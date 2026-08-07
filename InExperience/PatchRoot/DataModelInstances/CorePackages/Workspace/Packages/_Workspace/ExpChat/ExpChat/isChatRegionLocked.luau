local parent = script:FindFirstAncestor("ExpChat").Parent
local getFFlagExpChatGuacChatDisabledReason = require(parent.SharedFlags).GetFFlagExpChatGuacChatDisabledReason
local var0 = if getFFlagExpChatGuacChatDisabledReason() then require(parent.UniversalAppPolicy) else nil

return function() --[[ line: 12 ]]
	-- upvalues: getFFlagExpChatGuacChatDisabledReason (ref), var0 (write)
	return if getFFlagExpChatGuacChatDisabledReason() then var0.getAppFeaturePolicies().getExperienceChatAvailability() == "regionLocked" else false
end