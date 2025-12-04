if(instance_exists(obj_battle_switcher)) exit
var _switcher = instance_create_depth(0,0,0, obj_battle_switcher)
_switcher.party_data = party
_switcher.party_charge_data = party_charge

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

_switcher.original_room = rm_main
_switcher.enemy_object = other.object_index
_switcher.enemy_x = other.x
_switcher.enemy_y = other.y

// Destroy the enemy now
with(other) {
    instance_destroy()
}

room_goto(rm_battle)