local Parent = script:FindFirstAncestor("BugReporting").Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseUserExperimentFunction = require(Parent.RoactAppExperiment).useUserExperiment
local AppUserLayers = require(Parent.ExperimentLayers).AppUserLayers
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local SetCentralOverlayFunction = require(Parent.CentralOverlay).Actions.SetCentralOverlay
local ScreenshotManager = require(Parent.TnSScreenshot).ScreenshotManager
local Signal = require(Parent.AppCommonLib).Signal
local _ = require(Parent.SystemInfoProtocol)
local SetCurrentToastMessageFunction = require(Parent.ToastRodux).Actions.SetCurrentToastMessage
local ReportDeviceLogsFunction = require(Parent.LogReporting).reportDeviceLogs
local MutedErrorFunction = require(Parent.Loggers).mutedError
local BugReporterCounterName = require(script.Parent.BugReporterTypes).BugReporterCounterName
local PostBugReportApiModule = require(script.Parent.api.postBugReportApi)
local SharedConstantsModule = require(script.Parent.SharedConstants)
local DependenciesModule = require(script.Parent.dependencies)
local BugReporterService = DependenciesModule.bugReporterService
local GuiService = DependenciesModule.guiService
local LoggingProtocol = DependenciesModule.loggingProtocol
local LogReporterService = DependenciesModule.logReporterService
local RunService = DependenciesModule.runService
local UserInputService = DependenciesModule.userInputService
local VoiceChatService = DependenciesModule.voiceChatService
local SystemInfoProtocol = DependenciesModule.systemInfoProtocol
local LocalPlayer = DependenciesModule.localPlayer
local GetPlaceIdFunction = DependenciesModule.getPlaceId
local MakeLoggerFunction = DependenciesModule.makeLogger
local Networking = DependenciesModule.networking
local InAppBugReporterIxpEnabled = game:DefineFastFlag("InAppBugReporterIxpEnabled", false)
local InAppBugReporterIxpBypass = game:DefineFastFlag("InAppBugReporterIxpBypass", false)

local function _(p1, UserId)
	local Success, Result = pcall(function()
		-- upvalues: UserId (copy), p1 (copy)
		return if UserId then p1:IsVoiceEnabledForUserIdAsync(UserId) else false
	end)
	
	return Success and Result
end

local _ = function(p1, UserId, p2, p3)
	-- upvalues: ReportDeviceLogsFunction (copy), MutedErrorFunction (copy)
	local Success, Result = pcall(function()
		-- upvalues: ReportDeviceLogsFunction (upval), p1 (copy), UserId (copy), p2 (copy), p3 (copy)
		return ReportDeviceLogsFunction(p1, UserId, p2, p3).url
	end)
	
	if not Success then
		MutedErrorFunction(`Failed to report device logs: {Result}`)
	end
	return Success and Result or ""
end

