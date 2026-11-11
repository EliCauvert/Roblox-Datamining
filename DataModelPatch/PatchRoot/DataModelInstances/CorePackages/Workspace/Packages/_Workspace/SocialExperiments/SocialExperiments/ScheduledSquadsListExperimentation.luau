local ExperimentCacheManager = require(script:FindFirstAncestor("SocialExperiments").Parent.ExperimentCacheManager).ExperimentCacheManager
local ScheduledSquadsListExpLayer = game:DefineFastString("ScheduledSquadsListExpLayer", "")
local ScheduledSquadsListChatLandingScreenEntrypointVariant = game:DefineFastString("ScheduledSquadsListChatLandingScreenEntrypointVariant", "enableTopBarEntrypoint")
local EnableScheduledSquadsListExperimentationDev = game:DefineFastFlag("EnableScheduledSquadsListExperimentation_dev", false)
local EnableScheduledSquadsTopBarEntrypointDev = game:DefineFastFlag("EnableScheduledSquadsTopBarEntrypoint_dev", false)

local function _(p1)
	-- upvalues: ExperimentCacheManager (copy), ScheduledSquadsListExpLayer (copy)
	local LayerVariables = ExperimentCacheManager.default:getLayerVariables(ScheduledSquadsListExpLayer)
	
	return if LayerVariables and LayerVariables[p1] ~= nil then LayerVariables[p1] else false
end

return {
	getIsTopBarEntrypointEnabled = function()
		-- upvalues: EnableScheduledSquadsTopBarEntrypointDev (copy), EnableScheduledSquadsListExperimentationDev (copy), ScheduledSquadsListChatLandingScreenEntrypointVariant (copy), ExperimentCacheManager (copy), ScheduledSquadsListExpLayer (copy)
		local EnableScheduledSquadsTopBarEntrypointDev1: boolean = EnableScheduledSquadsTopBarEntrypointDev
		
		if not EnableScheduledSquadsTopBarEntrypointDev1 then
			EnableScheduledSquadsTopBarEntrypointDev1 = EnableScheduledSquadsListExperimentationDev
			
			if EnableScheduledSquadsTopBarEntrypointDev1 then
				local LayerVariables = ExperimentCacheManager.default:getLayerVariables(ScheduledSquadsListExpLayer)
				
				if LayerVariables and LayerVariables[ScheduledSquadsListChatLandingScreenEntrypointVariant] ~= nil then
					return LayerVariables[ScheduledSquadsListChatLandingScreenEntrypointVariant]
				end
				EnableScheduledSquadsTopBarEntrypointDev1 = false
			end
		end
		return EnableScheduledSquadsTopBarEntrypointDev1
	end,
	logExposure = function()
		-- upvalues: EnableScheduledSquadsListExperimentationDev (copy), ExperimentCacheManager (copy), ScheduledSquadsListExpLayer (copy)
		if EnableScheduledSquadsListExperimentationDev and ExperimentCacheManager.default:getLayerVariables(ScheduledSquadsListExpLayer) ~= nil then
			ExperimentCacheManager.default:logLayerExposure(ScheduledSquadsListExpLayer)
		end
	end
}