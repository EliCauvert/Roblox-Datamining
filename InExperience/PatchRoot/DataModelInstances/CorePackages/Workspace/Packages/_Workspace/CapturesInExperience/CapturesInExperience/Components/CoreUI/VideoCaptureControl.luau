local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local ReactOtterModule = require(Parent1.ReactOtter)
local RoactUtilsModule = require(Parent1.RoactUtils)
local FoundationModule = require(Parent1.Foundation)
local LocalizationModule = require(Parent1.Localization)
local Icon = FoundationModule.Icon
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local Tooltip = FoundationModule.Tooltip
local View = FoundationModule.View
local RadialProgressBarModule = require(Parent.Components.CoreUI.RadialProgressBar)
local ConstantsModule = require(Parent.Constants)
local EventNamesModule = require(Parent.Analytics.EventNames)
local StartVideoCaptureModule = require(Parent.Thunks.StartVideoCapture)
local StopVideoCaptureModule = require(Parent.Thunks.StopVideoCapture)
local IsEligibleForMomentsModule = require(Parent.Utils.isEligibleForMoments)
local LogCaptureEndLayerExposureModule = require(Parent.Utils.logCaptureEndLayerExposure)
local UseAnalyticsModule = require(Parent.Analytics.useAnalytics)
local UseCallbackFunction = ReactModule.useCallback
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseEffectFunction = ReactModule.useEffect
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization
local UseRefFunction = ReactModule.useRef
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseTokensFunction = FoundationModule.Hooks.useTokens
local CaptureTriggerTypeModule = require(Parent.Enums.CaptureTriggerType)
local MaxVideoCaptureDurationSeconds = game:DefineFastInt("MaxVideoCaptureDurationSeconds", 30)
local FFlagCapturesControlsUseBuilderIconsModule = require(Parent.Flags.FFlagCapturesControlsUseBuilderIcons)
local FFlagMomentsCaptureEndIxpEnabledModule = require(Parent.Flags.FFlagMomentsCaptureEndIxpEnabled)
local FIntMomentsInExperienceMinCaptureSecondsModule = require(Parent.Flags.FIntMomentsInExperienceMinCaptureSeconds)
local FrameVideoCamera = if FFlagCapturesControlsUseBuilderIconsModule then IconName.FrameVideoCamera else "icons/controls/screenRecord_alt"
local Large = if FFlagCapturesControlsUseBuilderIconsModule then IconSize.Large else nil

