local ExperimentCacheManager = require(script:FindFirstAncestor("SocialExperiments").Parent.ExperimentCacheManager).ExperimentCacheManager
local SquadCoordinationUiExperimentLayer = game:DefineFastString("SquadCoordinationUiExperimentLayer", "Party.Coordination.UI")
local SquadEnablePartyCoordinationUiVariant = game:DefineFastString("SquadEnablePartyCoordinationUiVariant", "enablePartyCoordinationUi")
local ForceEnablePartyCoordinationUiChanges3 = game:DefineFastFlag("ForceEnablePartyCoordinationUiChanges3", false)

local function _(p1)
	-- upvalues: ExperimentCacheManager (copy), SquadCoordinationUiExperimentLayer (copy)
	local LayerVariables = ExperimentCacheManager.default:getLayerVariables(SquadCoordinationUiExperimentLayer)
	
	return if LayerVariables and LayerVariables[p1] ~= nil then LayerVariables[p1] else false
end

return {
	getPartyCoordinationUiChangesEnabled = function()
		-- upvalues: ForceEnablePartyCoordinationUiChanges3 (copy), SquadEnablePartyCoordinationUiVariant (copy), ExperimentCacheManager (copy), SquadCoordinationUiExperimentLayer (copy)
		local Flag: boolean = ForceEnablePartyCoordinationUiChanges3
		
		if not Flag then
			local LayerVariables = ExperimentCacheManager.default:getLayerVariables(SquadCoordinationUiExperimentLayer)
			
			if LayerVariables and LayerVariables[SquadEnablePartyCoordinationUiVariant] ~= nil then
				return LayerVariables[SquadEnablePartyCoordinationUiVariant]
			end
			Flag = false
		end
		return Flag
	end,
	logExposure = function()
		-- upvalues: ExperimentCacheManager (copy), SquadCoordinationUiExperimentLayer (copy)
		if ExperimentCacheManager.default:getLayerVariables(SquadCoordinationUiExperimentLayer) ~= nil then
			ExperimentCacheManager.default:logLayerExposure(SquadCoordinationUiExperimentLayer)
		end
	end
}