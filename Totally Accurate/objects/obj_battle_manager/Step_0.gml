// Cancel targeting with Backspace key
if(targeting_mode && keyboard_check_pressed(vk_backspace)) {
    targeting_mode = false
    // Only restore special charge if it was actually a special attack (not normal or light attack)
    if(pending_special_character == "shaka" || pending_special_character == "cleopatra" || pending_special_character == "napoleon") {
        party_charge = 1
    }
}