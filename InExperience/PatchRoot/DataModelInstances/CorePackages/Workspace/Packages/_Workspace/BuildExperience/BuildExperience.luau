return {
	AssistantBuild = require(script.Components.ChatSheet.AssistantBuild),
	BuildModeLaunch = require(script.utils.BuildModeLaunch),
	BuildPage = require(script.BuildPage),
	BuildPillMenu = require(script.Components.BuildPillMenu.BuildPillMenu),
	BuildPillMenuPortalHost = require(script.Components.BuildPillMenu.BuildPillMenuPortalHost),
	BuildEventReceiver = require(script.BuildEventReceiver),
	GetBuildPillMenuPortalStore = require(script.Stores.GetBuildPillMenuPortalStore),
	GetAssistantBuildStore = require(script.Stores.GetAssistantBuildStore),
	GetCreatorAgentResumeStore = require(script.Stores.GetCreatorAgentResumeStore),
	GetPlayButtonStore = require(script.Stores.GetPlayButtonStore),
	mountBuildControls = require(script.mountBuildControls),
	mountChatSheet = require(script.mountChatSheet),
	mountCreatorAgentResumeToastReceiver = require(script.mountCreatorAgentResumeToastReceiver),
	mountPublishGameSheet = require(script.mountPublishGameSheet),
	sendBuildExperienceEvent = require(script.Telemetry.sendBuildExperienceEvent),
	UnpublishedPlaytestModeTooltip = require(script.Components.UnpublishedPlaytestModeTooltip.UnpublishedPlaytestModeTooltip),
	["jest.config"] = script["jest.config"]
}