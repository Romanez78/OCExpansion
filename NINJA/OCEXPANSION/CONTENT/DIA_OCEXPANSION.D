// *********************************************************
// 		  				      My Changes				
// *********************************************************
instance DIA_BRIAN_BUYRAWSTEEL_PATCHOC (C_INFO)
{
	npc			 =  VLK_457_Brian;
	nr			 =  4;
	condition	 = 	DIA_BRIAN_BUYRAWSTEEL_PATCHOC_Condition;
	information	 = 	DIA_BRIAN_BUYRAWSTEEL_PATCHOC_Info;
	permanent	 = 	FALSE;
	description	 = 	"Pot¯ebuju vÌce surovÈ oceli.";
};
func int DIA_BRIAN_BUYRAWSTEEL_PATCHOC_Condition ()
{	
	if (Kapitel >= 1)
	{
		return TRUE;
	};
};
func void DIA_BRIAN_BUYRAWSTEEL_PATCHOC_Info ()
{
    AI_Output(other, self, "DIA_BRIAN_BUYRAWSTEEL_PATCHOC_15_01"); //Pot¯ebuju vÌce surovÈ oceli.
    AI_Output(self, other, "DIA_BRIAN_BUYRAWSTEEL_PATCHOC_13_02"); //M˘ûu ti prodat nÏj·ke z m˝ch osobnÌch z·sob, ale vyjde tÏ to draho.
    AI_Output(self, other, "DIA_BRIAN_BUYRAWSTEEL_PATCHOC_13_03"); //200 zlat˝ch za jeden kus.
};
instance DIA_PATCHOC_BRIAN_IWANNABUYSOMESTEEL		(C_INFO)
{
	npc		 = 	VLK_457_Brian;
	nr		 = 	3;
	condition	 = 	DIA_PATCHOC_BRIAN_IWANNABUYSOMESTEEL_Condition;
	information	 = 	DIA_PATCHOC_BRIAN_IWANNABUYSOMESTEEL_Info;
	permanent	 = 	TRUE;
	description	 = 	"Prodej mi jeden kus surovÈ oceli. (Cena: 200 zlat˝ch).";
};
func int DIA_PATCHOC_BRIAN_IWANNABUYSOMESTEEL_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_BRIAN_BUYRAWSTEEL_PATCHOC))
	{
		return TRUE;
	};
};
func void DIA_PATCHOC_BRIAN_IWANNABUYSOMESTEEL_Info ()
{
	AI_Output(other, self, "DIA_PATCHOC_BRIAN_IWANNABUYSOMESTEEL_4_1"); //Prodej mi jeden kus surovÈ oceli.
	
	if (B_GiveInvItems(other, self, ItMi_Gold, 200))
	{	
		AI_Output(self, other, "DIA_PATCHOC_BRIAN_IWANNABUYSOMESTEEL_4_2"); //Tady je.
		B_GiveInvItems (self, other, ItMiSwordraw, 1);	
	}
	else 
	{
		AI_Output(self, other, "DIA_PATCHOC_BRIAN_IWANNABUYSOMESTEEL_4_3"); //P¯ijÔ aû budeö mÌt u sebe dost zlata
	};
};
const string	TOPIC_CARL_REPAIRSHADOWARMOR				=   "Zbroj StÌna";
instance Ninja_OldCampExpansion_DIA_Addon_Cavalorn_SHADOWB		(C_INFO)
{
	npc		 = 	BAU_4300_Addon_Cavalorn;
	nr		 = 	23;
	condition	 = 	Ninja_OldCampExpansion_DIA_Addon_Cavalorn_SHADOWB_Condition;
	information	 = 	Ninja_OldCampExpansion_DIA_Addon_Cavalorn_SHADOWB_Info;

	description	 = 	"Co takhle nÏj·k· zbroj?";
};

func int Ninja_OldCampExpansion_DIA_Addon_Cavalorn_SHADOWB_Condition ()
{
	if 	(MIS_Addon_Cavalorn_KillBrago != 0)
	&& (MIS_Addon_Nefarius_BringMissingOrnaments == 0)
	{
		return TRUE;
	};
};

