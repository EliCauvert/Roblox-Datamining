local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local guiService = game:GetService("GuiService")
local runService = game:GetService("RunService")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local playersService = game:GetService("Players")
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local fFlagEnableGameLeftMessage = sharedFlagsModule.FFlagEnableGameLeftMessage
local fFlagSurvBloxEventTypeEnabled = sharedFlagsModule.FFlagSurvBloxEventTypeEnabled
local rbxAnalyticsServiceExposePlaySessionIdEngineFeature = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local perfUtilsModule = require(robloxGui.Modules.Common.PerfUtils)
local cryoModule = require(corePackagesService.Packages.Cryo)
local messageBus = require(corePackagesService.Workspace.Packages.MessageBus).MessageBus
local surveyEventPublisherModule = require(corePackagesService.Workspace.Packages.OnPlatformSurveys.SurveyEventPublisher)
local webViewEventTypeModule = require(corePackagesService.Workspace.Packages.OnPlatformSurveys.WebViewEventType)
local var12 = require(script:FindFirstAncestor("Settings").Analytics.CoreGuiFinalStateAnalytics).new()
robloxGui:WaitForChild("Modules"):WaitForChild("TenFootInterface")
local getFFlagEnableInGameMenuDurationLoggerModule = require(robloxGui.Modules.Common.Flags.GetFFlagEnableInGameMenuDurationLogger)
local fFlagLeaveActionChromeShortcutTelemetryModule = require(robloxGui.Modules.Chrome.Flags.FFlagLeaveActionChromeShortcutTelemetry)
local getDefaultQualityLevel = require(corePackagesService.Workspace.Packages.AppCommonLib).GetDefaultQualityLevel
local constantsModule = require(robloxGui.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"))
local reactSchedulingTrackerModule = require(robloxGui.Modules.Common.ReactSchedulingTracker)

return function(p0, p1) --[[ line: 43 ]]
	-- upvalues: fFlagEnableGameLeftMessage (ref), messageBus (ref), constantsModule (ref), getFFlagEnableInGameMenuDurationLoggerModule (ref), perfUtilsModule (ref), reactSchedulingTrackerModule (ref), corePackagesService (ref), guiService (ref), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (ref), rbxAnalyticsService (ref), fFlagLeaveActionChromeShortcutTelemetryModule (ref), cryoModule (ref), fFlagSurvBloxEventTypeEnabled (ref), surveyEventPublisherModule (ref), webViewEventTypeModule (ref), playersService (ref), var12 (ref), runService (ref), getDefaultQualityLevel (ref)
	if fFlagEnableGameLeftMessage then
		messageBus.publish(constantsModule.OnAppRatingPromptEventDescriptor, { gameTime = game:getGameTime() })
	end
	if getFFlagEnableInGameMenuDurationLoggerModule() then
		perfUtilsModule.leavingGame()
	end
	reactSchedulingTrackerModule:reportSession()
	local var17 = require(corePackagesService.Workspace.Packages.Memory).MemoryTracker()
	
	if var17 then
		var17:destroy()
	end
	guiService.SelectedCoreObject = nil
	local t = {
		confirmed = constantsModule.AnalyticsConfirmedName,
		universeid = tostring(game.GameId),
		source = constantsModule.AnalyticsLeaveGameSource,
		playsessionid = if rbxAnalyticsServiceExposePlaySessionIdEngineFeature then rbxAnalyticsService:GetPlaySessionId() else ""
	}
	
	if fFlagLeaveActionChromeShortcutTelemetryModule and p1 and p1.telemetryFields then
		t = cryoModule.Dictionary.join(t, p1.telemetryFields)
	end
	rbxAnalyticsService:SetRBXEventStream(constantsModule.AnalyticsTargetName, constantsModule.AnalyticsInGameMenuName, constantsModule.AnalyticsLeaveGameName, t)
	
	if p0 then
		if fFlagSurvBloxEventTypeEnabled then
			surveyEventPublisherModule.publishSurveyEvent(webViewEventTypeModule.LeaveButtonClick)
		else
			messageBus.publish(constantsModule.OnSurveyEventDescriptor, {
				eventType = constantsModule.SurveyEventType,
				userId = tostring(playersService.LocalPlayer.UserId),
				customProps = { chromeSeenCount = tostring(0) }
			})
		end
	end
	var12:sendCoreGuiFinalAnalytic()
	runService.RenderStepped:wait()
	runService.RenderStepped:wait()
	game:Shutdown()
	settings().Rendering.QualityLevel = getDefaultQualityLevel()
end