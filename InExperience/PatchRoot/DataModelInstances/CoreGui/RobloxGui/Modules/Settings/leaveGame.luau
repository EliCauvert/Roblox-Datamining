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
local fFlagRemoveExitModalModule = require(robloxGui.Modules.Settings.Flags.FFlagRemoveExitModal)
local fFlagVoiceVolumeControlsEnableVoiceVolumeImpressionsTelemetry = require(corePackagesService.Workspace.Packages.VoiceChatCore).Flags.GetFFlagVoiceVolumeControlsEnableVoiceVolumeImpressionsTelemetry()
local perfUtilsModule = require(robloxGui.Modules.Common.PerfUtils)
local cryoModule = require(corePackagesService.Packages.Cryo)
local messageBus = require(corePackagesService.Workspace.Packages.MessageBus).MessageBus
local surveyEventPublisherModule = require(corePackagesService.Workspace.Packages.OnPlatformSurveys.SurveyEventPublisher)
local webViewEventTypeModule = require(corePackagesService.Workspace.Packages.OnPlatformSurveys.WebViewEventType)
local var1 = require(script:FindFirstAncestor("Settings").Analytics.CoreGuiFinalStateAnalytics).new()
robloxGui:WaitForChild("Modules"):WaitForChild("TenFootInterface")
local getFFlagEnableInGameMenuDurationLoggerModule = require(robloxGui.Modules.Common.Flags.GetFFlagEnableInGameMenuDurationLogger)
local fFlagLeaveActionChromeShortcutTelemetryModule = require(robloxGui.Modules.Chrome.Flags.FFlagLeaveActionChromeShortcutTelemetry)
local getDefaultQualityLevel = require(corePackagesService.Workspace.Packages.AppCommonLib).GetDefaultQualityLevel
local constantsModule = require(robloxGui.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"))
local reactSchedulingTrackerModule = require(robloxGui.Modules.Common.ReactSchedulingTracker)
local var2 = if fFlagVoiceVolumeControlsEnableVoiceVolumeImpressionsTelemetry then require(robloxGui.Modules.VoiceChat.VoiceChatServiceManager).default else nil

return function(p1, p2)
	-- upvalues: fFlagEnableGameLeftMessage (ref), messageBus (ref), constantsModule (ref), getFFlagEnableInGameMenuDurationLoggerModule (ref), perfUtilsModule (ref), reactSchedulingTrackerModule (ref), corePackagesService (ref), guiService (ref), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (ref), rbxAnalyticsService (ref), fFlagLeaveActionChromeShortcutTelemetryModule (ref), cryoModule (ref), fFlagSurvBloxEventTypeEnabled (ref), surveyEventPublisherModule (ref), webViewEventTypeModule (ref), playersService (ref), var1 (ref), fFlagVoiceVolumeControlsEnableVoiceVolumeImpressionsTelemetry (ref), var2 (ref), runService (ref), fFlagRemoveExitModalModule (ref), getDefaultQualityLevel (ref)
	if fFlagEnableGameLeftMessage and (not p2 or not p2.inhibitAppRating) then
		messageBus.publish(constantsModule.OnAppRatingPromptEventDescriptor, { gameTime = game:getGameTime() })
	end
	if getFFlagEnableInGameMenuDurationLoggerModule() then
		perfUtilsModule.leavingGame()
	end
	reactSchedulingTrackerModule:reportSession()
	local var3 = require(corePackagesService.Workspace.Packages.Memory).MemoryTracker()
	
	if var3 then
		var3:destroy()
	end
	guiService.SelectedCoreObject = nil
	local t = {
		confirmed = constantsModule.AnalyticsConfirmedName,
		universeid = tostring(game.GameId),
		source = constantsModule.AnalyticsLeaveGameSource,
		playsessionid = if rbxAnalyticsServiceExposePlaySessionIdEngineFeature then rbxAnalyticsService:GetPlaySessionId() else ""
	}
	
	if fFlagLeaveActionChromeShortcutTelemetryModule and p2 and p2.telemetryFields then
		t = cryoModule.Dictionary.join(t, p2.telemetryFields)
	end
	rbxAnalyticsService:SetRBXEventStream(constantsModule.AnalyticsTargetName, if p2 and p2.telemetryContext then p2.telemetryContext else constantsModule.AnalyticsInGameMenuName, constantsModule.AnalyticsLeaveGameName, t)
	
	if p1 then
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
	var1:sendCoreGuiFinalAnalytic()
	
	if fFlagVoiceVolumeControlsEnableVoiceVolumeImpressionsTelemetry then
		var2:ReportVoiceVolumeImpressionsIfNeeded()
	end
	runService.RenderStepped:wait()
	runService.RenderStepped:wait()
	
	if not fFlagRemoveExitModalModule or not p2 or not p2.shouldNativeExit then
		game:Shutdown()
	end
	settings().Rendering.QualityLevel = getDefaultQualityLevel()
	
	if fFlagRemoveExitModalModule and p2 and p2.shouldNativeExit then
		guiService:BroadcastNotification("", guiService:GetNotificationTypeList().NATIVE_EXIT)
	end
end