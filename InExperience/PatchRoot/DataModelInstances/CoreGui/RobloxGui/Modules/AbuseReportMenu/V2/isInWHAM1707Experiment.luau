local corePackagesService = game:GetService("CorePackages")
local IXPService = game:GetService("IXPService")
local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local getFFlagWHAM1707ExperimentForceEnabledModule = require(abuseReportMenu.Flags.GetFFlagWHAM1707ExperimentForceEnabled)
local fStringWHAM1707IXPFieldModule = require(abuseReportMenu.Flags.FStringWHAM1707IXPField)
local fStringEARReportMenuIXPLayer = require(corePackagesService.Workspace.Packages.SharedFlags).FStringEARReportMenuIXPLayer

return function() --[[ line: 13 ]]
	-- upvalues: getFFlagWHAM1707ExperimentForceEnabledModule (ref), IXPService (ref), fStringEARReportMenuIXPLayer (ref), fStringWHAM1707IXPFieldModule (ref)
	if getFFlagWHAM1707ExperimentForceEnabledModule() then
		return true
	end
	local ok, status = pcall(function() --[[ line: 18 ]]
		-- upvalues: IXPService (copy), fStringEARReportMenuIXPLayer (copy)
		return IXPService:GetUserLayerVariables(fStringEARReportMenuIXPLayer)
	end)
	
	if ok and status and status[fStringWHAM1707IXPFieldModule] ~= nil then
		IXPService:LogUserLayerExposure(fStringEARReportMenuIXPLayer)
		
		return status[fStringWHAM1707IXPFieldModule]
	end
	return false
end