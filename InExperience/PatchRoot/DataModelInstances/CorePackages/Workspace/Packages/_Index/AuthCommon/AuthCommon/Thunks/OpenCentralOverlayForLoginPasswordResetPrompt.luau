local parent = script:FindFirstAncestor("AuthCommon").Parent
local centralOverlayType = require(parent.RobloxAppEnums).CentralOverlayType
local setCentralOverlay = require(parent.CentralOverlay).Actions.SetCentralOverlay

return function() --[[ line: 7 ]]
	-- upvalues: setCentralOverlay (ref), centralOverlayType (ref)
	return function(p0) --[[ line: 8 ]]
		-- upvalues: setCentralOverlay (copy), centralOverlayType (copy)
		p0:dispatch(setCentralOverlay(centralOverlayType.LoginPasswordResetPrompt, {}))
	end
end