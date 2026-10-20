local Parent = script:FindFirstAncestor("AuthCommon").Parent
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local SetCentralOverlayFunction = require(Parent.CentralOverlay).Actions.SetCentralOverlay

return function()
	-- upvalues: SetCentralOverlayFunction (copy), CentralOverlayType (copy)
	return function(p1)
		-- upvalues: SetCentralOverlayFunction (upval), CentralOverlayType (upval)
		p1:dispatch(SetCentralOverlayFunction(CentralOverlayType.LoginPasswordResetPrompt, {}))
	end
end