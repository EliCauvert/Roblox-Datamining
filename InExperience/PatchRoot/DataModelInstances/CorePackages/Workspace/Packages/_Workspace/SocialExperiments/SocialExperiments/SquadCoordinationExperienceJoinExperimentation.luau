local experimentCacheManager = require(script:FindFirstAncestor("SocialExperiments").Parent.ExperimentCacheManager).ExperimentCacheManager
local squadCoordinationExperienceJoinExperimentLayer = game:DefineFastString("SquadCoordinationExperienceJoinExperimentLayer", "Party.Coordination.ExperienceJoin")
local isSquadCoordinationExperienceJoinExperimentExposureEnabled = game:DefineFastFlag("IsSquadCoordinationExperienceJoinExperimentExposureEnabled", false)
local isSquadLobbySessionEnabled = game:DefineFastFlag("IsSquadLobbySessionEnabled", false)

local function _(p0) --[[ line: 12 | named "getIsUserInTreatment" ]]
	-- upvalues: experimentCacheManager (ref), squadCoordinationExperienceJoinExperimentLayer (ref)
	local var3 = experimentCacheManager.default:getLayerVariables(squadCoordinationExperienceJoinExperimentLayer)
	
	return if var3 and var3[p0] ~= nil then var3[p0] else false
end

return {
	getIsSquadLobbySessionEnabled = function() --[[ line: 23 ]]
		-- upvalues: isSquadLobbySessionEnabled (ref)
		return isSquadLobbySessionEnabled
	end,
	getShouldOpenSLPFromExpPickerEnabled = function() --[[ line: 27 ]]
		-- upvalues: experimentCacheManager (ref), squadCoordinationExperienceJoinExperimentLayer (ref)
		local var4 = experimentCacheManager.default:getLayerVariables(squadCoordinationExperienceJoinExperimentLayer)
		
		return if var4 and var4.ShouldOpenSLPFromExpPickerEnabled ~= nil then var4.ShouldOpenSLPFromExpPickerEnabled else false
	end,
	getShouldShowFTUXOnExpPickerEnabled = function() --[[ line: 31 ]]
		-- upvalues: experimentCacheManager (ref), squadCoordinationExperienceJoinExperimentLayer (ref)
		local var5 = experimentCacheManager.default:getLayerVariables(squadCoordinationExperienceJoinExperimentLayer)
		
		return if var5 and var5.ShouldShowFTUXOnExpPickerEnabled ~= nil then var5.ShouldShowFTUXOnExpPickerEnabled else false
	end,
	getIsSearchIconOnExpPickerEnabled = function() --[[ line: 35 ]]
		-- upvalues: experimentCacheManager (ref), squadCoordinationExperienceJoinExperimentLayer (ref)
		local var6 = experimentCacheManager.default:getLayerVariables(squadCoordinationExperienceJoinExperimentLayer)
		
		return if var6 and var6.IsSearchIconOnExpPickerEnabled ~= nil then var6.IsSearchIconOnExpPickerEnabled else false
	end,
	getIsNewTooltipCopyEnabled = function() --[[ line: 39 ]]
		-- upvalues: experimentCacheManager (ref), squadCoordinationExperienceJoinExperimentLayer (ref)
		local var7 = experimentCacheManager.default:getLayerVariables(squadCoordinationExperienceJoinExperimentLayer)
		
		return if var7 and var7.IsNewTooltipCopyEnabled ~= nil then var7.IsNewTooltipCopyEnabled else false
	end,
	logExposure = function() --[[ line: 43 ]]
		-- upvalues: isSquadCoordinationExperienceJoinExperimentExposureEnabled (ref), experimentCacheManager (ref), squadCoordinationExperienceJoinExperimentLayer (ref)
		if isSquadCoordinationExperienceJoinExperimentExposureEnabled and experimentCacheManager.default:getLayerVariables(squadCoordinationExperienceJoinExperimentLayer) ~= nil then
			experimentCacheManager.default:logLayerExposure(squadCoordinationExperienceJoinExperimentLayer)
		end
	end
}