local playersService = game:GetService("Players")
local expChat = script:FindFirstAncestor("ExpChat")
local isGlobalMessagePrefixEnabledModule = require(expChat.isGlobalMessagePrefixEnabled)
local isGlobalChatMessageModule = require(expChat.isGlobalChatMessage)
local fFlagExpChatDisableNameTapActionInGlobalChatModule = require(expChat.Flags.FFlagExpChatDisableNameTapActionInGlobalChat)

local function _(p1)
	return if p1.isUniverseChat ~= true then p1.channelNameOverride == "RBXGlobal" else true
end

return function(p1, p2, p3, p4)
	-- upvalues: playersService (ref), isGlobalMessagePrefixEnabledModule (ref), fFlagExpChatDisableNameTapActionInGlobalChatModule (ref), isGlobalChatMessageModule (ref)
	local var1
	p4 = p4 or playersService
	
	if not isGlobalMessagePrefixEnabledModule() then
		return p1
	elseif fFlagExpChatDisableNameTapActionInGlobalChatModule then
		if not isGlobalChatMessageModule(p2) or #p1 == 0 then
			return p1
		elseif p3 == nil or p3 == "" then
			return p1
		end
		var1 = tonumber(p2.userId)
		
		if var1 == nil or p4:GetPlayerByUserId(var1) == nil then
			return p1
		end
		local localPlayer = p4.LocalPlayer
		
		if localPlayer ~= nil and var1 == localPlayer.UserId then
			return p1
		end
		local match, match_1 = string.match(p1, "^(<font[^>]*>)(.*)$")
		
		return if match == nil or match_1 == nil then `{p3} \194\183 {p1}` else `{match}{p3} \194\183 {match_1}`
	else
		var1 = if p2.isUniverseChat ~= true then p2.channelNameOverride == "RBXGlobal" else true
		
		if not var1 or #p1 == 0 then
			return p1
		end
	end
end