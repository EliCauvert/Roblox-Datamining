local chatService = game:GetService("Chat")
local clientChatModules = chatService:WaitForChild("ClientChatModules")
local chatModules = chatService:WaitForChild("ChatModules")
local chatConstantsModule = require(clientChatModules:WaitForChild("ChatConstants"))
local chatSettingsModule = require(clientChatModules:WaitForChild("ChatSettings"))
local displayNameHelpersModule = require(chatModules.Utility.DisplayNameHelpers)
local t = nil
pcall(function() --[[ line: 15 ]]
	-- upvalues: t (write)
	t = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)

if t == nil then
	t = {}
end
if not t.FormatMessageToSend or not t.LocalizeFormattedMessage then
	function t.FormatMessageToSend(_, _, p0) --[[ line: 18 ]]
		return p0
	end
end
local t_1 = {
	ChatColor = chatSettingsModule.ErrorMessageTextColor or Color3.fromRGB(245, 50, 50)
}

return function(p1) --[[ line: 24 | named "Run" ]]
	-- upvalues: chatSettingsModule (ref), displayNameHelpersModule (ref), t (write), t_1 (ref), chatConstantsModule (ref)
	local function _(p2) --[[ line: 26 | named "GetSpeakerNameFromMessage" ]]
		local var10 = p2
		
		if string.sub(p2, 1, 1) == "\"" then
			local matchIndex = string.find(p2, "\"", 2)
			
			if matchIndex then
				var10 = string.sub(p2, 2, matchIndex - 1)
				
				return var10
			end
		else
			local match = string.match(p2, "^[^%s]+")
			
			if match then
				var10 = match
			end
		end
		return var10
	end
	
	local function DoMuteCommand(p3, p4, p5) --[[ line: 42 ]]
		-- upvalues: p1 (ref), chatSettingsModule (copy), displayNameHelpersModule (copy), t (copy), t_1 (copy)
		local var13 = p4
		
		if string.sub(p4, 1, 1) == "\"" then
			local matchIndex = string.find(p4, "\"", 2)
			
			if matchIndex then
				var13 = string.sub(p4, 2, matchIndex - 1)
			end
		else
			local match = string.match(p4, "^[^%s]+")
			
			if match then
				var13 = match
			end
		end
		local var16 = p1:GetSpeaker(p3)
		
		if var16 then
			local var19, var20
			local _ = nil
			local _ = nil
			
			if chatSettingsModule.PlayerDisplayNamesEnabled then
				local userNameFromChattedName, userNameFromChattedName_1 = displayNameHelpersModule.getUserNameFromChattedName(var13, p3, var16:GetNameForDisplay())
				var19 = userNameFromChattedName
				var20 = userNameFromChattedName_1
			else
				local userNameFromChattedName, userNameFromChattedName_1 = displayNameHelpersModule.getUserNameFromChattedName(var13, p3, nil)
				var19 = userNameFromChattedName
				var20 = userNameFromChattedName_1
			end
			local var23 = p1:GetSpeaker(var19)
			
			if var20 == displayNameHelpersModule.CommandErrorCodes.ChattingToSelf then
				var16:SendSystemMessage(t:FormatMessageToSend("GameChat_DoMuteCommand_CannotMuteSelf", "You cannot mute yourself."), p5, t_1)
				
				return
			elseif var20 == displayNameHelpersModule.CommandErrorCodes.NoMatches then
				var16:SendSystemMessage(t:FormatMessageToSend("GameChat_MuteSpeaker_SpeakerDoesNotExist", string.format("Speaker '%s' does not exist.", tostring(var13)), "RBX_NAME", tostring(var19)), p5, t_1)
				
				return
			elseif var20 == displayNameHelpersModule.CommandErrorCodes.MultipleMatches then
				local usersWithDisplayNameString = displayNameHelpersModule.getUsersWithDisplayNameString(var13, p3)
				var16:SendSystemMessage(t:FormatMessageToSend("InGame.Chat.Response.DisplayNameMultipleMatches", "Warning: The following users have this display name: "), p5, t_1)
				var16:SendSystemMessage(usersWithDisplayNameString, p5, t_1)
				
				return
			elseif var23 then
				var16:AddMutedSpeaker(var23.Name)
				local var25 = if chatSettingsModule.PlayerDisplayNamesEnabled then var23:GetNameForDisplay() else var19
				var16:SendSystemMessage(t:FormatMessageToSend("GameChat_ChatMain_SpeakerHasBeenMuted", string.format("Speaker '%s' has been muted.", var25), "RBX_NAME", var25), p5)
			end
		end
	end
	
	local function DoUnmuteCommand(p6, p7, p8) --[[ line: 94 ]]
		-- upvalues: p1 (ref), chatSettingsModule (copy), displayNameHelpersModule (copy), t (copy), t_1 (copy)
		local var26 = p7
		
		if string.sub(p7, 1, 1) == "\"" then
			local matchIndex = string.find(p7, "\"", 2)
			
			if matchIndex then
				var26 = string.sub(p7, 2, matchIndex - 1)
			end
		else
			local match = string.match(p7, "^[^%s]+")
			
			if match then
				var26 = match
			end
		end
		local var29 = p1:GetSpeaker(p6)
		
		if var29 then
			local var32, var33
			local _ = nil
			local _ = nil
			
			if chatSettingsModule.PlayerDisplayNamesEnabled then
				local userNameFromChattedName, userNameFromChattedName_1 = displayNameHelpersModule.getUserNameFromChattedName(var26, p6, var29:GetNameForDisplay())
				var32 = userNameFromChattedName
				var33 = userNameFromChattedName_1
			else
				local userNameFromChattedName, userNameFromChattedName_1 = displayNameHelpersModule.getUserNameFromChattedName(var26, p6, nil)
				var32 = userNameFromChattedName
				var33 = userNameFromChattedName_1
			end
			local var36 = p1:GetSpeaker(var32)
			
			if var33 == displayNameHelpersModule.CommandErrorCodes.ChattingToSelf then
				var29:SendSystemMessage(t:FormatMessageToSend("GameChat_DoMuteCommand_CannotMuteSelf", "You cannot mute yourself."), p8, t_1)
				
				return
			elseif var33 == displayNameHelpersModule.CommandErrorCodes.NoMatches then
				var29:SendSystemMessage(t:FormatMessageToSend("GameChat_MuteSpeaker_SpeakerDoesNotExist", string.format("Speaker '%s' does not exist.", tostring(var32)), "RBX_NAME", tostring(var32)), p8, t_1)
				
				return
			elseif var33 == displayNameHelpersModule.CommandErrorCodes.MultipleMatches then
				local usersWithDisplayNameString = displayNameHelpersModule.getUsersWithDisplayNameString(var26, p6)
				var29:SendSystemMessage(t:FormatMessageToSend("InGame.Chat.Response.DisplayNameMultipleMatches", "Warning: The following users have this display name: "), p8, t_1)
				var29:SendSystemMessage(usersWithDisplayNameString, p8, t_1)
				
				return
			elseif var36 then
				var29:RemoveMutedSpeaker(var36.Name)
				local var38 = if chatSettingsModule.PlayerDisplayNamesEnabled then var36:GetNameForDisplay() else var32
				var29:SendSystemMessage(t:FormatMessageToSend("GameChat_ChatMain_SpeakerHasBeenUnMuted", string.format("Speaker '%s' has been unmuted.", var38), "RBX_NAME", var38), p8)
				
				return
			end
		end
	end
	
	p1:RegisterProcessCommandsFunction("mute_commands", function(p9, p10, p11) --[[ line: 149 | named "MuteCommandsFunction" ]]
		-- upvalues: DoMuteCommand (ref), DoUnmuteCommand (ref)
		local var39 = false
		
		if string.sub(p10, 1, 6):lower() == "/mute " then
			DoMuteCommand(p9, string.sub(p10, 7), p11)
			var39 = true
			
			return var39
		elseif string.sub(p10, 1, 8):lower() == "/unmute " then
			DoUnmuteCommand(p9, string.sub(p10, 9), p11)
			var39 = true
		end
		return var39
	end, chatConstantsModule.StandardPriority)
end