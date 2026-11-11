local CorePackages = game:GetService("CorePackages")
local CentralOverlayType = require(CorePackages.Workspace.Packages.RobloxAppEnums).CentralOverlayType
local SetCentralOverlayFunction = require(CorePackages.Workspace.Packages.CentralOverlay).Actions.SetCentralOverlay

return function()
	-- upvalues: SetCentralOverlayFunction (copy), CentralOverlayType (copy)
	return function(p1)
		-- upvalues: SetCentralOverlayFunction (upval), CentralOverlayType (upval)
		p1:dispatch(SetCentralOverlayFunction(CentralOverlayType.ReportLogsOverlay, {}))
	end
end