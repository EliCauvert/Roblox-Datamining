local Chat = game:GetService("Chat")
local RunService = game:GetService("RunService")
local ClientChatModules = Chat:WaitForChild("ClientChatModules")
local ChatSettingsModule = require(ClientChatModules:WaitForChild("ChatSettings"))
local ChatConstantsModule = require(ClientChatModules:WaitForChild("ChatConstants"))
local ChatLocalizationModule = nil
pcall(function() --[[ Line: 14 ]]
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
local DisallowedWhiteSpace = if ChatSettingsModule.DisallowedWhiteSpace then ChatSettingsModule.DisallowedWhiteSpace else {
	"\n",
	"\r",
	"\t",
	"\11",
	"\f"
}

local function isMessageValidServer(Text): boolean --[[ Line: 27 ]]
	-- upvalues: ChatSettingsModule (copy)
	return ChatSettingsModule.MaximumMessageLength * 6 >= Text:len() and (utf8.len(Text) ~= nil and ChatSettingsModule.MaximumMessageLength >= utf8.len(utf8.nfcnormalize(Text)))
end

local function _(Player: Player) --[[ Line: 47 | Named "CanUserChat" ]]
	-- upvalues: RunService (copy), Chat (copy)
	if RunService:IsStudio() then
		return true
	else
		local Success, Result = pcall(function() --[[ Line: 51 ]]
			-- upvalues: Chat (upval), Player (copy)
			return Chat:CanUserChatAsync(Player.UserId)
		end)
		
		return Success and Result
	end
end

return function(p1) --[[ Line: 57 | Named "Run" ]]
	-- upvalues: RunService (copy), Chat (copy), ChatLocalizationModule (ref), isMessageValidServer (copy), DisallowedWhiteSpace (ref), ChatConstantsModule (copy)
	p1:RegisterProcessCommandsFunction("message_validation", function(p2, p3: string, p4): boolean --[[ Line: 58 | Named "ValidateChatFunction" ]]
		-- upvalues: p1 (copy), RunService (upval), Chat (upval), ChatLocalizationModule (upval), isMessageValidServer (upval), DisallowedWhiteSpace (upval)
		local Speaker = p1:GetSpeaker(p2)
		local Player = Speaker:GetPlayer()
		
		if not Speaker then
			return false
		end
		if not Player then
			return false
		end
		if not RunService:IsStudio() and Player.UserId < 1 then
			return true
		end
		local v1 = nil
		if RunService:IsStudio() then
			v1 = true
		else
			local Success, Result = pcall(function() --[[ Line: 51 ]]
				-- upvalues: Chat (upval), Player (copy)
				return Chat:CanUserChatAsync(Player.UserId)
			end)
			v1 = Success and Result
		end
		if not v1 then
			Speaker:SendSystemMessage(ChatLocalizationModule:FormatMessageToSend("GameChat_ChatMessageValidator_SettingsError", "Your chat settings prevent you from sending messages."), p4)
			
			return true
		end
		if not isMessageValidServer(p3) then
			Speaker:SendSystemMessage(ChatLocalizationModule:FormatMessageToSend("GameChat_ChatMessageValidator_MaxLengthError", "Your message exceeds the maximum message length."), p4)
			
			return true
		end
		for _, value in pairs(DisallowedWhiteSpace) do
			if p3:find(value) then
				Speaker:SendSystemMessage(ChatLocalizationModule:FormatMessageToSend("GameChat_ChatMessageValidator_WhitespaceError", "Your message contains whitespace that is not allowed."), p4)
				
				return true
			end
		end
		return false
	end, ChatConstantsModule.VeryHighPriority)
end