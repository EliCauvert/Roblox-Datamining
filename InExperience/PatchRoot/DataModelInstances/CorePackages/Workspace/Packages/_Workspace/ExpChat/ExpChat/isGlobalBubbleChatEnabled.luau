local ExpChatGlobalTabDefaultExperimentation = require(script:FindFirstAncestor("ExpChat").Parent.SocialExperiments).ExpChatGlobalTabDefaultExperimentation
local IsGlobalBubbleChatEnabled = nil

return function() --[[ Line: 22 | Named "isGlobalBubbleChatEnabled" ]]
	-- upvalues: IsGlobalBubbleChatEnabled (ref), ExpChatGlobalTabDefaultExperimentation (copy)
	if IsGlobalBubbleChatEnabled == nil then
		IsGlobalBubbleChatEnabled = ExpChatGlobalTabDefaultExperimentation.getIsGlobalBubbleChatEnabled()
	end
	return IsGlobalBubbleChatEnabled
end