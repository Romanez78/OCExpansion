/*
 * Adds new armors.
 *
 * - Requires Ikarus, LeGo
 * - Compatible with Gothic 2 (Addon)
 *
 * Instructions
 * - Initialize from Init_Global with
 *     Patch_AE_Init();
 */

/*
 * Initialization function to be called from Init_Global
 */
func void Patch_OC_Init() {
    HookDaedalusFuncS("PC_Common_Condition", "Ninja_OCExpansion_PC_Common_Condition");
    HookDaedalusFuncS("PC_Ore_Condition", "Ninja_OCExpansion_PC_Ore_Condition");
};
