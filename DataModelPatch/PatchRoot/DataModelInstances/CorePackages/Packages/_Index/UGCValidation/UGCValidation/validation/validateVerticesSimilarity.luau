local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local PcallDeferredModule = require(Parent.util.pcallDeferred)
local GetFIntUGCLCCageVerticesSimilarityMaximumModule = require(Parent.flags.getFIntUGCLCCageVerticesSimilarityMaximum)
local AnalyticsModule = require(Parent.Analytics)

return function(p1, p2, MeshScale, p3)
	-- upvalues: PcallDeferredModule (copy), UGCValidationService (copy), AnalyticsModule (copy), GetFIntUGCLCCageVerticesSimilarityMaximumModule (copy)
	local CurrentTime = tick()
	local IsServer = p2.isServer
	local PcallDeferredModuleResult, PcallDeferredModuleResult2 = PcallDeferredModule(function()
		-- upvalues: UGCValidationService (upval), p1 (copy), MeshScale (copy)
		return UGCValidationService:GetEditableMeshVerticesSimilarityRate(p1.editableMesh, MeshScale)
	end, p2)
	
	if PcallDeferredModuleResult then
		local Floored = math.floor(PcallDeferredModuleResult2 * 100)
		
		if GetFIntUGCLCCageVerticesSimilarityMaximumModule() < Floored then
			AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateVerticesSimilarity_MaxSimilarityExceeded, nil, p2)
			
			return false, {
				string.format("%s has %d%% of vertices too close to each other. Please edit the vertices to have at most %d%% coincident or close to one another.", p3, Floored, GetFIntUGCLCCageVerticesSimilarityMaximumModule()) .. "[Read more](https://create.roblox.com/docs/art/validation-errors#cageDensity)"
			}
		else
			AnalyticsModule.recordScriptTime(script.Name, CurrentTime, p2)
			
			return true
		end
	else
		if IsServer ~= nil and IsServer then
			error(string.format("Failed to execute similarity mesh vertex check for '%s'. Make sure mesh exists and try again.", p1.fullName))
		end
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateVerticesSimilarity_FailedToExecute, nil, p2)
		
		return false, {
			string.format("Failed to execute similarity mesh vertex check for '%s'. Make sure mesh exists and try again.", p1.fullName)
		}
	end
end