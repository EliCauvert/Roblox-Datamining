local ChatPlacementContextModule = require(script:FindFirstAncestor("AppChat").Contexts.ChatPlacementContext)
local UseChatPlacementContextFunction = ChatPlacementContextModule.useChatPlacementContext
local IsPlacementInExperienceFunction = ChatPlacementContextModule.isPlacementInExperience

return function(_) --[[ Line: 12 ]]
	-- upvalues: UseChatPlacementContextFunction (copy), IsPlacementInExperienceFunction (copy)
	return if not IsPlacementInExperienceFunction(UseChatPlacementContextFunction().chatPlacement) then nil else 0
end