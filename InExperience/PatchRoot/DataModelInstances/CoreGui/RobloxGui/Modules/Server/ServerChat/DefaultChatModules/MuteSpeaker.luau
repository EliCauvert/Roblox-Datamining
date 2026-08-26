local chatService = game:GetService("Chat")
local clientChatModules = chatService:WaitForChild("ClientChatModules")
local chatModules = chatService:WaitForChild("ChatModules")
local chatConstantsModule = require(clientChatModules:WaitForChild("ChatConstants"))
local chatSettingsModule = require(clientChatModules:WaitForChild("ChatSettings"))
local displayNameHelpersModule = require(chatModules.Utility.DisplayNameHelpers)
local t = nil
pcall(function()
	-- upvalues: t (write)
	t = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)

if t == nil then
	t = {}
end
if not t.FormatMessageToSend or not t.LocalizeFormattedMessage then
	function t.FormatMessageToSend(_, _, p1)
		return p1
	end
end
local t_1 = {
	ChatColor = chatSettingsModule.ErrorMessageTextColor or Color3.fromRGB(245, 50, 50)
}

return function(p1)
	-- upvalues: chatSettingsModule (ref), displayNameHelpersModule (ref), t (write), t_1 (ref), chatConstantsModule (ref)
	local function _(p2)
		local var1 = p2
		
		if string.sub(p2, 1, 1) == "\"" then
			local matchIndex = string.find(p2, "\"", 2)
			
			if matchIndex then
				var1 = string.sub(p2, 2, matchIndex - 1)
				
				return var1
			end
		else
			local match = string.match(p2, "^[^%s]+")
			
			if match then
				var1 = match
			end
		end
		return var1
	end
	
	local function DoMuteCommand(p2, p3, p4)
		-- upvalues: p1 (ref), chatSettingsModule (copy), displayNameHelpersModule (copy), t (copy), t_1 (copy)
		local var1 = p3
		
		if string.sub(p3, 1, 1) == "\"" then
			local matchIndex = string.find(p3, "\"", 2)
			
			if matchIndex then
				var1 = string.sub(p3, 2, matchIndex - 1)
			end
		else
			local match = string.match(p3, "^[^%s]+")
			
			if match then
				var1 = match
			end
		end
		local var2 = p1:GetSpeaker(p2)
		
		if var2 then
			local var3, var4
			local _ = nil
			local _ = nil
			
			if chatSettingsModule.PlayerDisplayNamesEnabled then
				local userNameFromChattedName, userNameFromChattedName_1 = displayNameHelpersModule.getUserNameFromChattedName(var1, p2, var2:GetNameForDisplay())
				var3 = userNameFromChattedName
				var4 = userNameFromChattedName_1
			else
				local userNameFromChattedName, userNameFromChattedName_1 = displayNameHelpersModule.getUserNameFromChattedName(var1, p2, nil)
				var3 = userNameFromChattedName
				var4 = userNameFromChattedName_1
			end
			local var5 = p1:GetSpeaker(var3)
			
			if var4 == displayNameHelpersModule.CommandErrorCodes.ChattingToSelf then
				var2:SendSystemMessage(t:FormatMessageToSend("GameChat_DoMuteCommand_CannotMuteSelf", "You cannot mute yourself."), p4, t_1)
				
				return
			elseif var4 == displayNameHelpersModule.CommandErrorCodes.NoMatches then
				var2:SendSystemMessage(t:FormatMessageToSend("GameChat_MuteSpeaker_SpeakerDoesNotExist", string.format("Speaker '%s' does not exist.", tostring(var1)), "RBX_NAME", tostring(var3)), p4, t_1)
				
				return
			elseif var4 == displayNameHelpersModule.CommandErrorCodes.MultipleMatches then
				local usersWithDisplayNameString = displayNameHelpersModule.getUsersWithDisplayNameString(var1, p2)
				var2:SendSystemMessage(t:FormatMessageToSend("InGame.Chat.Response.DisplayNameMultipleMatches", "Warning: The following users have this display name: "), p4, t_1)
				var2:SendSystemMessage(usersWithDisplayNameString, p4, t_1)
				
				return
			elseif var5 then
				var2:AddMutedSpeaker(var5.Name)
				local var6 = if chatSettingsModule.PlayerDisplayNamesEnabled then var5:GetNameForDisplay() else var3
				var2:SendSystemMessage(t:FormatMessageToSend("GameChat_ChatMain_SpeakerHasBeenMuted", string.format("Speaker '%s' has been muted.", var6), "RBX_NAME", var6), p4)
			end
		end
	end
	
	local function DoUnmuteCommand(p2, p3, p4)
		-- upvalues: p1 (ref), chatSettingsModule (copy), displayNameHelpersModule (copy), t (copy), t_1 (copy)
		local var1 = p3
		
		if string.sub(p3, 1, 1) == "\"" then
			local matchIndex = string.find(p3, "\"", 2)
			
			if matchIndex then
				var1 = string.sub(p3, 2, matchIndex - 1)
			end
		else
			local match = string.match(p3, "^[^%s]+")
			
			if match then
				var1 = match
			end
		end
		local var2 = p1:GetSpeaker(p2)
		
		if var2 then
			local var3, var4
			local _ = nil
			local _ = nil
			
			if chatSettingsModule.PlayerDisplayNamesEnabled then
				local userNameFromChattedName, userNameFromChattedName_1 = displayNameHelpersModule.getUserNameFromChattedName(var1, p2, var2:GetNameForDisplay())
				var3 = userNameFromChattedName
				var4 = userNameFromChattedName_1
			else
				local userNameFromChattedName, userNameFromChattedName_1 = displayNameHelpersModule.getUserNameFromChattedName(var1, p2, nil)
				var3 = userNameFromChattedName
				var4 = userNameFromChattedName_1
			end
			local var5 = p1:GetSpeaker(var3)
			
			if var4 == displayNameHelpersModule.CommandErrorCodes.ChattingToSelf then
				var2:SendSystemMessage(t:FormatMessageToSend("GameChat_DoMuteCommand_CannotMuteSelf", "You cannot mute yourself."), p4, t_1)
				
				return
			elseif var4 == displayNameHelpersModule.CommandErrorCodes.NoMatches then
				var2:SendSystemMessage(t:FormatMessageToSend("GameChat_MuteSpeaker_SpeakerDoesNotExist", string.format("Speaker '%s' does not exist.", tostring(var3)), "RBX_NAME", tostring(var3)), p4, t_1)
				
				return
			elseif var4 == displayNameHelpersModule.CommandErrorCodes.MultipleMatches then
				local usersWithDisplayNameString = displayNameHelpersModule.getUsersWithDisplayNameString(var1, p2)
				var2:SendSystemMessage(t:FormatMessageToSend("InGame.Chat.Response.DisplayNameMultipleMatches", "Warning: The following users have this display name: "), p4, t_1)
				var2:SendSystemMessage(usersWithDisplayNameString, p4, t_1)
				
				return
			elseif var5 then
				var2:RemoveMutedSpeaker(var5.Name)
				local var6 = if chatSettingsModule.PlayerDisplayNamesEnabled then var5:GetNameForDisplay() else var3
				var2:SendSystemMessage(t:FormatMessageToSend("GameChat_ChatMain_SpeakerHasBeenUnMuted", string.format("Speaker '%s' has been unmuted.", var6), "RBX_NAME", var6), p4)
				
				return
			end
		end
	end
	
	p1:RegisterProcessCommandsFunction("mute_commands", function(p2, p3, p4)
		-- upvalues: DoMuteCommand (ref), DoUnmuteCommand (ref)
		local var1 = false
		
		if string.sub(p3, 1, 6):lower() == "/mute " then
			DoMuteCommand(p2, string.sub(p3, 7), p4)
			var1 = true
			
			return var1
		elseif string.sub(p3, 1, 8):lower() == "/unmute " then
			DoUnmuteCommand(p2, string.sub(p3, 9), p4)
			var1 = true
		end
		return var1
	end, chatConstantsModule.StandardPriority)
end