local parent = script:FindFirstAncestor("ExpChat").Parent
local getFFlagExpChatGuacChatDisabledReason = require(parent.SharedFlags).GetFFlagExpChatGuacChatDisabledReason
local var1 = if getFFlagExpChatGuacChatDisabledReason() then require(parent.UniversalAppPolicy) else nil

return function()
	-- upvalues: getFFlagExpChatGuacChatDisabledReason (ref), var1 (write)
	return if getFFlagExpChatGuacChatDisabledReason() then var1.getAppFeaturePolicies().getExperienceChatAvailability() == "regionLocked" else false
end