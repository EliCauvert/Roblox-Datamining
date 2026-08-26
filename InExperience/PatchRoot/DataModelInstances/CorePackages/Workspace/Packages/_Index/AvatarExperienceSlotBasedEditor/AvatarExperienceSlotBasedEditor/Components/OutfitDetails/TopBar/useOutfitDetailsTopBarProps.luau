local useStatusBarHeight = require(script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent.RobloxAppHooks).useStatusBarHeight
local _ = require(script.Parent.OutfitDetailsTopBar)

return function(p1)
	-- upvalues: useStatusBarHeight (ref)
	return {
		statusBarHeight = useStatusBarHeight(),
		LayoutOrder = p1.LayoutOrder,
		onClose = p1.onClose
	}
end