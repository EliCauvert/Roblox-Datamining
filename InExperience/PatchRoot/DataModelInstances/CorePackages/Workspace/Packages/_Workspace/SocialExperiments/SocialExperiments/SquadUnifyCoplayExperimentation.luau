local Parent = script:FindFirstAncestor("SocialExperiments").Parent
local ExperimentCacheManager = require(Parent.ExperimentCacheManager).ExperimentCacheManager
local SquadsUnifyCoplayExpLayer = game:DefineFastString("SquadsUnifyCoplayExpLayer", "Party.Formation.Create.PartyNudge")
local SquadsUnifyCoplayOneOnOnePartyCreationVariant = game:DefineFastString("SquadsUnifyCoplayOneOnOnePartyCreationVariant", "enableOneOnOnePartyCreation")
local SquadsUnifyCoplayMultiInvitePartyCreationVariant = game:DefineFastString("SquadsUnifyCoplayMultiInvitePartyCreationVariant", "enableMultiInvitePartyCreation")
local EnableSquadsUnifyCoplayOneOnOnePartyCreationDev = game:DefineFastFlag("EnableSquadsUnifyCoplayOneOnOnePartyCreation_dev", false)
local EnableSquadsUnifyCoplayMultiInvitePartyCreationDev = game:DefineFastFlag("EnableSquadsUnifyCoplayMultiInvitePartyCreation_dev", false)
local EnableSquadsUnifyCoplayExperimentationDev = game:DefineFastFlag("EnableSquadsUnifyCoplayExperimentation_dev", false)
local GetFFlagIsSquadEnabledFunction = require(Parent.SharedFlags).GetFFlagIsSquadEnabled

local function _(p1) --[[ Line: 20 | Named "getIsUserInTreatment" ]]
	-- upvalues: ExperimentCacheManager (copy), SquadsUnifyCoplayExpLayer (copy)
	local LayerVariables = ExperimentCacheManager.default:getLayerVariables(SquadsUnifyCoplayExpLayer)
	
	return if LayerVariables and LayerVariables[p1] ~= nil then LayerVariables[p1] else false
end

return {
	getOneOnOnePartyCreationEnabled = function() --[[ Line: 30 ]]
		-- upvalues: EnableSquadsUnifyCoplayOneOnOnePartyCreationDev (copy), EnableSquadsUnifyCoplayExperimentationDev (copy), SquadsUnifyCoplayOneOnOnePartyCreationVariant (copy), ExperimentCacheManager (copy), SquadsUnifyCoplayExpLayer (copy), GetFFlagIsSquadEnabledFunction (copy)
		local EnableSquadsUnifyCoplayOneOnOnePartyCreationDev1 = EnableSquadsUnifyCoplayOneOnOnePartyCreationDev
		
		if not EnableSquadsUnifyCoplayOneOnOnePartyCreationDev1 then
			EnableSquadsUnifyCoplayOneOnOnePartyCreationDev1 = EnableSquadsUnifyCoplayExperimentationDev
			
			if EnableSquadsUnifyCoplayOneOnOnePartyCreationDev1 then
				local LayerVariables = ExperimentCacheManager.default:getLayerVariables(SquadsUnifyCoplayExpLayer)
				EnableSquadsUnifyCoplayOneOnOnePartyCreationDev1 = if LayerVariables and LayerVariables[SquadsUnifyCoplayOneOnOnePartyCreationVariant] ~= nil then LayerVariables[SquadsUnifyCoplayOneOnOnePartyCreationVariant] and GetFFlagIsSquadEnabledFunction() else false
			end
		end
		return EnableSquadsUnifyCoplayOneOnOnePartyCreationDev1
	end,
	getMultiInvitePartyCreationEnabled = function() --[[ Line: 39 ]]
		-- upvalues: EnableSquadsUnifyCoplayMultiInvitePartyCreationDev (copy), EnableSquadsUnifyCoplayExperimentationDev (copy), SquadsUnifyCoplayMultiInvitePartyCreationVariant (copy), ExperimentCacheManager (copy), SquadsUnifyCoplayExpLayer (copy), GetFFlagIsSquadEnabledFunction (copy)
		local EnableSquadsUnifyCoplayMultiInvitePartyCreationDev1 = EnableSquadsUnifyCoplayMultiInvitePartyCreationDev
		
		if not EnableSquadsUnifyCoplayMultiInvitePartyCreationDev1 then
			EnableSquadsUnifyCoplayMultiInvitePartyCreationDev1 = EnableSquadsUnifyCoplayExperimentationDev
			
			if EnableSquadsUnifyCoplayMultiInvitePartyCreationDev1 then
				local LayerVariables = ExperimentCacheManager.default:getLayerVariables(SquadsUnifyCoplayExpLayer)
				EnableSquadsUnifyCoplayMultiInvitePartyCreationDev1 = if LayerVariables and LayerVariables[SquadsUnifyCoplayMultiInvitePartyCreationVariant] ~= nil then LayerVariables[SquadsUnifyCoplayMultiInvitePartyCreationVariant] and GetFFlagIsSquadEnabledFunction() else false
			end
		end
		return EnableSquadsUnifyCoplayMultiInvitePartyCreationDev1
	end,
	logExposure = function() --[[ Line: 48 ]]
		-- upvalues: EnableSquadsUnifyCoplayExperimentationDev (copy), ExperimentCacheManager (copy), SquadsUnifyCoplayExpLayer (copy)
		if EnableSquadsUnifyCoplayExperimentationDev and ExperimentCacheManager.default:getLayerVariables(SquadsUnifyCoplayExpLayer) ~= nil then
			ExperimentCacheManager.default:logLayerExposure(SquadsUnifyCoplayExpLayer)
		end
	end
}