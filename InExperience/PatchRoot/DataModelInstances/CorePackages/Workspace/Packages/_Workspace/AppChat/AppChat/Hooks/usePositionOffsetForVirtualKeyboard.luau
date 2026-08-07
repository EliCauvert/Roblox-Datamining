local chatPlacementContextModule = require(script:FindFirstAncestor("AppChat").Contexts.ChatPlacementContext)
local useChatPlacementContext = chatPlacementContextModule.useChatPlacementContext
local isPlacementInExperience = chatPlacementContextModule.isPlacementInExperience

return function(_) --[[ line: 12 ]]
	-- upvalues: useChatPlacementContext (ref), isPlacementInExperience (ref)
	return if isPlacementInExperience(useChatPlacementContext().chatPlacement) then nil else 0
end