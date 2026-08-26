local parent = script:FindFirstAncestor("AuthCommon").Parent
local centralOverlayType = require(parent.RobloxAppEnums).CentralOverlayType
local setCentralOverlay = require(parent.CentralOverlay).Actions.SetCentralOverlay

return function()
	-- upvalues: setCentralOverlay (ref), centralOverlayType (ref)
	return function(p1)
		-- upvalues: setCentralOverlay (copy), centralOverlayType (copy)
		p1:dispatch(setCentralOverlay(centralOverlayType.LoginPasswordResetPrompt, {}))
	end
end