local Parent = script:FindFirstAncestor("ExpChat").Parent
local GetFFlagExpChatGuacChatDisabledReasonFunction = require(Parent.SharedFlags).GetFFlagExpChatGuacChatDisabledReason
local UniversalAppPolicyModule = if GetFFlagExpChatGuacChatDisabledReasonFunction() then require(Parent.UniversalAppPolicy) else nil

return function(): boolean
	-- upvalues: GetFFlagExpChatGuacChatDisabledReasonFunction (copy), UniversalAppPolicyModule (ref)
	return if GetFFlagExpChatGuacChatDisabledReasonFunction() then UniversalAppPolicyModule.getAppFeaturePolicies().getExperienceChatAvailability() == "regionLocked" else false
end