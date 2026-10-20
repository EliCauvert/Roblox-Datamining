local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local DashModule = require(Parent1.Dash)
local ReactModule = require(Parent1.React)
local RoactUtilsModule = require(Parent1.RoactUtils)
local SocialStopwatchModule = require(Parent1.SocialStopwatch)
local UIBloxModule = require(Parent1.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local Toast = UIBloxModule.App.Dialog.Toast
local UseAnalyticsModule = require(Parent.Analytics.useAnalytics)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local CapturesToastTypeModule = require(Parent.Enums.CapturesToastType)
local CaptureTypeModule = require(Parent.Enums.CaptureType)
local CarouselOpenedModule = require(Parent.Actions.CarouselOpened)
local ConstantsModule = require(Parent.Constants)
local EventNamesModule = require(Parent.Analytics.EventNames)
local ExternalShareSourceTypeModule = require(Parent.Enums.ExternalShareSourceType)
local ShareCaptureModule = require(Parent.Thunks.ShareCapture)
local StartMomentsCreationFlowModule = require(Parent.Thunks.StartMomentsCreationFlow)
local ToastVanishedModule = require(Parent.Actions.ToastVanished)
local _ = require(Parent.Types)
local ToastControllerModule = require(script.Parent.ToastController)
local SharedFlagsModule = require(Parent1.SharedFlags)
local FFlagBuildExperienceInGameCaptureToChat = SharedFlagsModule.FFlagBuildExperienceInGameCaptureToChat
local FFlagMomentsCreationFeatureGate = SharedFlagsModule.FFlagMomentsCreationFeatureGate
local GetMomentsCapabilitiesFunction = require(Parent1.MomentsCommon).Stores.GetMomentsCapabilities
local FFlagCreateMomentsToastModule = require(Parent.Flags.FFlagCreateMomentsToast)
local FFlagEnableCapturesGalleryRetrievalCoreScriptModule = require(Parent.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript)
local IsPlatformMatch: boolean = UserInputService:GetPlatform() == Enum.Platform.Windows or UserInputService:GetPlatform() == Enum.Platform.OSX

local function _(p1): boolean
	-- upvalues: FFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), CaptureTypeModule (copy)
	if p1 then
		local CaptureInfo = p1.captureInfo
		
		return if CaptureInfo then if FFlagEnableCapturesGalleryRetrievalCoreScriptModule then CaptureInfo.CaptureType == Enum.CaptureType.Video else CaptureInfo.type == CaptureTypeModule.Video else false
	else
		return false
	end
end

