local ChatPlacementContextModule = require(script:FindFirstAncestor("AppChat").Contexts.ChatPlacementContext)
local UseChatPlacementContextFunction = ChatPlacementContextModule.useChatPlacementContext
local IsPlacementInExperienceFunction = ChatPlacementContextModule.isPlacementInExperience

return function()
	-- upvalues: UseChatPlacementContextFunction (copy), IsPlacementInExperienceFunction (copy)
	return IsPlacementInExperienceFunction(UseChatPlacementContextFunction().chatPlacement)
end