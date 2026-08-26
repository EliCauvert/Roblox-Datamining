local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local pcallDeferredModule = require(parent.util.pcallDeferred)
local getFIntUGCValidationVertexDensityThresholdModule = require(parent.flags.getFIntUGCValidationVertexDensityThreshold)
local analyticsModule = require(parent.Analytics)

return function(a, b, p1)
	-- upvalues: pcallDeferredModule (ref), UGCValidationService (ref), analyticsModule (ref), getFIntUGCValidationVertexDensityThresholdModule (ref)
	local currentTime = tick()
	local isServer = b.isServer
	local var1, var2 = pcallDeferredModule(function()
		-- upvalues: UGCValidationService (copy), a (ref), p1 (ref)
		return UGCValidationService:GetEditableMeshMaxNearbyVerticesCollisions(a.editableMesh, p1)
	end, b)
	
	if var1 then
		if getFIntUGCValidationVertexDensityThresholdModule() < var2 then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateVertexDensity_MaxDensityExceeded, nil, b)
			
			return false, {
				"The maximum vertex density has been exceeded. Reduce the number of vertices that are very close to each other."
			}
		end
		analyticsModule.recordScriptTime(script.Name, currentTime, b)
		
		return true
	elseif isServer ~= nil and isServer then
		error(string.format("Failed to execute vertex density check for '%s'. Make sure mesh exists and try again.", a.fullName))
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateVertexDensity_FailedToExecute, nil, b)
	
	return false, {
		string.format("Failed to execute vertex density check for '%s'. Make sure mesh exists and try again.", a.fullName)
	}
end