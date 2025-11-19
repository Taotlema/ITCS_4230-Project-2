function dialogue(_messages){
	if (instance_exists(obj_dialogue)) return
	
	var _inst  = instance_create_depth(0, 0, 0, obj_dialogue)
	_inst.messages = _messages
	_inst.current_message = 0
	
}

char_colors = {
	"Sun Tzu" : c_yellow
}


welcome_dialogue = [
{
	name: "Sun Tzu",
	msg: "Greetings, warrior. Someone once said: ‘Know thy enemy and know thyself.’"
},
{
	name: "Sun Tzu",
	msg: "Oh right that was me, anyways you obviously have no idea what youre doing."
},
{
	name: "Sun Tzu",
	msg: "Press Arrow keys to move. Yes, I know, very advanced tactic."
},
{
	name: "Sun Tzu",
	msg:"Unless you don’t. Then you will simply stand there, alone, but I mean nothing really changed did it?"
},
{
	name: "Sun Tzu",
	msg:"To perform a Light Attck, press the sword button when in combat."
},
{
	name: "Sun Tzu",
	msg:" I call it ‘light’ because that’s about how hard you seem capable of hitting."
},
{
	name: "Sun Tzu",
	msg:"To perform a Special Attck, press the fire button when in combat."
},
{
	name: "Sun Tzu",
	msg:"This move is powerful. Dramatic. Flashy. It has the energy of a 12-year-old using all their V-Bucks at once."
},
{
	name: "Sun Tzu",
	msg:"Now go forth. Conquer foes, seize victory, and just know when you die, its a skill issue not a Sun Tzu issue "
},
{
	name: "Sun Tzu",
	msg:"I swear, one of these days I’m getting transferred to a different game, instead of teaching these idiots"
},
]