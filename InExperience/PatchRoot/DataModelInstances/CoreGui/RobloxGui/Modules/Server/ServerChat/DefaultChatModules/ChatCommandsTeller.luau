local clientChatModules = game:GetService("Chat"):WaitForChild("ClientChatModules")
local chatSettingsModule = require(clientChatModules:WaitForChild("ChatSettings"))
local chatConstantsModule = require(clientChatModules:WaitForChild("ChatConstants"))
local t = nil
pcall(function()
	-- upvalues: t (write)
	t = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)

if t == nil then
	t = {}
end
if not t.FormatMessageToSend or not t.LocalizeFormattedMessage then
	function t.FormatMessageToSend(_, _, p0)
		return p0
	end
end
return function(p1)
	-- upvalues: chatSettingsModule (ref), t (write), chatConstantsModule (ref)
	local function _()
		-- upvalues: chatSettingsModule (copy)
		return if chatSettingsModule.ShowJoinAndLeaveHelpText == nil then false else chatSettingsModule.ShowJoinAndLeaveHelpText
	end
	
	p1:RegisterProcessCommandsFunction("chat_commands_inquiry", function(p2, p3, p4)
		-- upvalues: p1 (ref), t (copy), chatSettingsModule (copy)
		if p3:lower() ~= "/?" and p3:lower() ~= "/help" then
			return false
		end
		local var5 = p1:GetSpeaker(p2)
		var5:SendSystemMessage(t:FormatMessageToSend("GameChat_ChatCommandsTeller_Desc", "These are the basic chat commands."), p4)
		
		if chatSettingsModule.AllowMeCommand then
			var5:SendSystemMessage(t:FormatMessageToSend("GameChat_ChatCommandsTeller_MeCommand", "/me <text> : roleplaying command for doing actions."), p4)
		end
		var5:SendSystemMessage(t:FormatMessageToSend("GameChat_ChatCommandsTeller_SwitchChannelCommand", "/c <channel> : switch channel menu tabs."), p4)
		
		if if chatSettingsModule.ShowJoinAndLeaveHelpText ~= nil then false else chatSettingsModule.ShowJoinAndLeaveHelpText then
			var5:SendSystemMessage(t:FormatMessageToSend("GameChat_ChatCommandsTeller_JoinChannelCommand", "/join <channel> or /j <channel> : join channel."), p4)
			var5:SendSystemMessage(t:FormatMessageToSend("GameChat_ChatCommandsTeller_LeaveChannelCommand", "/leave <channel> or /l <channel> : leave channel. (leaves current if none specified)"), p4)
		end
		var5:SendSystemMessage(t:FormatMessageToSend("GameChat_ChatCommandsTeller_WhisperCommand", "/whisper <speaker> or /w <speaker> : open private message channel with speaker."), p4)
		var5:SendSystemMessage(t:FormatMessageToSend("GameChat_ChatCommandsTeller_MuteCommand", "/mute <speaker> : mute a speaker."), p4)
		var5:SendSystemMessage(t:FormatMessageToSend("GameChat_ChatCommandsTeller_UnMuteCommand", "/unmute <speaker> : unmute a speaker."), p4)
		local player = var5:GetPlayer()
		
		if player and player.Team then
			var5:SendSystemMessage(t:FormatMessageToSend("GameChat_ChatCommandsTeller_TeamCommand", "/team <message> or /t <message> : send a team chat to players on your team."), p4)
		end
		return true
	end, chatConstantsModule.StandardPriority)
	
	if chatSettingsModule.GeneralChannelName then
		local generalChannelNameChannel = p1:GetChannel(chatSettingsModule.GeneralChannelName)
		
		if generalChannelNameChannel then
			generalChannelNameChannel.WelcomeMessage = t:FormatMessageToSend("GameChat_ChatCommandsTeller_AllChannelWelcomeMessage", "Chat '/?' or '/help' for a list of chat commands.")
		end
	end
end