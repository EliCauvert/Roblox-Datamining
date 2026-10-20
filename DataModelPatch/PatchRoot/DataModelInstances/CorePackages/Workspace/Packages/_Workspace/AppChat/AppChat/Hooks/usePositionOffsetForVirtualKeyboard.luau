local ChatPlacementContextModule = require(script:FindFirstAncestor("AppChat").Contexts.ChatPlacementContext)
local UseChatPlacementContextFunction = ChatPlacementContextModule.useChatPlacementContext
local IsPlacementInExperienceFunction = ChatPlacementContextModule.isPlacementInExperience

return function(_)
	-- upvalues: UseChatPlacementContextFunction (copy), IsPlacementInExperienceFunction (copy)
	return if not IsPlacementInExperienceFunction(UseChatPlacementContextFunction().chatPlacement) then nil else 0
end