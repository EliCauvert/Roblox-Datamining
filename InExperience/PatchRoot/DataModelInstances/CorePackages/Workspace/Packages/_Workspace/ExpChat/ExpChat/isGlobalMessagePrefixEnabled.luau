local ExpChatGlobalTabDefaultExperimentation = require(script:FindFirstAncestor("ExpChat").Parent.SocialExperiments).ExpChatGlobalTabDefaultExperimentation
local IsGlobalMessagePrefixEnabled = nil

return function()
	-- upvalues: IsGlobalMessagePrefixEnabled (ref), ExpChatGlobalTabDefaultExperimentation (copy)
	if IsGlobalMessagePrefixEnabled == nil then
		IsGlobalMessagePrefixEnabled = ExpChatGlobalTabDefaultExperimentation.getIsGlobalMessagePrefixEnabled()
	end
	return IsGlobalMessagePrefixEnabled
end