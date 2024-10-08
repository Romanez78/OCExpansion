/*
 *  SMITHARMOR.d
 *   - forging armors
 *
 *  [Damianut 26.04.2024]
 */


// --- OBSOLETE
/*
 *  [VARIABLES]
 *   - [ARMORS]
 *
 *  I create variables for each armor, to avoid extending already created `PLAYER_TALENT_SMITH[]` array.
 *  If a variable, which starts with `NINJA_ARMOREXPANSION_PLAYER_TALENT_SMITH` is true, it means, that player knows how to forge an armor with an instance name, which is written after `NINJA_ARMOREXPANSION_PLAYER_TALENT_SMITH_`.
 */
// var int NINJA_ARMOREXPANSION_PLAYER_TALENT_SMITH_ITAR_PAL_ST;
// --- END "OBSOLETE"


/*
 *  [CONSTANTS]
 *   - [MOBSI]
 *  Treat an anvil like another mobsi, when player wants to forge an armor from a packet.
 */
const int NINJA_OCEXPANSION_MOBSI_SmithWeapon = 101;


/*
 *  [CONSTANTS]
 *   - [INGREDIENTS]
 *
 *  Lists of ingredients needed to forge armors.
 *  A name of an instance of a given ingredient, is written after `__` in each of a below constant.
 *
 *  IMPORTANT: To forge an armor, a blueprint itself is needed.
 */

/*
 *  instance `ITAR_OC_GLR`
 *      Description: in `Use_Plan_OCArmor` called by `ItWr_BluePrint_OCArmor` [IT_OCEXPANSION.D]
 */
const int NINJA_OCEXPANSION_INGREDIENTS_ITAR_OC_GLR__ItMiSwordrawhot = 1;
const int NINJA_OCEXPANSION_INGREDIENTS_ITAR_OC_GLR__ItAt_Addon_KeilerFur = 2;
const int NINJA_OCEXPANSION_INGREDIENTS_ITAR_OC_GLR__ItAr_OC_GL = 1;


/*
 *  instance `ITAR_OC_GMR`
 *      Description: in `Use_Plan_OCArmor` called by `ItWr_BluePrint_OCArmor` [IT_OCEXPANSION.D]
 */
const int NINJA_OCEXPANSION_INGREDIENTS_ITAR_OC_GMR__ItMiSwordrawhot = 2;
const int NINJA_OCEXPANSION_INGREDIENTS_ITAR_OC_GMR__ItAt_WargFur = 2;
const int NINJA_OCEXPANSION_INGREDIENTS_ITAR_OC_GMR__ItAr_OC_GM = 1;

/*
 *  instance `ITAR_OC_GHR`
 *      Description: in `Use_Plan_OCArmor` called by `ItWr_BluePrint_OCArmor` [IT_OCEXPANSION.D]
 */
const int NINJA_OCEXPANSION_INGREDIENTS_ITAR_OC_GHR__ItMiSwordrawhot = 4;
const int NINJA_OCEXPANSION_INGREDIENTS_ITAR_OC_GHR__ItAt_TrollFur = 1;
const int NINJA_OCEXPANSION_INGREDIENTS_ITAR_OC_GHR__ITAR_Thorus_Addon = 1;

/*
 *  instance `ITAR_OC_BM`
 *      Description: in `Use_Plan_OCBaronArmor` called by `ItWr_BluePrint_OCBaronArmor` [IT_OCEXPANSION.D]
 */
const int NINJA_OCEXPANSION_INGREDIENTS_ITAR_OC_BM__ItMiSwordrawhot = 4;
const int NINJA_OCEXPANSION_INGREDIENTS_ITAR_OC_BM__ItMi_Nugget = 1;
const int NINJA_OCEXPANSION_INGREDIENTS_ITAR_OC_BM__ITAR_OC_BL = 1;

/*
 *  instance `ITAR_OC_SH`
 *      Description: in `Use_Plan_OCBaronArmor` called by `ItWr_BluePrint_OCBaronArmor` [IT_OCEXPANSION.D]
 */
