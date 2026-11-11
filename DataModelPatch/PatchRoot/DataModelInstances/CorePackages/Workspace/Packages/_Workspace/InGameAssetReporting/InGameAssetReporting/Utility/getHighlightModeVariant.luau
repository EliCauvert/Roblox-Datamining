local InGameAssetReporting = script:FindFirstAncestor("InGameAssetReporting")
local IXPService = game:GetService("IXPService")
local SharedFlagsModule = require(InGameAssetReporting.Parent.SharedFlags)
local FStringReportMenuIXPLayer = SharedFlagsModule.FStringReportMenuIXPLayer
local FFlagHighlightModePreciseSelectionEnabled = SharedFlagsModule.FFlagHighlightModePreciseSelectionEnabled
local FStringHighlightModePreciseSelectionIXPField = SharedFlagsModule.FStringHighlightModePreciseSelectionIXPField
local FStringHighlightModePreciseSelectionForceVariant = SharedFlagsModule.FStringHighlightModePreciseSelectionForceVariant
local ConstantsModule = require(InGameAssetReporting.InGameAssetReportUI.Resources.Constants)

return function()
	-- upvalues: FFlagHighlightModePreciseSelectionEnabled (copy), ConstantsModule (copy), FStringHighlightModePreciseSelectionForceVariant (copy), IXPService (copy), FStringReportMenuIXPLayer (copy), FStringHighlightModePreciseSelectionIXPField (copy)
	if not FFlagHighlightModePreciseSelectionEnabled then
		return ConstantsModule.HighlightModeVariants.Default
	elseif FStringHighlightModePreciseSelectionForceVariant == "" then
		local Success, Result = pcall(function()
			-- upvalues: IXPService (upval), FStringReportMenuIXPLayer (upval)
			return IXPService:GetUserLayerVariables(FStringReportMenuIXPLayer)
		end)
		
		return if Success and Result and Result[FStringHighlightModePreciseSelectionIXPField] ~= nil then Result[FStringHighlightModePreciseSelectionIXPField] else ConstantsModule.HighlightModeVariants.Default
	else
		return FStringHighlightModePreciseSelectionForceVariant
	end
end