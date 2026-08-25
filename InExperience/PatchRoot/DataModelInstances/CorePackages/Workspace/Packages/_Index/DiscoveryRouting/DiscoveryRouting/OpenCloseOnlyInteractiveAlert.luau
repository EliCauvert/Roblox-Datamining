local parent = script:FindFirstAncestor("DiscoveryRouting").Parent
local centralOverlayType = require(parent.RobloxAppEnums).CentralOverlayType
local setCentralOverlay = require(parent.CentralOverlay).Actions.SetCentralOverlay

return function(p0, p1, p2, p3, p4)
	-- upvalues: setCentralOverlay (ref), centralOverlayType (ref)
	return function(p5)
		-- upvalues: setCentralOverlay (copy), centralOverlayType (copy), p0 (ref), p1 (ref), p2 (ref), p3 (ref), p4 (ref)
		p5:dispatch(setCentralOverlay(centralOverlayType.CloseOnlyInteractiveAlert, {
			title = p0,
			body = p1,
			closeAlert = p2,
			buttonText = p3,
			showCloseButton = p4
		}))
	end
end