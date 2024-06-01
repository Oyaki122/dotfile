ROS2_WS=~/ros2_ws && export ROS2_WS # ROS2のワークスペースのパスを環境変数に設定する

alias rospath='. ${ROS2_WS}/install/setup.zsh && eval "$(register-python-argcomplete3 ros2)" && eval "$(register-python-argcomplete3 colcon)"'

# ROS2のワークスペース内の全てのパッケージを列挙する、引数にパスを指定するとそのディレクトリ内のパッケージを列挙する。再帰的に探索する
function enumerate_ros2_packages {
    if [ $# -eq 0 ]; then
        current_path=$ROS2_WS/src # ワークスペースのsrcディレクトリをデフォルトのパスとする
    else
        current_path=$1 # 引数で指定されたパスを検索する
    fi

    for package in $(ls $current_path); do
        if [ -d $current_path/$package ]; then
            if [ -e $current_path/$package/package.xml ]; then # package.xmlがある場合はパッケージとして認識する
                echo $current_path/$package
            else
                echo $(enumerate_ros2_packages $current_path/$package) # package.xmlがない場合は再帰的に探索する
            fi
        fi
    done
}

# ROS2のワークスペース内で更新されたパッケージのみビルドする
function colb {
    current_path=$(pwd)
    cd $ROS2_WS # ワークスペースに移動する

    trap 'cd $current_path' 0 1 2 3 15 # スクリプトが終了したときに元のディレクトリに戻る (0: 正常終了, 1: SIGHUP, 2: SIGINT, 3: SIGQUIT, 15: SIGTERM)

    # 初回のビルドの場合は全てのパッケージをビルドする
    if [ ! -e $ROS2_WS/build/.timestamp ]; then
        colcon build --packages-select libsick_ldmrs --event-handlers console_direct+
        colcon build --symlink-install --packages-select sick_scan_xd --cmake-args " -DROS_VERSION=2"  --event-handlers console_direct+
        colcon build --symlink-install --cmake-args "-DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo"
        touch $ROS2_WS/build/.timestamp # タイムスタンプを作成する
        return
    fi

    editted_packages=() # 更新されたパッケージのリスト

    # 更新されたパッケージを探す
    for package in $(enumerate_ros2_packages); do
        if [ $(find $package -newer $ROS2_WS/build/.timestamp | wc -l) -gt 0 ]; then # findで更新されたファイルがあるか調べ、ある場合はリストに追加する
            editted_packages+=( $(basename $package) )
        fi
    done

    if [ ${#editted_packages[@]} -gt 0 ]; then
        echo ${editted_packages[@]} "updated."
        colcon build --symlink-install --packages-select ${editted_packages[@]}   --cmake-args " -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo"

         # 更新されたパッケージのみビルドする
        if [ $? -eq 1 ]; then
            return 1 # エラーが発生した場合は終了する
        fi
    else
        echo "No package updated."
    fi
    
    # colcon_lncc

    touch $ROS2_WS/build/.timestamp # タイムスタンプを更新する

    cd $current_path # 元のディレクトリに戻る

    rospath

    echo "Updated environment variables."
}
