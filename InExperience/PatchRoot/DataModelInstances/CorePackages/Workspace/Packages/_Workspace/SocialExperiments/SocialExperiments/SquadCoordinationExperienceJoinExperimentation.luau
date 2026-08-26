local experimentCacheManager = require(script:FindFirstAncestor("SocialExperiments").Parent.ExperimentCacheManager).ExperimentCacheManager
local squadCoordinationExperienceJoinExperimentLayer = game:DefineFastString("SquadCoordinationExperienceJoinExperimentLayer", "Party.Coordination.ExperienceJoin")
local isSquadCoordinationExperienceJoinExperimentExposureEnabled = game:DefineFastFlag("IsSquadCoordinationExperienceJoinExperimentExposureEnabled", false)
local isSquadLobbySessionEnabled = game:DefineFastFlag("IsSquadLobbySessionEnabled", false)

local function _(p1)
	-- upvalues: experimentCacheManager (ref), squadCoordinationExperienceJoinExperimentLayer (ref)
	local var1 = experimentCacheManager.default:getLayerVariables(squadCoordinationExperienceJoinExperimentLayer)
	
	return if var1 and var1[p1] ~= nil then var1[p1] else false
end

return {
	getIsSquadLobbySessionEnabled = function()
		-- upvalues: isSquadLobbySessionEnabled (ref)
		return isSquadLobbySessionEnabled
	end,
	getShouldOpenSLPFromExpPickerEnabled = function()
		-- upvalues: experimentCacheManager (ref), squadCoordinationExperienceJoinExperimentLayer (ref)
		local var1 = experimentCacheManager.default:getLayerVariables(squadCoordinationExperienceJoinExperimentLayer)
		
		return if var1 and var1.ShouldOpenSLPFromExpPickerEnabled ~= nil then var1.ShouldOpenSLPFromExpPickerEnabled else false
	end,
	getShouldShowFTUXOnExpPickerEnabled = function()
		-- upvalues: experimentCacheManager (ref), squadCoordinationExperienceJoinExperimentLayer (ref)
		local var1 = experimentCacheManager.default:getLayerVariables(squadCoordinationExperienceJoinExperimentLayer)
		
		return if var1 and var1.ShouldShowFTUXOnExpPickerEnabled ~= nil then var1.ShouldShowFTUXOnExpPickerEnabled else false
	end,
	getIsSearchIconOnExpPickerEnabled = function()
		-- upvalues: experimentCacheManager (ref), squadCoordinationExperienceJoinExperimentLayer (ref)
		local var1 = experimentCacheManager.default:getLayerVariables(squadCoordinationExperienceJoinExperimentLayer)
		
		return if var1 and var1.IsSearchIconOnExpPickerEnabled ~= nil then var1.IsSearchIconOnExpPickerEnabled else false
	end,
	getIsNewTooltipCopyEnabled = function()
		-- upvalues: experimentCacheManager (ref), squadCoordinationExperienceJoinExperimentLayer (ref)
		local var1 = experimentCacheManager.default:getLayerVariables(squadCoordinationExperienceJoinExperimentLayer)
		
		return if var1 and var1.IsNewTooltipCopyEnabled ~= nil then var1.IsNewTooltipCopyEnabled else false
	end,
	logExposure = function()
		-- upvalues: isSquadCoordinationExperienceJoinExperimentExposureEnabled (ref), experimentCacheManager (ref), squadCoordinationExperienceJoinExperimentLayer (ref)
		if isSquadCoordinationExperienceJoinExperimentExposureEnabled and experimentCacheManager.default:getLayerVariables(squadCoordinationExperienceJoinExperimentLayer) ~= nil then
			experimentCacheManager.default:logLayerExposure(squadCoordinationExperienceJoinExperimentLayer)
		end
	end
}