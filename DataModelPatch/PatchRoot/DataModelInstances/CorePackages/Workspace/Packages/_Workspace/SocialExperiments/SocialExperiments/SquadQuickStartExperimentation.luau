local ExperimentCacheManager = require(script:FindFirstAncestor("SocialExperiments").Parent.ExperimentCacheManager).ExperimentCacheManager
local SquadQuickStartExperimentLayer = game:DefineFastString("SquadQuickStartExperimentLayer", "Party.Formation.Create.User")
local SquadEnablePartyQuickStartVariant = game:DefineFastString("SquadEnablePartyQuickStartVariant", "enablePartyQuickStartChanges")
local EnablePartyQuickStartChanges2 = game:DefineFastFlag("EnablePartyQuickStartChanges2", false)
local PartyFormationCreateUserExposureEnabled = game:DefineFastFlag("PartyFormationCreateUserExposureEnabled", false)

local function _(p1)
	-- upvalues: ExperimentCacheManager (copy), SquadQuickStartExperimentLayer (copy)
	local LayerVariables = ExperimentCacheManager.default:getLayerVariables(SquadQuickStartExperimentLayer)
	
	return if LayerVariables and LayerVariables[p1] ~= nil then LayerVariables[p1] else false
end

return {
	getPartyQuickStartChangesEnabled = function()
		-- upvalues: EnablePartyQuickStartChanges2 (copy), SquadEnablePartyQuickStartVariant (copy), ExperimentCacheManager (copy), SquadQuickStartExperimentLayer (copy)
		local EnablePartyQuickStartChanges: boolean = EnablePartyQuickStartChanges2
		
		if not EnablePartyQuickStartChanges then
			local LayerVariables = ExperimentCacheManager.default:getLayerVariables(SquadQuickStartExperimentLayer)
			
			if LayerVariables and LayerVariables[SquadEnablePartyQuickStartVariant] ~= nil then
				return LayerVariables[SquadEnablePartyQuickStartVariant]
			end
			EnablePartyQuickStartChanges = false
		end
		return EnablePartyQuickStartChanges
	end,
	logExposure = function()
		-- upvalues: PartyFormationCreateUserExposureEnabled (copy), ExperimentCacheManager (copy), SquadQuickStartExperimentLayer (copy)
		if PartyFormationCreateUserExposureEnabled and ExperimentCacheManager.default:getLayerVariables(SquadQuickStartExperimentLayer) ~= nil then
			ExperimentCacheManager.default:logLayerExposure(SquadQuickStartExperimentLayer)
		end
	end,
	isLogExposureEnabled = PartyFormationCreateUserExposureEnabled
}