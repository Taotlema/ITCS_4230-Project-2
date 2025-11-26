move_speed = 1
tilemap = layer_tilemap_get_id("Tiles_Col")
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
        damage: 20,
		speed: 12,
        sprite: spr_1,
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
        sprite: spr_2,
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
        sprite: spr_3,
		napoleon_protected: false,
    },
	{
        character: "joan",
        name: "Joan of Arc",
        hp: 90,
        hp_total: 90,
		displayed_hp: 90,
        damage: 18,
        speed: 2,
        sprite: spr_4,
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
        napoleon_protected: false
    },
    {
        character: "suntzu",
        name: "Sun Tzu",
        hp: 200,
        hp_total: 200,
		displayed_hp: 200,
        damage: 30,
        speed: 30,
        sprite: spr_6,
        napoleon_protected: false
    }
]