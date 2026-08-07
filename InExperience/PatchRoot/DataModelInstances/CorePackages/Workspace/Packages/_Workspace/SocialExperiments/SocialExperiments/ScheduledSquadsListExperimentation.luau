local experimentCacheManager = require(script:FindFirstAncestor("SocialExperiments").Parent.ExperimentCacheManager).ExperimentCacheManager
local scheduledSquadsListExpLayer = game:DefineFastString("ScheduledSquadsListExpLayer", "")
local scheduledSquadsListChatLandingScreenEntrypointVariant = game:DefineFastString("ScheduledSquadsListChatLandingScreenEntrypointVariant", "enableTopBarEntrypoint")
local enableScheduledSquadsListExperimentationDev = game:DefineFastFlag("EnableScheduledSquadsListExperimentation_dev", false)
local enableScheduledSquadsTopBarEntrypointDev = game:DefineFastFlag("EnableScheduledSquadsTopBarEntrypoint_dev", false)

local function _(p0) --[[ line: 15 | named "getIsUserInTreatment" ]]
	-- upvalues: experimentCacheManager (ref), scheduledSquadsListExpLayer (ref)
	local var4 = experimentCacheManager.default:getLayerVariables(scheduledSquadsListExpLayer)
	
	return if var4 and var4[p0] ~= nil then var4[p0] else false
end

return {
	getIsTopBarEntrypointEnabled = function() --[[ line: 25 ]]
		-- upvalues: enableScheduledSquadsTopBarEntrypointDev (ref), enableScheduledSquadsListExperimentationDev (ref), scheduledSquadsListChatLandingScreenEntrypointVariant (ref), experimentCacheManager (ref), scheduledSquadsListExpLayer (ref)
		local var5 = enableScheduledSquadsTopBarEntrypointDev
		
		if not var5 then
			var5 = enableScheduledSquadsListExperimentationDev
			
			if var5 then
				local var6 = scheduledSquadsListChatLandingScreenEntrypointVariant
				local var7 = experimentCacheManager.default:getLayerVariables(scheduledSquadsListExpLayer)
				
				if var7 and var7[var6] ~= nil then
					return var7[var6]
				end
				var5 = false
			end
		end
		return var5
	end,
	logExposure = function() --[[ line: 33 ]]
		-- upvalues: enableScheduledSquadsListExperimentationDev (ref), experimentCacheManager (ref), scheduledSquadsListExpLayer (ref)
		if enableScheduledSquadsListExperimentationDev and experimentCacheManager.default:getLayerVariables(scheduledSquadsListExpLayer) ~= nil then
			experimentCacheManager.default:logLayerExposure(scheduledSquadsListExpLayer)
		end
	end
}