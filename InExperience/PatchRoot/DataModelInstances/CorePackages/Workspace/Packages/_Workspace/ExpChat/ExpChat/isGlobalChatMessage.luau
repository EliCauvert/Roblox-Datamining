return function(p1): boolean --[[ Line: 8 | Named "isGlobalChatMessage" ]]
	return p1.isUniverseChat == true or p1.channelNameOverride == "RBXGlobal"
end