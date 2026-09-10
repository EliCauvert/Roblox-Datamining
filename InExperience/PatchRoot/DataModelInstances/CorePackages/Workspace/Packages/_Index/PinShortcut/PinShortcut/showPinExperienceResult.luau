local parent = script:FindFirstAncestor("PinShortcut").Parent
local setCentralOverlay = require(parent.CentralOverlay).Actions.SetCentralOverlay
local centralOverlayType = require(parent.RobloxAppEnums).CentralOverlayType

return function(p1, p2, p3, p4)
	-- upvalues: setCentralOverlay (ref), centralOverlayType (ref)
	p1(setCentralOverlay(centralOverlayType.PinExperienceResultSnackbar, {
		status = p2,
		experienceName = p3,
		onViewShortcut = if p4 then p4.onViewShortcut else nil,
		onRetry = if p4 then p4.onRetry else nil
	}))
end