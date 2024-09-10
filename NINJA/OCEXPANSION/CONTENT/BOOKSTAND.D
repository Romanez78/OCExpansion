func void Ninja_OCExpansion_Use_FINALDRAGONEQUIPMENT_S1()
{
    ContinueCall();
    
    if (true == Npc_IsPlayer(self))
	{
        if (LOG_RUNNING == Ninja_OCExpansion_MIS_Huno_BARONARMOR)
        {
            if (false == Ninja_OCExpansion_MIS_Huno_BARONARMOR__Log_Entry_Added)
            {
                B_LogEntry(TOPIC_Huno_BARONARMOR, "Po přečtení jsem dostal nápad jak ještě vylepšit zbroj Rudobarona. Měl bych si o tom promluvit s Hunem.");
                
                Ninja_OCExpansion_MIS_Huno_BARONARMOR__Log_Entry_Added = true;
            };
        };
    };
};