func void Ninja_OldCampExpansion_DIA_Addon_Cavalorn_SHADOWB_Info ()
{
	AI_Output	(other, self, "Ninja_OldCampExpansion_DIA_Addon_Cavalorn_SHADOWB_15_00"); //Co takhle nÏj·k· zbroj?
	AI_Output	(self, other, "Ninja_OldCampExpansion_DIA_Addon_Cavalorn_SHADOWB_08_02"); //JedinÈ co mi zbylo tak je m˘j star˝ odÏv stÌna kter˝ jsem nosil v kolonii, ale ten uû toho zaûil mnoho...
	AI_Output	(other, self, "Ninja_OldCampExpansion_DIA_Addon_Cavalorn_SHADOWB_15_03"); //RozhodnÏ lepöÌ neû nic.
	CreateInvItems (self, ITAR_OC_SB, 1);									
	B_GiveInvItems (self, other, ITAR_OC_SB, 1);					
	Log_CreateTopic (TOPIC_CARL_REPAIRSHADOWARMOR,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_CARL_REPAIRSHADOWARMOR,LOG_RUNNING);
	B_LogEntry (TOPIC_CARL_REPAIRSHADOWARMOR,"Cavalorn mi dal jeho star˝ odÏv stÌna, ale je v hroznÈm stavu. Moûn· ve mÏstÏ najdu nÏkoho kdo mi ho opravÌ, ale musÌ to b˝t nÏkdo kdo mnÏ nenahlasÌ str·ûi. P¯ece jenom takovÈ obleËenÌ nosily Gomezovy lidÈ	ve starÈm t·bo¯e.");
};
//-------------------------------------
//-------------------------------------
instance Ninja_OldCampExpansion_DIA_Addon_Carl_QUESTION (C_INFO)
{
	npc			 =  VLK_461_Carl;
	nr			 =  4;
	condition	 = 	Ninja_OldCampExpansion_DIA_Addon_Carl_QUESTION_Condition;
	information	 = 	Ninja_OldCampExpansion_DIA_Addon_Carl_QUESTION_Info;
	permanent	 = 	FALSE;
	description	 = 	"Nemohl by si mi opravit tuhle zbroj? (Uk·zat odÏv stÌna)";
};
func int Ninja_OldCampExpansion_DIA_Addon_Carl_QUESTION_Condition ()
{	
	if (Npc_Hasitems(other, ItAr_OC_SB) > 0)
	{
		return TRUE;
	};
};
func void Ninja_OldCampExpansion_DIA_Addon_Carl_QUESTION_Info ()
{
    AI_Output(other, self, "Ninja_OldCampExpansion_DIA_Addon_Carl_QUESTION_15_01"); //Nemohl by si mi opravit tuhle zbroj?
    AI_Output(self, other, "Ninja_OldCampExpansion_DIA_Addon_Carl_QUESTION_13_02"); //UrËitÏ mohl, sice nejsem nejlepöÌ kov·¯ öiroko daleko ale nÏco takovÈho zvl·dnu.
    AI_Output(self, other, "Ninja_OldCampExpansion_DIA_Addon_Carl_QUESTION_13_03"); //P¯ijde mi ale ûe uû jsem ji nÏkde vidÏl, kde si jÌ sehnal?
	AI_Output(other, self, "Ninja_OldCampExpansion_DIA_Addon_Carl_QUESTION_15_04"); //Kdyû ti zaplatÌm, nebudeö se uû na nic vypt·vat?
	AI_PlayAni (self, "T_SEARCH");
	AI_Output(self, other, "Ninja_OldCampExpansion_DIA_Addon_Carl_QUESTION_13_05"); //Dobr·, souhlasÌm, v dneönÌ dobÏ je kaûd· pr·ce dobr·. Jenom douf·m ûe se dÌky tomu nedostanu do malÈru.
	AI_Output(self, other, "Ninja_OldCampExpansion_DIA_Addon_Carl_QUESTION_13_06"); //Budu od tebe chtÌt 175 zlat˝ch, za mÌÚ mi to nestojÌ.
	B_LogEntry (TOPIC_CARL_REPAIRSHADOWARMOR,"Carl souhlasil ûe mi zbroj opravÌ za 175 zlat˝ch.");
};
//-------------------------------------
//-------------------------------------
instance Ninja_OldCampExpansion_DIA_Addon_Carl_REFORGE (C_INFO)
{
	npc			 =  VLK_461_Carl;
	nr			 =  4;
	condition	 = 	Ninja_OldCampExpansion_DIA_Addon_Carl_REFORGE_Condition;
	information	 = 	Ninja_OldCampExpansion_DIA_Addon_Carl_REFORGE_Info;
	permanent	 = 	TRUE;
	description	 = 	"M·m u sebe dostatek zlat˝ch, oprav mi zbroj (Opravit OdÏv StÌna, Cena 175).";
};
func int Ninja_OldCampExpansion_DIA_Addon_Carl_REFORGE_Condition ()
{	
	if (Npc_Hasitems(other, ItAr_OC_SB) > 0) && (Npc_HasItems(other,ItMi_Gold) >= 175)
	&& (Npc_KnowsInfo (other, Ninja_OldCampExpansion_DIA_Addon_Carl_QUESTION))
	{
		return TRUE;
	};
};
func void Ninja_OldCampExpansion_DIA_Addon_Carl_REFORGE_Info ()
{
    AI_Output(other, self, "Ninja_OldCampExpansion_DIA_Addon_Carl_REFORGE_15_01"); //M·m u sebe dostatek zlat˝ch, oprav mi zbroj.	
        B_GiveInvItems(other, self, ItAr_OC_SB, 1);				
        B_GiveInvItems(other, self, ItMi_Gold, 175);
        AI_Output(self, other, "Ninja_OldCampExpansion_DIA_Addon_Carl_REFORGE_13_12"); //Dobr·, d·m se tedy do toho.
        
        B_LookAtNpc(other, self);
        AI_UseMob(self, "BSFIRE", 1);
        AI_UseMob(self, "BSFIRE", -1);
        B_TurnToNpc(other, self);

        AI_UseMob(self, "BSANVIL", 1);
        AI_UseMob(self, "BSANVIL", -1);
        B_TurnToNpc(other, self);

        AI_UseMob(self, "BSCOOL", 1);
        AI_UseMob(self, "BSCOOL", -1);
        B_TurnToNpc(other, self);
        B_TurnToNpc(self, other);
        
        AI_Output(self, other, "Ninja_OldCampExpansion_DIA_Addon_Carl_REFORGE_13_13"); //Hotovo.
        B_GiveInvItems(self, other, ITAR_OC_SL, 1);
        AI_Output(self, other, "Ninja_OldCampExpansion_DIA_Addon_Carl_REFORGE_13_14"); //Tady, opravil jsem ji.
        AI_Output(other, self, "Ninja_OldCampExpansion_DIA_Addon_Carl_REFORGE_15_15"); //DÌky.
		B_LogEntry (TOPIC_CARL_REPAIRSHADOWARMOR,"Carl mi opravil zbroj.");
};
//-------------------------------------
//-------------------------------------
instance Ninja_OldCampExpansion_DIA_Addon_Carl_UPGRADEQUESTION (C_INFO)
{
	npc			 =  VLK_461_Carl;
	nr			 =  4;
	condition	 = 	Ninja_OldCampExpansion_DIA_Addon_Carl_UPGRADEQUESTION_Condition;
	information	 = 	Ninja_OldCampExpansion_DIA_Addon_Carl_UPGRADEQUESTION_Info;
	permanent	 = 	FALSE;
	description	 = 	"Neölo by tu zbroj vylepöit? (OdÏv StÌna)";
};
func int Ninja_OldCampExpansion_DIA_Addon_Carl_UPGRADEQUESTION_Condition ()
{	
	if (Npc_Hasitems(other, ItAr_OC_SL) > 0)
	{
		return TRUE;
	};
};
func void Ninja_OldCampExpansion_DIA_Addon_Carl_UPGRADEQUESTION_Info ()
{
    AI_Output(other, self, "Ninja_OldCampExpansion_DIA_Addon_Carl_UPGRADEQUESTION_15_01"); //Neölo by tu zbroj vylepöit?
	AI_PlayAni (self, "T_SEARCH");
	AI_Output(self, other, "Ninja_OldCampExpansion_DIA_Addon_Carl_UPGRADEQUESTION_13_05"); //M·m u sebe n·kres kter˝ jsem zÌskal kr·tce po p·du bariÈry.
	AI_Output(self, other, "Ninja_OldCampExpansion_DIA_Addon_Carl_UPGRADEQUESTION_13_06"); //Za 250 zlat˝ch ti ho p¯epÌöu.
	B_LogEntry (TOPIC_CARL_REPAIRSHADOWARMOR,"Carl mi p¯epÌöe n·kres na v˝robu zbroje stÌna za 250 zlat˝ch.");
};
//-------------------------------------
//-------------------------------------
instance Ninja_OldCampExpansion_DIA_Addon_Carl_SHADOWARMOR (C_INFO)
{
	npc			 =  VLK_461_Carl;
	nr			 =  4;
	condition	 = 	Ninja_OldCampExpansion_DIA_Addon_Carl_SHADOWARMOR_Condition;
	information	 = 	Ninja_OldCampExpansion_DIA_Addon_Carl_SHADOWARMOR_Info;
	permanent	 = 	TRUE;
	description	 = 	"Koupit n·kres pro v˝robu Zbroje stÌna (250 zlat˝ch)";
};
func int Ninja_OldCampExpansion_DIA_Addon_Carl_SHADOWARMOR_Condition ()
{	
	if (Npc_KnowsInfo (other, Ninja_OldCampExpansion_DIA_Addon_Carl_UPGRADEQUESTION))
	{
		return TRUE;
	};
};
func void Ninja_OldCampExpansion_DIA_Addon_Carl_SHADOWARMOR_Info ()
{
    AI_Output(other, self, "Ninja_OldCampExpansion_DIA_Addon_Carl_SHADOWARMOR_15_01"); //Prodej mi n·kres na v˝robu zbroje stÌna.

	if (B_GiveInvItems(other, self, ItMi_Gold, 250)) 
	{		
		AI_Output(self, other, "Ninja_OldCampExpansion_DIA_Addon_Carl_SHADOWARMOR13_12"); //Dobr·, d·m se tedy do toho.
        B_GiveInvItems(self, other, Itwr_blueprint_OC_SH, 1);
		B_LogEntry (TOPIC_CARL_REPAIRSHADOWARMOR,"Carl mi vylepöil zbroj.");
		Log_SetTopicStatus (TOPIC_CARL_REPAIRSHADOWARMOR, LOG_SUCCESS);

	}
	else 
	{
	    AI_Output (self, other, "Ninja_OldCampExpansion_DIA_Addon_Carl_SHADOWARMOR_13_16"); //SnaûÌö se mnÏ nap·lit? ÿÌkal jsem ûe za nÏj chci 250 zlat˝ch.
	};
};
//-------------------------------------
//-------------------------------------
const string	TOPIC_DOBAR_GIVEGUARDARMOR				=   "Zbroj z hradu starÈho t·bora";
instance Ninja_OldCampExpansion_DIA_Dobar_GUARDQUESTION (C_INFO)
{
	npc			 =  VLK_4106_Dobar;
	nr			 =  4;
	condition	 = 	Ninja_OldCampExpansion_DIA_Dobar_GUARDQUESTION_Condition;
	information	 = 	Ninja_OldCampExpansion_DIA_Dobar_GUARDQUESTION_Info;
	permanent	 = 	FALSE;
	description	 = 	"Pot¯ebuju nÏjakou lepöÌ zbroj.";
};
func int Ninja_OldCampExpansion_DIA_Dobar_GUARDQUESTION_Condition ()	
{
	return TRUE;
};
func void Ninja_OldCampExpansion_DIA_Dobar_GUARDQUESTION_Info ()
{
    AI_Output(other, self, "Ninja_OldCampExpansion_DIA_Dobar_GUARDQUESTION_15_01"); //Pot¯ebuju nÏjakou lepöÌ zbroj.
    AI_Output(self, other, "Ninja_OldCampExpansion_DIA_Dobar_GUARDQUESTION_13_02"); //Promluv si s Engorem, on m· na starosti naöe z·soby.
	AI_Output(other, self, "Ninja_OldCampExpansion_DIA_Dobar_GUARDQUESTION_15_03"); //VÌm ûe tohle byl nejvÏtöÌ t·bor trestanc˘ p¯ed p·dem bariÈry, urËitÏ tu po nich nÏco z˘stalo.
	AI_Output(self, other, "Ninja_OldCampExpansion_DIA_Dobar_GUARDQUESTION_15_04"); //A kdyby ano, proË bych ti to mÏl jen tak d·t? RozhodnÏ tu nem·me z·sob nazbyt. 
	AI_Output(other, self, "Ninja_OldCampExpansion_DIA_Dobar_GUARDQUESTION_15_05"); //ZaplatÌm ti.
	AI_Output(self, other, "Ninja_OldCampExpansion_DIA_Dobar_GUARDQUESTION_13_06"); //A k Ëemu mi tady bude zlato? Nem˘ûu ho snÌst a pr·ci mi tady neulehËÌ.
	AI_Output(other, self, "Ninja_OldCampExpansion_DIA_Dobar_GUARDQUESTION_15_07"); //Tak co tedy chceö?
	AI_Output(self, other, "Ninja_OldCampExpansion_DIA_Dobar_GUARDQUESTION_13_08"); //Hmm, domluvÌme se takhle: ty za mnÏ vyrobÌö 6 meË˘ a p¯ineö mnÏ a Parlafovi nÏco k jÌdlu a j· ti na opl·tku tady seûenu nÏj·kou zbroj co tu z˘stala po trestancÌch. 
	AI_Output(other, self, "Ninja_OldCampExpansion_DIA_Dobar_GUARDQUESTION_15_09"); //Dobr·, beru to.
	AI_Output(self, other, "Ninja_OldCampExpansion_DIA_Dobar_GUARDQUESTION_13_10"); //V tom p¯ÌpadÏ dones n·m kaûdÈmu jednu öunku, chleba a kus s˝ra. A jeötÏ 6 piv pro n·s oba.
	B_GiveInvItems(self, other, ItMiSwordraw, 6);
	AI_Output(self, other, "Ninja_OldCampExpansion_DIA_Dobar_GUARDQUESTION_13_11"); //Tady m·ö materi·l na ty meËe, ale nechci aby si mi p¯inesl nÏj·k˝ amatÈrsk˝ kousky. Chci aby byly kvalitnÌ.
	AI_Output(self, other, "Ninja_OldCampExpansion_DIA_Dobar_GUARDQUESTION_13_12"); //Kdyû jich p¯ineseö 6 a to jÌdlo tak ti d·m zbroj.
	Log_CreateTopic (TOPIC_DOBAR_GIVEGUARDARMOR,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_DOBAR_GIVEGUARDARMOR,LOG_RUNNING);
	B_LogEntry (TOPIC_DOBAR_GIVEGUARDARMOR,"Dobar mi slÌbil ûe mi najde nÏjakou zbroj co z˘stala po trestancÌch ve starÈm hradu v hornickÈ kolonii. Chce po mnÏ abych mu vykoval 6 kvalitnÌch meË˘ a p¯inesl dvÏ öunky, dva kusy s˝ra, dva bochnÌky chleba a öest piv.");
};
//-------------------------------------
//-------------------------------------
instance Ninja_OldCampExpansion_DIA_Dobar_GUARDBRINGEVERYTHING (C_INFO)
{
	npc			 =  VLK_4106_Dobar;
	nr			 =  4;
	condition	 = 	Ninja_OldCampExpansion_DIA_Dobar_GUARDBRINGEVERYTHING_Condition;
	information	 = 	Ninja_OldCampExpansion_DIA_Dobar_GUARDBRINGEVERYTHING_Info;
	permanent	 = 	FALSE;
	description	 = 	"M·m vöe co si po mnÏ chtÏl.";
};
func int Ninja_OldCampExpansion_DIA_Dobar_GUARDBRINGEVERYTHING_Condition ()
{	
	if (Npc_KnowsInfo (other, Ninja_OldCampExpansion_DIA_Dobar_GUARDQUESTION))
	&& (Npc_Hasitems(other, ItFo_Beer) >= 6) && (Npc_HasItems(other, ItFo_Bacon) >= 2) && (Npc_HasItems(other, ItFo_Cheese) >= 2) && (Npc_HasItems(other, ItFo_Bread) >= 2) && (Npc_HasItems(other, ItMw_Schwert1) >= 6)
	{
		return TRUE;
	};
};
func void Ninja_OldCampExpansion_DIA_Dobar_GUARDBRINGEVERYTHING_Info ()
{
    B_GiveInvItems(other, self, ItFo_Beer, 6);
	B_GiveInvItems(other, self, ItFo_Bacon, 2);
	B_GiveInvItems(other, self, ItFo_Bread, 2);
	B_GiveInvItems(other, self, ItFo_Cheese, 2);
	B_GiveInvItems(other, self, ItMw_Schwert1, 6);
	AI_Output(other, self, "Ninja_OldCampExpansion_DIA_Dobar_GUARDBRINGEVERYTHING_15_01"); //M·m vöe co si po mnÏ chtÏl.
    AI_Output(self, other, "Ninja_OldCampExpansion_DIA_Dobar_GUARDBRINGEVERYTHING_13_02"); //N·dhera, koneËne si m˘ûeme j· a Parlaf trochu odpoËinout.
	AI_Output(self, other, "Ninja_OldCampExpansion_DIA_Dobar_GUARDBRINGEVERYTHING_15_03"); //Naöel jsem ti tu zbroj co si chtÏl, tady ji m·ö.
	B_GiveInvItems(self, other, ITAR_OC_GM, 1);
	AI_Output(other, self, "Ninja_OldCampExpansion_DIA_Dobar_GUARDBRINGEVERYTHING_15_04"); //DÌky.
		B_LogEntry (TOPIC_DOBAR_GIVEGUARDARMOR,"Po tÈ co jsem vöechno p¯inesl Dobarovi mi dal zbroj str·ûe starÈho t·bora");
		Log_SetTopicStatus(TOPIC_DOBAR_GIVEGUARDARMOR, LOG_SUCCESS);
};
instance DIA_Addon_Greg_GuardArmor_PATCH	(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_GuardArmor_PATCH_Condition;
	information	 = 	DIA_Addon_Greg_GuardArmor_PATCH_Info;
	permanent 	 =	FALSE;
	description	 = 	"Naöel jsi nÏco zajÌmavÈho v DexterovÏ t·bo¯e?.";
};

