local Chat = game:GetService("Chat")
local RunService = game:GetService("RunService")
local TextChatService = game:GetService("TextChatService")
local ClientChatModules = Chat:WaitForChild("ClientChatModules")
local ChatConstantsModule = require(ClientChatModules:WaitForChild("ChatConstants"))
local ChatSettingsModule = require(ClientChatModules:WaitForChild("ChatSettings"))
local DisplayNameHelpersModule = require(Chat:WaitForChild("ChatModules").Utility.DisplayNameHelpers)
local ChatLocalizationModule = nil
pcall(function() --[[ Line: 17 ]]
	-- upvalues: ChatLocalizationModule (ref)
	ChatLocalizationModule = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)

if ChatLocalizationModule == nil then
	ChatLocalizationModule = {}
end
if not ChatLocalizationModule.FormatMessageToSend or not ChatLocalizationModule.LocalizeFormattedMessage then
	function ChatLocalizationModule:FormatMessageToSend(_, Formatted) --[[ Line: 20 ]]
		return Formatted
	end
end
local config = {
	ChatColor = ChatSettingsModule.ErrorMessageTextColor or Color3.fromRGB(245, 50, 50)
}
local v1 = false
local Success, Result = pcall(function() --[[ Line: 27 ]]
	return UserSettings():IsUserFeatureEnabled("UserUseNewDirectChatAPI")
end)

if Success then
	v1 = Result
end
local function _() --[[ Line: 35 | Named "GetWhisperChannelPrefix" ]]
	-- upvalues: ChatConstantsModule (copy)
	return if ChatConstantsModule.WhisperChannelPrefix then ChatConstantsModule.WhisperChannelPrefix else "To "
end

local _ = function(Text): string --[[ Line: 42 | Named "GetWhisperChannelId" ]]
	-- upvalues: ChatConstantsModule (copy)
	return (if ChatConstantsModule.WhisperChannelPrefix then ChatConstantsModule.WhisperChannelPrefix else "To ") .. Text
end

