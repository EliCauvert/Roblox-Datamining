local ExpChat = script:FindFirstAncestor("ExpChat")
local DisplaySystemMessageModule = require(ExpChat.displaySystemMessage)
local CoreScriptsTextChatChatWindowChatEnabledChatWithOnlinePlayersBelowThreshold: string = if require(ExpChat.Parent.ExpChatShared).Flags.FFlagExpChatUseUpdatedUserCountStrings then "CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithOnlinePlayers.BelowThreshold" else "CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithOnlinePlayers.V3"

return function(p1)
	-- upvalues: CoreScriptsTextChatChatWindowChatEnabledChatWithOnlinePlayersBelowThreshold (copy), DisplaySystemMessageModule (copy)
	local Translator = p1.translator
	local DefaultSystemTextChannel = p1.defaultSystemTextChannel
	local DisplayVirtualSystemMessageFunction = p1.displayVirtualSystemMessage
	
	return function()
		-- upvalues: DisplayVirtualSystemMessageFunction (copy), CoreScriptsTextChatChatWindowChatEnabledChatWithOnlinePlayersBelowThreshold (upval), DisplaySystemMessageModule (upval), Translator (copy), DefaultSystemTextChannel (copy)
		if DisplayVirtualSystemMessageFunction then
			DisplayVirtualSystemMessageFunction(CoreScriptsTextChatChatWindowChatEnabledChatWithOnlinePlayersBelowThreshold, nil, "👋 Say hi to everyone playing now!")
			
			return
		else
			DisplaySystemMessageModule(CoreScriptsTextChatChatWindowChatEnabledChatWithOnlinePlayersBelowThreshold, nil, "Roblox.ChatEnabled.Info", Translator, DefaultSystemTextChannel, "👋 Say hi to everyone playing now!")
		end
	end
end