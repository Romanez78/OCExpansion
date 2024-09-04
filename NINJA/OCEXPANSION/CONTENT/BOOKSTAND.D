func void Ninja_OCExpansion_Use_FINALDRAGONEQUIPMENT_S1()
{
    ContinueCall();
    
    if (LOG_RUNNING == Ninja_OCExpansion_MIS_Huno_BARONARMOR)
    {
        if (false == Ninja_OCExpansion_MIS_Huno_BARONARMOR__Log_Entry_Added)
        {
            B_LogEntry(TOPIC_Huno_BARONARMOR, "Good afternoon");
            
            Ninja_OCExpansion_MIS_Huno_BARONARMOR__Log_Entry_Added = true;
        };
    };
};
