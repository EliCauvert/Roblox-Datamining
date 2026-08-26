local parent = script:FindFirstAncestor("RobloxAppUpdate").Parent
local setCentralOverlay = require(parent.CentralOverlay).Actions.SetCentralOverlay
local centralOverlayType = require(parent.RobloxAppEnums).CentralOverlayType

return function(p1, p2, p3)
	-- upvalues: setCentralOverlay (ref), centralOverlayType (ref)
	return function(p4)
		-- upvalues: setCentralOverlay (copy), centralOverlayType (copy), p1 (ref), p2 (ref), p3 (ref)
		p4:dispatch(setCentralOverlay(centralOverlayType.UpdateRequiredPrompt, {
			canPerformBinaryUpdate = p1,
			showInternalChannelMessage = p2,
			updateMessageType = p3
		}, { DisableBackButtonClose = true }))
	end
end