const int NINJA_OCEXPANSION_INGREDIENTS_ITAR_OC_SH__ItMiSwordrawhot = 2;
const int NINJA_OCEXPANSION_INGREDIENTS_ITAR_OC_SH__Itat_Wolffur = 3;

/*
 *  [CONSTANTS]
 *   - [ALERTS]
 *
 *  The constants used to create an alert (print on a screen) about missing ingredient(s) or an forged armor.
 */
const string NINJA_OCEXPANSION_PRINT_ProdItemsMissing__SUBSTR_1 = "Chyb�: ";
const string NINJA_OCEXPANSION_PRINT_ProdItemsMissing__SUBSTR_2 = " x";
const string NINJA_OCEXPANSION_PRINT_ForgeSuccess = " vyrobeno!";


/*
 *  [FUNCTIONS & INSTANCES]
 */

/*
 *  NINJA_ARMOREXPANSION_Func_Print_ProdItemsMissing
 *   - display information about missing ingredient(s)
 */
func void NINJA_OCEXPANSION_Func_Print_ProdItemsMissing(var string ingredientName, var int missingAmount)
{
    // Build a string
    var string str; str = NINJA_OCEXPANSION_PRINT_ProdItemsMissing__SUBSTR_1;
    str = ConcatStrings(str, ingredientName);
    str = ConcatStrings(str, NINJA_OCEXPANSION_PRINT_ProdItemsMissing__SUBSTR_2);   
	str = ConcatStrings(str, IntToString(missingAmount));
    
    // Print a string
    Print(str);
};

/*
 *  NINJA_ARMOREXPANSION_Func_Print_ForgeSuccess
 *   - display information about an forged armor
 */
func void NINJA_OCEXPANSION_Func_Print_ForgeSuccess(var string armorName)
{
    // Build and print a string
    Print(ConcatStrings(armorName, NINJA_OCEXPANSION_PRINT_ForgeSuccess));
};


/*
 *  [DIALOGUES]
 */

/*
 *  Normal & Ore smithing
 *   - overwriting original condition, to take forging an armor into consideration
 */
func int Ninja_OCExpansion_PC_Common_Condition()
{
    // If player already selected forging an armor
    if (NINJA_OCEXPANSION_MOBSI_SmithWeapon == PLAYER_MOBSI_PRODUCTION)
    {
        return false;
    };
    
    ContinueCall();
};
func int Ninja_OCExpansion_PC_Ore_Condition()
{
    // If player already selected forging an armor
    if (NINJA_OCEXPANSION_MOBSI_SmithWeapon == PLAYER_MOBSI_PRODUCTION)
    {
        return false;
    };
    
    ContinueCall();
};


/*
 *  NINJA_ARMOREXPANSION_PC_FORGE_ARMOR
 *   - select an armor forging
 */
instance NINJA_OCEXPANSION_PC_FORGE_ARMOR(C_INFO)
{
	npc				= PC_Hero;
	nr				= 0;
	condition		= NINJA_OCXPANSION_PC_FORGE_ARMOR_Condition;
	information		= NINJA_OCEXPANSION_PC_FORGE_ARMOR_Info;
	permanent		= true;
	description		= "Vylep�it Zbroj Star�ho T�bora";
};
func int NINJA_OCXPANSION_PC_FORGE_ARMOR_Condition()
{
	if (MOBSI_SmithWeapon == PLAYER_MOBSI_PRODUCTION)
    {
        if (false == Normalwaffen)
        {
            if (false == Erzwaffen)
            {
                return TRUE;
            };
        };
    };
};
func void NINJA_OCEXPANSION_PC_FORGE_ARMOR_Info()
{
    PLAYER_MOBSI_PRODUCTION = NINJA_OCEXPANSION_MOBSI_SmithWeapon;
};

