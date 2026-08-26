local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local getFIntMaxTotalSurfaceAreaModule = require(parent.flags.getFIntMaxTotalSurfaceArea)
local _ = require(parent.util.Types)
local pcallDeferredModule = require(parent.util.pcallDeferred)
local analyticsModule = require(parent.Analytics)

return function(p1, p2, p3)
	-- upvalues: pcallDeferredModule (ref), UGCValidationService (ref), analyticsModule (ref), getFIntMaxTotalSurfaceAreaModule (ref)
	local currentTime = tick()
	local isServer = p3.isServer
	local var1, var2 = pcallDeferredModule(function()
		-- upvalues: UGCValidationService (copy), p1 (ref), p2 (ref)
		return UGCValidationService:CalculateEditableMeshTotalSurfaceArea(p1.editableMesh, p2)
	end, p3)
	
	if var1 then
		if getFIntMaxTotalSurfaceAreaModule() < var2 then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateTotalSurfaceArea_maxTotalSurfaceAreaExceeded, nil, p3)
			
			return false, {
				string.format("The total surface area of model mesh '%s' is %.2f, it cannot be greater than %d. You must reduce the number and/or size of all triangles.", p1.fullName, var2, getFIntMaxTotalSurfaceAreaModule())
			}
		end
		analyticsModule.recordScriptTime(script.Name, currentTime, p3)
		
		return true
	else
		local formattedText = string.format("Failed to execute max total surface area check for '%s'. Make sure mesh exists and try again.", p1.fullName)
		
		if isServer ~= nil and isServer then
			error(formattedText)
		end
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateTotalSurfaceArea_FailedToExecute, nil, p3)
		
		return false, { formattedText }
	end
end