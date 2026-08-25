local experimentCacheManager = require(script:FindFirstAncestor("SocialExperiments").Parent.ExperimentCacheManager).ExperimentCacheManager
local squadQuickStartExperimentLayer = game:DefineFastString("SquadQuickStartExperimentLayer", "Party.Formation.Create.User")
local squadEnablePartyQuickStartVariant = game:DefineFastString("SquadEnablePartyQuickStartVariant", "enablePartyQuickStartChanges")
local enablePartyQuickStartChanges2 = game:DefineFastFlag("EnablePartyQuickStartChanges2", false)
local partyFormationCreateUserExposureEnabled = game:DefineFastFlag("PartyFormationCreateUserExposureEnabled", false)

local function _(p0)
	-- upvalues: experimentCacheManager (ref), squadQuickStartExperimentLayer (ref)
	local var4 = experimentCacheManager.default:getLayerVariables(squadQuickStartExperimentLayer)
	
	return if var4 and var4[p0] ~= nil then var4[p0] else false
end

return {
	getPartyQuickStartChangesEnabled = function()
		-- upvalues: enablePartyQuickStartChanges2 (ref), squadEnablePartyQuickStartVariant (ref), experimentCacheManager (ref), squadQuickStartExperimentLayer (ref)
		local var5 = enablePartyQuickStartChanges2
		
		if not var5 then
			local var6 = squadEnablePartyQuickStartVariant
			local var7 = experimentCacheManager.default:getLayerVariables(squadQuickStartExperimentLayer)
			
			if var7 and var7[var6] ~= nil then
				return var7[var6]
			end
			var5 = false
		end
		return var5
	end,
	logExposure = function()
		-- upvalues: partyFormationCreateUserExposureEnabled (ref), experimentCacheManager (ref), squadQuickStartExperimentLayer (ref)
		if partyFormationCreateUserExposureEnabled and experimentCacheManager.default:getLayerVariables(squadQuickStartExperimentLayer) ~= nil then
			experimentCacheManager.default:logLayerExposure(squadQuickStartExperimentLayer)
		end
	end,
	isLogExposureEnabled = partyFormationCreateUserExposureEnabled
}