local experimentCacheManager = require(script:FindFirstAncestor("SocialExperiments").Parent.ExperimentCacheManager).ExperimentCacheManager
local squadQuickStartExperimentLayer = game:DefineFastString("SquadQuickStartExperimentLayer", "Party.Formation.Create.User")
local squadEnablePartyQuickStartVariant = game:DefineFastString("SquadEnablePartyQuickStartVariant", "enablePartyQuickStartChanges")
local enablePartyQuickStartChanges2 = game:DefineFastFlag("EnablePartyQuickStartChanges2", false)

local function _(p1)
	-- upvalues: experimentCacheManager (ref), squadQuickStartExperimentLayer (ref)
	local var1 = experimentCacheManager.default:getLayerVariables(squadQuickStartExperimentLayer)
	
	return if var1 and var1[p1] ~= nil then var1[p1] else false
end

return {
	getPartyQuickStartChangesEnabled = function()
		-- upvalues: enablePartyQuickStartChanges2 (ref), squadEnablePartyQuickStartVariant (ref), experimentCacheManager (ref), squadQuickStartExperimentLayer (ref)
		local var1 = enablePartyQuickStartChanges2
		
		if not var1 then
			local var2 = squadEnablePartyQuickStartVariant
			local var3 = experimentCacheManager.default:getLayerVariables(squadQuickStartExperimentLayer)
			
			if var3 and var3[var2] ~= nil then
				return var3[var2]
			end
			var1 = false
		end
		return var1
	end,
	logExposure = function()
		-- upvalues: experimentCacheManager (ref), squadQuickStartExperimentLayer (ref)
		if experimentCacheManager.default:getLayerVariables(squadQuickStartExperimentLayer) ~= nil then
			experimentCacheManager.default:logLayerExposure(squadQuickStartExperimentLayer)
		end
	end
}