func int DIA_Addon_Greg_GuardArmor_PATCH_Condition ()
{
	if (Npc_IsDead(Dexter))
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_GuardArmor_PATCH_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_GuardArmor_PATCH_15_00"); //Naöel jsi nÏco zajÌmavÈho v DexterovÏ t·bo¯e?.
	AI_Output	(self, other, "DIA_Addon_Greg_GuardArmor_PATCH_01_01"); //Ani ne, sam˝ cetky a blbosti.
	AI_Output	(self, other, "DIA_Addon_Greg_GuardArmor_PATCH_01_02"); //Naöel jsem nÏjakou Ëervenou zbroj, jestli chceö m˘ûeö si ji nechat.
	AI_Output	(self, other, "DIA_Addon_Greg_GuardArmor_PATCH_01_03"); //Nem·m pro nÌ vyuûitÌ a nechce se mi sebou tahat.
	B_GiveInvItems(self, other, ITAR_OC_GL, 1);
};
//-------------------------------------
//-------------------------------------
instance DIA_ENGOR_ARMORQUESTION_BARON_PATCHOC (C_INFO)
{
	npc			 =  VLK_4108_Engor;
	nr			 =  4;
	condition	 = 	DIA_ENGOR_ARMORQUESTION_BARON_PATCHOC_Condition;
	information	 = 	DIA_ENGOR_ARMORQUESTION_BARON_PATCHOC_Info;
	permanent	 = 	FALSE;
	description	 = 	"Stalo se tu na z·mku mezitÌm nÏco zajÌmavÈho?";
};
func int DIA_ENGOR_ARMORQUESTION_BARON_PATCHOC_Condition ()
{	
	if (Kapitel >= 3)
	{
		return TRUE;
	};
};
func void DIA_ENGOR_ARMORQUESTION_BARON_PATCHOC_Info ()
{
    AI_Output(other, self, "DIA_ENGOR_ARMORQUESTION_BARON_PATCHOC_15_01"); //Stalo se tu na z·mku mezitÌm nÏco zajÌmavÈho?
    AI_Output(self, other, "DIA_ENGOR_ARMORQUESTION_BARON_PATCHOC_13_02"); //Dalo by se tak ¯Ìct, jelikoû jsme tu uvÏznÏni tak m·me vÌce Ëasu prozkoum·vat zbytek hradu.
    AI_Output(self, other, "DIA_ENGOR_ARMORQUESTION_BARON_PATCHOC_13_03"); //Naöel jsem nÏjakou zbroj, myslÌm si ûe pat¯ila rudobaron˘m co tu vl·dly. Ale pochybuju ûe by tu nÏkdo chtÏl nÏco takovÈho nosit, takûe m˘ûe b˝t tvoje za 3000 zlat˝ch.
	B_LogEntry (TOPIC_Trader_OC,"Engor mi prod· zbroj rudobarona za 3000 zlat˝ch.");
};
instance DIA_PATCHOC_ENGOR_BARON_BUY		(C_INFO)
{
	npc		 = 	VLK_4108_Engor;
	nr		 = 	3;
	condition	 = 	DIA_PATCHOC_ENGOR_BARON_BUY_Condition;
	information	 = 	DIA_PATCHOC_ENGOR_BARON_BUY_Info;
	permanent	 = 	FALSE;
	description	 = 	"Prodej mi zbroj rudobarona. (Obrany: 85/85, bonus 3 body sÌly Cena: 3000 zlat˝ch).";
};
func int DIA_PATCHOC_ENGOR_BARON_BUY_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_ENGOR_ARMORQUESTION_BARON_PATCHOC))
	{
		return TRUE;
	};
};
func void DIA_PATCHOC_ENGOR_BARON_BUY_Info ()
{
	AI_Output(other, self, "DIA_PATCHOC_ENGOR_BARON_BUY_4_1"); //Prodej mi zbroj rudobarona.
	
	if (B_GiveInvItems(other, self, ItMi_Gold, 3000))
	{	
		AI_Output(self, other, "DIA_PATCHOC_ENGOR_BARON_BUY_4_2"); //Dob¯e, tady ji m·ö.
		B_LogEntry (TOPIC_Trader_OC,"Engor mi prodal zbroj Rudobarona.");

		B_GiveInvItems(self, other, ItAr_OC_BL, 1);
	}
	else 
	{
		AI_Output(self, other, "DIA_PATCHOC_ENGOR_BARON_BUY_4_3"); //P¯ijÔ aû budeö mÌt u sebe dost zlata
	};
};
//-------------------------------------
//-------------------------------------
instance DIA_DOBAR_ARMORQUESTION_OLDCAMP_PATCHOC (C_INFO)
{
	npc			 =  BDT_1099_Addon_Huno;
	nr			 =  4;
	condition	 = 	DIA_DOBAR_ARMORQUESTION_OLDCAMP_PATCHOC_Condition;
	information	 = 	DIA_DOBAR_ARMORQUESTION_OLDCAMP_PATCHOC_Info;
	permanent	 = 	FALSE;
	description	 = 	"Mohl by jsi vylepöit zbroj ze starÈho t·bora?";
};
func int DIA_DOBAR_ARMORQUESTION_OLDCAMP_PATCHOC_Condition ()
{	
	if (Npc_HasItems(other, ItAr_OC_GL) > 0) || (Npc_HasItems(other, ItAr_OC_GM) > 0) || (Npc_HasItems(other, ItAr_OC_SL) > 0) || (Npc_HasItems(other, ItAr_OC_SH) > 0) || (Npc_HasItems(other, ItAr_OC_BL) > 0)
	{
		return TRUE;
	};
};
func void DIA_DOBAR_ARMORQUESTION_OLDCAMP_PATCHOC_Info ()
{
    AI_Output(other, self, "DIA_DOBAR_ARMORQUESTION_OLDCAMP_PATCHOC_15_01"); //Mohl by jsi vylepöit zbroj ze starÈho t·bora?
    AI_Output(other, self, "DIA_DOBAR_ARMORQUESTION_OLDCAMP_PATCHOC_15_02"); //Jednu u sebe m·m, a myslÌm si ûe pr·vÏ ty by si mi mohl pomoct.    
	AI_Output(self, other, "DIA_DOBAR_ARMORQUESTION_OLDCAMP_PATCHOC_13_03"); //Mohl, m·m u sebe n·kres kde jsem sepsal mÈ n·pady jak vylepöit zbroje co se tam nosily. 
	AI_Output(self, other, "DIA_DOBAR_ARMORQUESTION_OLDCAMP_PATCHOC_13_04"); //ChtÏl jsem ho uk·zat Stoneovi, ale tÈ doby co uzav¯ely star˝ t·bor jsem ho nevidÏl a myslÌm si ûe teÔ uû by ho to stejnÏ nezajÌmalo.    
	AI_Output(self, other, "DIA_DOBAR_ARMORQUESTION_OLDCAMP_PATCHOC_13_05"); //N·kres uû tedy pro mnÏ nem· vyuûitÌ, prod·m ti ho za 1750 zlat˝ch.	
	B_LogEntry (Topic_Addon_BDT_Trader,"Huno mi prod· n·kres kde m· seps·no jak vylepöit zbroje ze starÈho t·bora za 1700 zlat˝ch.");
};
instance DIA_Patch_OCEcpansion_Huno_Buy		(C_INFO)
{
	npc		 	 = 	BDT_1099_Addon_Huno;
	nr		 	 = 	2;
	condition	 = 	DIA_Patch_OCEcpansion_Huno_Buy_Condition;
	information	 = 	DIA_Patch_OCEcpansion_Huno_Buy_Info;
	permanent 	 =  TRUE;
	description	 = 	"Koupit n·kres pro vynikajÌcÌ meË domobrany Archolosu (poö. 75, dos. 90, sÌla 60 Bonus k dovednosti. Cena: 1000 zlat˝ch)"; 
};
//--------------------------------------
var int Huno_OCEXPANSION_NINJA_Plan_Bouhgt_perm;
//--------------------------------------
func int DIA_Patch_OCEcpansion_Huno_Buy_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_DOBAR_ARMORQUESTION_OLDCAMP_PATCHOC))
	&& (Huno_OCEXPANSION_NINJA_Plan_Bouhgt_perm == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Patch_OCEcpansion_Huno_Buy_Info ()
{
	if (B_GiveInvItems (other, self, Itmi_Gold, 1700))
	{
		AI_Output (other, self, "DIA_Patch_OCEcpansion_Huno_Buy_Buy_15_00"); //Prodej mi n·kres pro jednoruËnÌ meË.
		AI_Output (self, other, "DIA_Patch_OCEcpansion_Huno_Buy_Buy_06_01"); //JasnÏ.
		B_GiveInvItems (self,other, ItWr_BluePrint_ImproveOCArmor,1);
		Huno_OCEXPANSION_NINJA_Plan_Bouhgt_perm = TRUE;
	B_LogEntry (Topic_Addon_BDT_Trader,"Koupil jsem od Huna n·kres.");
	}
	else
	{
		AI_Output (self, other, "DIA_Patch_OCEcpansion_Huno_Buy_Buy_06_02"); //Nem·ö dost zlata.
	};
};
//
const string TOPIC_Huno_BARONARMOR = "»ern· zbroj rudobarona";
var int Ninja_OCExpansion_MIS_Huno_BARONARMOR;
instance DIA_ENGOR_ARMORQUESTION_BARONBLACK_PATCHOC (C_INFO)
{
	npc			 =  BDT_1099_Addon_Huno;
	nr			 =  4;
	condition	 = 	DIA_ENGOR_ARMORQUESTION_BARONBLACK_PATCHOC_Condition;
	information	 = 	DIA_ENGOR_ARMORQUESTION_BARONBLACK_PATCHOC_Info;
	permanent	 = 	FALSE;
	description	 = 	"Dostal jsem n·pad jak jeötÏ vylepöit zbroj rudobarona.";
};
func int DIA_ENGOR_ARMORQUESTION_BARONBLACK_PATCHOC_Condition ()
{	
	if  (MIS_SCKnowsWayToIrdorath == TRUE)
	&&	(Npc_HasItems(other, ItAr_OC_BM) > 0)
	{
		return TRUE;
	};
};
func void DIA_ENGOR_ARMORQUESTION_BARONBLACK_PATCHOC_Info ()
{
    AI_Output(other, self, "DIA_ENGOR_ARMORQUESTION_BARONBLACK_PATCHOC_15_01"); //Dostal jsem n·pad jak jeötÏ vylepöit zbroj rudobarona.
    AI_Output(other, self, "DIA_ENGOR_ARMORQUESTION_BARONBLACK_PATCHOC_15_01"); //Dala by se vylepöit s Ëernou rudou, Ëetl jsem o neËem podobnÈm ve starÈ knize.  
    AI_Output(self, other, "DIA_ENGOR_ARMORQUESTION_BARONBLACK_PATCHOC_13_02"); //ZnÌ to trochu öÌlenÏ, ale myslÌm si ûe by to ölo udÏlat.
    AI_Output(self, other, "DIA_ENGOR_ARMORQUESTION_BARONBLACK_PATCHOC_13_03"); //Takûe tedy, na takovou zbroj budeö pot¯ebovat dva kusy ËernÈ rudy, a jeötÏ jeden nuget magickÈ rudy.
		Log_CreateTopic (TOPIC_Huno_BARONARMOR,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Huno_BARONARMOR,LOG_RUNNING);
    Ninja_OCExpansion_MIS_Huno_BARONARMOR = LOG_RUNNING;
	B_LogEntry (TOPIC_Huno_BARONARMOR,"Huno souhlasil na vylepöenÌ zbroje rudobarona za pomocÌ ËernÈ rudy, bude pot¯ebovat dva kusy ËernÈ rudy a jeden nuget magickÈ rudy.");
};
instance DIA_Patch_OCExpansion_DOBAR_BARON_BlackArmor (C_INFO)
{
	npc			 =  BDT_1099_Addon_Huno;
	nr			 =  8;
	condition	 = 	DIA_Patch_OCExpansion_DOBAR_BARON_BlackArmor_Condition;
	information	 = 	DIA_Patch_OCExpansion_DOBAR_BARON_BlackArmor_Info;
	permanent	 = 	FALSE;
	description	 = 	"M·m u sebe vöechnu rudu pro vylepöenÌ zbroje rudobarona.";
};
func int DIA_Patch_OCExpansion_DOBAR_BARON_BlackArmor_Condition ()
{	
	if (Npc_HasItems(other, ItAr_OC_BM) > 0)
    && (Npc_HasItems(other, ItMi_Nugget) >= 1)
	&& (Npc_HasItems(other, ItMi_Zeitspalt_Addon) >= 2)	
	&& (Npc_KnowsInfo (other, DIA_ENGOR_ARMORQUESTION_BARONBLACK_PATCHOC))
	{
		return TRUE;
	};
};
func void DIA_Patch_OCExpansion_DOBAR_BARON_BlackArmor_Info ()
{
    AI_Output(other, self, "DIA_Patch_OCExpansion_DOBAR_BARON_BlackArmor_15_01"); //M·m vöe pro vylepöenÌ zbroje rudobarona.

	if (Npc_HasItems(other, ItAr_OC_BM) > 0)
    && (Npc_HasItems(other, ItMi_Nugget) >= 1)
	&& (Npc_HasItems(other, ItMi_Zeitspalt_Addon) >= 2)
	{	
        B_GiveInvItems(other, self, ITAR_OC_BM, 1);				
        B_GiveInvItems(other, self, ItMi_Nugget, 1);
        B_GiveInvItems(other, self, ItMi_Zeitspalt_Addon, 2);       
	   AI_Output(other, self, "DIA_Patch_OCExpansion_DOBAR_BARON_BlackArmor_15_10"); //Tady to je.
        AI_Output(self, other, "DIA_Patch_OCExpansion_DOBAR_BARON_BlackArmor_13_11"); //Tak j· se tedy do toho d·m, douf·m ûe se to poda¯Ì.
        
        B_LookAtNpc(other, self);
        AI_UseMob(self, "BSFIRE", 1);
        AI_UseMob(self, "BSFIRE", -1);
        B_TurnToNpc(other, self);

        AI_UseMob(self, "BSANVIL", 1);
        AI_UseMob(self, "BSANVIL", -1);
        B_TurnToNpc(other, self);

        AI_UseMob(self, "BSCOOL", 1);
        AI_UseMob(self, "BSCOOL", -1);
        B_TurnToNpc(other, self);
                
		B_LookAtNpc(other, self);
        AI_UseMob(self, "BSFIRE", 1);
        AI_UseMob(self, "BSFIRE", -1);
        B_TurnToNpc(other, self);

        AI_UseMob(self, "BSANVIL", 1);
        AI_UseMob(self, "BSANVIL", -1);
        B_TurnToNpc(other, self);

        AI_UseMob(self, "BSCOOL", 1);
        AI_UseMob(self, "BSCOOL", -1);
        B_TurnToNpc(other, self);
		B_TurnToNpc(self, other);
        
        AI_Output(self, other, "DIA_Patch_OCExpansion_DOBAR_BARON_BlackArmor_13_12"); //Hotovo.
        B_GiveInvItems(self, other, ITAR_OC_BH, 1);
        AI_Output(self, other, "DIA_Patch_OCExpansion_DOBAR_BARON_BlackArmor_13_13"); //Tady je, jsem s·m p¯ekvapen˝ ûe se takhle vyda¯ila.
        AI_Output(other, self, "DIA_Patch_OCExpansion_DOBAR_BARON_BlackArmor_15_14"); //DÌky.
				B_LogEntry (TOPIC_Huno_BARONARMOR,"Huno mi vylepöil zbroj rudobarona za pomocÌ ËernÈ rudy.");
		Log_SetTopicStatus(TOPIC_Huno_BARONARMOR, LOG_SUCCESS);
        Ninja_OCExpansion_MIS_Huno_BARONARMOR = LOG_SUCCESS;
	}
	else 
	{
	    AI_Output (self, other, "DIA_Patch_OCExpansion_DOBAR_BARON_BlackArmor_13_16"); //Vraù se aû to vöechno budeö mÌt u sebe.
	};
};

instance PC_BARONAMAZINGIDEA_PATCHOC (C_INFO)
{
	condition	 = 	PC_BARONAMAZINGIDEA_PATCHOC_Condition;
	information	 = 	PC_BARONAMAZINGIDEA_PATCHOC_Info;
};
func int PC_BARONAMAZINGIDEA_PATCHOC_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	{
		return TRUE;
	};
};
func void PC_BARONAMAZINGIDEA_PATCHOC_Info ()
{	
	B_LogEntry (TOPIC_HUNO_BARONARMOR,"Po p¯eËtenÌ Almanachu jsem dostal n·pad jak vylepöit zbroj rudobarona za pomocÌ ËernÈ rudy.");
};