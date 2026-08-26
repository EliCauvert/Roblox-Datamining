local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local centralOverlayType = require(parent.RobloxAppEnums).CentralOverlayType
local setCentralOverlay = require(parent.CentralOverlay).Actions.SetCentralOverlay
local _ = require(genericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes)
local _ = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local _ = require(genericAbuseReporting.Enums.AbuseVector)

return function(p1)
	-- upvalues: setCentralOverlay (ref), centralOverlayType (ref)
	return function(p2)
		-- upvalues: setCentralOverlay (copy), centralOverlayType (copy), p1 (ref)
		p2:dispatch(setCentralOverlay(centralOverlayType.DynamicAbuseReport, p1))
	end
end