local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
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
local var20 = if userInputService:GetPlatform() ~= Enum.Platform.Windows then userInputService:GetPlatform() == Enum.Platform.OSX else true

local function _(p0) --[[ line: 74 | named "isVideoCapture" ]]
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
		onActivated = if var20 then function(p1, _, p2) --[[ line: 95 ]]
			-- upvalues: eventNamesModule (ref), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (ref), captureTypeModule (ref)
			local var22
			p1.fireEvent(eventNamesModule.CapturesSavedToDeviceToastOpenButtonActivated)
			
			if p2 then
				local captureInfo = p2.captureInfo
				
				if not captureInfo then
					var22 = false
				elseif fFlagEnableCapturesGalleryRetrievalCoreScriptModule then
					var22 = captureInfo.CaptureType == Enum.CaptureType.Video
					var22 = nil
				else
					var22 = captureInfo.type == captureTypeModule.Video
				end
			else
				var22 = false
			end
			if var22 then
				game:OpenVideosFolder()
				
				return
			end
			game:OpenScreenshotsFolder()
		end else nil,
		toastCTAKey = if var20 then "openInFiles" else nil
	},
	[capturesToastTypeModule.CaptureTaken] = {
		toastCTAKey = "shareAction",
		toastSubtitleKey = "shareCaptureDescription",
		toastTitleKey = "captureSaved",
		iconImage = images["icons/controls/screenshot"],
		onActivated = function(p3, p4, p5) --[[ line: 109 ]]
			-- upvalues: eventNamesModule (ref), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (ref), captureTypeModule (ref), socialStopwatchModule (ref), shareCaptureModule (ref), externalShareSourceTypeModule (ref)
			local var23
			p3.fireEvent(eventNamesModule.CapturesShareToastButtonActivated)
			
			if p5 then
				local captureInfo = p5.captureInfo
				
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
		onActivated = function(p6, p7) --[[ line: 159 ]]
			-- upvalues: eventNamesModule (ref), carouselOpenedModule (ref)
			p6.fireEvent(eventNamesModule.CapturesViewToastButtonActivated)
			p7(carouselOpenedModule(1))
		end
	}
}

return function(_) --[[ line: 170 ]]
	-- upvalues: useAnalyticsModule (ref), useDispatch (ref), useLocalization (ref), useSelector (ref), constantsModule (ref), reactModule (ref), capturesToastTypeModule (ref), t (ref), toastVanishedModule (ref), dashModule (ref), fFlagCreateMomentsToastModule (ref), toastControllerModule (ref), startMomentsCreationFlowModule (ref), eventNamesModule (ref), toast (ref)
	local var24 = useAnalyticsModule()
	local var25 = useDispatch()
	local var26 = useLocalization({
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
	local var27 = useSelector(function(p8) --[[ line: 195 ]]
		-- upvalues: constantsModule (copy)
		return p8[constantsModule.RoduxKey].Toast.ToastType
	end)
	local var28 = useSelector(function(p9) --[[ line: 199 ]]
		-- upvalues: constantsModule (copy)
		return p9[constantsModule.RoduxKey].Toast.ToastConfig
	end)
	local var29 = useSelector(function(p10) --[[ line: 203 ]]
		-- upvalues: constantsModule (copy)
		return p10[constantsModule.RoduxKey].Toast.IsDismissed
	end)
	local var30 = reactModule.useCallback(function(p11) --[[ line: 207 ]]
		-- upvalues: var26 (ref)
		return if p11 then var26[p11] else nil
	end)
	local var31 = reactModule.useMemo(function() --[[ line: 214 ]]
		-- upvalues: var27 (ref), capturesToastTypeModule (copy), t (copy), var25 (ref), toastVanishedModule (copy), var24 (ref), var28 (ref), constantsModule (copy), dashModule (copy), var30 (ref)
		if var27 == capturesToastTypeModule.None then
			return nil
		end
		local var32 = t[var27]
		
		return dashModule.join(var32, {
			buttonText = var30(var32.toastCTAKey),
			duration = var32.duration or constantsModule.ToastDuration,
			onActivated = if var32.onActivated then function() --[[ line: 230 ]]
				-- upvalues: var32 (ref), var24 (copy), var25 (copy), var28 (copy), var27 (ref), var27 (copy), toastVanishedModule (copy)
				var32.onActivated(var24, var25, var28)
				
				if var27 == var27 then
					var25(toastVanishedModule())
				end
			end else nil,
			onDismissed = function() --[[ line: 222 ]]
				-- upvalues: var27 (ref), var27 (copy), var25 (copy), toastVanishedModule (copy)
				if var27 == var27 then
					var25(toastVanishedModule())
				end
			end,
			toastCTAKey = dashModule.None,
			toastSubtitle = var30(var32.toastSubtitleKey),
			toastSubtitleKey = dashModule.None,
			toastTitle = var30(var32.toastTitleKey),
			toastTitleKey = dashModule.None
		})
	end, { var27, var28 })
	
	return if var31 then if fFlagCreateMomentsToastModule then if var27 == capturesToastTypeModule.CaptureTakenWithMomentsCTA then reactModule.createElement(toastControllerModule, {
		icon = "icons/brands/moments_large",
		title = var30("momentsTitle"),
		text = var30("discoverPostWatch"),
		actionText = var30("createAction"),
		onAction = function() --[[ line: 262 ]]
			-- upvalues: var28 (ref), var25 (ref), startMomentsCreationFlowModule (copy), var24 (ref), eventNamesModule (copy)
			if var28 and var28.captureInfo then
				var25(startMomentsCreationFlowModule(var28.captureInfo))
			end
			var24.fireEvent(eventNamesModule.CapturesCreateMomentToastButtonActivated)
		end,
		onDismissed = function() --[[ line: 268 ]]
			-- upvalues: var25 (ref), toastVanishedModule (copy)
			var25(toastVanishedModule())
		end,
		duration = var31.duration,
		show = not var29
	}) elseif var27 == capturesToastTypeModule.MomentProcessing then reactModule.createElement(toastControllerModule, {
		icon = "icons/brands/moments_large",
		title = var30("momentProcessingTitle"),
		text = var30("momentProcessingDescription"),
		onDismissed = function() --[[ line: 279 ]]
			-- upvalues: var25 (ref), toastVanishedModule (copy)
			var25(toastVanishedModule())
		end,
		duration = var31.duration,
		show = not var29
	}) else reactModule.createElement(reactModule.Fragment, {}, {
		[var27] = reactModule.createElement(toast, {
			duration = var31.duration,
			show = not var29,
			toastContent = var31
		})
	}) else reactModule.createElement(reactModule.Fragment, {}, {
		[var27] = reactModule.createElement(toast, {
			duration = var31.duration,
			show = not var29,
			toastContent = var31
		})
	}) else nil
end