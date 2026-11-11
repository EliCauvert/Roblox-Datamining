local IXPService = game:GetService("IXPService")
local AbuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local GetFFlagWHAM1707ExperimentForceEnabledModule = require(AbuseReportMenu.Flags.GetFFlagWHAM1707ExperimentForceEnabled)
local FStringWHAM1707IXPFieldModule = require(AbuseReportMenu.Flags.FStringWHAM1707IXPField)
local FStringEARReportMenuIXPLayer = require(game:GetService("CorePackages").Workspace.Packages.SharedFlags).FStringEARReportMenuIXPLayer

return function()
	-- upvalues: GetFFlagWHAM1707ExperimentForceEnabledModule (copy), IXPService (copy), FStringEARReportMenuIXPLayer (copy), FStringWHAM1707IXPFieldModule (copy)
	if GetFFlagWHAM1707ExperimentForceEnabledModule() then
		return true
	end
	local Success, Result = pcall(function()
		-- upvalues: IXPService (upval), FStringEARReportMenuIXPLayer (upval)
		return IXPService:GetUserLayerVariables(FStringEARReportMenuIXPLayer)
	end)
	
	if Success and Result and Result[FStringWHAM1707IXPFieldModule] ~= nil then
		IXPService:LogUserLayerExposure(FStringEARReportMenuIXPLayer)
		
		return Result[FStringWHAM1707IXPFieldModule]
	else
		return false
	end
end