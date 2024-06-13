INSTANCE ITAR_OC_BH (C_Item)
{
	name 					=	"Zbroj Rudobarona Z Èerné Rudy";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	140;
	protection [PROT_BLUNT] = 	140;
	protection [PROT_POINT] = 	140;
	protection [PROT_FIRE] 	= 	115;
	protection [PROT_MAGIC] = 	50;
	
	value 					=	20000;

	wear 					=	WEAR_TORSO;

	visual 					=	"ARMOR_OCBARONH.3ds";
	visual_change 			=	"ARMOR_OREBARONBLACK_ADDON.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

		on_equip    			=    Equip_ITAR_OC_BH;
    on_unequip    			=    UnEquip_ITAR_OC_BH;	
	
	description				=	name;

	TEXT[0]					= 	"Bonus 5 bodù síly";
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
func void Equip_ITAR_OC_BH()
{
    // "self" it is C_NPC which is equipping armor
    Npc_ChangeAttribute(self,ATR_STRENGTH, 5);
};
func void UnEquip_ITAR_OC_BH()
{
    // "self" it is C_NPC which is unequipping armor
    Npc_ChangeAttribute(self,ATR_STRENGTH, -5);
	};
INSTANCE ITAR_OC_BM (C_Item)
{
	name 					=	"Tìžká Zbroj Rudobarona";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	115;
	protection [PROT_BLUNT] = 	115;
	protection [PROT_POINT] = 	115;
	protection [PROT_FIRE] 	= 	70;
	protection [PROT_MAGIC] = 	20;

	value 					=	10000;

	wear 					=	WEAR_TORSO;

	visual 					=	"ARMOR_OCBARONM.3ds";
	visual_change 			=	"ARMOR_OREBARONM_ADDON.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

		on_equip    			=    Equip_ITAR_OC_BM;
    on_unequip    			=    UnEquip_ITAR_OC_BM;

	description				=	name;

	TEXT[0]					= 	"Bonus 4 body síly";
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
func void Equip_ITAR_OC_BM()
{
    // "self" it is C_NPC which is equipping armor
    Npc_ChangeAttribute(self,ATR_STRENGTH, 4);
};
func void UnEquip_ITAR_OC_BM()
{
    // "self" it is C_NPC which is unequipping armor
    Npc_ChangeAttribute(self,ATR_STRENGTH, -4);
	};
INSTANCE ITAR_OC_BL (C_Item)
{
	name 					=	"Zbroj Rudobarona";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	85;
	protection [PROT_BLUNT] = 	85;
	protection [PROT_POINT] = 	85;
	protection [PROT_FIRE] 	= 	50;
	protection [PROT_MAGIC] = 	15;

	value 					=	3000;

	wear 					=	WEAR_TORSO;

	visual 					=	"ARMOR_OCBARONL.3ds";
	visual_change 			=	"ARMOR_OREBARONL_ADDON.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

		on_equip    			=    Equip_ITAR_OC_BL;
    on_unequip    			=    UnEquip_ITAR_OC_BL;	
	
	description				=	name;

	TEXT[0]					= 	"Bonus 3 body síly";
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
func void Equip_ITAR_OC_BL()
{
    // "self" it is C_NPC which is equipping armor
    Npc_ChangeAttribute(self,ATR_STRENGTH, 3);
};
func void UnEquip_ITAR_OC_BL()
{
    // "self" it is C_NPC which is unequipping armor
    Npc_ChangeAttribute(self,ATR_STRENGTH, -3);
	};
INSTANCE ITAR_OC_GM (C_Item)
{
	name 					=	"Zbroj Stráže";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	60;
	protection [PROT_BLUNT] = 	60;
	protection [PROT_POINT] = 	60;
	protection [PROT_FIRE] 	= 	10;
	protection [PROT_MAGIC] = 	5;

	value 					=	1250;

	wear 					=	WEAR_TORSO;

	visual 					=	"ARMOR_OCGUARDM.3ds";
	visual_change 			=	"HUM_OGUARDM_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

		on_equip    			=    Equip_ITAR_OC_GM;
    on_unequip    			=    UnEquip_ITAR_OC_GM;
	
	description				=	name;

	TEXT[0]					= 	"Bonus 2 body síly";
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
func void Equip_ITAR_OC_GM()
{
    // "self" it is C_NPC which is equipping armor
    Npc_ChangeAttribute(self,ATR_STRENGTH, 2);
};
func void UnEquip_ITAR_OC_GM()
{
    // "self" it is C_NPC which is unequipping armor
    Npc_ChangeAttribute(self,ATR_STRENGTH, -2);
	};
INSTANCE ITAR_OC_GL (C_Item)
{
	name 					=	"Lehká Zbroj Stráže";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	45;
	protection [PROT_BLUNT] = 	45;
	protection [PROT_POINT] = 	45;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	750;

	wear 					=	WEAR_TORSO;

	visual 					=	"ARMOR_OCGUARDL.3ds";
	visual_change 			=	"HUM_OGUARDL_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;
	
	on_equip    			=    Equip_ITAR_OC_GL;
    on_unequip    			=    UnEquip_ITAR_OC_GL;
	
	description				=	name;

	TEXT[0]					= 	"Bonus 2 body síly";
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
func void Equip_ITAR_OC_GL()
{
    // "self" it is C_NPC which is equipping armor
    Npc_ChangeAttribute(self,ATR_STRENGTH, 2);
};
func void UnEquip_ITAR_OC_GL()
{
    // "self" it is C_NPC which is unequipping armor
    Npc_ChangeAttribute(self,ATR_STRENGTH, -2);
	};
INSTANCE ITAR_OC_SH (C_Item)
{
	name 					=	"Zbroj Stína";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	35;
	protection [PROT_BLUNT] = 	35;
	protection [PROT_POINT] = 	35;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	500;

	wear 					=	WEAR_TORSO;

	visual 					=	"ARMOR_OCSHADOWH.3ds";
	visual_change 			=	"ARMOR_SHADOWH.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;

	TEXT[0]					= 	"";
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
INSTANCE ITAR_OC_SL (C_Item)
{
	name 					=	"Odìv Stína";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	25;
	protection [PROT_BLUNT] = 	25;
	protection [PROT_POINT] = 	25;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	250;

	wear 					=	WEAR_TORSO;

	visual 					=	"ARMOR_OCSHADOWL.3ds";
	visual_change 			=	"HUM_SHADOWL_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;

	TEXT[0]					= 	"";
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
INSTANCE ITAR_OC_SB (C_Item)
{
	name 					=	"Obnošený Odìv Stína";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	10;
	protection [PROT_BLUNT] = 	10;
	protection [PROT_POINT] = 	10;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	50;

	wear 					=	WEAR_TORSO;

	visual 					=	"ARMOR_SHADOWBROKEN.3ds";
	visual_change 			=	"HUM_SHADOWLBROKEN_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;

	TEXT[0]					= 	"Tato zbroj zažila lepší èasy, mìl bych ji dát opravit.";
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
INSTANCE ITAR_OC_GMR (C_Item)
{
	name 					=	"Vylepšená Zbroj Stráže";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	65;
	protection [PROT_BLUNT] = 	65;
	protection [PROT_POINT] = 	65;
	protection [PROT_FIRE] 	= 	15;
	protection [PROT_MAGIC] = 	5;

	value 					=	1500;

	wear 					=	WEAR_TORSO;

	visual 					=	"ARMOR_OCGUARDMREFORGED.3ds";
	visual_change 			=	"HUM_OGUARDMREFORGED_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

		on_equip    			=    Equip_ITAR_OC_GMR;
    on_unequip    			=    UnEquip_ITAR_OC_GMR;	
	
	description				=	name;

	TEXT[0]					= 	"Bonus 3 body síly";
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
func void Equip_ITAR_OC_GMR()
{
    // "self" it is C_NPC which is equipping armor
    Npc_ChangeAttribute(self,ATR_STRENGTH, 3);
};
func void UnEquip_ITAR_OC_GMR()
{
    // "self" it is C_NPC which is unequipping armor
    Npc_ChangeAttribute(self,ATR_STRENGTH, -3);
	};
INSTANCE ITAR_OC_GLR (C_Item)
{
	name 					=	"Vylepšená Lehká Zbroj Stráže";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	50;
	protection [PROT_BLUNT] = 	50;
	protection [PROT_POINT] = 	50;
	protection [PROT_FIRE] 	= 	10;
	protection [PROT_MAGIC] = 	0;

	value 					=	1000;

	wear 					=	WEAR_TORSO;

	visual 					=	"ARMOR_OCGUARDLREFORGED.3ds";
	visual_change 			=	"HUM_OGUARDLREFORGED_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

		on_equip    			=    Equip_ITAR_OC_GLR;
    on_unequip    			=    UnEquip_ITAR_OC_GLR;	
	
	description				=	name;

	TEXT[0]					= 	"Bonus 3 body síly";
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
func void Equip_ITAR_OC_GLR()
{
    // "self" it is C_NPC which is equipping armor
    Npc_ChangeAttribute(self,ATR_STRENGTH, 3);
};
func void UnEquip_ITAR_OC_GLR()
{
    // "self" it is C_NPC which is unequipping armor
    Npc_ChangeAttribute(self,ATR_STRENGTH, -3);
	};
INSTANCE ITAR_OC_GHR (C_Item)
{
	name 					=	"Vylepšená Tìžká Zbroj Stráže";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	75;
	protection [PROT_BLUNT] = 	75;
	protection [PROT_POINT] = 	75;
	protection [PROT_FIRE] 	= 	35;
	protection [PROT_MAGIC] = 	15;

	value 					=	1750;

	wear 					=	WEAR_TORSO;

	visual 					=	"ARMOR_OCGUARDHREFORGED.3ds";
	visual_change 			=	"HUM_OGUARDHREFORGED_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

		on_equip    			=    Equip_ITAR_OC_GHR;
    on_unequip    			=    UnEquip_ITAR_OC_GHR;	
	
	description				=	name;

	TEXT[0]					= 	"Bonus 4 body síly";
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
func void Equip_ITAR_OC_GHR()
{
    // "self" it is C_NPC which is equipping armor
    Npc_ChangeAttribute(self,ATR_STRENGTH, 4);
};
func void UnEquip_ITAR_OC_GHR()
{
    // "self" it is C_NPC which is unequipping armor
    Npc_ChangeAttribute(self,ATR_STRENGTH, -4);
	};
	
instance ItWr_BluePrint_ImproveOCArmor(C_Item)
{
	name = "Nákres na vylepšení zbrojí ze starého tábora";

	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;

	value = 100;

	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;

	on_state[0] = Use_Plan_OCArmor;

	scemeName = "MAP";

	description = name;
};
func void Use_Plan_OCArmor()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"     Nákres na výrobu plátové zbroje ze Stewarku");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Tohle je nákres pro všechny schopné kováøe mìsta Stewark,");
    Doc_PrintLines(nDocID,0,"máte za úkol vyrobit nové kusy zbroje kterou bude");
    Doc_PrintLines(nDocID,0,"vybavena stráž mìsta.");
    Doc_PrintLines(nDocID,0,"Suroviny dostanete brzy, na výrobu jedné zbroje budete potøebovat:");
    Doc_PrintLines(nDocID,0,"-6 Kusù surového železa");
    Doc_PrintLines(nDocID,0,"-3 Kùže Warga");
    Doc_PrintLines(nDocID,0,"Návod k výrobì je na druhé stranì tohoto nákresu.");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Pokud budete pøistiženi jak prodáváte suroviny");
	Doc_PrintLines(nDocID,0,"nebo nákres, budete tvrdì potrestáni.");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Rozkaz vydal velitel mìstské stráže Cenric");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};  