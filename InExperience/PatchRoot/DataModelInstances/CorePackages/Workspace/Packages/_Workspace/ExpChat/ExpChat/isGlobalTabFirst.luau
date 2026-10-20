local Parent = script:FindFirstAncestor("ExpChat").Parent
local ExpChatGlobalTabDefaultExperimentation = require(Parent.SocialExperiments).ExpChatGlobalTabDefaultExperimentation
local GetFFlagTextChatEnableUniverseChatTabsFunction = require(Parent.ExpChatShared).Flags.GetFFlagTextChatEnableUniverseChatTabs
local IsGlobalTabDefault = nil

return function()
	-- upvalues: IsGlobalTabDefault (ref), GetFFlagTextChatEnableUniverseChatTabsFunction (copy), ExpChatGlobalTabDefaultExperimentation (copy)
	if IsGlobalTabDefault == nil then
		IsGlobalTabDefault = GetFFlagTextChatEnableUniverseChatTabsFunction() and ExpChatGlobalTabDefaultExperimentation.getIsGlobalTabDefault()
	end
	return IsGlobalTabDefault
end