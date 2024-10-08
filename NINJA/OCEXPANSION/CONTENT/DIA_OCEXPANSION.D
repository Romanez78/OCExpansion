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
	description	 = 	"Pot�ebuju v�ce surov� oceli.";
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
    AI_Output(other, self, "DIA_BRIAN_BUYRAWSTEEL_PATCHOC_15_01"); //Pot�ebuju v�ce surov� oceli.
    AI_Output(self, other, "DIA_BRIAN_BUYRAWSTEEL_PATCHOC_13_02"); //M��u ti prodat n�j�ke z m�ch osobn�ch z�sob, ale vyjde t� to draho.
    AI_Output(self, other, "DIA_BRIAN_BUYRAWSTEEL_PATCHOC_13_03"); //200 zlat�ch za jeden kus.
};
instance DIA_PATCHOC_BRIAN_IWANNABUYSOMESTEEL		(C_INFO)
{
	npc		 = 	VLK_457_Brian;
	nr		 = 	3;
	condition	 = 	DIA_PATCHOC_BRIAN_IWANNABUYSOMESTEEL_Condition;
	information	 = 	DIA_PATCHOC_BRIAN_IWANNABUYSOMESTEEL_Info;
	permanent	 = 	TRUE;
	description	 = 	"Prodej mi jeden kus surov� oceli. (Cena: 200 zlat�ch).";
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
	AI_Output(other, self, "DIA_PATCHOC_BRIAN_IWANNABUYSOMESTEEL_4_1"); //Prodej mi jeden kus surov� oceli.
	
	if (B_GiveInvItems(other, self, ItMi_Gold, 200))
	{	
		AI_Output(self, other, "DIA_PATCHOC_BRIAN_IWANNABUYSOMESTEEL_4_2"); //Tady je.
		B_GiveInvItems (self, other, ItMiSwordraw, 1);	
	}
	else 
	{
		AI_Output(self, other, "DIA_PATCHOC_BRIAN_IWANNABUYSOMESTEEL_4_3"); //P�ij� a� bude� m�t u sebe dost zlata
	};
};
const string	TOPIC_CARL_REPAIRSHADOWARMOR				=   "Zbroj St�na";
instance Ninja_OldCampExpansion_DIA_Addon_Cavalorn_SHADOWB		(C_INFO)
{
	npc		 = 	BAU_4300_Addon_Cavalorn;
	nr		 = 	23;
	condition	 = 	Ninja_OldCampExpansion_DIA_Addon_Cavalorn_SHADOWB_Condition;
	information	 = 	Ninja_OldCampExpansion_DIA_Addon_Cavalorn_SHADOWB_Info;

	description	 = 	"Co takhle n�j�k� zbroj?";
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
	AI_Output	(other, self, "Ninja_OldCampExpansion_DIA_Addon_Cavalorn_SHADOWB_15_00"); //Co takhle n�j�k� zbroj?
	AI_Output	(self, other, "Ninja_OldCampExpansion_DIA_Addon_Cavalorn_SHADOWB_08_02"); //Jedin� co mi zbylo tak je m�j star� od�v st�na kter� jsem nosil v kolonii, ale ten u� toho za�il mnoho...
	AI_Output	(other, self, "Ninja_OldCampExpansion_DIA_Addon_Cavalorn_SHADOWB_15_03"); //Rozhodn� lep�� ne� nic.
	CreateInvItems (self, ITAR_OC_SB, 1);									
	B_GiveInvItems (self, other, ITAR_OC_SB, 1);					
	Log_CreateTopic (TOPIC_CARL_REPAIRSHADOWARMOR,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_CARL_REPAIRSHADOWARMOR,LOG_RUNNING);
	B_LogEntry (TOPIC_CARL_REPAIRSHADOWARMOR,"Cavalorn mi dal jeho star� od�v st�na, ale je v hrozn�m stavu. Mo�n� ve m�st� najdu n�koho kdo mi ho oprav�, ale mus� to b�t n�kdo kdo mn� nenahlas� str�i. P�ece jenom takov� oble�en� nosily Gomezovy lid�	ve star�m t�bo�e.");
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
	description	 = 	"Nemohl by si mi opravit tuhle zbroj? (Uk�zat od�v st�na)";
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
    AI_Output(self, other, "Ninja_OldCampExpansion_DIA_Addon_Carl_QUESTION_13_02"); //Ur�it� mohl, sice nejsem nejlep�� kov�� �iroko daleko ale n�co takov�ho zvl�dnu.
    AI_Output(self, other, "Ninja_OldCampExpansion_DIA_Addon_Carl_QUESTION_13_03"); //P�ijde mi ale �e u� jsem ji n�kde vid�l, kde si j� sehnal?
	AI_Output(other, self, "Ninja_OldCampExpansion_DIA_Addon_Carl_QUESTION_15_04"); //Kdy� ti zaplat�m, nebude� se u� na nic vypt�vat?
	AI_PlayAni (self, "T_SEARCH");
	AI_Output(self, other, "Ninja_OldCampExpansion_DIA_Addon_Carl_QUESTION_13_05"); //Dobr�, souhlas�m, v dne�n� dob� je ka�d� pr�ce dobr�. Jenom douf�m �e se d�ky tomu nedostanu do mal�ru.
	AI_Output(self, other, "Ninja_OldCampExpansion_DIA_Addon_Carl_QUESTION_13_06"); //Budu od tebe cht�t 175 zlat�ch, za m�� mi to nestoj�.
	B_LogEntry (TOPIC_CARL_REPAIRSHADOWARMOR,"Carl souhlasil �e mi zbroj oprav� za 175 zlat�ch.");
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
	description	 = 	"M�m u sebe dostatek zlat�ch, oprav mi zbroj (Opravit Od�v St�na, Cena 175).";
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
    AI_Output(other, self, "Ninja_OldCampExpansion_DIA_Addon_Carl_REFORGE_15_01"); //M�m u sebe dostatek zlat�ch, oprav mi zbroj.	
        B_GiveInvItems(other, self, ItAr_OC_SB, 1);				
        B_GiveInvItems(other, self, ItMi_Gold, 175);
        AI_Output(self, other, "Ninja_OldCampExpansion_DIA_Addon_Carl_REFORGE_13_12"); //Dobr�, d�m se tedy do toho.
        
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
        AI_Output(other, self, "Ninja_OldCampExpansion_DIA_Addon_Carl_REFORGE_15_15"); //D�ky.
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
	description	 = 	"Ne�lo by tu zbroj vylep�it? (Od�v St�na)";
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
    AI_Output(other, self, "Ninja_OldCampExpansion_DIA_Addon_Carl_UPGRADEQUESTION_15_01"); //Ne�lo by tu zbroj vylep�it?
	AI_PlayAni (self, "T_SEARCH");
	AI_Output(self, other, "Ninja_OldCampExpansion_DIA_Addon_Carl_UPGRADEQUESTION_13_05"); //M�m u sebe n�kres kter� jsem z�skal kr�tce po p�du bari�ry.
	AI_Output(self, other, "Ninja_OldCampExpansion_DIA_Addon_Carl_UPGRADEQUESTION_13_06"); //Za 250 zlat�ch ti ho p�ep�u.
	B_LogEntry (TOPIC_CARL_REPAIRSHADOWARMOR,"Carl mi p�ep�e n�kres na v�robu zbroje st�na za 250 zlat�ch.");
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
	description	 = 	"Koupit n�kres pro v�robu Zbroje st�na (250 zlat�ch)";
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
    AI_Output(other, self, "Ninja_OldCampExpansion_DIA_Addon_Carl_SHADOWARMOR_15_01"); //Prodej mi n�kres na v�robu zbroje st�na.

	if (B_GiveInvItems(other, self, ItMi_Gold, 250)) 
	{		
		AI_Output(self, other, "Ninja_OldCampExpansion_DIA_Addon_Carl_SHADOWARMOR13_12"); //Dobr�, d�m se tedy do toho.
        B_GiveInvItems(self, other, Itwr_blueprint_OC_SH, 1);
		B_LogEntry (TOPIC_CARL_REPAIRSHADOWARMOR,"Carl mi vylep�il zbroj.");
		Log_SetTopicStatus (TOPIC_CARL_REPAIRSHADOWARMOR, LOG_SUCCESS);

	}
	else 
	{
	    AI_Output (self, other, "Ninja_OldCampExpansion_DIA_Addon_Carl_SHADOWARMOR_13_16"); //Sna�� se mn� nap�lit? ��kal jsem �e za n�j chci 250 zlat�ch.
	};
};
//-------------------------------------
//-------------------------------------
const string	TOPIC_DOBAR_GIVEGUARDARMOR				=   "Zbroj z hradu star�ho t�bora";
instance Ninja_OldCampExpansion_DIA_Dobar_GUARDQUESTION (C_INFO)
{
	npc			 =  VLK_4106_Dobar;
	nr			 =  4;
	condition	 = 	Ninja_OldCampExpansion_DIA_Dobar_GUARDQUESTION_Condition;
	information	 = 	Ninja_OldCampExpansion_DIA_Dobar_GUARDQUESTION_Info;
	permanent	 = 	FALSE;
	description	 = 	"Pot�ebuju n�jakou lep�� zbroj.";
};
func int Ninja_OldCampExpansion_DIA_Dobar_GUARDQUESTION_Condition ()	
{
	return TRUE;
};
func void Ninja_OldCampExpansion_DIA_Dobar_GUARDQUESTION_Info ()
{
    AI_Output(other, self, "Ninja_OldCampExpansion_DIA_Dobar_GUARDQUESTION_15_01"); //Pot�ebuju n�jakou lep�� zbroj.
    AI_Output(self, other, "Ninja_OldCampExpansion_DIA_Dobar_GUARDQUESTION_13_02"); //Promluv si s Engorem, on m� na starosti na�e z�soby.
	AI_Output(other, self, "Ninja_OldCampExpansion_DIA_Dobar_GUARDQUESTION_15_03"); //V�m �e tohle byl nejv�t�� t�bor trestanc� p�ed p�dem bari�ry, ur�it� tu po nich n�co z�stalo.
	AI_Output(self, other, "Ninja_OldCampExpansion_DIA_Dobar_GUARDQUESTION_15_04"); //A kdyby ano, pro� bych ti to m�l jen tak d�t? Rozhodn� tu nem�me z�sob nazbyt. 
	AI_Output(other, self, "Ninja_OldCampExpansion_DIA_Dobar_GUARDQUESTION_15_05"); //Zaplat�m ti.
	AI_Output(self, other, "Ninja_OldCampExpansion_DIA_Dobar_GUARDQUESTION_13_06"); //A k �emu mi tady bude zlato? Nem��u ho sn�st a pr�ci mi tady neuleh��.
	AI_Output(other, self, "Ninja_OldCampExpansion_DIA_Dobar_GUARDQUESTION_15_07"); //Tak co tedy chce�?
	AI_Output(self, other, "Ninja_OldCampExpansion_DIA_Dobar_GUARDQUESTION_13_08"); //Hmm, domluv�me se takhle: ty za mn� vyrob� 6 me�� a p�ine� mn� a Parlafovi n�co k j�dlu a j� ti na opl�tku tady se�enu n�j�kou zbroj co tu z�stala po trestanc�ch. 
	AI_Output(other, self, "Ninja_OldCampExpansion_DIA_Dobar_GUARDQUESTION_15_09"); //Dobr�, beru to.
	AI_Output(self, other, "Ninja_OldCampExpansion_DIA_Dobar_GUARDQUESTION_13_10"); //V tom p��pad� dones n�m ka�d�mu jednu �unku, chleba a kus s�ra. A je�t� 6 piv pro n�s oba.
	B_GiveInvItems(self, other, ItMiSwordraw, 6);
	AI_Output(self, other, "Ninja_OldCampExpansion_DIA_Dobar_GUARDQUESTION_13_11"); //Tady m� materi�l na ty me�e, ale nechci aby si mi p�inesl n�j�k� amat�rsk� kousky. Chci aby byly kvalitn�.
	AI_Output(self, other, "Ninja_OldCampExpansion_DIA_Dobar_GUARDQUESTION_13_12"); //Kdy� jich p�inese� 6 a to j�dlo tak ti d�m zbroj.
	Log_CreateTopic (TOPIC_DOBAR_GIVEGUARDARMOR,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_DOBAR_GIVEGUARDARMOR,LOG_RUNNING);
	B_LogEntry (TOPIC_DOBAR_GIVEGUARDARMOR,"Dobar mi sl�bil �e mi najde n�jakou zbroj co z�stala po trestanc�ch ve star�m hradu v hornick� kolonii. Chce po mn� abych mu vykoval 6 kvalitn�ch me�� a p�inesl dv� �unky, dva kusy s�ra, dva bochn�ky chleba a �est piv.");
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
	description	 = 	"M�m v�e co si po mn� cht�l.";
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
	AI_Output(other, self, "Ninja_OldCampExpansion_DIA_Dobar_GUARDBRINGEVERYTHING_15_01"); //M�m v�e co si po mn� cht�l.
    AI_Output(self, other, "Ninja_OldCampExpansion_DIA_Dobar_GUARDBRINGEVERYTHING_13_02"); //N�dhera, kone�ne si m��eme j� a Parlaf trochu odpo�inout.
	AI_Output(self, other, "Ninja_OldCampExpansion_DIA_Dobar_GUARDBRINGEVERYTHING_15_03"); //Na�el jsem ti tu zbroj co si cht�l, tady ji m�.
	B_GiveInvItems(self, other, ITAR_OC_GM, 1);
	AI_Output(other, self, "Ninja_OldCampExpansion_DIA_Dobar_GUARDBRINGEVERYTHING_15_04"); //D�ky.
		B_LogEntry (TOPIC_DOBAR_GIVEGUARDARMOR,"Po t� co jsem v�echno p�inesl Dobarovi mi dal zbroj str�e star�ho t�bora");
		Log_SetTopicStatus(TOPIC_DOBAR_GIVEGUARDARMOR, LOG_SUCCESS);
};
instance DIA_Addon_Greg_GuardArmor_PATCH	(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_GuardArmor_PATCH_Condition;
	information	 = 	DIA_Addon_Greg_GuardArmor_PATCH_Info;
	permanent 	 =	FALSE;
	description	 = 	"Na�el jsi n�co zaj�mav�ho v Dexterov� t�bo�e?.";
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
	AI_Output	(other, self, "DIA_Addon_Greg_GuardArmor_PATCH_15_00"); //Na�el jsi n�co zaj�mav�ho v Dexterov� t�bo�e?.
	AI_Output	(self, other, "DIA_Addon_Greg_GuardArmor_PATCH_01_01"); //Ani ne, sam� cetky a blbosti.
	AI_Output	(self, other, "DIA_Addon_Greg_GuardArmor_PATCH_01_02"); //Na�el jsem n�jakou �ervenou zbroj, jestli chce� m��e� si ji nechat.
	AI_Output	(self, other, "DIA_Addon_Greg_GuardArmor_PATCH_01_03"); //Nem�m pro n� vyu�it� a nechce se mi sebou tahat.
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
	description	 = 	"Stalo se tu na z�mku mezit�m n�co zaj�mav�ho?";
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
    AI_Output(other, self, "DIA_ENGOR_ARMORQUESTION_BARON_PATCHOC_15_01"); //Stalo se tu na z�mku mezit�m n�co zaj�mav�ho?
    AI_Output(self, other, "DIA_ENGOR_ARMORQUESTION_BARON_PATCHOC_13_02"); //Dalo by se tak ��ct, jeliko� jsme tu uv�zn�ni tak m�me v�ce �asu prozkoum�vat zbytek hradu.
    AI_Output(self, other, "DIA_ENGOR_ARMORQUESTION_BARON_PATCHOC_13_03"); //Na�el jsem n�jakou zbroj, mysl�m si �e pat�ila rudobaron�m co tu vl�dly. Ale pochybuju �e by tu n�kdo cht�l n�co takov�ho nosit, tak�e m��e b�t tvoje za 3000 zlat�ch.
	B_LogEntry (TOPIC_Trader_OC,"Engor mi prod� zbroj rudobarona za 3000 zlat�ch.");
};
instance DIA_PATCHOC_ENGOR_BARON_BUY		(C_INFO)
{
	npc		 = 	VLK_4108_Engor;
	nr		 = 	3;
	condition	 = 	DIA_PATCHOC_ENGOR_BARON_BUY_Condition;
	information	 = 	DIA_PATCHOC_ENGOR_BARON_BUY_Info;
	permanent	 = 	FALSE;
	description	 = 	"Prodej mi zbroj rudobarona. (Obrany: 85/85, bonus 3 body s�ly Cena: 3000 zlat�ch).";
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
		AI_Output(self, other, "DIA_PATCHOC_ENGOR_BARON_BUY_4_2"); //Dob�e, tady ji m�.
		B_LogEntry (TOPIC_Trader_OC,"Engor mi prodal zbroj Rudobarona.");

		B_GiveInvItems(self, other, ItAr_OC_BL, 1);
	}
	else 
	{
		AI_Output(self, other, "DIA_PATCHOC_ENGOR_BARON_BUY_4_3"); //P�ij� a� bude� m�t u sebe dost zlata
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
	description	 = 	"Mohl by jsi vylep�it zbroj ze star�ho t�bora?";
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
    AI_Output(other, self, "DIA_DOBAR_ARMORQUESTION_OLDCAMP_PATCHOC_15_01"); //Mohl by jsi vylep�it zbroj ze star�ho t�bora?
    AI_Output(other, self, "DIA_DOBAR_ARMORQUESTION_OLDCAMP_PATCHOC_15_02"); //Jednu u sebe m�m, a mysl�m si �e pr�v� ty by si mi mohl pomoct.    
	AI_Output(self, other, "DIA_DOBAR_ARMORQUESTION_OLDCAMP_PATCHOC_13_03"); //Mohl, m�m u sebe n�kres kde jsem sepsal m� n�pady jak vylep�it zbroje co se tam nosily. 
	AI_Output(self, other, "DIA_DOBAR_ARMORQUESTION_OLDCAMP_PATCHOC_13_04"); //Cht�l jsem ho uk�zat Stoneovi, ale t� doby co uzav�ely star� t�bor jsem ho nevid�l a mysl�m si �e te� u� by ho to stejn� nezaj�malo.    
	AI_Output(self, other, "DIA_DOBAR_ARMORQUESTION_OLDCAMP_PATCHOC_13_05"); //N�kres u� tedy pro mn� nem� vyu�it�, prod�m ti ho za 1750 zlat�ch.	
	B_LogEntry (Topic_Addon_BDT_Trader,"Huno mi prod� n�kres kde m� seps�no jak vylep�it zbroje ze star�ho t�bora za 1700 zlat�ch.");
};
instance DIA_Patch_OCEcpansion_Huno_Buy		(C_INFO)
{
	npc		 	 = 	BDT_1099_Addon_Huno;
	nr		 	 = 	2;
	condition	 = 	DIA_Patch_OCEcpansion_Huno_Buy_Condition;
	information	 = 	DIA_Patch_OCEcpansion_Huno_Buy_Info;
	permanent 	 =  TRUE;
	description	 = 	"Koupit n�kres pro vynikaj�c� me� domobrany Archolosu (po�. 75, dos. 90, s�la 60 Bonus k dovednosti. Cena: 1000 zlat�ch)"; 
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
		AI_Output (other, self, "DIA_Patch_OCEcpansion_Huno_Buy_Buy_15_00"); //Prodej mi n�kres pro jednoru�n� me�.
		AI_Output (self, other, "DIA_Patch_OCEcpansion_Huno_Buy_Buy_06_01"); //Jasn�.
		B_GiveInvItems (self,other, ItWr_BluePrint_ImproveOCArmor,1);
		Huno_OCEXPANSION_NINJA_Plan_Bouhgt_perm = TRUE;
	B_LogEntry (Topic_Addon_BDT_Trader,"Koupil jsem od Huna n�kres.");
	}
	else
	{
		AI_Output (self, other, "DIA_Patch_OCEcpansion_Huno_Buy_Buy_06_02"); //Nem� dost zlata.
	};
};
//
const string TOPIC_Huno_BARONARMOR = "�ern� zbroj rudobarona";
var int Ninja_OCExpansion_MIS_Huno_BARONARMOR;
instance DIA_ENGOR_ARMORQUESTION_BARONBLACK_PATCHOC (C_INFO)
{
	npc			 =  BDT_1099_Addon_Huno;
	nr			 =  4;
	condition	 = 	DIA_ENGOR_ARMORQUESTION_BARONBLACK_PATCHOC_Condition;
	information	 = 	DIA_ENGOR_ARMORQUESTION_BARONBLACK_PATCHOC_Info;
	permanent	 = 	FALSE;
	description	 = 	"Dostal jsem n�pad jak je�t� vylep�it zbroj rudobarona.";
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
    AI_Output(other, self, "DIA_ENGOR_ARMORQUESTION_BARONBLACK_PATCHOC_15_01"); //Dostal jsem n�pad jak je�t� vylep�it zbroj rudobarona.
    AI_Output(other, self, "DIA_ENGOR_ARMORQUESTION_BARONBLACK_PATCHOC_15_01"); //Dala by se vylep�it s �ernou rudou, �etl jsem o ne�em podobn�m ve star� knize.  
    AI_Output(self, other, "DIA_ENGOR_ARMORQUESTION_BARONBLACK_PATCHOC_13_02"); //Zn� to trochu ��len�, ale mysl�m si �e by to �lo ud�lat.
    AI_Output(self, other, "DIA_ENGOR_ARMORQUESTION_BARONBLACK_PATCHOC_13_03"); //Tak�e tedy, na takovou zbroj bude� pot�ebovat dva kusy �ern� rudy, a je�t� jeden nuget magick� rudy.
		Log_CreateTopic (TOPIC_Huno_BARONARMOR,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Huno_BARONARMOR,LOG_RUNNING);
    Ninja_OCExpansion_MIS_Huno_BARONARMOR = LOG_RUNNING;
	B_LogEntry (TOPIC_Huno_BARONARMOR,"Huno souhlasil na vylep�en� zbroje rudobarona za pomoc� �ern� rudy, bude pot�ebovat dva kusy �ern� rudy a jeden nuget magick� rudy.");
};
instance DIA_Patch_OCExpansion_DOBAR_BARON_BlackArmor (C_INFO)
{
	npc			 =  BDT_1099_Addon_Huno;
	nr			 =  8;
	condition	 = 	DIA_Patch_OCExpansion_DOBAR_BARON_BlackArmor_Condition;
	information	 = 	DIA_Patch_OCExpansion_DOBAR_BARON_BlackArmor_Info;
	permanent	 = 	FALSE;
	description	 = 	"M�m u sebe v�echnu rudu pro vylep�en� zbroje rudobarona.";
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
    AI_Output(other, self, "DIA_Patch_OCExpansion_DOBAR_BARON_BlackArmor_15_01"); //M�m v�e pro vylep�en� zbroje rudobarona.

	if (Npc_HasItems(other, ItAr_OC_BM) > 0)
    && (Npc_HasItems(other, ItMi_Nugget) >= 1)
	&& (Npc_HasItems(other, ItMi_Zeitspalt_Addon) >= 2)
	{	
        B_GiveInvItems(other, self, ITAR_OC_BM, 1);				
        B_GiveInvItems(other, self, ItMi_Nugget, 1);
        B_GiveInvItems(other, self, ItMi_Zeitspalt_Addon, 2);       
	   AI_Output(other, self, "DIA_Patch_OCExpansion_DOBAR_BARON_BlackArmor_15_10"); //Tady to je.
        AI_Output(self, other, "DIA_Patch_OCExpansion_DOBAR_BARON_BlackArmor_13_11"); //Tak j� se tedy do toho d�m, douf�m �e se to poda��.
        
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
        AI_Output(self, other, "DIA_Patch_OCExpansion_DOBAR_BARON_BlackArmor_13_13"); //Tady je, jsem s�m p�ekvapen� �e se takhle vyda�ila.
        AI_Output(other, self, "DIA_Patch_OCExpansion_DOBAR_BARON_BlackArmor_15_14"); //D�ky.
				B_LogEntry (TOPIC_Huno_BARONARMOR,"Huno mi vylep�il zbroj rudobarona za pomoc� �ern� rudy.");
		Log_SetTopicStatus(TOPIC_Huno_BARONARMOR, LOG_SUCCESS);
        Ninja_OCExpansion_MIS_Huno_BARONARMOR = LOG_SUCCESS;
	}
	else 
	{
	    AI_Output (self, other, "DIA_Patch_OCExpansion_DOBAR_BARON_BlackArmor_13_16"); //Vra� se a� to v�echno bude� m�t u sebe.
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
	B_LogEntry (TOPIC_HUNO_BARONARMOR,"Po p�e�ten� Almanachu jsem dostal n�pad jak vylep�it zbroj rudobarona za pomoc� �ern� rudy.");
};