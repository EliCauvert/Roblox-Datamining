local ExpChatGlobalTabDefaultExperimentation = require(script:FindFirstAncestor("ExpChat").Parent.SocialExperiments).ExpChatGlobalTabDefaultExperimentation
local GlobalWelcomeMessageKey = nil

return function() --[[ Line: 23 | Named "getGlobalWelcomeMessageKey" ]]
	-- upvalues: GlobalWelcomeMessageKey (ref), ExpChatGlobalTabDefaultExperimentation (copy)
	if GlobalWelcomeMessageKey == nil then
		GlobalWelcomeMessageKey = ExpChatGlobalTabDefaultExperimentation.getGlobalWelcomeMessageKey()
	end
	return GlobalWelcomeMessageKey
end