return function(p1)
	-- upvalues: UseAnalyticsModule (copy), UseDispatchFunction (copy), UseLocalizationFunction (copy), UseTokensFunction (copy), UseSelectorFunction (copy), ConstantsModule (copy), FFlagMomentsCaptureEndIxpEnabledModule (copy), UseRefFunction (copy), UseEffectFunction (copy), IsEligibleForMomentsModule (copy), FIntMomentsInExperienceMinCaptureSecondsModule (copy), UseCallbackFunction (copy), EventNamesModule (copy), StopVideoCaptureModule (copy), CaptureTriggerTypeModule (copy), LogCaptureEndLayerExposureModule (copy), ReactOtterModule (copy), MaxVideoCaptureDurationSeconds (copy), StartVideoCaptureModule (copy), ReactModule (copy), View (copy), Tooltip (copy), PopoverAlign (copy), Icon (copy), FrameVideoCamera (copy), Large (copy), FoundationModule (copy), RadialProgressBarModule (copy)
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		captureVideo = "Feature.Captures.Title.CaptureVideoTooltip",
		videoCaptureInProgressTitle = "Feature.Captures.Title.VideoCaptureInProgressTooltip"
	})
	local UseTokensResult = UseTokensFunction()
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: ConstantsModule (upval)
		return p2[ConstantsModule.RoduxKey].IsVideoCaptureActive.status
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		-- upvalues: ConstantsModule (upval)
		return p2[ConstantsModule.RoduxKey].IsVideoCaptureActive.triggerType
	end)
	local UseSelectorResult2 = if FFlagMomentsCaptureEndIxpEnabledModule then UseSelectorFunction(function(p2)
		-- upvalues: ConstantsModule (upval)
		return p2[ConstantsModule.RoduxKey].MomentsEligibility
	end) else nil
	local UseRefResult = if FFlagMomentsCaptureEndIxpEnabledModule then UseRefFunction(nil) else nil
	
	if FFlagMomentsCaptureEndIxpEnabledModule then
		UseEffectFunction(function()
			-- upvalues: UseRefResult (copy), UseSelectorResult (copy)
			UseRefResult.current = if UseSelectorResult then os.clock() else nil
		end, { UseSelectorResult })
	end
	local function _(): boolean
		-- upvalues: UseRefResult (copy), IsEligibleForMomentsModule (upval), UseSelectorResult2 (copy), FIntMomentsInExperienceMinCaptureSecondsModule (upval)
		local Current = UseRefResult.current
		
		return IsEligibleForMomentsModule(UseSelectorResult2) and (Current ~= nil and FIntMomentsInExperienceMinCaptureSecondsModule <= os.clock() - Current)
	end
	
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0, (UseCallbackFunction(function()
		-- upvalues: UseSelectorResult (copy), UseAnalyticsModuleResult (copy), EventNamesModule (upval), UseDispatchResult (copy), StopVideoCaptureModule (upval), FFlagMomentsCaptureEndIxpEnabledModule (upval), UseSelectorResult1 (copy), CaptureTriggerTypeModule (upval), UseRefResult (copy), IsEligibleForMomentsModule (upval), UseSelectorResult2 (copy), FIntMomentsInExperienceMinCaptureSecondsModule (upval), LogCaptureEndLayerExposureModule (upval)
		if not UseSelectorResult then return end
		UseAnalyticsModuleResult.fireEvent(EventNamesModule.CapturesEntrypointVideoDeactivatedAutomatically)
		UseDispatchResult(StopVideoCaptureModule())
		
		if FFlagMomentsCaptureEndIxpEnabledModule and UseSelectorResult1 == CaptureTriggerTypeModule.UserCapture then
			local Current = UseRefResult.current
			
			if IsEligibleForMomentsModule(UseSelectorResult2) and (Current ~= nil and os.clock() - Current >= FIntMomentsInExperienceMinCaptureSecondsModule) then
				LogCaptureEndLayerExposureModule()
			end
		end
	end, if FFlagMomentsCaptureEndIxpEnabledModule then {
		UseSelectorResult,
		UseSelectorResult1,
		UseSelectorResult2
	} else { UseSelectorResult })))
	UseEffectFunction(function()
		-- upvalues: UseSelectorResult (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), MaxVideoCaptureDurationSeconds (upval)
		if UseSelectorResult then
			UseAnimatedBindingResult2(ReactOtterModule.ease(1, {
				duration = MaxVideoCaptureDurationSeconds,
				easingStyle = Enum.EasingStyle.Linear
			}))
			
			return
		else
			UseAnimatedBindingResult2(ReactOtterModule.instant(0))
		end
	end, { UseAnimatedBindingResult2, UseSelectorResult })
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: UseSelectorResult (copy), UseAnalyticsModuleResult (copy), EventNamesModule (upval), UseDispatchResult (copy), StartVideoCaptureModule (upval)
		if not UseSelectorResult then
			UseAnalyticsModuleResult.fireEvent(EventNamesModule.CapturesEntrypointVideoActivated)
			UseDispatchResult(StartVideoCaptureModule())
			
			return
		end
	end, { UseSelectorResult })
	local UseCallbackResult1 = UseCallbackFunction(function()
		-- upvalues: UseSelectorResult (copy), UseAnalyticsModuleResult (copy), EventNamesModule (upval), UseDispatchResult (copy), StopVideoCaptureModule (upval), FFlagMomentsCaptureEndIxpEnabledModule (upval), UseRefResult (copy), IsEligibleForMomentsModule (upval), UseSelectorResult2 (copy), FIntMomentsInExperienceMinCaptureSecondsModule (upval), LogCaptureEndLayerExposureModule (upval)
		if not UseSelectorResult then return end
		UseAnalyticsModuleResult.fireEvent(EventNamesModule.CapturesEntrypointVideoDeactivated)
		UseDispatchResult(StopVideoCaptureModule())
		
		if FFlagMomentsCaptureEndIxpEnabledModule then
			local Current = UseRefResult.current
			
			if IsEligibleForMomentsModule(UseSelectorResult2) and (Current ~= nil and os.clock() - Current >= FIntMomentsInExperienceMinCaptureSecondsModule) then
				LogCaptureEndLayerExposureModule()
			end
		end
	end, if FFlagMomentsCaptureEndIxpEnabledModule then { UseSelectorResult, UseSelectorResult2 } else { UseSelectorResult })
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		VideoCaptureStartCTA = if UseSelectorResult then nil else ReactModule.createElement(View, {
			LayoutOrder = p1.layoutOrder,
			onActivated = UseCallbackResult,
			tag = {
				["size-1200-1200"] = true,
				["anchor-center-center auto-xy clip position-center-center radius-circle"] = true
			}
		}, {
			StartIconWithTooltip = ReactModule.createElement(Tooltip, {
				align = PopoverAlign.Center,
				side = p1.popoverSide,
				title = UseLocalizationResult.captureVideo
			}, ReactModule.createElement(View, { tag = "size-1200-1200" }, {
				Icon = ReactModule.createElement(Icon, {
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					name = FrameVideoCamera,
					size = Large,
					style = UseTokensResult.Color.Content.Emphasis
				})
			}))
		}),
		VideoCaptureDisabledStartCTA = if UseSelectorResult and UseSelectorResult1 == CaptureTriggerTypeModule.LegacyCapture then ReactModule.createElement(View, {
			tag = "anchor-center-center auto-xy clip position-center-center radius-circle",
			LayoutOrder = p1.layoutOrder
		}, {
			StartIconWithTooltip = ReactModule.createElement(Tooltip, {
				align = PopoverAlign.Center,
				side = p1.popoverSide,
				title = UseLocalizationResult.videoCaptureInProgressTitle
			}, ReactModule.createElement(Icon, {
				name = FrameVideoCamera,
				size = Large,
				style = UseTokensResult.Color.Content.Muted
			}))
		}) else nil,
		VideoCaptureActiveView = if UseSelectorResult and (UseSelectorResult1 == CaptureTriggerTypeModule.UserCapture or UseSelectorResult1 == CaptureTriggerTypeModule.DeveloperCapture) then ReactModule.createElement(View, {
			tag = "anchor-center-center clip position-center-center radius-circle size-900-900 padding-xxsmall",
			LayoutOrder = p1.layoutOrder
		}, {
			VideoCaptureStopCTA = if UseSelectorResult1 == CaptureTriggerTypeModule.UserCapture then ReactModule.createElement(View, {
				tag = "anchor-center-center bg-over-media-300 col flex-evenly position-center-center size-700-700 radius-circle",
				onActivated = UseCallbackResult1
			}, {
				VideoCaptureStopIcon = ReactModule.createElement(Icon, {
					name = "icons/controls/mediaStop_small",
					size = FoundationModule.Enums.IconSize.Small,
					style = UseTokensResult.Color.System.Alert
				})
			}) else nil,
			VideoCaptureActiveIndicator = if UseSelectorResult1 == CaptureTriggerTypeModule.DeveloperCapture then ReactModule.createElement(View, {
				tag = "anchor-center-center col flex-evenly position-center-center size-700-700 radius-circle"
			}, {
				VideoCaptureIndicatorIcon = ReactModule.createElement(View, {
					tag = "anchor-center-center bg-alert position-center-center size-300-300 radius-circle"
				})
			}) else nil,
			ProgressBar = ReactModule.createElement(RadialProgressBarModule, { progress = UseAnimatedBindingResult })
		}) else nil
	})
end