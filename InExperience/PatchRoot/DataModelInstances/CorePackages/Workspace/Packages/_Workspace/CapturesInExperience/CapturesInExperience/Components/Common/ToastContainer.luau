local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local httpService = game:GetService("HttpService")
local userInputService = game:GetService("UserInputService")
local dashModule = require(parent_1.Dash)
local localizationModule = require(parent_1.Localization)
local reactModule = require(parent_1.React)
local roactUtilsModule = require(parent_1.RoactUtils)
local socialStopwatchModule = require(parent_1.SocialStopwatch)
local UIBloxModule = require(parent_1.UIBlox)
local images = UIBloxModule.App.ImageSet.Images
local toast = UIBloxModule.App.Dialog.Toast
local useAnalyticsModule = require(parent.Analytics.useAnalytics)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useLocalization = localizationModule.Hooks.useLocalization
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local capturesToastTypeModule = require(parent.Enums.CapturesToastType)
local captureTypeModule = require(parent.Enums.CaptureType)
local carouselOpenedModule = require(parent.Actions.CarouselOpened)
local constantsModule = require(parent.Constants)
local eventNamesModule = require(parent.Analytics.EventNames)
local externalShareSourceTypeModule = require(parent.Enums.ExternalShareSourceType)
local shareCaptureModule = require(parent.Thunks.ShareCapture)
local startMomentsCreationFlowModule = require(parent.Thunks.StartMomentsCreationFlow)
local toastVanishedModule = require(parent.Actions.ToastVanished)
local _ = require(parent.Types)
local toastControllerModule = require(script.Parent.ToastController)
local fFlagCreateMomentsToastModule = require(parent.Flags.FFlagCreateMomentsToast)
local fFlagEnableCapturesGalleryRetrievalCoreScriptModule = require(parent.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript)
local _ = {
	captureSaved = "captureSaved",
	captureSavedToDevice = "captureSavedToDevice",
	capturesEnabled = "capturesEnabled",
	createAction = "createAction",
	discoverPostWatch = "discoverPostWatch",
	momentProcessingDescription = "momentProcessingDescription",
	momentProcessingTitle = "momentProcessingTitle",
	momentsTitle = "momentsTitle",
	openInFiles = "openInFiles",
	shareAction = "shareAction",
	shareCaptureDescription = "shareCaptureDescription",
	videoCaptureFailed = "videoCaptureFailed",
	videoCaptureInitializationCapturingAlreadyError = "videoCaptureInitializationCapturingAlreadyError",
	videoCaptureInitializationNoDeviceSupportError = "videoCaptureInitializationNoDeviceSupportError",
	videoCaptureInitializationNoSpaceOnDeviceError = "videoCaptureInitializationNoSpaceOnDeviceError",
	videoCaptureInitializationOtherError = "videoCaptureInitializationOtherError",
	videoCaptureOtherError = "videoCaptureOtherError",
	viewAction = "viewAction"
}
local var21 = if userInputService:GetPlatform() ~= Enum.Platform.Windows then userInputService:GetPlatform() == Enum.Platform.OSX else true

local function _(p0)
	-- upvalues: fFlagEnableCapturesGalleryRetrievalCoreScriptModule (ref), captureTypeModule (ref)
	if not p0 then
		return false
	end
	local captureInfo = p0.captureInfo
	
	return if captureInfo then if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then captureInfo.CaptureType == Enum.CaptureType.Video else captureInfo.type == captureTypeModule.Video else false
end