local config = {
	[CapturesToastTypeModule.CaptureSavedToDevice] = {
		toastTitleKey = "captureSavedToDevice",
		iconImage = Images["icons/status/success"],
		onActivated = if IsPlatformMatch then function(p1, _, p2)
			-- upvalues: EventNamesModule (copy), FFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), CaptureTypeModule (copy)
			p1.fireEvent(EventNamesModule.CapturesSavedToDeviceToastOpenButtonActivated)
			local IsCaptureTypeMatch = nil
			
			if p2 then
				local CaptureInfo = p2.captureInfo
				IsCaptureTypeMatch = if CaptureInfo then if FFlagEnableCapturesGalleryRetrievalCoreScriptModule then CaptureInfo.CaptureType == Enum.CaptureType.Video else CaptureInfo.type == CaptureTypeModule.Video else false
			else
				IsCaptureTypeMatch = false
			end
			if IsCaptureTypeMatch then
				game:OpenVideosFolder()
				
				return
			else
				game:OpenScreenshotsFolder()
			end
		end else nil,
		toastCTAKey = if IsPlatformMatch then "openInFiles" else nil
	},
	[CapturesToastTypeModule.CaptureTaken] = {
		toastCTAKey = "shareAction",
		toastSubtitleKey = "shareCaptureDescription",
		toastTitleKey = "captureSaved",
		iconImage = Images["icons/controls/screenshot"],
		onActivated = function(p1, Callback: (any) -> (), p2)
			-- upvalues: EventNamesModule (copy), FFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), CaptureTypeModule (copy), SocialStopwatchModule (copy), ShareCaptureModule (copy), ExternalShareSourceTypeModule (copy)
			p1.fireEvent(EventNamesModule.CapturesShareToastButtonActivated)
			local IsCaptureTypeMatch = nil
			
			if p2 then
				local CaptureInfo = p2.captureInfo
				IsCaptureTypeMatch = if CaptureInfo then if FFlagEnableCapturesGalleryRetrievalCoreScriptModule then CaptureInfo.CaptureType == Enum.CaptureType.Video else CaptureInfo.type == CaptureTypeModule.Video else false
			else
				IsCaptureTypeMatch = false
			end
			if IsCaptureTypeMatch then
				p1.fireEvent(EventNamesModule.CapturesVideoShareToastButtonActivated)
			end
			if p2 and p2.captureInfo then
				if not SocialStopwatchModule.Stopwatch.get(SocialStopwatchModule.Events.CaptureShared) then
					SocialStopwatchModule.Stopwatch.start(SocialStopwatchModule.Events.CaptureShared)
				end
				Callback(ShareCaptureModule(p2.captureInfo, ExternalShareSourceTypeModule.Toast))
			end
		end
	},
	[CapturesToastTypeModule.CaptureTakenWithAction] = {
		toastTitleKey = "captureSaved",
		iconImage = Images["icons/controls/screenshot"],
		onActivated = function(_, _, p1)
			if p1 and p1.toastAction and p1.captureInfo then
				p1.toastAction.onActivated(p1.captureInfo)
			end
		end
	},
	[CapturesToastTypeModule.CapturesActivated] = {
		toastTitleKey = "capturesEnabled",
		iconImage = Images["icons/status/success"]
	},
	[CapturesToastTypeModule.CaptureTakenWithMomentsCTA] = {
		duration = if FFlagCreateMomentsToastModule then 5 else nil
	},
	[CapturesToastTypeModule.MomentProcessing] = {},
	[CapturesToastTypeModule.VideoCaptureFailed] = {
		toastTitleKey = "videoCaptureFailed",
		iconImage = Images["icons/status/alert"]
	},
	[CapturesToastTypeModule.VideoCaptureInitializationCapturingAlreadyError] = {
		toastTitleKey = "videoCaptureInitializationCapturingAlreadyError",
		iconImage = Images["icons/status/alert"]
	},
	[CapturesToastTypeModule.VideoCaptureInitializationNoDeviceSupportError] = {
		toastTitleKey = "videoCaptureInitializationNoDeviceSupportError",
		iconImage = Images["icons/status/alert"]
	},
	[CapturesToastTypeModule.VideoCaptureInitializationNoSpaceOnDeviceError] = {
		toastTitleKey = "videoCaptureInitializationNoSpaceOnDeviceError",
		iconImage = Images["icons/status/alert"]
	},
	[CapturesToastTypeModule.VideoCaptureInitializationOtherError] = {
		toastTitleKey = "videoCaptureInitializationOtherError",
		iconImage = Images["icons/status/alert"]
	},
	[CapturesToastTypeModule.VideoCaptureOtherError] = {
		toastTitleKey = "videoCaptureOtherError",
		iconImage = Images["icons/status/alert"]
	},
	[CapturesToastTypeModule.ViewCapture] = {
		toastCTAKey = "viewAction",
		toastTitleKey = "captureSaved",
		iconImage = Images["icons/controls/screenshot"],
		onActivated = function(p1, Callback: (any) -> ())
			-- upvalues: EventNamesModule (copy), CarouselOpenedModule (copy)
			p1.fireEvent(EventNamesModule.CapturesViewToastButtonActivated)
			Callback(CarouselOpenedModule(1))
		end
	}
}

