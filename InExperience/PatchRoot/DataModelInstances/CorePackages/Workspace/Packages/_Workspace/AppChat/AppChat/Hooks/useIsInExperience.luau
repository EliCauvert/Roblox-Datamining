local chatPlacementContextModule = require(script:FindFirstAncestor("AppChat").Contexts.ChatPlacementContext)
local useChatPlacementContext = chatPlacementContextModule.useChatPlacementContext
local isPlacementInExperience = chatPlacementContextModule.isPlacementInExperience

return function()
	-- upvalues: useChatPlacementContext (ref), isPlacementInExperience (ref)
	return isPlacementInExperience(useChatPlacementContext().chatPlacement)
end