local t = {
	[capturesToastTypeModule.CaptureSavedToDevice] = {
		toastTitleKey = "captureSavedToDevice",
		iconImage = images["icons/status/success"],
		onActivated = if var21 then function(p1, _, p2)
			-- upvalues: eventNamesModule (ref), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (ref), captureTypeModule (ref)
			local var23
			p1.fireEvent(eventNamesModule.CapturesSavedToDeviceToastOpenButtonActivated)
			
			if p2 then
				local captureInfo = p2.captureInfo
				
				if not captureInfo then
					var23 = false
				elseif fFlagEnableCapturesGalleryRetrievalCoreScriptModule then
					var23 = captureInfo.CaptureType == Enum.CaptureType.Video
					var23 = nil
				else
					var23 = captureInfo.type == captureTypeModule.Video
				end
			else
				var23 = false
			end
			if var23 then
				game:OpenVideosFolder()
				
				return
			end
			game:OpenScreenshotsFolder()
		end else nil,
		toastCTAKey = if var21 then "openInFiles" else nil
	},
	[capturesToastTypeModule.CaptureTaken] = {
		toastCTAKey = "shareAction",
		toastSubtitleKey = "shareCaptureDescription",
		toastTitleKey = "captureSaved",
		iconImage = images["icons/controls/screenshot"],
		onActivated = function(p3, p4, p5)
			-- upvalues: eventNamesModule (ref), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (ref), captureTypeModule (ref), socialStopwatchModule (ref), shareCaptureModule (ref), externalShareSourceTypeModule (ref)
			local var24
			p3.fireEvent(eventNamesModule.CapturesShareToastButtonActivated)
			
			if p5 then
				local captureInfo = p5.captureInfo
				
				if not captureInfo then
					var24 = false
				elseif fFlagEnableCapturesGalleryRetrievalCoreScriptModule then
					var24 = captureInfo.CaptureType == Enum.CaptureType.Video
					var24 = nil
				else
					var24 = captureInfo.type == captureTypeModule.Video
				end
			else
				var24 = false
			end
			if var24 then
				p3.fireEvent(eventNamesModule.CapturesVideoShareToastButtonActivated)
			end
			if p5 and p5.captureInfo then
				if not socialStopwatchModule.Stopwatch.get(socialStopwatchModule.Events.CaptureShared) then
					socialStopwatchModule.Stopwatch.start(socialStopwatchModule.Events.CaptureShared)
				end
				p4(shareCaptureModule(p5.captureInfo, externalShareSourceTypeModule.Toast))
			end
		end
	},
	[capturesToastTypeModule.CapturesActivated] = {
		toastTitleKey = "capturesEnabled",
		iconImage = images["icons/status/success"]
	},
	[capturesToastTypeModule.CaptureTakenWithMomentsCTA] = {
		duration = if fFlagCreateMomentsToastModule then 5 else nil
	},
	[capturesToastTypeModule.MomentProcessing] = {},
	[capturesToastTypeModule.VideoCaptureFailed] = {
		toastTitleKey = "videoCaptureFailed",
		iconImage = images["icons/status/alert"]
	},
	[capturesToastTypeModule.VideoCaptureInitializationCapturingAlreadyError] = {
		toastTitleKey = "videoCaptureInitializationCapturingAlreadyError",
		iconImage = images["icons/status/alert"]
	},
	[capturesToastTypeModule.VideoCaptureInitializationNoDeviceSupportError] = {
		toastTitleKey = "videoCaptureInitializationNoDeviceSupportError",
		iconImage = images["icons/status/alert"]
	},
	[capturesToastTypeModule.VideoCaptureInitializationNoSpaceOnDeviceError] = {
		toastTitleKey = "videoCaptureInitializationNoSpaceOnDeviceError",
		iconImage = images["icons/status/alert"]
	},
	[capturesToastTypeModule.VideoCaptureInitializationOtherError] = {
		toastTitleKey = "videoCaptureInitializationOtherError",
		iconImage = images["icons/status/alert"]
	},
	[capturesToastTypeModule.VideoCaptureOtherError] = {
		toastTitleKey = "videoCaptureOtherError",
		iconImage = images["icons/status/alert"]
	},
	[capturesToastTypeModule.ViewCapture] = {
		toastCTAKey = "viewAction",
		toastTitleKey = "captureSaved",
		iconImage = images["icons/controls/screenshot"],
		onActivated = function(p6, p7)
			-- upvalues: eventNamesModule (ref), carouselOpenedModule (ref)
			p6.fireEvent(eventNamesModule.CapturesViewToastButtonActivated)
			p7(carouselOpenedModule(1))
		end
	}
}

