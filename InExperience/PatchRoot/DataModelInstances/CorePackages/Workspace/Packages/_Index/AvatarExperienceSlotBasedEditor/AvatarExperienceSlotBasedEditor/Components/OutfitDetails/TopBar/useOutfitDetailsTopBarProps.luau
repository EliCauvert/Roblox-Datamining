local UseStatusBarHeightFunction = require(script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent.RobloxAppHooks).useStatusBarHeight
local _ = require(script.Parent.OutfitDetailsTopBar)

return function(Frame) --[[ Line: 14 | Named "useOutfitDetailsTopBarProps" ]]
	-- upvalues: UseStatusBarHeightFunction (copy)
	return {
		statusBarHeight = UseStatusBarHeightFunction(),
		LayoutOrder = Frame.LayoutOrder,
		onClose = Frame.onClose
	}
end