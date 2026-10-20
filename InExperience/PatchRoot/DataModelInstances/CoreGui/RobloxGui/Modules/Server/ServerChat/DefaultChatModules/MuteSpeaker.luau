local Chat = game:GetService("Chat")
local ClientChatModules = Chat:WaitForChild("ClientChatModules")
local ChatConstantsModule = require(ClientChatModules:WaitForChild("ChatConstants"))
local ChatSettingsModule = require(ClientChatModules:WaitForChild("ChatSettings"))
local DisplayNameHelpersModule = require(Chat:WaitForChild("ChatModules").Utility.DisplayNameHelpers)
local ChatLocalizationModule = nil
pcall(function()
	-- upvalues: ChatLocalizationModule (ref)
	ChatLocalizationModule = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)

if ChatLocalizationModule == nil then
	ChatLocalizationModule = {}
end
if not ChatLocalizationModule.FormatMessageToSend or not ChatLocalizationModule.LocalizeFormattedMessage then
	function ChatLocalizationModule:FormatMessageToSend(_, Formatted)
		return Formatted
	end
end
local config = {
	ChatColor = ChatSettingsModule.ErrorMessageTextColor or Color3.fromRGB(245, 50, 50)
}

return function(p1)
	-- upvalues: ChatSettingsModule (copy), DisplayNameHelpersModule (copy), ChatLocalizationModule (ref), config (copy), ChatConstantsModule (copy)
	local function _(Text: string): string
		local Segment: string = Text
		
		if string.sub(Text, 1, 1) == "\"" then
			local FoundAt: number? = string.find(Text, "\"", 2)
			
			if FoundAt then
				Segment = string.sub(Text, 2, FoundAt - 1)
				
				return Segment
			end
		else
			local Match: string? = string.match(Text, "^[^%s]+")
			
			if Match then
				Segment = Match
			end
		end
		return Segment
	end
	
	local function DoMuteCommand(p2, Text: string, p3)
		-- upvalues: p1 (copy), ChatSettingsModule (upval), DisplayNameHelpersModule (upval), ChatLocalizationModule (upval), config (upval)
		local Segment: string = Text
		
		if string.sub(Text, 1, 1) == "\"" then
			local FoundAt: number? = string.find(Text, "\"", 2)
			
			if FoundAt then
				Segment = string.sub(Text, 2, FoundAt - 1)
			end
		else
			local Match: string? = string.match(Text, "^[^%s]+")
			
			if Match then
				Segment = Match
			end
		end
		local Segment1: string = Segment
		local Speaker = p1:GetSpeaker(p2)
		
		if Speaker then
			local UserNameFromChattedName = nil
			local UserNameFromChattedName2 = nil
			if ChatSettingsModule.PlayerDisplayNamesEnabled then
				UserNameFromChattedName, UserNameFromChattedName2 = DisplayNameHelpersModule.getUserNameFromChattedName(Segment1, p2, Speaker:GetNameForDisplay())
			else
				UserNameFromChattedName, UserNameFromChattedName2 = DisplayNameHelpersModule.getUserNameFromChattedName(Segment1, p2, nil)
			end
			local Speaker1 = p1:GetSpeaker(UserNameFromChattedName)
			
			if UserNameFromChattedName2 == DisplayNameHelpersModule.CommandErrorCodes.ChattingToSelf then
				Speaker:SendSystemMessage(ChatLocalizationModule:FormatMessageToSend("GameChat_DoMuteCommand_CannotMuteSelf", "You cannot mute yourself."), p3, config)
				
				return
			end
			if UserNameFromChattedName2 == DisplayNameHelpersModule.CommandErrorCodes.NoMatches then
				Speaker:SendSystemMessage(ChatLocalizationModule:FormatMessageToSend("GameChat_MuteSpeaker_SpeakerDoesNotExist", string.format("Speaker '%s' does not exist.", (tostring(Segment1))), "RBX_NAME", (tostring(UserNameFromChattedName))), p3, config)
				
				return
			end
			if UserNameFromChattedName2 == DisplayNameHelpersModule.CommandErrorCodes.MultipleMatches then
				local UsersWithDisplayNameString = DisplayNameHelpersModule.getUsersWithDisplayNameString(Segment1, p2)
				Speaker:SendSystemMessage(ChatLocalizationModule:FormatMessageToSend("InGame.Chat.Response.DisplayNameMultipleMatches", "Warning: The following users have this display name: "), p3, config)
				Speaker:SendSystemMessage(UsersWithDisplayNameString, p3, config)
				
				return
			end
			if Speaker1 then
				Speaker:AddMutedSpeaker(Speaker1.Name)
				local NameForDisplay = if ChatSettingsModule.PlayerDisplayNamesEnabled then Speaker1:GetNameForDisplay() else UserNameFromChattedName
				Speaker:SendSystemMessage(ChatLocalizationModule:FormatMessageToSend("GameChat_ChatMain_SpeakerHasBeenMuted", string.format("Speaker '%s' has been muted.", NameForDisplay), "RBX_NAME", NameForDisplay), p3)
			end
		end
	end
	
	local function DoUnmuteCommand(p2, Text: string, p3)
		-- upvalues: p1 (copy), ChatSettingsModule (upval), DisplayNameHelpersModule (upval), ChatLocalizationModule (upval), config (upval)
		local Segment: string = Text
		
		if string.sub(Text, 1, 1) == "\"" then
			local FoundAt: number? = string.find(Text, "\"", 2)
			
			if FoundAt then
				Segment = string.sub(Text, 2, FoundAt - 1)
			end
		else
			local Match: string? = string.match(Text, "^[^%s]+")
			
			if Match then
				Segment = Match
			end
		end
		local Segment1: string = Segment
		local Speaker = p1:GetSpeaker(p2)
		
		if Speaker then
			local UserNameFromChattedName = nil
			local UserNameFromChattedName2 = nil
			if ChatSettingsModule.PlayerDisplayNamesEnabled then
				UserNameFromChattedName, UserNameFromChattedName2 = DisplayNameHelpersModule.getUserNameFromChattedName(Segment1, p2, Speaker:GetNameForDisplay())
			else
				UserNameFromChattedName, UserNameFromChattedName2 = DisplayNameHelpersModule.getUserNameFromChattedName(Segment1, p2, nil)
			end
			local Speaker1 = p1:GetSpeaker(UserNameFromChattedName)
			
			if UserNameFromChattedName2 == DisplayNameHelpersModule.CommandErrorCodes.ChattingToSelf then
				Speaker:SendSystemMessage(ChatLocalizationModule:FormatMessageToSend("GameChat_DoMuteCommand_CannotMuteSelf", "You cannot mute yourself."), p3, config)
				
				return
			end
			if UserNameFromChattedName2 == DisplayNameHelpersModule.CommandErrorCodes.NoMatches then
				Speaker:SendSystemMessage(ChatLocalizationModule:FormatMessageToSend("GameChat_MuteSpeaker_SpeakerDoesNotExist", string.format("Speaker '%s' does not exist.", (tostring(UserNameFromChattedName))), "RBX_NAME", (tostring(UserNameFromChattedName))), p3, config)
				
				return
			end
			if UserNameFromChattedName2 == DisplayNameHelpersModule.CommandErrorCodes.MultipleMatches then
				local UsersWithDisplayNameString = DisplayNameHelpersModule.getUsersWithDisplayNameString(Segment1, p2)
				Speaker:SendSystemMessage(ChatLocalizationModule:FormatMessageToSend("InGame.Chat.Response.DisplayNameMultipleMatches", "Warning: The following users have this display name: "), p3, config)
				Speaker:SendSystemMessage(UsersWithDisplayNameString, p3, config)
				
				return
			end
			if Speaker1 then
				Speaker:RemoveMutedSpeaker(Speaker1.Name)
				local NameForDisplay = if ChatSettingsModule.PlayerDisplayNamesEnabled then Speaker1:GetNameForDisplay() else UserNameFromChattedName
				Speaker:SendSystemMessage(ChatLocalizationModule:FormatMessageToSend("GameChat_ChatMain_SpeakerHasBeenUnMuted", string.format("Speaker '%s' has been unmuted.", NameForDisplay), "RBX_NAME", NameForDisplay), p3)
				
				return
			end
		end
	end
	
	p1:RegisterProcessCommandsFunction("mute_commands", function(p2, Text: string, p3): boolean
		-- upvalues: DoMuteCommand (copy), DoUnmuteCommand (copy)
		local Flag = false
		
		if string.sub(Text, 1, 6):lower() == "/mute " then
			DoMuteCommand(p2, string.sub(Text, 7), p3)
			Flag = true
			
			return Flag
		end
		if string.sub(Text, 1, 8):lower() == "/unmute " then
			DoUnmuteCommand(p2, string.sub(Text, 9), p3)
			Flag = true
		end
		return Flag
	end, ChatConstantsModule.StandardPriority)
end