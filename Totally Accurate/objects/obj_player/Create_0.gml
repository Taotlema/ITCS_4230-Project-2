move_speed = 1.5
hp = 10
hp_total = hp
damage = 1
charge = 0

party_charge = 0

party = [
    {
        character: "shaka",
        name: "Shaka Zulu",
        hp: 100,
        hp_total: 100,
        displayed_hp: 100,
        damage: 15,
        speed: 12,
        sprite: spr_zulu_idle,
        sprite_attack: spr_zulu_attack,  
        sprite_hurt: spr_zulu_hurt,      
        napoleon_protected: false
    },
    {
        character: "cleopatra",
        name: "Cleopatra",
        hp: 120,
        hp_total: 120,
        displayed_hp: 120,
        damage: 10,
        speed: 10,
        sprite: spr_cleo_idle,
        sprite_attack: spr_cleo_attack,  
        sprite_hurt: spr_cleo_hurt,     
        napoleon_protected: false
    },
    {
        character: "napoleon",
        name: "Napolean",
        hp: 80,
        hp_total: 80,
        displayed_hp: 80,
        damage: 25,
        speed: 15,
        sprite: spr_nap_idle,
        sprite_attack: spr_nap_attack,   
        sprite_hurt: spr_nap_hurt,       
        napoleon_protected: false
    },
    {
        character: "joan",
        name: "Joan of Arc",
        hp: 90,
        hp_total: 90,
        displayed_hp: 90,
        damage: 18,
        speed: 13,
        sprite: spr_4,
        sprite_attack: spr_4,  
        sprite_hurt: spr_4,   
        napoleon_protected: false
    },
    {
        character: "alexander",
        name: "Alexander the Great",
        hp: 110,
        hp_total: 110,
        displayed_hp: 110,
        damage: 22,
        speed: 14,
        sprite: spr_5,
        sprite_attack: spr_5,  
        sprite_hurt: spr_5,    
        napoleon_protected: false
    },
    {
        character: "suntzu",
        name: "Sun Tzu",
        hp: 85,
        hp_total: 85,
        displayed_hp: 85,
        damage: 20,
        speed: 11,
        sprite: spr_6,
        sprite_attack: spr_6,  
        sprite_hurt: spr_6,    
        napoleon_protected: false
    }
]

// At the very end of Create Event
if(instance_exists(obj_battle_switcher)) {
    show_debug_message("Switcher exists! Original room: " + room_get_name(obj_battle_switcher.original_room))
    show_debug_message("Player position: " + string(obj_battle_switcher.player_x) + ", " + string(obj_battle_switcher.player_y))
}