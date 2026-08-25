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
	function t.FormatMessageToSend(_, _, p0)
		return p0
	end
end
local t_1 = {
	ChatColor = chatSettingsModule.ErrorMessageTextColor or Color3.fromRGB(245, 50, 50)
}
local var10 = false
local ok, status = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserUseNewDirectChatAPI")
end)

if ok then
	var10 = status
end
local function _()
	-- upvalues: chatConstantsModule (ref)
	return if chatConstantsModule.WhisperChannelPrefix then chatConstantsModule.WhisperChannelPrefix else "To "
end

local _ = function(p1)
	-- upvalues: chatConstantsModule (ref)
	return (if chatConstantsModule.WhisperChannelPrefix then chatConstantsModule.WhisperChannelPrefix else "To ") .. p1
end

return function(p2)
	-- upvalues: runService (ref), var10 (write), textChatService (ref), chatService (ref), chatSettingsModule (ref), displayNameHelpersModule (ref), t (write), t_1 (ref), chatConstantsModule (ref)
	local function CanCommunicate(p3, p4)
		-- upvalues: runService (copy), var10 (copy), textChatService (copy), chatService (copy)
		if runService:IsStudio() then
			return true
		end
		local player = p3:GetPlayer()
		local player_1 = p4:GetPlayer()
		
		if not player or not player_1 then
			return false
		elseif var10 then
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
	
	local function DoWhisperCommand(p5, p6, p7)
		-- upvalues: p2 (ref), chatSettingsModule (copy), displayNameHelpersModule (copy), t (copy), t_1 (copy), chatConstantsModule (copy), CanCommunicate (ref)
		local var18 = p2:GetSpeaker(p5)
		local var19 = p6
		local substring = nil
		
		if string.sub(p6, 1, 1) == "\"" then
			local matchIndex = string.find(p6, "\"", 2)
			
			if matchIndex then
				var19 = string.sub(p6, 2, matchIndex - 1)
				substring = string.sub(p6, matchIndex + 2)
			end
		else
			local match = string.match(p6, "^[^%s]+")
			
			if match then
				var19 = match
				substring = string.sub(p6, string.len(var19) + 2)
			end
		end
		local var25, var26
		local _ = nil
		local _ = nil
		
		if chatSettingsModule.PlayerDisplayNamesEnabled and chatSettingsModule.WhisperByDisplayNameEnabled then
			local userNameFromChattedName, userNameFromChattedName_1 = displayNameHelpersModule.getUserNameFromChattedName(var19, p5, var18:GetNameForDisplay())
			var25 = userNameFromChattedName
			var26 = userNameFromChattedName_1
		else
			local userNameFromChattedName, userNameFromChattedName_1 = displayNameHelpersModule.getUserNameFromChattedName(var19, p5, nil)
			var25 = userNameFromChattedName
			var26 = userNameFromChattedName_1
		end
		local var29 = p2:GetSpeaker(var25)
		
		if var26 == displayNameHelpersModule.CommandErrorCodes.ChattingToSelf then
			var18:SendSystemMessage(t:FormatMessageToSend("GameChat_PrivateMessaging_CannotWhisperToSelf", "You cannot whisper to yourself."), p7, t_1)
			
			return
		elseif var26 == displayNameHelpersModule.CommandErrorCodes.NoMatches then
			var18:SendSystemMessage(t:FormatMessageToSend("GameChat_MuteSpeaker_SpeakerDoesNotExist", string.format("Speaker '%s' does not exist.", tostring(var19)), "RBX_NAME", tostring(var25)), p7, t_1)
			
			return
		elseif var26 == displayNameHelpersModule.CommandErrorCodes.MultipleMatches then
			local usersWithDisplayNameString = displayNameHelpersModule.getUsersWithDisplayNameString(var19, p5)
			var18:SendSystemMessage(t:FormatMessageToSend("InGame.Chat.Response.DisplayNameMultipleMatches", "Warning: The following users have this display name: "), p7, t_1)
			var18:SendSystemMessage(usersWithDisplayNameString, p7, t_1)
			
			return
		elseif var29 then
			local var31 = p2:GetChannel((if chatConstantsModule.WhisperChannelPrefix then chatConstantsModule.WhisperChannelPrefix else "To ") .. var25)
			
			if var31 then
				if not CanCommunicate(var18, var29) then
					var18:SendSystemMessage(t:FormatMessageToSend("GameChat_PrivateMessaging_CannotChat", "You are not able to chat with this player."), p7, t_1)
					
					return
				elseif not var18:IsInChannel(var31.Name) then
					var18:JoinChannel(var31.Name)
				end
				if substring and string.len(substring) > 0 then
					var18:SayMessage(substring, var31.Name)
				end
				var18:SetMainChannel(var31.Name)
				
				return
			else
				var18:SendSystemMessage(t:FormatMessageToSend("GameChat_MuteSpeaker_SpeakerDoesNotExist", string.format("Speaker '%s' does not exist.", tostring(var19)), "RBX_NAME", tostring(var25)), p7, t_1)
			end
		end
	end
	
	local function WhisperCommandsFunction(p8, p9, p10)
		-- upvalues: DoWhisperCommand (ref)
		local var32 = false
		
		if string.sub(p9, 1, 3):lower() == "/w " then
			DoWhisperCommand(p8, string.sub(p9, 4), p10)
			var32 = true
			
			return var32
		elseif string.sub(p9, 1, 9):lower() == "/whisper " then
			DoWhisperCommand(p8, string.sub(p9, 10), p10)
			var32 = true
		end
		return var32
	end
	
	local function PrivateMessageReplicationFunction(p11, p12, p13)
		-- upvalues: p2 (ref), chatConstantsModule (copy)
		local var33 = p2:GetSpeaker(p11)
		local extraData = var33.ExtraData
		var33:SendMessage(p12, p13, p11, extraData)
		local var34 = p2:GetSpeaker(string.sub(p13, 4))
		local text = (if chatConstantsModule.WhisperChannelPrefix then chatConstantsModule.WhisperChannelPrefix else "To ") .. p11
		
		if var34 then
			if not var34:IsInChannel(text) then
				var34:JoinChannel(text)
			end
			var34:SendMessage(p12, text, p11, extraData)
		end
		return true
	end
	
	local function PrivateMessageAddTypeFunction(_, p14, _)
		-- upvalues: chatConstantsModule (copy)
		if chatConstantsModule.MessageTypeWhisper then
			p14.MessageType = chatConstantsModule.MessageTypeWhisper
		end
	end
	
	p2:RegisterProcessCommandsFunction("whisper_commands", WhisperCommandsFunction, chatConstantsModule.StandardPriority)
	
	local function _()
		-- upvalues: chatSettingsModule (copy)
		return if chatSettingsModule.WhisperChannelNameColor then chatSettingsModule.WhisperChannelNameColor else Color3.fromRGB(102, 14, 102)
	end
	
	p2.SpeakerAdded:connect(function(p15)
		-- upvalues: p2 (ref), chatSettingsModule (copy), chatConstantsModule (copy), t (copy), PrivateMessageReplicationFunction (ref), PrivateMessageAddTypeFunction (ref)
		local var36 = p2:GetSpeaker(p15)
		local _ = nil
		local var37 = if chatSettingsModule.PlayerDisplayNamesEnabled and var36:GetPlayer() then var36:GetNameForDisplay() .. "(@" .. p15 .. ")" else p15
		local text = (if chatConstantsModule.WhisperChannelPrefix then chatConstantsModule.WhisperChannelPrefix else "To ") .. p15
		
		if p2:GetChannel(text) then
			p2:RemoveChannel(text)
		end
		local var39 = p2:AddChannel(text)
		var39.Joinable = false
		var39.Leavable = true
		var39.AutoJoin = false
		var39.Private = true
		var39.WelcomeMessage = t:FormatMessageToSend("GameChat_PrivateMessaging_NowChattingWith", "You are now privately chatting with " .. var37 .. ".", "RBX_NAME", tostring(var37))
		var39.ChannelNameColor = if chatSettingsModule.WhisperChannelNameColor then chatSettingsModule.WhisperChannelNameColor else Color3.fromRGB(102, 14, 102)
		var39:RegisterProcessCommandsFunction("replication_function", PrivateMessageReplicationFunction, chatConstantsModule.LowPriority)
		var39:RegisterFilterMessageFunction("message_type_function", PrivateMessageAddTypeFunction)
	end)
	p2.SpeakerRemoved:connect(function(p16)
		-- upvalues: chatConstantsModule (copy), p2 (ref)
		local text = (if chatConstantsModule.WhisperChannelPrefix then chatConstantsModule.WhisperChannelPrefix else "To ") .. p16
		
		if p2:GetChannel(text) then
			p2:RemoveChannel(text)
		end
	end)
end