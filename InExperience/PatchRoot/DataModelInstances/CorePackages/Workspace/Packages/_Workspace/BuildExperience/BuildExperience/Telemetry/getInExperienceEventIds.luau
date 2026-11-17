local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local BuildModeLaunchModule = require(Parent.BuildExperiencePlaytestLaunch.BuildModeLaunch)
local GetPlayButtonStoreModule = require(BuildExperience.Stores.GetPlayButtonStore)
local GetCurrentExperienceProjectModule = require(BuildExperience.utils.getCurrentExperienceProject)
local _ = require(script.Parent.sendBuildExperienceEvent)
local TeamCreateUtilsModule = require(Parent.BuildExperiencePlaytestLaunch.teamCreateUtils)

return function()
	-- upvalues: GetCurrentExperienceProjectModule (copy), GetPlayButtonStoreModule (copy), TeamCreateUtilsModule (copy), BuildModeLaunchModule (copy)
	local CurrentExperienceProjectModule = GetCurrentExperienceProjectModule()
	local ResumeTarget = GetPlayButtonStoreModule().getResumeTarget(false)
	
	return {
		universeId = CurrentExperienceProjectModule.universeId,
		placeId = CurrentExperienceProjectModule.placeId,
		conversationId = if ResumeTarget == nil and CurrentExperienceProjectModule.placeId ~= nil and TeamCreateUtilsModule.isViewer() then BuildModeLaunchModule:getChatSessionId(CurrentExperienceProjectModule.placeId) elseif ResumeTarget == nil then nil else ResumeTarget.sessionId
	}
end