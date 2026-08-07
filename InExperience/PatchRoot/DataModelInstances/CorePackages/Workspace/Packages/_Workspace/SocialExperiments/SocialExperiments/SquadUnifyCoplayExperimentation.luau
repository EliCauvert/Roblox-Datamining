local parent = script:FindFirstAncestor("SocialExperiments").Parent
local experimentCacheManager = require(parent.ExperimentCacheManager).ExperimentCacheManager
local squadsUnifyCoplayExpLayer = game:DefineFastString("SquadsUnifyCoplayExpLayer", "Party.Formation.Create.PartyNudge")
local squadsUnifyCoplayOneOnOnePartyCreationVariant = game:DefineFastString("SquadsUnifyCoplayOneOnOnePartyCreationVariant", "enableOneOnOnePartyCreation")
local squadsUnifyCoplayMultiInvitePartyCreationVariant = game:DefineFastString("SquadsUnifyCoplayMultiInvitePartyCreationVariant", "enableMultiInvitePartyCreation")
local enableSquadsUnifyCoplayOneOnOnePartyCreationDev = game:DefineFastFlag("EnableSquadsUnifyCoplayOneOnOnePartyCreation_dev", false)
local enableSquadsUnifyCoplayMultiInvitePartyCreationDev = game:DefineFastFlag("EnableSquadsUnifyCoplayMultiInvitePartyCreation_dev", false)
local enableSquadsUnifyCoplayExperimentationDev = game:DefineFastFlag("EnableSquadsUnifyCoplayExperimentation_dev", false)
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled

local function _(p0) --[[ line: 20 | named "getIsUserInTreatment" ]]
	-- upvalues: experimentCacheManager (ref), squadsUnifyCoplayExpLayer (ref)
	local var6 = experimentCacheManager.default:getLayerVariables(squadsUnifyCoplayExpLayer)
	
	return if var6 and var6[p0] ~= nil then var6[p0] else false
end

return {
	getOneOnOnePartyCreationEnabled = function() --[[ line: 30 ]]
		-- upvalues: enableSquadsUnifyCoplayOneOnOnePartyCreationDev (ref), enableSquadsUnifyCoplayExperimentationDev (ref), squadsUnifyCoplayOneOnOnePartyCreationVariant (ref), experimentCacheManager (ref), squadsUnifyCoplayExpLayer (ref), getFFlagIsSquadEnabled (ref)
		local var7 = enableSquadsUnifyCoplayOneOnOnePartyCreationDev
		
		if not var7 then
			var7 = enableSquadsUnifyCoplayExperimentationDev
			
			if var7 then
				local var8 = squadsUnifyCoplayOneOnOnePartyCreationVariant
				local var9 = experimentCacheManager.default:getLayerVariables(squadsUnifyCoplayExpLayer)
				var7 = if var9 and var9[var8] ~= nil then var9[var8] else false
				var7 = var7 and getFFlagIsSquadEnabled()
			end
		end
		return var7
	end,
	getMultiInvitePartyCreationEnabled = function() --[[ line: 39 ]]
		-- upvalues: enableSquadsUnifyCoplayMultiInvitePartyCreationDev (ref), enableSquadsUnifyCoplayExperimentationDev (ref), squadsUnifyCoplayMultiInvitePartyCreationVariant (ref), experimentCacheManager (ref), squadsUnifyCoplayExpLayer (ref), getFFlagIsSquadEnabled (ref)
		local var10 = enableSquadsUnifyCoplayMultiInvitePartyCreationDev
		
		if not var10 then
			var10 = enableSquadsUnifyCoplayExperimentationDev
			
			if var10 then
				local var11 = squadsUnifyCoplayMultiInvitePartyCreationVariant
				local var12 = experimentCacheManager.default:getLayerVariables(squadsUnifyCoplayExpLayer)
				var10 = if var12 and var12[var11] ~= nil then var12[var11] else false
				var10 = var10 and getFFlagIsSquadEnabled()
			end
		end
		return var10
	end,
	logExposure = function() --[[ line: 48 ]]
		-- upvalues: enableSquadsUnifyCoplayExperimentationDev (ref), experimentCacheManager (ref), squadsUnifyCoplayExpLayer (ref)
		if enableSquadsUnifyCoplayExperimentationDev and experimentCacheManager.default:getLayerVariables(squadsUnifyCoplayExpLayer) ~= nil then
			experimentCacheManager.default:logLayerExposure(squadsUnifyCoplayExpLayer)
		end
	end
}