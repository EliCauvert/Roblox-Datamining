local chatService = game:GetService("Chat")
local runService = game:GetService("RunService")
local clientChatModules = chatService:WaitForChild("ClientChatModules")
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
	function t.FormatMessageToSend(_, _, p1)
		return p1
	end
end
local var1 = if chatSettingsModule.DisallowedWhiteSpace then chatSettingsModule.DisallowedWhiteSpace else {
	"\n",
	"\r",
	"\t",
	"\11",
	"\f"
}

local function isMessageValidServer(p1)
	-- upvalues: chatSettingsModule (ref)
	return if chatSettingsModule.MaximumMessageLength * 6 < p1:len() then false elseif utf8.len(p1) == nil then false else chatSettingsModule.MaximumMessageLength >= utf8.len(utf8.nfcnormalize(p1))
end

local function _(p1)
	-- upvalues: runService (ref), chatService (ref)
	if runService:IsStudio() then
		return true
	end
	local ok, status = pcall(function()
		-- upvalues: chatService (copy), p1 (ref)
		return chatService:CanUserChatAsync(p1.UserId)
	end)
	
	return ok and status
end

return function(p1)
	-- upvalues: runService (ref), chatService (ref), t (write), isMessageValidServer (ref), var1 (write), chatConstantsModule (ref)
	p1:RegisterProcessCommandsFunction("message_validation", function(p2, p3, p4)
		-- upvalues: p1 (ref), runService (copy), chatService (copy), t (copy), isMessageValidServer (copy), var1 (copy)
		local var2
		local var3 = p1:GetSpeaker(p2)
		local player = var3:GetPlayer()
		
		if not var3 then
			return false
		elseif not player then
			return false
		elseif not runService:IsStudio() and player.UserId < 1 then
			return true
		elseif runService:IsStudio() then
			var2 = true
		else
			local ok, status = pcall(function()
				-- upvalues: chatService (copy), player (ref)
				return chatService:CanUserChatAsync(player.UserId)
			end)
			var2 = ok and status
		end
		if not var2 then
			var3:SendSystemMessage(t:FormatMessageToSend("GameChat_ChatMessageValidator_SettingsError", "Your chat settings prevent you from sending messages."), p4)
			
			return true
		elseif not isMessageValidServer(p3) then
			var3:SendSystemMessage(t:FormatMessageToSend("GameChat_ChatMessageValidator_MaxLengthError", "Your message exceeds the maximum message length."), p4)
			
			return true
		end
		for i, v in pairs(var1) do
			if p3:find(v) then
				var3:SendSystemMessage(t:FormatMessageToSend("GameChat_ChatMessageValidator_WhitespaceError", "Your message contains whitespace that is not allowed."), p4)
				
				return true
			end
		end
		return false
	end, chatConstantsModule.VeryHighPriority)
end