instance NINJA_OCEXPANSION_PC_FORGE_ARMORBACK(C_INFO)
{
	npc				= PC_Hero;
	nr				= 99;
	condition		= NINJA_OCEXPANSION_PC_FORGE_ARMORBACK_Condition;
	information		= NINJA_OCEXPANSION_PC_FORGE_ARMORBACK_Info;
	permanent		= true;
	description		= DIALOG_BACK;
};
func int NINJA_OCEXPANSION_PC_FORGE_ARMORBACK_Condition()
{
    if (NINJA_OCEXPANSION_MOBSI_SmithWeapon == PLAYER_MOBSI_PRODUCTION)
    {
        return true;
    };
};
func void NINJA_OCEXPANSION_PC_FORGE_ARMORBACK_Info()
{
    // Return to original constant.
	PLAYER_MOBSI_PRODUCTION = MOBSI_SmithWeapon;
};
instance NINJA_OCEXPANSION_PC_FORGE_ARMOR_End(C_Info)
{
	npc				= PC_Hero;
	nr				= 999;
	condition		= NINJA_OCEXPANSION_PC_FORGE_ARMOR_End_Condition;
	information		= NINJA_OCEXPANSION_PC_FORGE_ARMOR_End_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};
func int NINJA_OCEXPANSION_PC_FORGE_ARMOR_End_Condition()
{
	if (NINJA_OCEXPANSION_MOBSI_SmithWeapon == PLAYER_MOBSI_PRODUCTION)
	{
		return TRUE;
	};
};
func void NINJA_OCEXPANSION_PC_FORGE_ARMOR_End_Info()
{
	CreateInvItems(self, ItMiSwordRaw, 1);
	B_ENDPRODUCTIONDIALOG();
    
    // For sure I reset it.
	Erzwaffen = FALSE;
	NormalWaffen = FALSE;
};


/*
 *  Forging concrete armor
 */

/*
 *  NINJA_OCEXPANSION_PC_ITAR_OC_GLR
 */
