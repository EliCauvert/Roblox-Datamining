local useStatusBarHeight = require(script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent.RobloxAppHooks).useStatusBarHeight
local _ = require(script.Parent.OutfitDetailsTopBar)

return function(p0) --[[ line: 14 | named "useOutfitDetailsTopBarProps" ]]
	-- upvalues: useStatusBarHeight (ref)
	return {
		statusBarHeight = useStatusBarHeight(),
		LayoutOrder = p0.LayoutOrder,
		onClose = p0.onClose
	}
end