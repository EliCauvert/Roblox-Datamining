local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local PcallDeferredModule = require(Parent.util.pcallDeferred)
local GetFIntUGCValidationVertexDensityThresholdModule = require(Parent.flags.getFIntUGCValidationVertexDensityThreshold)
local AnalyticsModule = require(Parent.Analytics)

return function(p1, p2, MeshScale)
	-- upvalues: PcallDeferredModule (copy), UGCValidationService (copy), AnalyticsModule (copy), GetFIntUGCValidationVertexDensityThresholdModule (copy)
	local CurrentTime = tick()
	local IsServer = p2.isServer
	local PcallDeferredModuleResult, PcallDeferredModuleResult2 = PcallDeferredModule(function()
		-- upvalues: UGCValidationService (upval), p1 (copy), MeshScale (copy)
		return UGCValidationService:GetEditableMeshMaxNearbyVerticesCollisions(p1.editableMesh, MeshScale)
	end, p2)
	
	if not PcallDeferredModuleResult then
		if IsServer ~= nil and IsServer then
			error(string.format("Failed to execute vertex density check for '%s'. Make sure mesh exists and try again.", p1.fullName))
		end
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateVertexDensity_FailedToExecute, nil, p2)
		
		return false, {
			string.format("Failed to execute vertex density check for '%s'. Make sure mesh exists and try again.", p1.fullName)
		}
	elseif GetFIntUGCValidationVertexDensityThresholdModule() < PcallDeferredModuleResult2 then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateVertexDensity_MaxDensityExceeded, nil, p2)
		
		return false, {
			"The maximum vertex density has been exceeded. Reduce the number of vertices that are very close to each other."
		}
	else
		AnalyticsModule.recordScriptTime(script.Name, CurrentTime, p2)
		
		return true
	end
end