INSTANCE NINJA_OCEXPANSION_PC_ITAR_OC_GLR (C_INFO)
{
	npc				= PC_Hero;
	condition		= NINJA_OCEXPANSION_PC_ITAR_OC_GLR_Condition;
	information		= NINJA_OCEXPANSION_PC_ITAR_OC_GLR_Info;
	permanent		= true;
    description     = "Vylep�it Lehkou zbroj str�e";
};
FUNC INT NINJA_OCEXPANSION_PC_ITAR_OC_GLR_Condition()
{	
	if (NINJA_OCEXPANSION_MOBSI_SmithWeapon == PLAYER_MOBSI_PRODUCTION)
    {
        // If has a blueprint
        if (0 < Npc_HasItems(hero, ItWr_BluePrint_ImproveOCArmor))
		{	
            return true;
        };
    };
};
FUNC VOID NINJA_OCEXPANSION_PC_ITAR_OC_GLR_Info()
{
	var int has_all_ingredients; has_all_ingredients = true;
    var int amount_needed;
    var int amount_current;
    var int amount_missing;
    
    // Check ingredients
    
    // [ItMiSwordrawhot]
    amount_needed = NINJA_OCEXPANSION_INGREDIENTS_ITAR_OC_GLR__ItMiSwordrawhot;
    amount_current = Npc_HasItems(hero, ItMiSwordrawhot) + 1; // IMPORTANT: An one of a raw steel is in a hand
    
    if (amount_needed > amount_current)
    {
        // Count missing ingredients
        amount_missing = amount_needed - amount_current;
    
        // Print message
        NINJA_OCEXPANSION_Func_Print_ProdItemsMissing(ItMiSwordrawhot.name, amount_missing);

        // Save an information, that player hasn't all ingredients
        has_all_ingredients = false;
    };
    
    // [ItAt_Addon_KeilerFur]
    amount_needed = NINJA_OCEXPANSION_INGREDIENTS_ITAR_OC_GLR__ItAt_Addon_KeilerFur;
    amount_current = Npc_HasItems(hero, ItAt_Addon_KeilerFur);
    if (amount_needed > amount_current)
    {
        // Count missing ingredients
        amount_missing = amount_needed - amount_current;
    
        // Print message
        NINJA_OCEXPANSION_Func_Print_ProdItemsMissing(ItAt_Addon_KeilerFur.name, amount_missing);

        // Save an information, that player hasn't all ingredients
        has_all_ingredients = false;
    };
    
	// [ItAr_OC_GL]
    amount_needed = NINJA_OCEXPANSION_INGREDIENTS_ITAR_OC_GLR__ItAr_OC_GL;
    amount_current = Npc_HasItems(hero, ItAr_OC_GL);
    if (amount_needed > amount_current)
    {
        // Count missing ingredients
        amount_missing = amount_needed - amount_current;
    
        // Print message
        NINJA_OCEXPANSION_Func_Print_ProdItemsMissing(ItAr_OC_GL.name, amount_missing);

        // Save an information, that player hasn't all ingredients
        has_all_ingredients = false;
    }; 
 
    
    // If player has all ingredients
    if (true == has_all_ingredients)
    {
        // Remove ingredients
        
        // [ItMiSwordrawhot]
        // IMPORTANT: An one raw steel will be removed by finishing using of an anvil
        Npc_RemoveInvItems(hero, ItMiSwordrawhot, NINJA_OCEXPANSION_INGREDIENTS_ITAR_OC_GLR__ItMiSwordrawhot - 1);
        
        // [ItAt_Addon_KeilerFur]
        Npc_RemoveInvItems(hero, ItAt_Addon_KeilerFur, NINJA_OCEXPANSION_INGREDIENTS_ITAR_OC_GLR__ItAt_Addon_KeilerFur);
        
        // [ItAr_OC_GL]		
		Npc_RemoveInvItems(hero, ItAr_OC_GL, NINJA_OCEXPANSION_INGREDIENTS_ITAR_OC_GLR__ItAr_OC_GL); 
        
        // Create an armor
        CreateInvItem(hero, ITAR_OC_GLR);
        
        // Print an information about success
        NINJA_OCEXPANSION_Func_Print_ForgeSuccess(ITAR_OC_GLR.name);
    // If hasn't
    } else
    {
        // Restore a raw steel
        CreateInvItem(hero, ItMiSwordrawhot);
    };
    

    // Quit a dialogue window
	B_ENDPRODUCTIONDIALOG();
};
/*
 *  Forging concrete armor
 */

/*
 *  NINJA_OCEXPANSION_PC_ITAR_OC_GMR
 */
