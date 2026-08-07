local chatService = game:GetService("Chat")
local runService = game:GetService("RunService")
local clientChatModules = chatService:WaitForChild("ClientChatModules")
local chatSettingsModule = require(clientChatModules:WaitForChild("ChatSettings"))
local chatConstantsModule = require(clientChatModules:WaitForChild("ChatConstants"))
local t = nil
pcall(function() --[[ line: 14 ]]
	-- upvalues: t (write)
	t = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)

if t == nil then
	t = {}
end
if not t.FormatMessageToSend or not t.LocalizeFormattedMessage then
	function t.FormatMessageToSend(_, _, p0) --[[ line: 17 ]]
		return p0
	end
end
local var6 = if chatSettingsModule.DisallowedWhiteSpace then chatSettingsModule.DisallowedWhiteSpace else {
	"\n",
	"\r",
	"\t",
	"\11",
	"\f"
}

local function isMessageValidServer(p1) --[[ line: 27 ]]
	-- upvalues: chatSettingsModule (ref)
	return if chatSettingsModule.MaximumMessageLength * 6 < p1:len() then false elseif utf8.len(p1) == nil then false else chatSettingsModule.MaximumMessageLength >= utf8.len(utf8.nfcnormalize(p1))
end

local function _(p2) --[[ line: 47 | named "CanUserChat" ]]
	-- upvalues: runService (ref), chatService (ref)
	if runService:IsStudio() then
		return true
	end
	local ok, status = pcall(function() --[[ line: 51 ]]
		-- upvalues: chatService (copy), p2 (ref)
		return chatService:CanUserChatAsync(p2.UserId)
	end)
	
	return ok and status
end

return function(p3) --[[ line: 57 | named "Run" ]]
	-- upvalues: runService (ref), chatService (ref), t (write), isMessageValidServer (ref), var6 (write), chatConstantsModule (ref)
	p3:RegisterProcessCommandsFunction("message_validation", function(p4, p5, p6) --[[ line: 58 | named "ValidateChatFunction" ]]
		-- upvalues: p3 (ref), runService (copy), chatService (copy), t (copy), isMessageValidServer (copy), var6 (copy)
		local var10
		local var8 = p3:GetSpeaker(p4)
		local player = var8:GetPlayer()
		
		if not var8 then
			return false
		elseif not player then
			return false
		elseif not runService:IsStudio() and player.UserId < 1 then
			return true
		elseif runService:IsStudio() then
			var10 = true
		else
			local ok, status = pcall(function() --[[ line: 51 ]]
				-- upvalues: chatService (copy), player (ref)
				return chatService:CanUserChatAsync(player.UserId)
			end)
			var10 = ok and status
		end
		if not var10 then
			var8:SendSystemMessage(t:FormatMessageToSend("GameChat_ChatMessageValidator_SettingsError", "Your chat settings prevent you from sending messages."), p6)
			
			return true
		elseif not isMessageValidServer(p5) then
			var8:SendSystemMessage(t:FormatMessageToSend("GameChat_ChatMessageValidator_MaxLengthError", "Your message exceeds the maximum message length."), p6)
			
			return true
		end
		for i, v in pairs(var6) do
			if p5:find(v) then
				var8:SendSystemMessage(t:FormatMessageToSend("GameChat_ChatMessageValidator_WhitespaceError", "Your message contains whitespace that is not allowed."), p6)
				
				return true
			end
		end
		return false
	end, chatConstantsModule.VeryHighPriority)
end