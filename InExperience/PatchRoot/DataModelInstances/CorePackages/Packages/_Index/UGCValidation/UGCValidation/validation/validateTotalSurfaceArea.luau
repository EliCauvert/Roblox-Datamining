local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent
local GetFIntMaxTotalSurfaceAreaModule = require(Parent.flags.getFIntMaxTotalSurfaceArea)
local _ = require(Parent.util.Types)
local PcallDeferredModule = require(Parent.util.pcallDeferred)
local AnalyticsModule = require(Parent.Analytics)

return function(p1, MeshScale, p2) --[[ Line: 16 | Named "validateTotalSurfaceArea" ]]
	-- upvalues: PcallDeferredModule (copy), UGCValidationService (copy), AnalyticsModule (copy), GetFIntMaxTotalSurfaceAreaModule (copy)
	local CurrentTime = tick()
	local IsServer = p2.isServer
	local PcallDeferredModuleResult, PcallDeferredModuleResult2 = PcallDeferredModule(function() --[[ Line: 25 ]]
		-- upvalues: UGCValidationService (upval), p1 (copy), MeshScale (copy)
		return UGCValidationService:CalculateEditableMeshTotalSurfaceArea(p1.editableMesh, MeshScale)
	end, p2)
	
	if not PcallDeferredModuleResult then
		local Formatted = string.format("Failed to execute max total surface area check for '%s'. Make sure mesh exists and try again.", p1.fullName)
		
		if IsServer ~= nil and IsServer then
			error(Formatted)
		end
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateTotalSurfaceArea_FailedToExecute, nil, p2)
		
		return false, { Formatted }
	elseif GetFIntMaxTotalSurfaceAreaModule() < PcallDeferredModuleResult2 then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateTotalSurfaceArea_maxTotalSurfaceAreaExceeded, nil, p2)
		
		return false, {
			string.format("The total surface area of model mesh '%s' is %.2f, it cannot be greater than %d. You must reduce the number and/or size of all triangles.", p1.fullName, PcallDeferredModuleResult2, GetFIntMaxTotalSurfaceAreaModule())
		}
	else
		AnalyticsModule.recordScriptTime(script.Name, CurrentTime, p2)
		
		return true
	end
end