INSTANCE NINJA_OCEXPANSION_PC_ITAR_OC_GMR (C_INFO)
{
	npc				= PC_Hero;
	condition		= NINJA_OCEXPANSION_PC_ITAR_OC_GMR_Condition;
	information		= NINJA_OCEXPANSION_PC_ITAR_OC_GMR_Info;
	permanent		= true;
    description     = "Vylep�it Zbroj str�e";
};
FUNC INT NINJA_OCEXPANSION_PC_ITAR_OC_GMR_Condition()
{	
	if (NINJA_OCEXPANSION_MOBSI_SmithWeapon == PLAYER_MOBSI_PRODUCTION)
    {
        // If has a blueprint
        if (0 < Npc_HasItems(hero, ItWr_BluePrint_ImproveOCArmor))
		{	
            return true;
        };
    };
};
FUNC VOID NINJA_OCEXPANSION_PC_ITAR_OC_GMR_Info()
{
	var int has_all_ingredients; has_all_ingredients = true;
    var int amount_needed;
    var int amount_current;
    var int amount_missing;
    
    // Check ingredients
    
    // [ItMiSwordrawhot]
    amount_needed = NINJA_OCEXPANSION_INGREDIENTS_ITAR_OC_GMR__ItMiSwordrawhot;
    amount_current = Npc_HasItems(hero, ItMiSwordrawhot) + 1; // IMPORTANT: An one of a raw steel is in a hand
    
    if (amount_needed > amount_current)
    {
        // Count missing ingredients
        amount_missing = amount_needed - amount_current;
    
        // Print message
        NINJA_OCEXPANSION_Func_Print_ProdItemsMissing(ItMiSwordrawhot.name, amount_missing);

        // Save an information, that player hasn't all ingredients
        has_all_ingredients = false;
    };
    
    // [ItAt_WargFur]
    amount_needed = NINJA_OCEXPANSION_INGREDIENTS_ITAR_OC_GMR__ItAt_WargFur;
    amount_current = Npc_HasItems(hero, ItAt_WargFur);
    if (amount_needed > amount_current)
    {
        // Count missing ingredients
        amount_missing = amount_needed - amount_current;
    
        // Print message
        NINJA_OCEXPANSION_Func_Print_ProdItemsMissing(ItAt_WargFur.name, amount_missing);

        // Save an information, that player hasn't all ingredients
        has_all_ingredients = false;
    };
    
	// [ItAr_OC_GM]
    amount_needed = NINJA_OCEXPANSION_INGREDIENTS_ITAR_OC_GMR__ItAr_OC_GM;
    amount_current = Npc_HasItems(hero, ItAr_OC_GM);
    if (amount_needed > amount_current)
    {
        // Count missing ingredients
        amount_missing = amount_needed - amount_current;
    
        // Print message
        NINJA_OCEXPANSION_Func_Print_ProdItemsMissing(ItAr_OC_GM.name, amount_missing);

        // Save an information, that player hasn't all ingredients
        has_all_ingredients = false;
    }; 
 
    
    // If player has all ingredients
    if (true == has_all_ingredients)
    {
        // Remove ingredients
        
        // [ItMiSwordrawhot]
        // IMPORTANT: An one raw steel will be removed by finishing using of an anvil
        Npc_RemoveInvItems(hero, ItMiSwordrawhot, NINJA_OCEXPANSION_INGREDIENTS_ITAR_OC_GMR__ItMiSwordrawhot - 1);
        
        // [ItAt_WargFur]
        Npc_RemoveInvItems(hero, ItAt_WargFur, NINJA_OCEXPANSION_INGREDIENTS_ITAR_OC_GMR__ItAt_WargFur);
        
        // [ItAr_OC_GM]		
		Npc_RemoveInvItems(hero, ItAr_OC_GM, NINJA_OCEXPANSION_INGREDIENTS_ITAR_OC_GMR__ItAr_OC_GM); 
        
        // Create an armor
        CreateInvItem(hero, ITAR_OC_GMR);
        
        // Print an information about success
        NINJA_OCEXPANSION_Func_Print_ForgeSuccess(ITAR_OC_GMR.name);
    // If hasn't
    } else
    {
        // Restore a raw steel
        CreateInvItem(hero, ItMiSwordrawhot);
    };
    

    // Quit a dialogue window
	B_ENDPRODUCTIONDIALOG();
};
/*
 *  Forging concrete armor
 */

/*
 *  NINJA_OCEXPANSION_PC_ITAR_OC_GHR
 */
