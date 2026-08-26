local chatService = game:GetService("Chat")
local runService = game:GetService("RunService")
local textChatService = game:GetService("TextChatService")
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
local var1 = false
local ok, status = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserUseNewDirectChatAPI")
end)

if ok then
	var1 = status
end
local function _()
	-- upvalues: chatConstantsModule (ref)
	return if chatConstantsModule.WhisperChannelPrefix then chatConstantsModule.WhisperChannelPrefix else "To "
end

local _ = function(p1)
	-- upvalues: chatConstantsModule (ref)
	return (if chatConstantsModule.WhisperChannelPrefix then chatConstantsModule.WhisperChannelPrefix else "To ") .. p1
end

return function(p1)
	-- upvalues: runService (ref), var1 (write), textChatService (ref), chatService (ref), chatSettingsModule (ref), displayNameHelpersModule (ref), t (write), t_1 (ref), chatConstantsModule (ref)
	local function CanCommunicate(p2, p3)
		-- upvalues: runService (copy), var1 (copy), textChatService (copy), chatService (copy)
		if runService:IsStudio() then
			return true
		end
		local player = p2:GetPlayer()
		local player_1 = p3:GetPlayer()
		
		if not player or not player_1 then
			return false
		elseif var1 then
			local ok, status = pcall(function()
				-- upvalues: textChatService (copy), player (ref), player_1 (ref)
				return textChatService:CanUsersDirectChatAsync(player.UserId, { player_1.UserId })
			end)
			
			return ok and #status > 0
		end
		local ok, status = pcall(function()
			-- upvalues: chatService (copy), player (ref), player_1 (ref)
			return chatService:CanUsersChatAsync(player.UserId, player_1.UserId)
		end)
		
		return ok and status
	end
	
	local function DoWhisperCommand(p2, p3, p4)
		-- upvalues: p1 (ref), chatSettingsModule (copy), displayNameHelpersModule (copy), t (copy), t_1 (copy), chatConstantsModule (copy), CanCommunicate (ref)
		local var2 = p1:GetSpeaker(p2)
		local var3 = p3
		local substring = nil
		
		if string.sub(p3, 1, 1) == "\"" then
			local matchIndex = string.find(p3, "\"", 2)
			
			if matchIndex then
				var3 = string.sub(p3, 2, matchIndex - 1)
				substring = string.sub(p3, matchIndex + 2)
			end
		else
			local match = string.match(p3, "^[^%s]+")
			
			if match then
				var3 = match
				substring = string.sub(p3, string.len(var3) + 2)
			end
		end
		local var4, var5
		local _ = nil
		local _ = nil
		
		if chatSettingsModule.PlayerDisplayNamesEnabled and chatSettingsModule.WhisperByDisplayNameEnabled then
			local userNameFromChattedName, userNameFromChattedName_1 = displayNameHelpersModule.getUserNameFromChattedName(var3, p2, var2:GetNameForDisplay())
			var4 = userNameFromChattedName
			var5 = userNameFromChattedName_1
		else
			local userNameFromChattedName, userNameFromChattedName_1 = displayNameHelpersModule.getUserNameFromChattedName(var3, p2, nil)
			var4 = userNameFromChattedName
			var5 = userNameFromChattedName_1
		end
		local var6 = p1:GetSpeaker(var4)
		
		if var5 == displayNameHelpersModule.CommandErrorCodes.ChattingToSelf then
			var2:SendSystemMessage(t:FormatMessageToSend("GameChat_PrivateMessaging_CannotWhisperToSelf", "You cannot whisper to yourself."), p4, t_1)
			
			return
		elseif var5 == displayNameHelpersModule.CommandErrorCodes.NoMatches then
			var2:SendSystemMessage(t:FormatMessageToSend("GameChat_MuteSpeaker_SpeakerDoesNotExist", string.format("Speaker '%s' does not exist.", tostring(var3)), "RBX_NAME", tostring(var4)), p4, t_1)
			
			return
		elseif var5 == displayNameHelpersModule.CommandErrorCodes.MultipleMatches then
			local usersWithDisplayNameString = displayNameHelpersModule.getUsersWithDisplayNameString(var3, p2)
			var2:SendSystemMessage(t:FormatMessageToSend("InGame.Chat.Response.DisplayNameMultipleMatches", "Warning: The following users have this display name: "), p4, t_1)
			var2:SendSystemMessage(usersWithDisplayNameString, p4, t_1)
			
			return
		elseif var6 then
			local var7 = p1:GetChannel((if chatConstantsModule.WhisperChannelPrefix then chatConstantsModule.WhisperChannelPrefix else "To ") .. var25)
			
			if var7 then
				if not CanCommunicate(var2, var6) then
					var2:SendSystemMessage(t:FormatMessageToSend("GameChat_PrivateMessaging_CannotChat", "You are not able to chat with this player."), p4, t_1)
					
					return
				elseif not var2:IsInChannel(var7.Name) then
					var2:JoinChannel(var7.Name)
				end
				if substring and string.len(substring) > 0 then
					var2:SayMessage(substring, var7.Name)
				end
				var2:SetMainChannel(var7.Name)
				
				return
			else
				var2:SendSystemMessage(t:FormatMessageToSend("GameChat_MuteSpeaker_SpeakerDoesNotExist", string.format("Speaker '%s' does not exist.", tostring(var3)), "RBX_NAME", tostring(var4)), p4, t_1)
			end
		end
	end
	
	local function WhisperCommandsFunction(p2, p3, p4)
		-- upvalues: DoWhisperCommand (ref)
		local var2 = false
		
		if string.sub(p3, 1, 3):lower() == "/w " then
			DoWhisperCommand(p2, string.sub(p3, 4), p4)
			var2 = true
			
			return var2
		elseif string.sub(p3, 1, 9):lower() == "/whisper " then
			DoWhisperCommand(p2, string.sub(p3, 10), p4)
			var2 = true
		end
		return var2
	end
	
	local function PrivateMessageReplicationFunction(p2, p3, p4)
		-- upvalues: p1 (ref), chatConstantsModule (copy)
		local var2 = p1:GetSpeaker(p2)
		local extraData = var2.ExtraData
		var2:SendMessage(p3, p4, p2, extraData)
		local var3 = p1:GetSpeaker(string.sub(p4, 4))
		local text = (if chatConstantsModule.WhisperChannelPrefix then chatConstantsModule.WhisperChannelPrefix else "To ") .. p11
		
		if var3 then
			if not var3:IsInChannel(text) then
				var3:JoinChannel(text)
			end
			var3:SendMessage(p3, text, p2, extraData)
		end
		return true
	end
	
	local function PrivateMessageAddTypeFunction(_, p2, _)
		-- upvalues: chatConstantsModule (copy)
		if chatConstantsModule.MessageTypeWhisper then
			p2.MessageType = chatConstantsModule.MessageTypeWhisper
		end
	end
	
	p1:RegisterProcessCommandsFunction("whisper_commands", WhisperCommandsFunction, chatConstantsModule.StandardPriority)
	
	local function _()
		-- upvalues: chatSettingsModule (copy)
		return if chatSettingsModule.WhisperChannelNameColor then chatSettingsModule.WhisperChannelNameColor else Color3.fromRGB(102, 14, 102)
	end
	
	p1.SpeakerAdded:connect(function(p2)
		-- upvalues: p1 (ref), chatSettingsModule (copy), chatConstantsModule (copy), t (copy), PrivateMessageReplicationFunction (ref), PrivateMessageAddTypeFunction (ref)
		local var2 = p1:GetSpeaker(p2)
		local _ = nil
		local var3 = if chatSettingsModule.PlayerDisplayNamesEnabled and var2:GetPlayer() then var2:GetNameForDisplay() .. "(@" .. p15 .. ")" else p2
		local text = (if chatConstantsModule.WhisperChannelPrefix then chatConstantsModule.WhisperChannelPrefix else "To ") .. p15
		
		if p1:GetChannel(text) then
			p1:RemoveChannel(text)
		end
		local var4 = p1:AddChannel(text)
		var4.Joinable = false
		var4.Leavable = true
		var4.AutoJoin = false
		var4.Private = true
		var4.WelcomeMessage = t:FormatMessageToSend("GameChat_PrivateMessaging_NowChattingWith", "You are now privately chatting with " .. var37 .. ".", "RBX_NAME", tostring(var3))
		var4.ChannelNameColor = if chatSettingsModule.WhisperChannelNameColor then chatSettingsModule.WhisperChannelNameColor else Color3.fromRGB(102, 14, 102)
		var4:RegisterProcessCommandsFunction("replication_function", PrivateMessageReplicationFunction, chatConstantsModule.LowPriority)
		var4:RegisterFilterMessageFunction("message_type_function", PrivateMessageAddTypeFunction)
	end)
	p1.SpeakerRemoved:connect(function(p2)
		-- upvalues: chatConstantsModule (copy), p1 (ref)
		local text = (if chatConstantsModule.WhisperChannelPrefix then chatConstantsModule.WhisperChannelPrefix else "To ") .. p16
		
		if p1:GetChannel(text) then
			p1:RemoveChannel(text)
		end
	end)
end