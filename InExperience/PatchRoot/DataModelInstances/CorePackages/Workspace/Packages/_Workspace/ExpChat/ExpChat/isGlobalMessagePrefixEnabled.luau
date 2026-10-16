local ExpChatGlobalTabDefaultExperimentation = require(script:FindFirstAncestor("ExpChat").Parent.SocialExperiments).ExpChatGlobalTabDefaultExperimentation
local IsGlobalMessagePrefixEnabled = nil

return function() --[[ Line: 21 | Named "isGlobalMessagePrefixEnabled" ]]
	-- upvalues: IsGlobalMessagePrefixEnabled (ref), ExpChatGlobalTabDefaultExperimentation (copy)
	if IsGlobalMessagePrefixEnabled == nil then
		IsGlobalMessagePrefixEnabled = ExpChatGlobalTabDefaultExperimentation.getIsGlobalMessagePrefixEnabled()
	end
	return IsGlobalMessagePrefixEnabled
end