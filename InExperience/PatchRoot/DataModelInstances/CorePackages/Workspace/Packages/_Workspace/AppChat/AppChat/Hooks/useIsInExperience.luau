local chatPlacementContextModule = require(script:FindFirstAncestor("AppChat").Contexts.ChatPlacementContext)
local useChatPlacementContext = chatPlacementContextModule.useChatPlacementContext
local isPlacementInExperience = chatPlacementContextModule.isPlacementInExperience

return function() --[[ line: 7 ]]
	-- upvalues: useChatPlacementContext (ref), isPlacementInExperience (ref)
	return isPlacementInExperience(useChatPlacementContext().chatPlacement)
end