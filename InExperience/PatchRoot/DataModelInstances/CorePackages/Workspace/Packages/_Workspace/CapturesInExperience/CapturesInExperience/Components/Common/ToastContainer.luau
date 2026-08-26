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
local var1 = if userInputService:GetPlatform() ~= Enum.Platform.Windows then userInputService:GetPlatform() == Enum.Platform.OSX else true

local function _(p1)
	-- upvalues: fFlagEnableCapturesGalleryRetrievalCoreScriptModule (ref), captureTypeModule (ref)
	if not p1 then
		return false
	end
	local captureInfo = p1.captureInfo
	
	return if captureInfo then if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then captureInfo.CaptureType == Enum.CaptureType.Video else captureInfo.type == captureTypeModule.Video else false
end

local t = {
	[capturesToastTypeModule.CaptureSavedToDevice] = {
		toastTitleKey = "captureSavedToDevice",
		iconImage = images["icons/status/success"],
		onActivated = if var1 then function(p1, _, p2)
			-- upvalues: eventNamesModule (ref), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (ref), captureTypeModule (ref)
			local var2
			p1.fireEvent(eventNamesModule.CapturesSavedToDeviceToastOpenButtonActivated)
			
			if p2 then
				local captureInfo = p2.captureInfo
				
				if not captureInfo then
					var2 = false
				elseif fFlagEnableCapturesGalleryRetrievalCoreScriptModule then
					var2 = captureInfo.CaptureType == Enum.CaptureType.Video
					var2 = nil
				else
					var2 = captureInfo.type == captureTypeModule.Video
				end
			else
				var2 = false
			end
			if var2 then
				game:OpenVideosFolder()
				
				return
			end
			game:OpenScreenshotsFolder()
		end else nil,
		toastCTAKey = if var1 then "openInFiles" else nil
	},
	[capturesToastTypeModule.CaptureTaken] = {
		toastCTAKey = "shareAction",
		toastSubtitleKey = "shareCaptureDescription",
		toastTitleKey = "captureSaved",
		iconImage = images["icons/controls/screenshot"],
		onActivated = function(p1, p2, p3)
			-- upvalues: eventNamesModule (ref), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (ref), captureTypeModule (ref), socialStopwatchModule (ref), shareCaptureModule (ref), externalShareSourceTypeModule (ref)
			local var2
			p1.fireEvent(eventNamesModule.CapturesShareToastButtonActivated)
			
			if p3 then
				local captureInfo = p3.captureInfo
				
				if not captureInfo then
					var2 = false
				elseif fFlagEnableCapturesGalleryRetrievalCoreScriptModule then
					var2 = captureInfo.CaptureType == Enum.CaptureType.Video
					var2 = nil
				else
					var2 = captureInfo.type == captureTypeModule.Video
				end
			else
				var2 = false
			end
			if var2 then
				p1.fireEvent(eventNamesModule.CapturesVideoShareToastButtonActivated)
			end
			if p3 and p3.captureInfo then
				if not socialStopwatchModule.Stopwatch.get(socialStopwatchModule.Events.CaptureShared) then
					socialStopwatchModule.Stopwatch.start(socialStopwatchModule.Events.CaptureShared)
				end
				p2(shareCaptureModule(p3.captureInfo, externalShareSourceTypeModule.Toast))
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
		onActivated = function(p1, p2)
			-- upvalues: eventNamesModule (ref), carouselOpenedModule (ref)
			p1.fireEvent(eventNamesModule.CapturesViewToastButtonActivated)
			p2(carouselOpenedModule(1))
		end
	}
}

