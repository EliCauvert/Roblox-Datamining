local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local getFIntMaxTotalSurfaceAreaModule = require(parent.flags.getFIntMaxTotalSurfaceArea)
local _ = require(parent.util.Types)
local pcallDeferredModule = require(parent.util.pcallDeferred)
local analyticsModule = require(parent.Analytics)

return function(p0, p1, p2)
	-- upvalues: pcallDeferredModule (ref), UGCValidationService (ref), analyticsModule (ref), getFIntMaxTotalSurfaceAreaModule (ref)
	local currentTime = tick()
	local isServer = p2.isServer
	local var5, var6 = pcallDeferredModule(function()
		-- upvalues: UGCValidationService (copy), p0 (ref), p1 (ref)
		return UGCValidationService:CalculateEditableMeshTotalSurfaceArea(p0.editableMesh, p1)
	end, p2)
	
	if var5 then
		if getFIntMaxTotalSurfaceAreaModule() < var6 then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateTotalSurfaceArea_maxTotalSurfaceAreaExceeded, nil, p2)
			
			return false, {
				string.format("The total surface area of model mesh '%s' is %.2f, it cannot be greater than %d. You must reduce the number and/or size of all triangles.", p0.fullName, var6, getFIntMaxTotalSurfaceAreaModule())
			}
		end
		analyticsModule.recordScriptTime(script.Name, currentTime, p2)
		
		return true
	else
		local formattedText = string.format("Failed to execute max total surface area check for '%s'. Make sure mesh exists and try again.", p0.fullName)
		
		if isServer ~= nil and isServer then
			error(formattedText)
		end
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateTotalSurfaceArea_FailedToExecute, nil, p2)
		
		return false, { formattedText }
	end
end