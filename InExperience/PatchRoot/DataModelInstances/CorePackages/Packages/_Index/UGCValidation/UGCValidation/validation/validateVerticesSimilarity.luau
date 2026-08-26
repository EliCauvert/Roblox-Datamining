local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local pcallDeferredModule = require(parent.util.pcallDeferred)
local getFIntUGCLCCageVerticesSimilarityMaximumModule = require(parent.flags.getFIntUGCLCCageVerticesSimilarityMaximum)
local analyticsModule = require(parent.Analytics)

return function(p1, p2, p3, p4)
	-- upvalues: pcallDeferredModule (ref), UGCValidationService (ref), analyticsModule (ref), getFIntUGCLCCageVerticesSimilarityMaximumModule (ref)
	local currentTime = tick()
	local isServer = p2.isServer
	local var1, var2 = pcallDeferredModule(function()
		-- upvalues: UGCValidationService (copy), p1 (ref), p3 (ref)
		return UGCValidationService:GetEditableMeshVerticesSimilarityRate(p1.editableMesh, p3)
	end, p2)
	
	if var1 then
		local floored = math.floor(var2 * 100)
		
		if getFIntUGCLCCageVerticesSimilarityMaximumModule() < floored then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateVerticesSimilarity_MaxSimilarityExceeded, nil, p2)
			
			return false, {
				string.format("%s has %d%% of vertices too close to each other. Please edit the vertices to have at most %d%% coincident or close to one another.", p4, floored, getFIntUGCLCCageVerticesSimilarityMaximumModule()) .. "[Read more](https://create.roblox.com/docs/art/validation-errors#cageDensity)"
			}
		end
		analyticsModule.recordScriptTime(script.Name, currentTime, p2)
		
		return true
	elseif isServer ~= nil and isServer then
		error(string.format("Failed to execute similarity mesh vertex check for '%s'. Make sure mesh exists and try again.", p1.fullName))
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateVerticesSimilarity_FailedToExecute, nil, p2)
	
	return false, {
		string.format("Failed to execute similarity mesh vertex check for '%s'. Make sure mesh exists and try again.", p1.fullName)
	}
end