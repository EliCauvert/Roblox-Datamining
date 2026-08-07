local experimentCacheManager = require(script:FindFirstAncestor("SocialExperiments").Parent.ExperimentCacheManager).ExperimentCacheManager
local squadCoordinationUiExperimentLayer = game:DefineFastString("SquadCoordinationUiExperimentLayer", "Party.Coordination.UI")
local squadEnablePartyCoordinationUiVariant = game:DefineFastString("SquadEnablePartyCoordinationUiVariant", "enablePartyCoordinationUi")
local forceEnablePartyCoordinationUiChanges3 = game:DefineFastFlag("ForceEnablePartyCoordinationUiChanges3", false)
local partyCoordinationUIExposureEnabled = game:DefineFastFlag("PartyCoordinationUIExposureEnabled", false)

local function _(p0) --[[ line: 14 | named "getIsUserInTreatment" ]]
	-- upvalues: experimentCacheManager (ref), squadCoordinationUiExperimentLayer (ref)
	local var4 = experimentCacheManager.default:getLayerVariables(squadCoordinationUiExperimentLayer)
	
	return if var4 and var4[p0] ~= nil then var4[p0] else false
end

return {
	getPartyCoordinationUiChangesEnabled = function() --[[ line: 24 ]]
		-- upvalues: forceEnablePartyCoordinationUiChanges3 (ref), squadEnablePartyCoordinationUiVariant (ref), experimentCacheManager (ref), squadCoordinationUiExperimentLayer (ref)
		local var5 = forceEnablePartyCoordinationUiChanges3
		
		if not var5 then
			local var6 = squadEnablePartyCoordinationUiVariant
			local var7 = experimentCacheManager.default:getLayerVariables(squadCoordinationUiExperimentLayer)
			
			if var7 and var7[var6] ~= nil then
				return var7[var6]
			end
			var5 = false
		end
		return var5
	end,
	logExposure = function() --[[ line: 29 ]]
		-- upvalues: partyCoordinationUIExposureEnabled (ref), experimentCacheManager (ref), squadCoordinationUiExperimentLayer (ref)
		if partyCoordinationUIExposureEnabled and experimentCacheManager.default:getLayerVariables(squadCoordinationUiExperimentLayer) ~= nil then
			experimentCacheManager.default:logLayerExposure(squadCoordinationUiExperimentLayer)
		end
	end,
	isLogExposureEnabled = partyCoordinationUIExposureEnabled
}