local parent = script:FindFirstAncestor("ExpChat").Parent
local expChatGlobalTabDefaultExperimentation = require(parent.SocialExperiments).ExpChatGlobalTabDefaultExperimentation
local getFFlagTextChatEnableUniverseChatTabs = require(parent.ExpChatShared).Flags.GetFFlagTextChatEnableUniverseChatTabs
local var1 = nil

return function()
	-- upvalues: var1 (write), getFFlagTextChatEnableUniverseChatTabs (ref), expChatGlobalTabDefaultExperimentation (ref)
	if var1 == nil then
		var1 = getFFlagTextChatEnableUniverseChatTabs() and expChatGlobalTabDefaultExperimentation.getIsGlobalTabDefault()
	end
	return var1
end