if(instance_exists(obj_battle_switcher)) exit
var _switcher = instance_create_depth(0,0,0, obj_battle_switcher)
_switcher.party_data = party
_switcher.party_charge_data = party_charge

// Store player position before battle
_switcher.player_x = x
_switcher.player_y = y

// Create two separate enemy data structs
_switcher.enemy_data = [
    {
        hp: other.hp,
        hp_total: other.hp_total,
        damage: other.damage,
        speed_stat: other.speed_stat,
        sprite_index: other.sprite_index,
        sprite_attack: other.sprite_attack,
        sprite_death: other.sprite_death
    },
    {
        hp: other.hp,
        hp_total: other.hp_total,
        damage: other.damage,
        speed_stat: other.speed_stat,
        sprite_index: other.sprite_index,
        sprite_attack: other.sprite_attack,
        sprite_death: other.sprite_death
    }
]

// Determine which battle room to go to based on current room
var _battle_room = rm_battle  // Default
var _original_room = room  // Store current room

if(room == rm_russia) {
    _battle_room = rm_battle_russia
} else if(room == rm_china) {
    _battle_room = rm_battle_china
} else if(room == rm_main) {
    _battle_room = rm_battle  // Egypt battle
}

_switcher.original_room = _original_room
_switcher.enemy_object = other.object_index
_switcher.enemy_x = other.x
_switcher.enemy_y = other.y

// Destroy the enemy now
with(other) {
    instance_destroy()
}

room_goto(_battle_room)