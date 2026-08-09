local parent = script:FindFirstAncestor("SocialExperiments").Parent
local experimentCacheManager = require(parent.ExperimentCacheManager).ExperimentCacheManager
local scheduledPartiesExpLayer = game:DefineFastString("ScheduledPartiesExpLayer", "Party.Schedule")
local scheduledPartiesTooltipVariant = game:DefineFastString("ScheduledPartiesTooltipVariant", "enableScheduledPartiesTooltip")
local enableScheduledSquadsTooltip = game:DefineFastFlag("EnableScheduledSquadsTooltip", false)
local enableScheduledPartiesExperimentation = game:DefineFastFlag("EnableScheduledPartiesExperimentation", false)
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled

local function _(p0) --[[ line: 13 | named "getIsUserInTreatment" ]]
	-- upvalues: experimentCacheManager (ref), scheduledPartiesExpLayer (ref)
	local var4 = experimentCacheManager.default:getLayerVariables(scheduledPartiesExpLayer)
	
	return if var4 and var4[p0] ~= nil then var4[p0] else false
end

return {
	getScheduledPartiesTooltipEnabled = function() --[[ line: 23 ]]
		-- upvalues: enableScheduledSquadsTooltip (ref), enableScheduledPartiesExperimentation (ref), scheduledPartiesTooltipVariant (ref), experimentCacheManager (ref), scheduledPartiesExpLayer (ref), getFFlagIsSquadEnabled (ref)
		local var5 = enableScheduledSquadsTooltip
		
		if not var5 then
			var5 = enableScheduledPartiesExperimentation
			
			if var5 then
				local var6 = scheduledPartiesTooltipVariant
				local var7 = experimentCacheManager.default:getLayerVariables(scheduledPartiesExpLayer)
				var5 = if var7 and var7[var6] ~= nil then var7[var6] else false
				var5 = var5 and getFFlagIsSquadEnabled()
			end
		end
		return var5
	end,
	logExposure = function() --[[ line: 32 ]]
		-- upvalues: enableScheduledPartiesExperimentation (ref), experimentCacheManager (ref), scheduledPartiesTooltipVariant (ref)
		if enableScheduledPartiesExperimentation and experimentCacheManager.default:getLayerVariables(scheduledPartiesTooltipVariant) ~= nil then
			experimentCacheManager.default:logLayerExposure(scheduledPartiesTooltipVariant)
		end
	end
}