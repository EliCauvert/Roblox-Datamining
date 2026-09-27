local expChatGlobalTabDefaultExperimentation = require(script:FindFirstAncestor("ExpChat").Parent.SocialExperiments).ExpChatGlobalTabDefaultExperimentation
local var1 = nil

return function()
	-- upvalues: var1 (write), expChatGlobalTabDefaultExperimentation (ref)
	if var1 == nil then
		var1 = expChatGlobalTabDefaultExperimentation.getIsGlobalBubbleChatEnabled()
	end
	return var1
end