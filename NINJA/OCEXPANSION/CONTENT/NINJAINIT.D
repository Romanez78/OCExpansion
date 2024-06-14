const string Ninja_OCExpansion_Version = "OCExpansion 1.0";

/*
 * Initialization function called by Ninja after "Init_Global" (G2) / "Init_<Levelname>" (G1)
 */
func void Ninja_OCExpansion_Init() {
    // Init Ikarus&Lego
    LeGo_MergeFlags(LeGo_PermMem);
    
    MEM_Info(ConcatStrings(ConcatStrings("Initialize ", Ninja_OCExpansion_Version), "."));
    Patch_OC_Init();
    MEM_Info(ConcatStrings(Ninja_OCExpansion_Version, " was initialized successfully."));
};
