local ClientChatModules = game:GetService("Chat"):WaitForChild("ClientChatModules")
local ChatSettingsModule = require(ClientChatModules:WaitForChild("ChatSettings"))
local ChatConstantsModule = require(ClientChatModules:WaitForChild("ChatConstants"))
local ChatLocalizationModule = nil
pcall(function() --[[ Line: 13 ]]
	-- upvalues: ChatLocalizationModule (ref)
	ChatLocalizationModule = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)

if ChatLocalizationModule == nil then
	ChatLocalizationModule = {}
end
if not ChatLocalizationModule.FormatMessageToSend or not ChatLocalizationModule.LocalizeFormattedMessage then
	function ChatLocalizationModule:FormatMessageToSend(_, p1) --[[ Line: 17 ]]
		return p1
	end
end
return function(p1) --[[ Line: 20 | Named "Run" ]]
	-- upvalues: ChatSettingsModule (copy), ChatLocalizationModule (ref), ChatConstantsModule (copy)
	local function _() --[[ Line: 22 | Named "ShowJoinAndLeaveCommands" ]]
		-- upvalues: ChatSettingsModule (upval)
		return ChatSettingsModule.ShowJoinAndLeaveHelpText ~= nil and ChatSettingsModule.ShowJoinAndLeaveHelpText
	end
	
	p1:RegisterProcessCommandsFunction("chat_commands_inquiry", function(p2, Text: string, p3): boolean --[[ Line: 29 | Named "ProcessCommandsFunction" ]]
		-- upvalues: p1 (copy), ChatLocalizationModule (upval), ChatSettingsModule (upval)
		if Text:lower() ~= "/?" and Text:lower() ~= "/help" then
			return false
		end
		local Speaker = p1:GetSpeaker(p2)
		Speaker:SendSystemMessage(ChatLocalizationModule:FormatMessageToSend("GameChat_ChatCommandsTeller_Desc", "These are the basic chat commands."), p3)
		
		if ChatSettingsModule.AllowMeCommand then
			Speaker:SendSystemMessage(ChatLocalizationModule:FormatMessageToSend("GameChat_ChatCommandsTeller_MeCommand", "/me <text> : roleplaying command for doing actions."), p3)
		end
		Speaker:SendSystemMessage(ChatLocalizationModule:FormatMessageToSend("GameChat_ChatCommandsTeller_SwitchChannelCommand", "/c <channel> : switch channel menu tabs."), p3)
		
		if ChatSettingsModule.ShowJoinAndLeaveHelpText ~= nil and ChatSettingsModule.ShowJoinAndLeaveHelpText then
			Speaker:SendSystemMessage(ChatLocalizationModule:FormatMessageToSend("GameChat_ChatCommandsTeller_JoinChannelCommand", "/join <channel> or /j <channel> : join channel."), p3)
			Speaker:SendSystemMessage(ChatLocalizationModule:FormatMessageToSend("GameChat_ChatCommandsTeller_LeaveChannelCommand", "/leave <channel> or /l <channel> : leave channel. (leaves current if none specified)"), p3)
		end
		Speaker:SendSystemMessage(ChatLocalizationModule:FormatMessageToSend("GameChat_ChatCommandsTeller_WhisperCommand", "/whisper <speaker> or /w <speaker> : open private message channel with speaker."), p3)
		Speaker:SendSystemMessage(ChatLocalizationModule:FormatMessageToSend("GameChat_ChatCommandsTeller_MuteCommand", "/mute <speaker> : mute a speaker."), p3)
		Speaker:SendSystemMessage(ChatLocalizationModule:FormatMessageToSend("GameChat_ChatCommandsTeller_UnMuteCommand", "/unmute <speaker> : unmute a speaker."), p3)
		local Player = Speaker:GetPlayer()
		
		if Player and Player.Team then
			Speaker:SendSystemMessage(ChatLocalizationModule:FormatMessageToSend("GameChat_ChatCommandsTeller_TeamCommand", "/team <message> or /t <message> : send a team chat to players on your team."), p3)
		end
		return true
	end, ChatConstantsModule.StandardPriority)
	
	if ChatSettingsModule.GeneralChannelName then
		local Channel = p1:GetChannel(ChatSettingsModule.GeneralChannelName)
		
		if Channel then
			Channel.WelcomeMessage = ChatLocalizationModule:FormatMessageToSend("GameChat_ChatCommandsTeller_AllChannelWelcomeMessage", "Chat '/?' or '/help' for a list of chat commands.")
		end
	end
end