return function(p1) --[[ Line: 46 | Named "Run" ]]
	-- upvalues: RunService (copy), v1 (ref), TextChatService (copy), Chat (copy), ChatSettingsModule (copy), DisplayNameHelpersModule (copy), ChatLocalizationModule (ref), config (copy), ChatConstantsModule (copy)
	local function CanCommunicate(Speaker, Speaker1) --[[ Line: 48 ]]
		-- upvalues: RunService (upval), v1 (upval), TextChatService (upval), Chat (upval)
		if RunService:IsStudio() then
			return true
		end
		local Player = Speaker:GetPlayer()
		local Player1 = Speaker1:GetPlayer()
		
		if not Player or not Player1 then
			return false
		elseif v1 then
			local Success, Result = pcall(function() --[[ Line: 56 ]]
				-- upvalues: TextChatService (upval), Player (copy), Player1 (copy)
				return TextChatService:CanUsersDirectChatAsync(Player.UserId, { Player1.UserId })
			end)
			
			return Success and #Result > 0
		else
			local Success1, Result1 = pcall(function() --[[ Line: 61 ]]
				-- upvalues: Chat (upval), Player (copy), Player1 (copy)
				return Chat:CanUsersChatAsync(Player.UserId, Player1.UserId)
			end)
			
			return Success1 and Result1
		end
	end
	
	local function DoWhisperCommand(p2, Text: string, p3) --[[ Line: 70 ]]
		-- upvalues: p1 (copy), ChatSettingsModule (upval), DisplayNameHelpersModule (upval), ChatLocalizationModule (upval), config (upval), ChatConstantsModule (upval), CanCommunicate (copy)
		local Speaker = p1:GetSpeaker(p2)
		local Text1: string = Text
		local Text2: string? = nil
		
		if string.sub(Text, 1, 1) == "\"" then
			local FoundAt: number? = string.find(Text, "\"", 2)
			
			if FoundAt then
				Text1 = string.sub(Text, 2, FoundAt - 1)
				Text2 = string.sub(Text, FoundAt + 2)
			end
		else
			local Match: string? = string.match(Text, "^[^%s]+")
			
			if Match then
				Text1 = Match
				Text2 = string.sub(Text, string.len(Text1) + 2)
			end
		end
		local UserNameFromChattedName2 = nil
		local UserNameFromChattedName = nil
		if ChatSettingsModule.PlayerDisplayNamesEnabled and ChatSettingsModule.WhisperByDisplayNameEnabled then
			UserNameFromChattedName, UserNameFromChattedName2 = DisplayNameHelpersModule.getUserNameFromChattedName(Text1, p2, Speaker:GetNameForDisplay())
		else
			UserNameFromChattedName, UserNameFromChattedName2 = DisplayNameHelpersModule.getUserNameFromChattedName(Text1, p2, nil)
		end
		local Speaker1 = p1:GetSpeaker(UserNameFromChattedName)
		
		if UserNameFromChattedName2 == DisplayNameHelpersModule.CommandErrorCodes.ChattingToSelf then
			Speaker:SendSystemMessage(ChatLocalizationModule:FormatMessageToSend("GameChat_PrivateMessaging_CannotWhisperToSelf", "You cannot whisper to yourself."), p3, config)
			
			return
		end
		if UserNameFromChattedName2 == DisplayNameHelpersModule.CommandErrorCodes.NoMatches then
			Speaker:SendSystemMessage(ChatLocalizationModule:FormatMessageToSend("GameChat_MuteSpeaker_SpeakerDoesNotExist", string.format("Speaker '%s' does not exist.", (tostring(Text1))), "RBX_NAME", (tostring(UserNameFromChattedName))), p3, config)
			
			return
		end
		if UserNameFromChattedName2 == DisplayNameHelpersModule.CommandErrorCodes.MultipleMatches then
			local UsersWithDisplayNameString = DisplayNameHelpersModule.getUsersWithDisplayNameString(Text1, p2)
			Speaker:SendSystemMessage(ChatLocalizationModule:FormatMessageToSend("InGame.Chat.Response.DisplayNameMultipleMatches", "Warning: The following users have this display name: "), p3, config)
			Speaker:SendSystemMessage(UsersWithDisplayNameString, p3, config)
			
			return
		end
		if Speaker1 then
			local Channel = p1:GetChannel((if ChatConstantsModule.WhisperChannelPrefix then ChatConstantsModule.WhisperChannelPrefix else "To ") .. UserNameFromChattedName)
			
			if Channel then
				if not CanCommunicate(Speaker, Speaker1) then
					Speaker:SendSystemMessage(ChatLocalizationModule:FormatMessageToSend("GameChat_PrivateMessaging_CannotChat", "You are not able to chat with this player."), p3, config)
					
					return
				end
				if not Speaker:IsInChannel(Channel.Name) then
					Speaker:JoinChannel(Channel.Name)
				end
				if Text2 and string.len(Text2) > 0 then
					Speaker:SayMessage(Text2, Channel.Name)
				end
				Speaker:SetMainChannel(Channel.Name)
				
				return
			else
				Speaker:SendSystemMessage(ChatLocalizationModule:FormatMessageToSend("GameChat_MuteSpeaker_SpeakerDoesNotExist", string.format("Speaker '%s' does not exist.", (tostring(Text1))), "RBX_NAME", (tostring(UserNameFromChattedName))), p3, config)
			end
		end
	end
	
	local function PrivateMessageReplicationFunction(Text1, p2, Text: string): boolean --[[ Line: 163 ]]
		-- upvalues: p1 (copy), ChatConstantsModule (upval)
		local Speaker = p1:GetSpeaker(Text1)
		local ExtraData = Speaker.ExtraData
		Speaker:SendMessage(p2, Text, Text1, ExtraData)
		local Speaker1 = p1:GetSpeaker((string.sub(Text, 4)))
		local Text2 = (if ChatConstantsModule.WhisperChannelPrefix then ChatConstantsModule.WhisperChannelPrefix else "To ") .. Text1
		
		if Speaker1 then
			if not Speaker1:IsInChannel(Text2) then
				Speaker1:JoinChannel(Text2)
			end
			Speaker1:SendMessage(p2, Text2, Text1, ExtraData)
		end
		return true
	end
	
	local function PrivateMessageAddTypeFunction(_, p2, _) --[[ Line: 181 ]]
		-- upvalues: ChatConstantsModule (upval)
		if ChatConstantsModule.MessageTypeWhisper then
			p2.MessageType = ChatConstantsModule.MessageTypeWhisper
		end
	end
	
	p1:RegisterProcessCommandsFunction("whisper_commands", function(p2, Text: string, p3): boolean --[[ Line: 147 | Named "WhisperCommandsFunction" ]]
		-- upvalues: DoWhisperCommand (copy)
		local Flag = false
		
		if string.sub(Text, 1, 3):lower() == "/w " then
			DoWhisperCommand(p2, string.sub(Text, 4), p3)
			Flag = true
			
			return Flag
		end
		if string.sub(Text, 1, 9):lower() == "/whisper " then
			DoWhisperCommand(p2, string.sub(Text, 10), p3)
			Flag = true
		end
		return Flag
	end, ChatConstantsModule.StandardPriority)
	
	local function _() --[[ Line: 189 | Named "GetWhisperChanneNameColor" ]]
		-- upvalues: ChatSettingsModule (upval)
		return if ChatSettingsModule.WhisperChannelNameColor then ChatSettingsModule.WhisperChannelNameColor else Color3.fromRGB(102, 14, 102)
	end
	
	p1.SpeakerAdded:connect(function(Text) --[[ Line: 196 ]]
		-- upvalues: p1 (copy), ChatSettingsModule (upval), ChatConstantsModule (upval), ChatLocalizationModule (upval), PrivateMessageReplicationFunction (copy), PrivateMessageAddTypeFunction (copy)
		local Speaker = p1:GetSpeaker(Text)
		local Text1 = if ChatSettingsModule.PlayerDisplayNamesEnabled and Speaker:GetPlayer() then Speaker:GetNameForDisplay() .. "(@" .. Text .. ")" else Text
		local Text2 = (if ChatConstantsModule.WhisperChannelPrefix then ChatConstantsModule.WhisperChannelPrefix else "To ") .. Text
		
		if p1:GetChannel(Text2) then
			p1:RemoveChannel(Text2)
		end
		local AddChannelResult = p1:AddChannel(Text2)
		AddChannelResult.Joinable = false
		AddChannelResult.Leavable = true
		AddChannelResult.AutoJoin = false
		AddChannelResult.Private = true
		AddChannelResult.WelcomeMessage = ChatLocalizationModule:FormatMessageToSend("GameChat_PrivateMessaging_NowChattingWith", "You are now privately chatting with " .. Text1 .. ".", "RBX_NAME", (tostring(Text1)))
		AddChannelResult.ChannelNameColor = if ChatSettingsModule.WhisperChannelNameColor then ChatSettingsModule.WhisperChannelNameColor else Color3.fromRGB(102, 14, 102)
		AddChannelResult:RegisterProcessCommandsFunction("replication_function", PrivateMessageReplicationFunction, ChatConstantsModule.LowPriority)
		AddChannelResult:RegisterFilterMessageFunction("message_type_function", PrivateMessageAddTypeFunction)
	end)
	p1.SpeakerRemoved:connect(function(Text) --[[ Line: 228 ]]
		-- upvalues: ChatConstantsModule (upval), p1 (copy)
		local Text1 = (if ChatConstantsModule.WhisperChannelPrefix then ChatConstantsModule.WhisperChannelPrefix else "To ") .. Text
		
		if p1:GetChannel(Text1) then
			p1:RemoveChannel(Text1)
		end
	end)
end