local experimentCacheManager = require(script:FindFirstAncestor("SocialExperiments").Parent.ExperimentCacheManager).ExperimentCacheManager
local squadCoordinationUiExperimentLayer = game:DefineFastString("SquadCoordinationUiExperimentLayer", "Party.Coordination.UI")
local squadEnablePartyCoordinationUiVariant = game:DefineFastString("SquadEnablePartyCoordinationUiVariant", "enablePartyCoordinationUi")
local forceEnablePartyCoordinationUiChanges3 = game:DefineFastFlag("ForceEnablePartyCoordinationUiChanges3", false)
local partyCoordinationUIExposureEnabled = game:DefineFastFlag("PartyCoordinationUIExposureEnabled", false)

local function _(p1)
	-- upvalues: experimentCacheManager (ref), squadCoordinationUiExperimentLayer (ref)
	local var1 = experimentCacheManager.default:getLayerVariables(squadCoordinationUiExperimentLayer)
	
	return if var1 and var1[p1] ~= nil then var1[p1] else false
end

return {
	getPartyCoordinationUiChangesEnabled = function()
		-- upvalues: forceEnablePartyCoordinationUiChanges3 (ref), squadEnablePartyCoordinationUiVariant (ref), experimentCacheManager (ref), squadCoordinationUiExperimentLayer (ref)
		local var1 = forceEnablePartyCoordinationUiChanges3
		
		if not var1 then
			local var2 = squadEnablePartyCoordinationUiVariant
			local var3 = experimentCacheManager.default:getLayerVariables(squadCoordinationUiExperimentLayer)
			
			if var3 and var3[var2] ~= nil then
				return var3[var2]
			end
			var1 = false
		end
		return var1
	end,
	logExposure = function()
		-- upvalues: partyCoordinationUIExposureEnabled (ref), experimentCacheManager (ref), squadCoordinationUiExperimentLayer (ref)
		if partyCoordinationUIExposureEnabled and experimentCacheManager.default:getLayerVariables(squadCoordinationUiExperimentLayer) ~= nil then
			experimentCacheManager.default:logLayerExposure(squadCoordinationUiExperimentLayer)
		end
	end,
	isLogExposureEnabled = partyCoordinationUIExposureEnabled
}