INSTANCE NINJA_OCEXPANSION_PC_ITAR_OC_GHR (C_INFO)
{
	npc				= PC_Hero;
	condition		= NINJA_OCEXPANSION_PC_ITAR_OC_GHR_Condition;
	information		= NINJA_OCEXPANSION_PC_ITAR_OC_GHR_Info;
	permanent		= true;
    description     = "Vylep�it T�kou zbroj str�e";
};
FUNC INT NINJA_OCEXPANSION_PC_ITAR_OC_GHR_Condition()
{	
	if (NINJA_OCEXPANSION_MOBSI_SmithWeapon == PLAYER_MOBSI_PRODUCTION)
    {
        // If has a blueprint
        if (0 < Npc_HasItems(hero, ItWr_BluePrint_ImproveOCArmor))
		{	
            return true;
        };
    };
};
FUNC VOID NINJA_OCEXPANSION_PC_ITAR_OC_GHR_Info()
{
	var int has_all_ingredients; has_all_ingredients = true;
    var int amount_needed;
    var int amount_current;
    var int amount_missing;
    
    // Check ingredients
    
    // [ItMiSwordrawhot]
    amount_needed = NINJA_OCEXPANSION_INGREDIENTS_ITAR_OC_GHR__ItMiSwordrawhot;
    amount_current = Npc_HasItems(hero, ItMiSwordrawhot) + 1; // IMPORTANT: An one of a raw steel is in a hand
    
    if (amount_needed > amount_current)
    {
        // Count missing ingredients
        amount_missing = amount_needed - amount_current;
    
        // Print message
        NINJA_OCEXPANSION_Func_Print_ProdItemsMissing(ItMiSwordrawhot.name, amount_missing);

        // Save an information, that player hasn't all ingredients
        has_all_ingredients = false;
    };
    
    // [ItAt_TrollFur]
    amount_needed = NINJA_OCEXPANSION_INGREDIENTS_ITAR_OC_GHR__ItAt_TrollFur;
    amount_current = Npc_HasItems(hero, ItAt_TrollFur);
    if (amount_needed > amount_current)
    {
        // Count missing ingredients
        amount_missing = amount_needed - amount_current;
    
        // Print message
        NINJA_OCEXPANSION_Func_Print_ProdItemsMissing(ItAt_TrollFur.name, amount_missing);

        // Save an information, that player hasn't all ingredients
        has_all_ingredients = false;
    };
    
	// [ITAR_Thorus_Addon]
    amount_needed = NINJA_OCEXPANSION_INGREDIENTS_ITAR_OC_GHR__ITAR_Thorus_Addon;
    amount_current = Npc_HasItems(hero, ITAR_Thorus_Addon);
    if (amount_needed > amount_current)
    {
        // Count missing ingredients
        amount_missing = amount_needed - amount_current;
    
        // Print message
        NINJA_OCEXPANSION_Func_Print_ProdItemsMissing(ITAR_Thorus_Addon.name, amount_missing);

        // Save an information, that player hasn't all ingredients
        has_all_ingredients = false;
    }; 
 
    
    // If player has all ingredients
    if (true == has_all_ingredients)
    {
        // Remove ingredients
        
        // [ItMiSwordrawhot]
        // IMPORTANT: An one raw steel will be removed by finishing using of an anvil
        Npc_RemoveInvItems(hero, ItMiSwordrawhot, NINJA_OCEXPANSION_INGREDIENTS_ITAR_OC_GHR__ItMiSwordrawhot - 1);
        
        // [ItAt_TrollFur]
        Npc_RemoveInvItems(hero, ItAt_TrollFur, NINJA_OCEXPANSION_INGREDIENTS_ITAR_OC_GHR__ItAt_TrollFur);
        
        // [ITAR_Thorus_Addon]		
		Npc_RemoveInvItems(hero, ITAR_Thorus_Addon, NINJA_OCEXPANSION_INGREDIENTS_ITAR_OC_GHR__ITAR_Thorus_Addon); 
        
        // Create an armor
        CreateInvItem(hero, ITAR_OC_GHR);
        
        // Print an information about success
        NINJA_OCEXPANSION_Func_Print_ForgeSuccess(ITAR_OC_GHR.name);
    // If hasn't
    } else
    {
        // Restore a raw steel
        CreateInvItem(hero, ItMiSwordrawhot);
    };
    

    // Quit a dialogue window
	B_ENDPRODUCTIONDIALOG();
};
/*
 *  Forging concrete armor
 */

/*
 *  NINJA_OCEXPANSION_PC_ITAR_OC_BM
 */
