local Parent = script:FindFirstAncestor("PinShortcut").Parent
local RobloxAppEnumsModule = require(Parent.RobloxAppEnums)
local SetCentralOverlayFunction = require(Parent.CentralOverlay).Actions.SetCentralOverlay
local CentralOverlayType = RobloxAppEnumsModule.CentralOverlayType

return function(Callback: (any) -> (), Status, ExperienceName, p1)
	-- upvalues: SetCentralOverlayFunction (copy), CentralOverlayType (copy)
	Callback(SetCentralOverlayFunction(CentralOverlayType.PinExperienceResultSnackbar, {
		status = Status,
		experienceName = ExperienceName,
		onViewShortcut = if p1 then p1.onViewShortcut else nil,
		onRetry = if p1 then p1.onRetry else nil
	}))
end