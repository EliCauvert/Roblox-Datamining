local ExperimentCacheManager = require(script:FindFirstAncestor("SocialExperiments").Parent.ExperimentCacheManager).ExperimentCacheManager
local SquadCoordinationExperienceJoinExperimentLayer = game:DefineFastString("SquadCoordinationExperienceJoinExperimentLayer", "Party.Coordination.ExperienceJoin")
local IsSquadCoordinationExperienceJoinExperimentExposureEnabled = game:DefineFastFlag("IsSquadCoordinationExperienceJoinExperimentExposureEnabled", false)
local IsSquadLobbySessionEnabled = game:DefineFastFlag("IsSquadLobbySessionEnabled", false)

local function _(p1) --[[ Line: 12 | Named "getIsUserInTreatment" ]]
	-- upvalues: ExperimentCacheManager (copy), SquadCoordinationExperienceJoinExperimentLayer (copy)
	local LayerVariables = ExperimentCacheManager.default:getLayerVariables(SquadCoordinationExperienceJoinExperimentLayer)
	
	return if LayerVariables and LayerVariables[p1] ~= nil then LayerVariables[p1] else false
end

return {
	getIsSquadLobbySessionEnabled = function() --[[ Line: 23 ]]
		-- upvalues: IsSquadLobbySessionEnabled (copy)
		return IsSquadLobbySessionEnabled
	end,
	getShouldOpenSLPFromExpPickerEnabled = function() --[[ Line: 27 ]]
		-- upvalues: ExperimentCacheManager (copy), SquadCoordinationExperienceJoinExperimentLayer (copy)
		local LayerVariables = ExperimentCacheManager.default:getLayerVariables(SquadCoordinationExperienceJoinExperimentLayer)
		
		return if LayerVariables and LayerVariables.ShouldOpenSLPFromExpPickerEnabled ~= nil then LayerVariables.ShouldOpenSLPFromExpPickerEnabled else false
	end,
	getShouldShowFTUXOnExpPickerEnabled = function() --[[ Line: 31 ]]
		-- upvalues: ExperimentCacheManager (copy), SquadCoordinationExperienceJoinExperimentLayer (copy)
		local LayerVariables = ExperimentCacheManager.default:getLayerVariables(SquadCoordinationExperienceJoinExperimentLayer)
		
		return if LayerVariables and LayerVariables.ShouldShowFTUXOnExpPickerEnabled ~= nil then LayerVariables.ShouldShowFTUXOnExpPickerEnabled else false
	end,
	getIsSearchIconOnExpPickerEnabled = function() --[[ Line: 35 ]]
		-- upvalues: ExperimentCacheManager (copy), SquadCoordinationExperienceJoinExperimentLayer (copy)
		local LayerVariables = ExperimentCacheManager.default:getLayerVariables(SquadCoordinationExperienceJoinExperimentLayer)
		
		return if LayerVariables and LayerVariables.IsSearchIconOnExpPickerEnabled ~= nil then LayerVariables.IsSearchIconOnExpPickerEnabled else false
	end,
	getIsNewTooltipCopyEnabled = function() --[[ Line: 39 ]]
		-- upvalues: ExperimentCacheManager (copy), SquadCoordinationExperienceJoinExperimentLayer (copy)
		local LayerVariables = ExperimentCacheManager.default:getLayerVariables(SquadCoordinationExperienceJoinExperimentLayer)
		
		return if LayerVariables and LayerVariables.IsNewTooltipCopyEnabled ~= nil then LayerVariables.IsNewTooltipCopyEnabled else false
	end,
	logExposure = function() --[[ Line: 43 ]]
		-- upvalues: IsSquadCoordinationExperienceJoinExperimentExposureEnabled (copy), ExperimentCacheManager (copy), SquadCoordinationExperienceJoinExperimentLayer (copy)
		if IsSquadCoordinationExperienceJoinExperimentExposureEnabled and ExperimentCacheManager.default:getLayerVariables(SquadCoordinationExperienceJoinExperimentLayer) ~= nil then
			ExperimentCacheManager.default:logLayerExposure(SquadCoordinationExperienceJoinExperimentLayer)
		end
	end
}