INSTANCE NINJA_OCEXPANSION_PC_ITAR_OC_BM (C_INFO)
{
	npc				= PC_Hero;
	condition		= NINJA_OCEXPANSION_PC_ITAR_OC_BM_Condition;
	information		= NINJA_OCEXPANSION_PC_ITAR_OC_BM_Info;
	permanent		= true;
    description     = "Vylep�it zbroj Rudobarona str�e";
};
FUNC INT NINJA_OCEXPANSION_PC_ITAR_OC_BM_Condition()
{	
	if (NINJA_OCEXPANSION_MOBSI_SmithWeapon == PLAYER_MOBSI_PRODUCTION)
    {
        // If has a blueprint
        if (0 < Npc_HasItems(hero, ItWr_BluePrint_ImproveOCArmor))
		{	
            return true;
        };
    };
};
FUNC VOID NINJA_OCEXPANSION_PC_ITAR_OC_BM_Info()
{
	var int has_all_ingredients; has_all_ingredients = true;
    var int amount_needed;
    var int amount_current;
    var int amount_missing;
    
    // Check ingredients
    
    // [ItMiSwordrawhot]
    amount_needed = NINJA_OCEXPANSION_INGREDIENTS_ITAR_OC_BM__ItMiSwordrawhot;
    amount_current = Npc_HasItems(hero, ItMiSwordrawhot) + 1; // IMPORTANT: An one of a raw steel is in a hand
    
    if (amount_needed > amount_current)
    {
        // Count missing ingredients
        amount_missing = amount_needed - amount_current;
    
        // Print message
        NINJA_OCEXPANSION_Func_Print_ProdItemsMissing(ItMiSwordrawhot.name, amount_missing);

        // Save an information, that player hasn't all ingredients
        has_all_ingredients = false;
    };
    
    // [ItMi_Nugget]
    amount_needed = NINJA_OCEXPANSION_INGREDIENTS_ITAR_OC_BM__ItMi_Nugget;
    amount_current = Npc_HasItems(hero, ItMi_Nugget);
    if (amount_needed > amount_current)
    {
        // Count missing ingredients
        amount_missing = amount_needed - amount_current;
    
        // Print message
        NINJA_OCEXPANSION_Func_Print_ProdItemsMissing(ItMi_Nugget.name, amount_missing);

        // Save an information, that player hasn't all ingredients
        has_all_ingredients = false;
    };
    
	// [ITAR_OC_BL]
    amount_needed = NINJA_OCEXPANSION_INGREDIENTS_ITAR_OC_BM__ITAR_OC_BL;
    amount_current = Npc_HasItems(hero, ITAR_OC_BL);
    if (amount_needed > amount_current)
    {
        // Count missing ingredients
        amount_missing = amount_needed - amount_current;
    
        // Print message
        NINJA_OCEXPANSION_Func_Print_ProdItemsMissing(ItAr_OC_BL.name, amount_missing);

        // Save an information, that player hasn't all ingredients
        has_all_ingredients = false;
    }; 
 
    
    // If player has all ingredients
    if (true == has_all_ingredients)
    {
        // Remove ingredients
        
        // [ItMiSwordrawhot]
        // IMPORTANT: An one raw steel will be removed by finishing using of an anvil
        Npc_RemoveInvItems(hero, ItMiSwordrawhot, NINJA_OCEXPANSION_INGREDIENTS_ITAR_OC_BM__ItMiSwordrawhot - 1);
        
        // [ItMi_Nugget]
        Npc_RemoveInvItems(hero, ItMi_Nugget, NINJA_OCEXPANSION_INGREDIENTS_ITAR_OC_BM__ItMi_Nugget);
        
        // [ITAR_OC_BL]		
		Npc_RemoveInvItems(hero, ITAR_OC_BL, NINJA_OCEXPANSION_INGREDIENTS_ITAR_OC_BM__ITAR_OC_BL); 
        
        // Create an armor
        CreateInvItem(hero, ITAR_OC_BM);
        
        // Print an information about success
        NINJA_OCEXPANSION_Func_Print_ForgeSuccess(ITAR_OC_BM.name);
    // If hasn't
    } else
    {
        // Restore a raw steel
        CreateInvItem(hero, ItMiSwordrawhot);
    };
    

    // Quit a dialogue window
	B_ENDPRODUCTIONDIALOG();
};

