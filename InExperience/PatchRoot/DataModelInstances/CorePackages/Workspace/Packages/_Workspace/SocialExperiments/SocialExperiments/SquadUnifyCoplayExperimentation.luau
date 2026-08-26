local parent = script:FindFirstAncestor("SocialExperiments").Parent
local experimentCacheManager = require(parent.ExperimentCacheManager).ExperimentCacheManager
local squadsUnifyCoplayExpLayer = game:DefineFastString("SquadsUnifyCoplayExpLayer", "Party.Formation.Create.PartyNudge")
local squadsUnifyCoplayOneOnOnePartyCreationVariant = game:DefineFastString("SquadsUnifyCoplayOneOnOnePartyCreationVariant", "enableOneOnOnePartyCreation")
local squadsUnifyCoplayMultiInvitePartyCreationVariant = game:DefineFastString("SquadsUnifyCoplayMultiInvitePartyCreationVariant", "enableMultiInvitePartyCreation")
local enableSquadsUnifyCoplayOneOnOnePartyCreationDev = game:DefineFastFlag("EnableSquadsUnifyCoplayOneOnOnePartyCreation_dev", false)
local enableSquadsUnifyCoplayMultiInvitePartyCreationDev = game:DefineFastFlag("EnableSquadsUnifyCoplayMultiInvitePartyCreation_dev", false)
local enableSquadsUnifyCoplayExperimentationDev = game:DefineFastFlag("EnableSquadsUnifyCoplayExperimentation_dev", false)
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled

local function _(p1)
	-- upvalues: experimentCacheManager (ref), squadsUnifyCoplayExpLayer (ref)
	local var1 = experimentCacheManager.default:getLayerVariables(squadsUnifyCoplayExpLayer)
	
	return if var1 and var1[p1] ~= nil then var1[p1] else false
end

return {
	getOneOnOnePartyCreationEnabled = function()
		-- upvalues: enableSquadsUnifyCoplayOneOnOnePartyCreationDev (ref), enableSquadsUnifyCoplayExperimentationDev (ref), squadsUnifyCoplayOneOnOnePartyCreationVariant (ref), experimentCacheManager (ref), squadsUnifyCoplayExpLayer (ref), getFFlagIsSquadEnabled (ref)
		local var1 = enableSquadsUnifyCoplayOneOnOnePartyCreationDev
		
		if not var1 then
			var1 = enableSquadsUnifyCoplayExperimentationDev
			
			if var1 then
				local var2 = squadsUnifyCoplayOneOnOnePartyCreationVariant
				local var3 = experimentCacheManager.default:getLayerVariables(squadsUnifyCoplayExpLayer)
				var1 = if var3 and var3[var2] ~= nil then var3[var2] else false
				var1 = var1 and getFFlagIsSquadEnabled()
			end
		end
		return var1
	end,
	getMultiInvitePartyCreationEnabled = function()
		-- upvalues: enableSquadsUnifyCoplayMultiInvitePartyCreationDev (ref), enableSquadsUnifyCoplayExperimentationDev (ref), squadsUnifyCoplayMultiInvitePartyCreationVariant (ref), experimentCacheManager (ref), squadsUnifyCoplayExpLayer (ref), getFFlagIsSquadEnabled (ref)
		local var1 = enableSquadsUnifyCoplayMultiInvitePartyCreationDev
		
		if not var1 then
			var1 = enableSquadsUnifyCoplayExperimentationDev
			
			if var1 then
				local var2 = squadsUnifyCoplayMultiInvitePartyCreationVariant
				local var3 = experimentCacheManager.default:getLayerVariables(squadsUnifyCoplayExpLayer)
				var1 = if var3 and var3[var2] ~= nil then var3[var2] else false
				var1 = var1 and getFFlagIsSquadEnabled()
			end
		end
		return var1
	end,
	logExposure = function()
		-- upvalues: enableSquadsUnifyCoplayExperimentationDev (ref), experimentCacheManager (ref), squadsUnifyCoplayExpLayer (ref)
		if enableSquadsUnifyCoplayExperimentationDev and experimentCacheManager.default:getLayerVariables(squadsUnifyCoplayExpLayer) ~= nil then
			experimentCacheManager.default:logLayerExposure(squadsUnifyCoplayExpLayer)
		end
	end
}