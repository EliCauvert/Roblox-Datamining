local inGameAssetReporting = script:FindFirstAncestor("InGameAssetReporting")
local IXPService = game:GetService("IXPService")
local sharedFlagsModule = require(inGameAssetReporting.Parent.SharedFlags)
local fStringReportMenuIXPLayer = sharedFlagsModule.FStringReportMenuIXPLayer
local fFlagHighlightModePreciseSelectionEnabled = sharedFlagsModule.FFlagHighlightModePreciseSelectionEnabled
local fStringHighlightModePreciseSelectionIXPField = sharedFlagsModule.FStringHighlightModePreciseSelectionIXPField
local fStringHighlightModePreciseSelectionForceVariant = sharedFlagsModule.FStringHighlightModePreciseSelectionForceVariant
local constantsModule = require(inGameAssetReporting.InGameAssetReportUI.Resources.Constants)

return function()
	-- upvalues: fFlagHighlightModePreciseSelectionEnabled (ref), constantsModule (ref), fStringHighlightModePreciseSelectionForceVariant (ref), IXPService (ref), fStringReportMenuIXPLayer (ref), fStringHighlightModePreciseSelectionIXPField (ref)
	if not fFlagHighlightModePreciseSelectionEnabled then
		return constantsModule.HighlightModeVariants.Default
	elseif fStringHighlightModePreciseSelectionForceVariant ~= "" then
		return fStringHighlightModePreciseSelectionForceVariant
	end
	local ok, status = pcall(function()
		-- upvalues: IXPService (copy), fStringReportMenuIXPLayer (copy)
		return IXPService:GetUserLayerVariables(fStringReportMenuIXPLayer)
	end)
	
	return if ok and status and status[fStringHighlightModePreciseSelectionIXPField] ~= nil then status[fStringHighlightModePreciseSelectionIXPField] else constantsModule.HighlightModeVariants.Default
end