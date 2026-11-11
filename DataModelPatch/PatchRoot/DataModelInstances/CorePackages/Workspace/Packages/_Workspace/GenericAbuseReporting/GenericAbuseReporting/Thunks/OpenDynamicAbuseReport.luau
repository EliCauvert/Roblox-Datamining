local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local SetCentralOverlayFunction = require(Parent.CentralOverlay).Actions.SetCentralOverlay
local _ = require(GenericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes)
local _ = require(GenericAbuseReporting.Enums.AbuseVector)

return function(p1)
	-- upvalues: SetCentralOverlayFunction (copy), CentralOverlayType (copy)
	return function(p2)
		-- upvalues: SetCentralOverlayFunction (upval), CentralOverlayType (upval), p1 (copy)
		p2:dispatch(SetCentralOverlayFunction(CentralOverlayType.DynamicAbuseReport, p1))
	end
end