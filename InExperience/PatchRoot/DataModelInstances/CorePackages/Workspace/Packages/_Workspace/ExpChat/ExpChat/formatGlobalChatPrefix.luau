local Players = game:GetService("Players")
local ExpChat = script:FindFirstAncestor("ExpChat")
local IsGlobalMessagePrefixEnabledModule = require(ExpChat.isGlobalMessagePrefixEnabled)
local IsGlobalChatMessageModule = require(ExpChat.isGlobalChatMessage)

return function(Text: string, p1, p2, p3): string
	-- upvalues: Players (copy), IsGlobalMessagePrefixEnabledModule (copy), IsGlobalChatMessageModule (copy)
	local P2 = p3 or Players
	
	if not IsGlobalMessagePrefixEnabledModule() then
		return Text
	elseif not IsGlobalChatMessageModule(p1) or #Text == 0 then
		return Text
	elseif p2 == nil or p2 == "" then
		return Text
	else
		local Number: number? = tonumber(p1.userId)
		
		if Number == nil or P2:GetPlayerByUserId(Number) == nil then
			return Text
		end
		local LocalPlayer = P2.LocalPlayer
		
		if LocalPlayer == nil or Number ~= LocalPlayer.UserId then
			local Match, Match2 = string.match(Text, "^(<font[^>]*>)(.*)$")
			
			return if Match == nil or Match2 == nil then `{p2} · {Text}` else `{Match}{p2} · {Match2}`
		else
			return Text
		end
	end
end