return function(_)
	-- upvalues: UseAnalyticsModule (copy), UseDispatchFunction (copy), UseLocalizationFunction (copy), UseSelectorFunction (copy), ConstantsModule (copy), ReactModule (copy), CapturesToastTypeModule (copy), config (copy), ToastVanishedModule (copy), FFlagBuildExperienceInGameCaptureToChat (copy), DashModule (copy), FFlagMomentsCreationFeatureGate (copy), GetMomentsCapabilitiesFunction (copy), FFlagCreateMomentsToastModule (copy), ToastControllerModule (copy), HttpService (copy), StartMomentsCreationFlowModule (copy), EventNamesModule (copy), Toast (copy)
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		captureSaved = "Feature.Captures.Toast.CaptureSaved",
		captureSavedToDevice = "Feature.Captures.Toast.CaptureSavedToDevice",
		capturesEnabled = "Feature.Captures.Toast.CapturesEnabled",
		createAction = "Feature.Captures.Action.Create",
		discoverPostWatch = "Feature.Captures.Description.DiscoverPostWatch",
		momentProcessingDescription = "Feature.Captures.Description.MomentProcessing",
		momentProcessingTitle = "Feature.Captures.Toast.MomentProcessing",
		momentsTitle = "Feature.Captures.Toast.CreateMoment2",
		openInFiles = "Feature.Captures.Action.OpenInFiles",
		shareAction = "Feature.Captures.Action.Share",
		shareCaptureDescription = "Feature.Captures.Description.ShareCTA",
		videoCaptureFailed = "Feature.Captures.Toast.VideoCaptureFailed",
		videoCaptureInitializationCapturingAlreadyError = "Feature.Captures.Toast.VideoCaptureInitializationCapturingAlreadyError",
		videoCaptureInitializationNoDeviceSupportError = "Feature.Captures.Toast.VideoCaptureInitializationNoDeviceSupportError",
		videoCaptureInitializationNoSpaceOnDeviceError = "Feature.Captures.Toast.VideoCaptureInitializationNoSpaceOnDeviceError",
		videoCaptureInitializationOtherError = "Feature.Captures.Toast.VideoCaptureInitializationOtherError",
		videoCaptureOtherError = "Feature.Captures.Toast.VideoCaptureOtherError",
		viewAction = "Feature.Captures.Action.ViewCapture"
	})
	local UseSelectorResult = UseSelectorFunction(function(p1)
		-- upvalues: ConstantsModule (upval)
		return p1[ConstantsModule.RoduxKey].Toast.ToastType
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p1)
		-- upvalues: ConstantsModule (upval)
		return p1[ConstantsModule.RoduxKey].Toast.ToastConfig
	end)
	local UseSelectorResult2 = UseSelectorFunction(function(p1)
		-- upvalues: ConstantsModule (upval)
		return p1[ConstantsModule.RoduxKey].Toast.IsDismissed
	end)
	local UseResult = ReactModule.useCallback(function(p1)
		-- upvalues: UseLocalizationResult (copy)
		return if p1 then UseLocalizationResult[p1] else nil
	end)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseSelectorResult (copy), CapturesToastTypeModule (upval), config (upval), UseDispatchResult (copy), ToastVanishedModule (upval), UseAnalyticsModuleResult (copy), UseSelectorResult1 (copy), ConstantsModule (upval), UseResult (copy), FFlagBuildExperienceInGameCaptureToChat (upval), DashModule (upval)
		if UseSelectorResult == CapturesToastTypeModule.None then
			return nil
		else
			local Entry = config[UseSelectorResult]
			
			return DashModule.join(Entry, {
				buttonText = if FFlagBuildExperienceInGameCaptureToChat and UseSelectorResult1 and UseSelectorResult1.toastAction then UseSelectorResult1.toastAction.text else UseResult(Entry.toastCTAKey),
				duration = Entry.duration or ConstantsModule.ToastDuration,
				onActivated = if Entry.onActivated then function()
					-- upvalues: Entry (copy), UseAnalyticsModuleResult (upval), UseDispatchResult (upval), UseSelectorResult1 (upval), UseSelectorResult (copy), UseSelectorResult (upval), ToastVanishedModule (upval)
					Entry.onActivated(UseAnalyticsModuleResult, UseDispatchResult, UseSelectorResult1)
					
					if UseSelectorResult == UseSelectorResult then
						UseDispatchResult(ToastVanishedModule())
					end
				end else nil,
				onDismissed = function()
					-- upvalues: UseSelectorResult (copy), UseSelectorResult (upval), UseDispatchResult (upval), ToastVanishedModule (upval)
					if UseSelectorResult == UseSelectorResult then
						UseDispatchResult(ToastVanishedModule())
					end
				end,
				toastCTAKey = DashModule.None,
				toastSubtitle = UseResult(Entry.toastSubtitleKey),
				toastSubtitleKey = DashModule.None,
				toastTitle = UseResult(Entry.toastTitleKey),
				toastTitleKey = DashModule.None
			})
		end
	end, { UseSelectorResult, UseSelectorResult1 })
	
	return if UseMemoResult then if FFlagMomentsCreationFeatureGate and UseSelectorResult == CapturesToastTypeModule.CaptureTakenWithMomentsCTA and not GetMomentsCapabilitiesFunction(false).getCanCreateMoments(false) then nil elseif FFlagCreateMomentsToastModule then if UseSelectorResult == CapturesToastTypeModule.CaptureTakenWithMomentsCTA then ReactModule.createElement(ToastControllerModule, {
		icon = "icons/brands/moments_large",
		title = UseResult("momentsTitle"),
		text = UseResult("discoverPostWatch"),
		actionText = UseResult("createAction"),
		onAction = function()
			-- upvalues: UseSelectorResult1 (copy), HttpService (upval), UseDispatchResult (copy), StartMomentsCreationFlowModule (upval), UseAnalyticsModuleResult (copy), EventNamesModule (upval)
			if UseSelectorResult1 and UseSelectorResult1.captureInfo then
				local Guid = HttpService:GenerateGUID(false)
				UseDispatchResult(StartMomentsCreationFlowModule(UseSelectorResult1.captureInfo, Guid))
				UseAnalyticsModuleResult.fireEvent(EventNamesModule.XExpMomentCreationStarted, { creationSessionId = Guid })
			end
			UseAnalyticsModuleResult.fireEvent(EventNamesModule.CapturesCreateMomentToastButtonActivated)
		end,
		onDismissed = function()
			-- upvalues: UseDispatchResult (copy), ToastVanishedModule (upval)
			UseDispatchResult(ToastVanishedModule())
		end,
		duration = UseMemoResult.duration,
		show = not UseSelectorResult2
	}) elseif UseSelectorResult == CapturesToastTypeModule.MomentProcessing then ReactModule.createElement(ToastControllerModule, {
		icon = "icons/brands/moments_large",
		title = UseResult("momentProcessingTitle"),
		text = UseResult("momentProcessingDescription"),
		onDismissed = function()
			-- upvalues: UseDispatchResult (copy), ToastVanishedModule (upval)
			UseDispatchResult(ToastVanishedModule())
		end,
		duration = UseMemoResult.duration,
		show = not UseSelectorResult2
	}) else ReactModule.createElement(ReactModule.Fragment, {}, {
		[UseSelectorResult] = ReactModule.createElement(Toast, {
			duration = UseMemoResult.duration,
			show = not UseSelectorResult2,
			toastContent = UseMemoResult
		})
	}) else ReactModule.createElement(ReactModule.Fragment, {}, {
		[UseSelectorResult] = ReactModule.createElement(Toast, {
			duration = UseMemoResult.duration,
			show = not UseSelectorResult2,
			toastContent = UseMemoResult
		})
	}) else nil
end