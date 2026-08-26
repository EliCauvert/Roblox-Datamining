local parent = script:FindFirstAncestor("DiscoveryRouting").Parent
local centralOverlayType = require(parent.RobloxAppEnums).CentralOverlayType
local setCentralOverlay = require(parent.CentralOverlay).Actions.SetCentralOverlay

return function(p1, p2, p3, p4, p5)
	-- upvalues: setCentralOverlay (ref), centralOverlayType (ref)
	return function(p6)
		-- upvalues: setCentralOverlay (copy), centralOverlayType (copy), p1 (ref), p2 (ref), p3 (ref), p4 (ref), p5 (ref)
		p6:dispatch(setCentralOverlay(centralOverlayType.CloseOnlyInteractiveAlert, {
			title = p1,
			body = p2,
			closeAlert = p3,
			buttonText = p4,
			showCloseButton = p5
		}))
	end
end