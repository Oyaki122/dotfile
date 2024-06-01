# -*- coding: utf-8 -*-

import re
from xkeysnail.transform import *


def isKicad(wm_class):
    return wm_class != "KiCad"


# something remap
define_conditional_multipurpose_modmap(
    isKicad, {
        Key.CAPSLOCK: [Key.F14, Key.LEFT_CTRL],
    })
define_keymap(None, {
#     # K('F13'): [K('C-LEFT_BRACE'), K('C-Shift-F12')],
    K('F14'): [K('esc'), K('C-Shift-F12')],
}, "Esc and IME off")

define_keymap(None, {
    K('LShift-SPACE'): [K("C-Shift-F11")],
})


