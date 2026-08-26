local experimentCacheManager = require(script:FindFirstAncestor("SocialExperiments").Parent.ExperimentCacheManager).ExperimentCacheManager
local scheduledSquadsListExpLayer = game:DefineFastString("ScheduledSquadsListExpLayer", "")
local scheduledSquadsListChatLandingScreenEntrypointVariant = game:DefineFastString("ScheduledSquadsListChatLandingScreenEntrypointVariant", "enableTopBarEntrypoint")
local enableScheduledSquadsListExperimentationDev = game:DefineFastFlag("EnableScheduledSquadsListExperimentation_dev", false)
local enableScheduledSquadsTopBarEntrypointDev = game:DefineFastFlag("EnableScheduledSquadsTopBarEntrypoint_dev", false)

local function _(p1)
	-- upvalues: experimentCacheManager (ref), scheduledSquadsListExpLayer (ref)
	local var1 = experimentCacheManager.default:getLayerVariables(scheduledSquadsListExpLayer)
	
	return if var1 and var1[p1] ~= nil then var1[p1] else false
end

return {
	getIsTopBarEntrypointEnabled = function()
		-- upvalues: enableScheduledSquadsTopBarEntrypointDev (ref), enableScheduledSquadsListExperimentationDev (ref), scheduledSquadsListChatLandingScreenEntrypointVariant (ref), experimentCacheManager (ref), scheduledSquadsListExpLayer (ref)
		local var1 = enableScheduledSquadsTopBarEntrypointDev
		
		if not var1 then
			var1 = enableScheduledSquadsListExperimentationDev
			
			if var1 then
				local var2 = scheduledSquadsListChatLandingScreenEntrypointVariant
				local var3 = experimentCacheManager.default:getLayerVariables(scheduledSquadsListExpLayer)
				
				if var3 and var3[var2] ~= nil then
					return var3[var2]
				end
				var1 = false
			end
		end
		return var1
	end,
	logExposure = function()
		-- upvalues: enableScheduledSquadsListExperimentationDev (ref), experimentCacheManager (ref), scheduledSquadsListExpLayer (ref)
		if enableScheduledSquadsListExperimentationDev and experimentCacheManager.default:getLayerVariables(scheduledSquadsListExpLayer) ~= nil then
			experimentCacheManager.default:logLayerExposure(scheduledSquadsListExpLayer)
		end
	end
}