return function(_)
	-- upvalues: useAnalyticsModule (ref), useDispatch (ref), useLocalization (ref), useSelector (ref), constantsModule (ref), reactModule (ref), capturesToastTypeModule (ref), t (ref), toastVanishedModule (ref), dashModule (ref), fFlagCreateMomentsToastModule (ref), toastControllerModule (ref), httpService (ref), startMomentsCreationFlowModule (ref), eventNamesModule (ref), toast (ref)
	local var25 = useAnalyticsModule()
	local var26 = useDispatch()
	local var27 = useLocalization({
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
	local var28 = useSelector(function(p8)
		-- upvalues: constantsModule (copy)
		return p8[constantsModule.RoduxKey].Toast.ToastType
	end)
	local var29 = useSelector(function(p9)
		-- upvalues: constantsModule (copy)
		return p9[constantsModule.RoduxKey].Toast.ToastConfig
	end)
	local var30 = useSelector(function(p10)
		-- upvalues: constantsModule (copy)
		return p10[constantsModule.RoduxKey].Toast.IsDismissed
	end)
	local var31 = reactModule.useCallback(function(p11)
		-- upvalues: var27 (ref)
		return if p11 then var27[p11] else nil
	end)
	local var32 = reactModule.useMemo(function()
		-- upvalues: var28 (ref), capturesToastTypeModule (copy), t (copy), var26 (ref), toastVanishedModule (copy), var25 (ref), var29 (ref), constantsModule (copy), dashModule (copy), var31 (ref)
		if var28 == capturesToastTypeModule.None then
			return nil
		end
		local var33 = t[var28]
		
		return dashModule.join(var33, {
			buttonText = var31(var33.toastCTAKey),
			duration = var33.duration or constantsModule.ToastDuration,
			onActivated = if var33.onActivated then function()
				-- upvalues: var33 (ref), var25 (copy), var26 (copy), var29 (copy), var28 (ref), var28 (copy), toastVanishedModule (copy)
				var33.onActivated(var25, var26, var29)
				
				if var28 == var28 then
					var26(toastVanishedModule())
				end
			end else nil,
			onDismissed = function()
				-- upvalues: var28 (ref), var28 (copy), var26 (copy), toastVanishedModule (copy)
				if var28 == var28 then
					var26(toastVanishedModule())
				end
			end,
			toastCTAKey = dashModule.None,
			toastSubtitle = var31(var33.toastSubtitleKey),
			toastSubtitleKey = dashModule.None,
			toastTitle = var31(var33.toastTitleKey),
			toastTitleKey = dashModule.None
		})
	end, { var28, var29 })
	
	return if var32 then if fFlagCreateMomentsToastModule then if var28 == capturesToastTypeModule.CaptureTakenWithMomentsCTA then reactModule.createElement(toastControllerModule, {
		icon = "icons/brands/moments_large",
		title = var31("momentsTitle"),
		text = var31("discoverPostWatch"),
		actionText = var31("createAction"),
		onAction = function()
			-- upvalues: var29 (ref), httpService (copy), var26 (ref), startMomentsCreationFlowModule (copy), var25 (ref), eventNamesModule (copy)
			if var29 and var29.captureInfo then
				local var34 = httpService:GenerateGUID(false)
				var26(startMomentsCreationFlowModule(var29.captureInfo, var34))
				var25.fireEvent(eventNamesModule.XExpMomentCreationStarted, { creationSessionId = var34 })
			end
			var25.fireEvent(eventNamesModule.CapturesCreateMomentToastButtonActivated)
		end,
		onDismissed = function()
			-- upvalues: var26 (ref), toastVanishedModule (copy)
			var26(toastVanishedModule())
		end,
		duration = var32.duration,
		show = not var30
	}) elseif var28 == capturesToastTypeModule.MomentProcessing then reactModule.createElement(toastControllerModule, {
		icon = "icons/brands/moments_large",
		title = var31("momentProcessingTitle"),
		text = var31("momentProcessingDescription"),
		onDismissed = function()
			-- upvalues: var26 (ref), toastVanishedModule (copy)
			var26(toastVanishedModule())
		end,
		duration = var32.duration,
		show = not var30
	}) else reactModule.createElement(reactModule.Fragment, {}, {
		[var28] = reactModule.createElement(toast, {
			duration = var32.duration,
			show = not var30,
			toastContent = var32
		})
	}) else reactModule.createElement(reactModule.Fragment, {}, {
		[var28] = reactModule.createElement(toast, {
			duration = var32.duration,
			show = not var30,
			toastContent = var32
		})
	}) else nil
end