return ReactModule.memo(function()
	-- upvalues: UseDispatchFunction (copy), GetPlaceIdFunction (copy), InAppBugReporterIxpBypass (copy), InAppBugReporterIxpEnabled (copy), UseUserExperimentFunction (copy), AppUserLayers (copy), BugReporterService (copy), ReactModule (copy), LocalPlayer (copy), VoiceChatService (copy), LogReporterService (copy), ReportDeviceLogsFunction (copy), MutedErrorFunction (copy), BugReporterCounterName (copy), PostBugReportApiModule (copy), Networking (copy), DashModule (copy), SetCurrentToastMessageFunction (copy), MakeLoggerFunction (copy), LoggingProtocol (copy), Signal (copy), ScreenshotManager (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy), GuiService (copy), RunService (copy), UserInputService (copy), SystemInfoProtocol (copy), SharedConstantsModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local PlaceId = GetPlaceIdFunction()
	local IsAvailable = (if InAppBugReporterIxpBypass then true elseif InAppBugReporterIxpEnabled then UseUserExperimentFunction({ AppUserLayers.ConsumerPlatformsBugReporting }, function(p1)
		-- upvalues: AppUserLayers (upval)
		return (p1[AppUserLayers.ConsumerPlatformsBugReporting] or {}).inAppBugReportingEnabled or nil
	end) else nil) and (BugReporterService and BugReporterService:IsAvailable())
	local UseResult = ReactModule.useCallback(function(p1, p2)
		-- upvalues: LocalPlayer (upval), VoiceChatService (upval), LogReporterService (upval), PlaceId (copy), ReportDeviceLogsFunction (upval), MutedErrorFunction (upval), BugReporterCounterName (upval), PostBugReportApiModule (upval), Networking (upval), DashModule (upval), UseDispatchResult (copy), SetCurrentToastMessageFunction (upval)
		local UserId = LocalPlayer and LocalPlayer.UserId or 0
		local DisplayName = LocalPlayer and LocalPlayer.DisplayName or ""
		local Success, Result = pcall(function()
			-- upvalues: UserId (copy), VoiceChatService (copy)
			return if UserId then VoiceChatService:IsVoiceEnabledForUserIdAsync(UserId) else false
		end)
		local Result1 = Success and Result
		local Success1, Result2 = pcall(function()
			-- upvalues: ReportDeviceLogsFunction (upval), LogReporterService (copy), UserId (copy), PlaceId (copy), Result1 (copy)
			return ReportDeviceLogsFunction(LogReporterService, UserId, PlaceId, Result1).url
		end)
		
		if not Success1 then
			MutedErrorFunction(`Failed to report device logs: {Result2}`)
		end
		local Result2_1 = Success1 and Result2 or ""
		p1.reportCounter(BugReporterCounterName.ReportSubmitted)
		p1.reportMilestone(BugReporterCounterName.ReportSubmitted, { screen = p2.additionalInfo.screen })
		PostBugReportApiModule(Networking, DashModule.join(p2, {
			userId = UserId,
			userDisplayName = DisplayName,
			logUrl = Result2_1
		})):andThen(function(Result)
			-- upvalues: p1 (copy), BugReporterCounterName (upval), UseDispatchResult (upval), SetCurrentToastMessageFunction (upval)
			p1.reportCounter(BugReporterCounterName.ReportSucceeded)
			p1.reportMilestone(BugReporterCounterName.ReportSucceeded, { issueId = Result.issue.id })
			UseDispatchResult(SetCurrentToastMessageFunction({
				toastMessage = "Feature.InAppBugReporting.Message.ToastSuccess"
			}))
		end):catch(function(Err)
			-- upvalues: p1 (copy), p2 (copy), UseDispatchResult (upval), SetCurrentToastMessageFunction (upval)
			p1.reportError(Err.type, { screen = p2.additionalInfo.screen, message = Err.message })
			UseDispatchResult(SetCurrentToastMessageFunction({
				toastMessage = "Feature.InAppBugReporting.Message.ToastFailure"
			}))
		end)
	end, { UseDispatchResult, PlaceId })
	ReactModule.useEffect(function()
		-- upvalues: IsAvailable (copy), BugReporterService (upval), MakeLoggerFunction (upval), LoggingProtocol (upval), Signal (upval), BugReporterCounterName (upval), ScreenshotManager (upval), UseDispatchResult (copy), SetCentralOverlayFunction (upval), CentralOverlayType (upval), GuiService (upval), RunService (upval), UserInputService (upval), SystemInfoProtocol (upval), UseResult (copy), SharedConstantsModule (upval)
		local BugReportRequestedConnection = if IsAvailable and BugReporterService then BugReporterService.BugReportRequested:Connect(function(Trigger)
			-- upvalues: MakeLoggerFunction (upval), LoggingProtocol (upval), Signal (upval), BugReporterCounterName (upval), ScreenshotManager (upval), UseDispatchResult (upval), SetCentralOverlayFunction (upval), CentralOverlayType (upval), GuiService (upval), RunService (upval), UserInputService (upval), SystemInfoProtocol (upval), UseResult (upval), SharedConstantsModule (upval)
			local Logger = MakeLoggerFunction(LoggingProtocol, Trigger)
			local NewSignal = Signal.new()
			Logger.reportCounter(BugReporterCounterName.ReportInitiated)
			ScreenshotManager:TakeScreenshotWithCallback(function(ScreenshotRemoteId)
				-- upvalues: Logger (copy), BugReporterCounterName (upval), NewSignal (copy)
				Logger.reportCounter(BugReporterCounterName.ScreenshotUploaded, { screenshotRemoteId = ScreenshotRemoteId })
				NewSignal:fire(ScreenshotRemoteId)
			end, function(ScreenshotLocalId)
				-- upvalues: Logger (copy), BugReporterCounterName (upval), UseDispatchResult (upval), SetCentralOverlayFunction (upval), CentralOverlayType (upval), GuiService (upval), RunService (upval), UserInputService (upval), SystemInfoProtocol (upval), NewSignal (copy), UseResult (upval)
				Logger.reportCounter(BugReporterCounterName.ScreenshotCaptured, { screenshotLocalId = ScreenshotLocalId })
				UseDispatchResult(SetCentralOverlayFunction(CentralOverlayType.BugReporter, {
					guiService = GuiService,
					runService = RunService,
					userInputService = UserInputService,
					systemInfoProtocol = SystemInfoProtocol,
					screenshotLocalId = ScreenshotLocalId,
					onScreenshotUploaded = NewSignal,
					onSubmitBugReport = UseResult,
					logger = Logger
				}))
			end, SharedConstantsModule.SCREENSHOT_BUCKET)
		end) else nil
		
		return function()
			-- upvalues: BugReportRequestedConnection (ref)
			if BugReportRequestedConnection then
				BugReportRequestedConnection:Disconnect()
			end
		end
	end, { UseDispatchResult, IsAvailable, UseResult })
end)