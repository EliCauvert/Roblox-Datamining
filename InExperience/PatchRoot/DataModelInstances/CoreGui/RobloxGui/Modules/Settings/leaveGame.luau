local CorePackages = game:GetService("CorePackages")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local GuiService = game:GetService("GuiService")
local RunService = game:GetService("RunService")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local Players = game:GetService("Players")
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagEnableGameLeftMessage = SharedFlagsModule.FFlagEnableGameLeftMessage
local FFlagSurvBloxEventTypeEnabled = SharedFlagsModule.FFlagSurvBloxEventTypeEnabled
local RbxAnalyticsServiceExposePlaySessionIdEngineFeature = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local IsExitModalRemovedModule = require(RobloxGui.Modules.Settings.Flags.isExitModalRemoved)
local FFlagVoiceVolumeControlsEnableVoiceVolumeImpressionsTelemetry = require(CorePackages.Workspace.Packages.VoiceChatCore).Flags.GetFFlagVoiceVolumeControlsEnableVoiceVolumeImpressionsTelemetry()
local PerfUtilsModule = require(RobloxGui.Modules.Common.PerfUtils)
local CryoModule = require(CorePackages.Packages.Cryo)
local MessageBus = require(CorePackages.Workspace.Packages.MessageBus).MessageBus
local SurveyEventPublisherModule = require(CorePackages.Workspace.Packages.OnPlatformSurveys.SurveyEventPublisher)
local WebViewEventTypeModule = require(CorePackages.Workspace.Packages.OnPlatformSurveys.WebViewEventType)
local NewResult = require(script:FindFirstAncestor("Settings").Analytics.CoreGuiFinalStateAnalytics).new()
RobloxGui:WaitForChild("Modules"):WaitForChild("TenFootInterface")
local GetFFlagEnableInGameMenuDurationLoggerModule = require(RobloxGui.Modules.Common.Flags.GetFFlagEnableInGameMenuDurationLogger)
local FFlagLeaveActionChromeShortcutTelemetryModule = require(RobloxGui.Modules.Chrome.Flags.FFlagLeaveActionChromeShortcutTelemetry)
local GetDefaultQualityLevelFunction = require(CorePackages.Workspace.Packages.AppCommonLib).GetDefaultQualityLevel
local ConstantsModule = require(RobloxGui.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"))
local ReactSchedulingTrackerModule = require(RobloxGui.Modules.Common.ReactSchedulingTracker)
local Default = if FFlagVoiceVolumeControlsEnableVoiceVolumeImpressionsTelemetry then require(RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default else nil

return function(p1, p2) --[[ Line: 52 ]]
	-- upvalues: FFlagEnableGameLeftMessage (copy), MessageBus (copy), ConstantsModule (copy), GetFFlagEnableInGameMenuDurationLoggerModule (copy), PerfUtilsModule (copy), ReactSchedulingTrackerModule (copy), CorePackages (copy), GuiService (copy), RbxAnalyticsServiceExposePlaySessionIdEngineFeature (copy), RbxAnalyticsService (copy), FFlagLeaveActionChromeShortcutTelemetryModule (copy), CryoModule (copy), FFlagSurvBloxEventTypeEnabled (copy), SurveyEventPublisherModule (copy), WebViewEventTypeModule (copy), Players (copy), NewResult (copy), FFlagVoiceVolumeControlsEnableVoiceVolumeImpressionsTelemetry (copy), Default (copy), RunService (copy), IsExitModalRemovedModule (copy), GetDefaultQualityLevelFunction (copy)
	if FFlagEnableGameLeftMessage and (not p2 or not p2.inhibitAppRating) then
		MessageBus.publish(ConstantsModule.OnAppRatingPromptEventDescriptor, { gameTime = game:getGameTime() })
	end
	if GetFFlagEnableInGameMenuDurationLoggerModule() then
		PerfUtilsModule.leavingGame()
	end
	ReactSchedulingTrackerModule:reportSession()
	local MemoryTrackerResult = require(CorePackages.Workspace.Packages.Memory).MemoryTracker()
	
	if MemoryTrackerResult then
		MemoryTrackerResult:destroy()
	end
	GuiService.SelectedCoreObject = nil
	local JoinResult = {
		confirmed = ConstantsModule.AnalyticsConfirmedName,
		universeid = tostring(game.GameId),
		source = ConstantsModule.AnalyticsLeaveGameSource,
		playsessionid = if RbxAnalyticsServiceExposePlaySessionIdEngineFeature then RbxAnalyticsService:GetPlaySessionId() else ""
	}
	
	if FFlagLeaveActionChromeShortcutTelemetryModule and p2 and p2.telemetryFields then
		JoinResult = CryoModule.Dictionary.join(JoinResult, p2.telemetryFields)
	end
	RbxAnalyticsService:SetRBXEventStream(ConstantsModule.AnalyticsTargetName, if p2 and p2.telemetryContext then p2.telemetryContext else ConstantsModule.AnalyticsInGameMenuName, ConstantsModule.AnalyticsLeaveGameName, JoinResult)
	
	if p1 then
		if FFlagSurvBloxEventTypeEnabled then
			SurveyEventPublisherModule.publishSurveyEvent(WebViewEventTypeModule.LeaveButtonClick)
		else
			MessageBus.publish(ConstantsModule.OnSurveyEventDescriptor, {
				eventType = ConstantsModule.SurveyEventType,
				userId = tostring(Players.LocalPlayer.UserId),
				customProps = { chromeSeenCount = tostring(0) }
			})
		end
	end
	NewResult:sendCoreGuiFinalAnalytic()
	
	if FFlagVoiceVolumeControlsEnableVoiceVolumeImpressionsTelemetry then
		Default:ReportVoiceVolumeImpressionsIfNeeded()
	end
	RunService.RenderStepped:wait()
	RunService.RenderStepped:wait()
	
	if not IsExitModalRemovedModule or not p2 or not p2.shouldNativeExit then
		game:Shutdown()
	end
	settings().Rendering.QualityLevel = GetDefaultQualityLevelFunction()
	
	if IsExitModalRemovedModule and p2 and p2.shouldNativeExit then
		GuiService:BroadcastNotification("", GuiService:GetNotificationTypeList().NATIVE_EXIT)
	end
end