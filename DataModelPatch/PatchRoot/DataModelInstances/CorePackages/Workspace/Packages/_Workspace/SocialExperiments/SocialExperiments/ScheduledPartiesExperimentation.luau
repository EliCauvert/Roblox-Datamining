local Parent = script:FindFirstAncestor("SocialExperiments").Parent
local ExperimentCacheManager = require(Parent.ExperimentCacheManager).ExperimentCacheManager
local ScheduledPartiesExpLayer = game:DefineFastString("ScheduledPartiesExpLayer", "Party.Schedule")
local ScheduledPartiesTooltipVariant = game:DefineFastString("ScheduledPartiesTooltipVariant", "enableScheduledPartiesTooltip")
local EnableScheduledSquadsTooltip = game:DefineFastFlag("EnableScheduledSquadsTooltip", false)
local EnableScheduledPartiesExperimentation = game:DefineFastFlag("EnableScheduledPartiesExperimentation", false)
local GetFFlagIsSquadEnabledFunction = require(Parent.SharedFlags).GetFFlagIsSquadEnabled

local function _(p1)
	-- upvalues: ExperimentCacheManager (copy), ScheduledPartiesExpLayer (copy)
	local LayerVariables = ExperimentCacheManager.default:getLayerVariables(ScheduledPartiesExpLayer)
	
	return if LayerVariables and LayerVariables[p1] ~= nil then LayerVariables[p1] else false
end

return {
	getScheduledPartiesTooltipEnabled = function()
		-- upvalues: EnableScheduledSquadsTooltip (copy), EnableScheduledPartiesExperimentation (copy), ScheduledPartiesTooltipVariant (copy), ExperimentCacheManager (copy), ScheduledPartiesExpLayer (copy), GetFFlagIsSquadEnabledFunction (copy)
		local EnableScheduledSquadsTooltip1 = EnableScheduledSquadsTooltip
		
		if not EnableScheduledSquadsTooltip1 then
			EnableScheduledSquadsTooltip1 = EnableScheduledPartiesExperimentation
			
			if EnableScheduledSquadsTooltip1 then
				local LayerVariables = ExperimentCacheManager.default:getLayerVariables(ScheduledPartiesExpLayer)
				EnableScheduledSquadsTooltip1 = if LayerVariables and LayerVariables[ScheduledPartiesTooltipVariant] ~= nil then LayerVariables[ScheduledPartiesTooltipVariant] and GetFFlagIsSquadEnabledFunction() else false
			end
		end
		return EnableScheduledSquadsTooltip1
	end,
	logExposure = function()
		-- upvalues: EnableScheduledPartiesExperimentation (copy), ExperimentCacheManager (copy), ScheduledPartiesTooltipVariant (copy)
		if EnableScheduledPartiesExperimentation and ExperimentCacheManager.default:getLayerVariables(ScheduledPartiesTooltipVariant) ~= nil then
			ExperimentCacheManager.default:logLayerExposure(ScheduledPartiesTooltipVariant)
		end
	end
}