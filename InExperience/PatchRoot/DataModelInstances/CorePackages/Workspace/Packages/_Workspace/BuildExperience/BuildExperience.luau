return {
	AssistantBuild = require(script.Components.ChatSheet.AssistantBuild),
	BuildPage = require(script.BuildPage),
	BuildPillMenu = require(script.Components.BuildPillMenu.BuildPillMenu),
	BuildPillMenuPortalHost = require(script.Components.BuildPillMenu.BuildPillMenuPortalHost),
	BuildEventReceiver = require(script.BuildEventReceiver),
	GetBuildPillMenuPortalStore = require(script.Stores.GetBuildPillMenuPortalStore),
	GetAssistantBuildStore = require(script.Stores.GetAssistantBuildStore),
	GetCreatorAgentResumeStore = require(script.Stores.GetCreatorAgentResumeStore),
	GetModelLibraryStore = require(script.Stores.GetModelLibraryStore),
	GetPlayButtonStore = require(script.Stores.GetPlayButtonStore),
	createTeamCreateFreeCamera = require(script.createTeamCreateFreeCamera),
	mountChatSheet = require(script.mountChatSheet),
	mountCreatorAgentResumeToastReceiver = require(script.mountCreatorAgentResumeToastReceiver),
	mountModelLibrary = require(script.mountModelLibrary),
	sendBuildExperienceEvent = require(script.Telemetry.sendBuildExperienceEvent),
	UnpublishedPlaytestModeTooltip = require(script.Components.UnpublishedPlaytestModeTooltip.UnpublishedPlaytestModeTooltip),
	["jest.config"] = script["jest.config"]
}