/*
 *  NINJA_OCEXPANSION_PC_ITAR_OC_SH
 */
INSTANCE NINJA_OCEXPANSION_PC_ITAR_OC_SH (C_INFO)
{
	npc				= PC_Hero;
	condition		= NINJA_OCEXPANSION_PC_ITAR_OC_SH_Condition;
	information		= NINJA_OCEXPANSION_PC_ITAR_OC_SH_Info;
	permanent		= true;
    description     = "Vylep�it zbroj Rudobarona str�e";
};
FUNC INT NINJA_OCEXPANSION_PC_ITAR_OC_SH_Condition()
{	
	if (NINJA_OCEXPANSION_MOBSI_SmithWeapon == PLAYER_MOBSI_PRODUCTION)
    {
        // If has a blueprint
        if (0 < Npc_HasItems(hero, ItWr_BluePrint_ImproveOCArmor))
		{	
            return true;
        };
    };
};
FUNC VOID NINJA_OCEXPANSION_PC_ITAR_OC_SH_Info()
{
	var int has_all_ingredients; has_all_ingredients = true;
    var int amount_needed;
    var int amount_current;
    var int amount_missing;
    
    // Check ingredients
    
    // [ItMiSwordrawhot]
    amount_needed = NINJA_OCEXPANSION_INGREDIENTS_ITAR_OC_SH__ItMiSwordrawhot;
    amount_current = Npc_HasItems(hero, ItMiSwordrawhot) + 1; // IMPORTANT: An one of a raw steel is in a hand
    
    if (amount_needed > amount_current)
    {
        // Count missing ingredients
        amount_missing = amount_needed - amount_current;
    
        // Print message
        NINJA_OCEXPANSION_Func_Print_ProdItemsMissing(ItMiSwordrawhot.name, amount_missing);

        // Save an information, that player hasn't all ingredients
        has_all_ingredients = false;
    };
    
    // [ItAt_Wolffur]
    amount_needed = NINJA_OCEXPANSION_INGREDIENTS_ITAR_OC_SH__ItAt_Wolffur;
    amount_current = Npc_HasItems(hero, ItAt_Wolffur);
    if (amount_needed > amount_current)
    {
        // Count missing ingredients
        amount_missing = amount_needed - amount_current;
    
        // Print message
        NINJA_OCEXPANSION_Func_Print_ProdItemsMissing(ItAt_Wolffur.name, amount_missing);

        // Save an information, that player hasn't all ingredients
        has_all_ingredients = false;
    };
    
    // If player has all ingredients
    if (true == has_all_ingredients)
    {
        // Remove ingredients
        
        // [ItMiSwordrawhot]
        // IMPORTANT: An one raw steel will be removed by finishing using of an anvil
        Npc_RemoveInvItems(hero, ItMiSwordrawhot, NINJA_OCEXPANSION_INGREDIENTS_ITAR_OC_SH__ItMiSwordrawhot - 1);
        
        // [ItAt_Wolffur]
        Npc_RemoveInvItems(hero, ItAt_WolfFur, NINJA_OCEXPANSION_INGREDIENTS_ITAR_OC_SH__ItAt_WolfFur);
        
        // Create an armor
        CreateInvItem(hero, ITAR_OC_SH);
        
        // Print an information about success
        NINJA_OCEXPANSION_Func_Print_ForgeSuccess(ITAR_OC_SH.name);
    // If hasn't
    } else
    {
        // Restore a raw steel
        CreateInvItem(hero, ItMiSwordrawhot);
    };
    

    // Quit a dialogue window
	B_ENDPRODUCTIONDIALOG();
};


