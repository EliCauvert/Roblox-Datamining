local parent = script:FindFirstAncestor("RobloxAppUpdate").Parent
local setCentralOverlay = require(parent.CentralOverlay).Actions.SetCentralOverlay
local centralOverlayType = require(parent.RobloxAppEnums).CentralOverlayType

return function(p0, p1, p2) --[[ line: 7 ]]
	-- upvalues: setCentralOverlay (ref), centralOverlayType (ref)
	return function(p3) --[[ line: 8 ]]
		-- upvalues: setCentralOverlay (copy), centralOverlayType (copy), p0 (ref), p1 (ref), p2 (ref)
		p3:dispatch(setCentralOverlay(centralOverlayType.UpdateRequiredPrompt, {
			canPerformBinaryUpdate = p0,
			showInternalChannelMessage = p1,
			updateMessageType = p2
		}, { DisableBackButtonClose = true }))
	end
end