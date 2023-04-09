global function TitanTipsInit

int titan = 0
int id = 1
int name = 2
int summary = 3
int details = 4

array<string> alreadySentTips = []

array<string> goodToKnowList = [
"Northstar's railgun has more base damage, but a full charge does less damage.",
"Ion's vortex shield is a lot trickier to use due to an activation cost.",
"Sword Block can't protect Ronin forever, effectivenss fades with damage.",
"Tone's cannon now does more damage, but getting target locks is trickier.",
"Legion's Gun Shield covers a larger angle, and has more health.",
"The Thermite Launcher can now hold and fire two rounds."
]


void function TitanTipsInit(){

#if FSCC_ENABLED
	FSCC_CommandStruct command
	command.m_UsageUser = "titans <titan>"
	command.m_Description = "View titan rebalance changes."
	command.m_Group = "REBALANCE"
	command.m_Abbreviations = ["tnerfs","tnerf","tbuff","tbuffs","tchangelog","tchange"]
	command.Callback = titanInfoCommand
	FSCC_RegisterCommand( "titans", command )
#endif

    if (GetConVarInt( "titan_rebalance_tips" ) == 1){
        AddCallback_GameStateEnter( eGameState.Playing, Playing)
    }
}

void function Playing(){
    printl("[REBALANCETIPS] Titan rebalance tips enabled")
    AddCallback_OnPilotBecomesTitan( TitanTipsThread )
}

void function TitanTipsThread(entity player, entity titan){
    if ( !IsValid(player) || !IsAlive(player) || !player.IsTitan() ) {
        printl("[REBALANCETIPS] Interrupted, player no longer needs tips")
        return
    }
    if (alreadySentTips.find(player.GetPlayerName()) == -1){
        NSSendInfoMessageToPlayer(player, "Titans on this server are rebalanced. Use the !titans command to see changes.")
        alreadySentTips.append(player.GetPlayerName())
    }
    string playerTitan = GetActiveTitanLoadout( player ).titanClass
    if (alreadySentTips.find(playerTitan+player.GetPlayerName()) == -1){
        provideTitan(player)
        alreadySentTips.append(playerTitan+player.GetPlayerName())
    }
}

void function provideTitan(entity player){
    array <int> itemIndex = []

    if ( !IsValid(player) || !IsAlive(player) ) {
    #if FSCC_ENABLED
        FSU_PrivateChatMessage( player, "%EUnable to get your loadout! %TAre you dead?")
    #endif
        return
    }

    string playerTitan = GetActiveTitanLoadout( player ).titanClass

    for(int i = 0; i < titanData.len(); i++){
        if( titanData[i][titan] == playerTitan ){
            itemIndex.append(i)
        }
    }

#if FSCC_ENABLED
    FSU_PrivateChatMessage( player, "%HSummary of changes to your current titan:")
    foreach(int i in itemIndex){
        FSU_PrivateChatMessage( player, "    " + titanData[i][summary])
    }
    if( playerTitan == "monarch" )
        FSU_PrivateChatMessage( player, "%HUse %T%Ptitans upgradecore %Hto view the list of changes to the Upgrade Core.")
    FSU_PrivateChatMessage( player, "%HGood to know: %T" + goodToKnowList[RandomIntRange( 0, goodToKnowList.len() - 1 )])
#else
    Chat_ServerPrivateMessage( player, "\x1b[38;5;153mSummary of changes to your current titan:", false)
    foreach(int i in itemIndex){
        Chat_ServerPrivateMessage( player, "    " + titanData[i][summary], false)
    }
    Chat_ServerPrivateMessage( player, "\x1b[38;5;153mGood to know: \x1b[0m" + goodToKnowList[RandomIntRange( 0, goodToKnowList.len() - 1 )], false)
#endif
}

#if FSCC_ENABLED
void function titanInfoCommand( entity player, array < string > args ){

    if ( args.len() == 0 ){
        FSU_PrivateChatMessage( player, "%ENo argument! %TCorrect format is %H!titans <argument>")
        FSU_PrivateChatMessage( player, "    To see a summary of the changes to your titan, use the word %Hloadout%T as the argument.")
        FSU_PrivateChatMessage( player, "    Other valid summary arguments are the names of any titan.")
        FSU_PrivateChatMessage( player, "    For full details on changes to a weapon or ability, enter its name.")
        FSU_PrivateChatMessage( player, "%HGood to know: %T" + goodToKnowList[RandomIntRange( 0, goodToKnowList.len() - 1 )])
        FSU_PrivateChatMessage( player, "%HRebalance version: %F" + TITAN_REBALANCE_VERSION)
        return
    }

    string arg = ""
    foreach(string part in args){
        arg += part
    }

    if ( arg.find("load") != null ){
        provideTitan( player )
        return
    }

    if ( arg == "ion" || arg == "tone" || arg == "ronin" || arg == "northstar" || arg == "legion" || arg == "scorch" || arg == "monarch" || arg.find("upgrade") != null  ){
        provideTypeSummary( player, arg )
        return
    }

    provideItem( player, arg )
}

void function provideTypeSummary(entity player, string arg){
    string message = ""
    string selectedType = ""
    array <int> itemIndex = []

    if ( arg.find("ion") != null ){
        message = "Summary of changes to Ion:"
        selectedType = "ion"
    }
    if ( arg.find("tone") != null ){
        message = "Summary of changes to Tone:"
        selectedType = "tone"
    }
    if ( arg.find("ronin") != null ){
        message = "Summary of changes to Ronin:"
        selectedType = "ronin"
    }
    if ( arg.find("northstar") != null ){
        message = "Summary of changes to Northstar:"
        selectedType = "northstar"
    }
    if ( arg.find("legion") != null ){
        message = "Summary of changes to Legion:"
        selectedType = "legion"
    }
    if ( arg.find("scorch") != null ){
        message = "Summary of changes to Scorch:"
        selectedType = "scorch"
    }
    if ( arg.find("monarch") != null ){
        message = "Summary of changes to Monarch:"
        selectedType = "monarch"
    }
    if ( arg.find("upgrade") != null ){
        message = "Summary of changes to Monarch's Upgrade Core:"
        selectedType = "upgradecore"
    }

    for(int i = 0; i < titanData.len(); i++){
        if( titanData[i][titan] == selectedType ){
            itemIndex.append(i)
        }
    }

    FSU_PrivateChatMessage( player, "%H" + message )
    foreach(int i in itemIndex){
        FSU_PrivateChatMessage( player, "    " + titanData[i][summary] )
    }
    if( selectedType == "monarch" )
        FSU_PrivateChatMessage( player, "%HUse %T%Ptitans upgradecore %Hto view the list of changes to the Upgrade Core.")
}

void function provideItem(entity player, string arg){
    int itemIndex = -1

    for(int i = 0; i < titanData.len(); i++){
        array <string> term = split(titanData[i][name], " ")
        string terms = ""
        foreach(string part in term){
            terms += part
        }
        if( terms.tolower().find(arg) != null ){
            itemIndex = i
        }
    }

    if(itemIndex != -1){
        FSU_PrivateChatMessage( player, "%H" + titanData[itemIndex][name] + ":" )
        foreach(string message in split(titanData[itemIndex][details], "\n" )){
            FSU_PrivateChatMessage( player, "    " + message )
        }
    }
    else
        FSU_PrivateChatMessage( player, "%ENo match for that argument!")
}
#endif
