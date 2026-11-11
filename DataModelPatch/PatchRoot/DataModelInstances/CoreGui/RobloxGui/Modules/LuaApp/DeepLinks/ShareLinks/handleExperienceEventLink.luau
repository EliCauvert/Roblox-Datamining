local Default = require(game:GetService("CorePackages").Workspace.Packages.ExperienceService).GameProtocol.default
local ExperienceJoinDataHelperModule = require(script.Parent.Parent.Utils.ExperienceJoinDataHelper)
local _ = require(script.Parent.Types)
local ShareLinkTypesModule = require(script.Parent.ShareLinkTypes)

return function(p1, p2)
	-- upvalues: ExperienceJoinDataHelperModule (copy), ShareLinkTypesModule (copy), Default (copy)
	local ExperienceEventData = p1 and p1.responseBody and p1.responseBody.experienceEventData or {}
	
	if not ExperienceEventData or not ExperienceEventData.universeId or not ExperienceEventData.placeId then return end
	local MergeExperienceJoinDataResult = {}
	local JoinData = ExperienceEventData.joinData
	
	if JoinData then
		MergeExperienceJoinDataResult = ExperienceJoinDataHelperModule.mergeExperienceJoinData(MergeExperienceJoinDataResult, JoinData)
	end
	p2.launchGame(ExperienceEventData.placeId, ShareLinkTypesModule.ExperienceEvent, MergeExperienceJoinDataResult.experienceJoinData, Default, "ExperienceEventShareLink")
end