return function(_)
	-- upvalues: useAnalyticsModule (ref), useDispatch (ref), useLocalization (ref), useSelector (ref), constantsModule (ref), reactModule (ref), capturesToastTypeModule (ref), t (ref), toastVanishedModule (ref), dashModule (ref), fFlagCreateMomentsToastModule (ref), toastControllerModule (ref), httpService (ref), startMomentsCreationFlowModule (ref), eventNamesModule (ref), toast (ref)
	local var2 = useAnalyticsModule()
	local var3 = useDispatch()
	local var4 = useLocalization({
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
	local var5 = useSelector(function(p1)
		-- upvalues: constantsModule (copy)
		return p1[constantsModule.RoduxKey].Toast.ToastType
	end)
	local var6 = useSelector(function(p1)
		-- upvalues: constantsModule (copy)
		return p1[constantsModule.RoduxKey].Toast.ToastConfig
	end)
	local var7 = useSelector(function(p1)
		-- upvalues: constantsModule (copy)
		return p1[constantsModule.RoduxKey].Toast.IsDismissed
	end)
	local var8 = reactModule.useCallback(function(p1)
		-- upvalues: var4 (ref)
		return if p1 then var4[p1] else nil
	end)
	local var9 = reactModule.useMemo(function()
		-- upvalues: var5 (ref), capturesToastTypeModule (copy), t (copy), var3 (ref), toastVanishedModule (copy), var2 (ref), var6 (ref), constantsModule (copy), dashModule (copy), var8 (ref)
		if var5 == capturesToastTypeModule.None then
			return nil
		end
		local var10 = t[var5]
		
		return dashModule.join(var10, {
			buttonText = var8(var10.toastCTAKey),
			duration = var10.duration or constantsModule.ToastDuration,
			onActivated = if var10.onActivated then function()
				-- upvalues: var10 (ref), var2 (copy), var3 (copy), var6 (copy), var5 (ref), var5 (copy), toastVanishedModule (copy)
				var10.onActivated(var2, var3, var6)
				
				if var5 == var5 then
					var3(toastVanishedModule())
				end
			end else nil,
			onDismissed = function()
				-- upvalues: var5 (ref), var5 (copy), var3 (copy), toastVanishedModule (copy)
				if var5 == var5 then
					var3(toastVanishedModule())
				end
			end,
			toastCTAKey = dashModule.None,
			toastSubtitle = var8(var10.toastSubtitleKey),
			toastSubtitleKey = dashModule.None,
			toastTitle = var8(var10.toastTitleKey),
			toastTitleKey = dashModule.None
		})
	end, { var5, var6 })
	
	return if var9 then if fFlagCreateMomentsToastModule then if var5 == capturesToastTypeModule.CaptureTakenWithMomentsCTA then reactModule.createElement(toastControllerModule, {
		icon = "icons/brands/moments_large",
		title = var8("momentsTitle"),
		text = var8("discoverPostWatch"),
		actionText = var8("createAction"),
		onAction = function()
			-- upvalues: var6 (ref), httpService (copy), var3 (ref), startMomentsCreationFlowModule (copy), var2 (ref), eventNamesModule (copy)
			if var6 and var6.captureInfo then
				local var10 = httpService:GenerateGUID(false)
				var3(startMomentsCreationFlowModule(var6.captureInfo, var10))
				var2.fireEvent(eventNamesModule.XExpMomentCreationStarted, { creationSessionId = var10 })
			end
			var2.fireEvent(eventNamesModule.CapturesCreateMomentToastButtonActivated)
		end,
		onDismissed = function()
			-- upvalues: var3 (ref), toastVanishedModule (copy)
			var3(toastVanishedModule())
		end,
		duration = var9.duration,
		show = not var7
	}) elseif var5 == capturesToastTypeModule.MomentProcessing then reactModule.createElement(toastControllerModule, {
		icon = "icons/brands/moments_large",
		title = var8("momentProcessingTitle"),
		text = var8("momentProcessingDescription"),
		onDismissed = function()
			-- upvalues: var3 (ref), toastVanishedModule (copy)
			var3(toastVanishedModule())
		end,
		duration = var9.duration,
		show = not var7
	}) else reactModule.createElement(reactModule.Fragment, {}, {
		[var5] = reactModule.createElement(toast, {
			duration = var9.duration,
			show = not var7,
			toastContent = var9
		})
	}) else reactModule.createElement(reactModule.Fragment, {}, {
		[var5] = reactModule.createElement(toast, {
			duration = var9.duration,
			show = not var7,
			toastContent = var9
		})
	}) else nil
end