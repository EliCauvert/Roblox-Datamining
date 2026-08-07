-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:45 2026 Pacific Standard Time.

local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local pcallDeferredModule = require(parent.util.pcallDeferred)
local getFIntUGCLCCageVerticesSimilarityMaximumModule = require(parent.flags.getFIntUGCLCCageVerticesSimilarityMaximum)
local analyticsModule = require(parent.Analytics)

return function(p0, p1, p2, p3) --[[ line: 14 | named "validateVerticesSimilarity" ]]
	-- upvalues: pcallDeferredModule (ref), UGCValidationService (ref), analyticsModule (ref), getFIntUGCLCCageVerticesSimilarityMaximumModule (ref)
	local currentTime = tick()
	local isServer = p1.isServer
	local var5, var6 = pcallDeferredModule(function() --[[ line: 24 ]]
		-- upvalues: UGCValidationService (copy), p0 (ref), p2 (ref)
		return UGCValidationService:GetEditableMeshVerticesSimilarityRate(p0.editableMesh, p2)
	end, p1)
	
	if var5 then
		local floored = math.floor(var6 * 100)
		
		if getFIntUGCLCCageVerticesSimilarityMaximumModule() < floored then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateVerticesSimilarity_MaxSimilarityExceeded, nil, p1)
			
			return false, {
				string.format("%s has %d%% of vertices too close to each other. Please edit the vertices to have at most %d%% coincident or close to one another.", p3, floored, getFIntUGCLCCageVerticesSimilarityMaximumModule()) .. "[Read more](https://create.roblox.com/docs/art/validation-errors#cageDensity)"
			}
		end
		analyticsModule.recordScriptTime(script.Name, currentTime, p1)
		
		return true
	elseif isServer ~= nil and isServer then
		error(string.format("Failed to execute similarity mesh vertex check for '%s'. Make sure mesh exists and try again.", p0.fullName))
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateVerticesSimilarity_FailedToExecute, nil, p1)
	
	return false, {
		string.format("Failed to execute similarity mesh vertex check for '%s'. Make sure mesh exists and try again.", p0.fullName)
	}
end