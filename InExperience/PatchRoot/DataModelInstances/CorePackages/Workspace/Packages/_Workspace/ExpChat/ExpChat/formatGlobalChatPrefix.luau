local Players = game:GetService("Players")
local ExpChat = script:FindFirstAncestor("ExpChat")
local IsGlobalMessagePrefixEnabledModule = require(ExpChat.isGlobalMessagePrefixEnabled)
local IsGlobalChatMessageModule = require(ExpChat.isGlobalChatMessage)
local FFlagExpChatDisableNameTapActionInGlobalChatModule = require(ExpChat.Flags.FFlagExpChatDisableNameTapActionInGlobalChat)

local function _(p1): boolean --[[ Line: 41 | Named "isGlobalChatMessage" ]]
	return p1.isUniverseChat == true or p1.channelNameOverride == "RBXGlobal"
end

return function(Text: string, p1, p2, p3): string --[[ Line: 47 | Named "formatGlobalChatPrefix" ]]
	-- upvalues: Players (copy), IsGlobalMessagePrefixEnabledModule (copy), FFlagExpChatDisableNameTapActionInGlobalChatModule (copy), IsGlobalChatMessageModule (copy)
	local P3 = p3 or Players
	
	if not IsGlobalMessagePrefixEnabledModule() then
		return Text
	elseif FFlagExpChatDisableNameTapActionInGlobalChatModule then
		if not IsGlobalChatMessageModule(p1) or #Text == 0 then
			return Text
		end
	elseif p1.isUniverseChat ~= true and p1.channelNameOverride ~= "RBXGlobal" or #Text == 0 then
		return Text
	end
	if p2 == nil or p2 == "" then
		return Text
	end
	local Number: number? = tonumber(p1.userId)
	
	if Number == nil or P3:GetPlayerByUserId(Number) == nil then
		return Text
	end
	local LocalPlayer = P3.LocalPlayer
	
	if LocalPlayer == nil or Number ~= LocalPlayer.UserId then
		local Match, Match2 = string.match(Text, "^(<font[^>]*>)(.*)$")
		
		return if Match == nil or Match2 == nil then `{p2} · {Text}` else `{Match}{p2} · {Match2}`
	else
		return Text
	end
end