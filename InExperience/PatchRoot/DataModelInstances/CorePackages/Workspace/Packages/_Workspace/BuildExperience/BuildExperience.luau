local sharedFlagsModule = require(script.Parent.SharedFlags)
local buildLiveActivityControllerModule = require(script.BuildLiveActivityController)
local buildLiveActivity = game:DefineFastFlag("BuildLiveActivity", false)

if (buildLiveActivity or game:DefineFastFlag("BuildLiveActivityCleanup", false)) and (not buildLiveActivity or not sharedFlagsModule.FFlagAppNavMyStatsTab) then
	buildLiveActivityControllerModule.bootstrap(false)
end
return {
	AssistantBuild = require(script.Components.ChatSheet.AssistantBuild),
	BuildModeLaunch = require(script.utils.BuildModeLaunch),
	BuildPage = require(script.BuildPage),
	BuildPillMenu = require(script.Components.BuildPillMenu.BuildPillMenu),
	BuildEventReceiver = require(script.BuildEventReceiver),
	GetAssistantBuildStore = require(script.Stores.GetAssistantBuildStore),
	GetCreatorAgentResumeStore = require(script.Stores.GetCreatorAgentResumeStore),
	GetPlayButtonStore = require(script.Stores.GetPlayButtonStore),
	mountBuildControls = require(script.mountBuildControls),
	mountChatSheet = require(script.mountChatSheet),
	mountCreatorAgentResumeToastReceiver = require(script.mountCreatorAgentResumeToastReceiver),
	mountPublishGameSheet = require(script.mountPublishGameSheet),
	["jest.config"] = script["jest.config"]
}