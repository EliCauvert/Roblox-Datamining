local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local ReactOtterModule = require(Parent1.ReactOtter)
local RoactUtilsModule = require(Parent1.RoactUtils)
local FoundationModule = require(Parent1.Foundation)
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
local UseAnalyticsModule = require(Parent.Analytics.useAnalytics)
local UseCallbackFunction = ReactModule.useCallback
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseEffectFunction = ReactModule.useEffect
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseTokensFunction = FoundationModule.Hooks.useTokens
local CaptureTriggerTypeModule = require(Parent.Enums.CaptureTriggerType)
local MaxVideoCaptureDurationSeconds = game:DefineFastInt("MaxVideoCaptureDurationSeconds", 30)
local FFlagCapturesControlsUseBuilderIconsModule = require(Parent.Flags.FFlagCapturesControlsUseBuilderIcons)
local FrameVideoCamera = if FFlagCapturesControlsUseBuilderIconsModule then IconName.FrameVideoCamera else "icons/controls/screenRecord_alt"
local Large = if FFlagCapturesControlsUseBuilderIconsModule then IconSize.Large else nil

return function(p1)
	-- upvalues: UseAnalyticsModule (copy), UseDispatchFunction (copy), UseLocalizationFunction (copy), UseTokensFunction (copy), UseSelectorFunction (copy), ConstantsModule (copy), UseCallbackFunction (copy), EventNamesModule (copy), StopVideoCaptureModule (copy), ReactOtterModule (copy), UseEffectFunction (copy), MaxVideoCaptureDurationSeconds (copy), StartVideoCaptureModule (copy), ReactModule (copy), View (copy), Tooltip (copy), PopoverAlign (copy), Icon (copy), FrameVideoCamera (copy), Large (copy), CaptureTriggerTypeModule (copy), FoundationModule (copy), RadialProgressBarModule (copy)
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
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0, (UseCallbackFunction(function()
		-- upvalues: UseSelectorResult (copy), UseAnalyticsModuleResult (copy), EventNamesModule (upval), UseDispatchResult (copy), StopVideoCaptureModule (upval)
		if UseSelectorResult then
			UseAnalyticsModuleResult.fireEvent(EventNamesModule.CapturesEntrypointVideoDeactivatedAutomatically)
			UseDispatchResult(StopVideoCaptureModule())
			
			return
		end
	end, { UseSelectorResult })))
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
		-- upvalues: UseSelectorResult (copy), UseAnalyticsModuleResult (copy), EventNamesModule (upval), UseDispatchResult (copy), StopVideoCaptureModule (upval)
		if UseSelectorResult then
			UseAnalyticsModuleResult.fireEvent(EventNamesModule.CapturesEntrypointVideoDeactivated)
			UseDispatchResult(StopVideoCaptureModule())
			
			return
		end
	end, { UseSelectorResult })
	
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