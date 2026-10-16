local Parent = script:FindFirstAncestor("DiscoveryRouting").Parent
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local SetCentralOverlayFunction = require(Parent.CentralOverlay).Actions.SetCentralOverlay

return function(Title, Body, CloseAlert, ButtonText, ShowCloseButton) --[[ Line: 6 ]]
	-- upvalues: SetCentralOverlayFunction (copy), CentralOverlayType (copy)
	return function(p1) --[[ Line: 7 ]]
		-- upvalues: SetCentralOverlayFunction (upval), CentralOverlayType (upval), Title (copy), Body (copy), CloseAlert (copy), ButtonText (copy), ShowCloseButton (copy)
		p1:dispatch(SetCentralOverlayFunction(CentralOverlayType.CloseOnlyInteractiveAlert, {
			title = Title,
			body = Body,
			closeAlert = CloseAlert,
			buttonText = ButtonText,
			showCloseButton = ShowCloseButton
		}))
	end
end