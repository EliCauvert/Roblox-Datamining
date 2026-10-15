local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local reactOtterModule = require(parent_1.ReactOtter)
local roactUtilsModule = require(parent_1.RoactUtils)
local foundationModule = require(parent_1.Foundation)
local localizationModule = require(parent_1.Localization)
local icon = foundationModule.Icon
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local popoverAlign = foundationModule.Enums.PopoverAlign
local tooltip = foundationModule.Tooltip
local view = foundationModule.View
local radialProgressBarModule = require(parent.Components.CoreUI.RadialProgressBar)
local constantsModule = require(parent.Constants)
local eventNamesModule = require(parent.Analytics.EventNames)
local startVideoCaptureModule = require(parent.Thunks.StartVideoCapture)
local stopVideoCaptureModule = require(parent.Thunks.StopVideoCapture)
local useAnalyticsModule = require(parent.Analytics.useAnalytics)
local useCallback = reactModule.useCallback
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useEffect = reactModule.useEffect
local useLocalization = localizationModule.Hooks.useLocalization
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useTokens = foundationModule.Hooks.useTokens
local captureTriggerTypeModule = require(parent.Enums.CaptureTriggerType)
local maxVideoCaptureDurationSeconds = game:DefineFastInt("MaxVideoCaptureDurationSeconds", 30)
local fFlagCapturesControlsUseBuilderIconsModule = require(parent.Flags.FFlagCapturesControlsUseBuilderIcons)
local var1 = if fFlagCapturesControlsUseBuilderIconsModule then iconName.FrameVideoCamera else "icons/controls/screenRecord_alt"
local var2 = if fFlagCapturesControlsUseBuilderIconsModule then iconSize.Large else nil

return function(p1)
	-- upvalues: useAnalyticsModule (ref), useDispatch (ref), useLocalization (ref), useTokens (ref), useSelector (ref), constantsModule (ref), useCallback (ref), eventNamesModule (ref), stopVideoCaptureModule (ref), reactOtterModule (ref), useEffect (ref), maxVideoCaptureDurationSeconds (ref), startVideoCaptureModule (ref), reactModule (ref), view (ref), tooltip (ref), popoverAlign (ref), icon (ref), var1 (ref), var2 (ref), captureTriggerTypeModule (ref), foundationModule (ref), radialProgressBarModule (ref)
	local var3 = useAnalyticsModule()
	local var4 = useDispatch()
	local var5 = useLocalization({
		captureVideo = "Feature.Captures.Title.CaptureVideoTooltip",
		videoCaptureInProgressTitle = "Feature.Captures.Title.VideoCaptureInProgressTooltip"
	})
	local var6 = useTokens()
	local var7 = useSelector(function(p2)
		-- upvalues: constantsModule (copy)
		return p2[constantsModule.RoduxKey].IsVideoCaptureActive.status
	end)
	local var8 = useSelector(function(p2)
		-- upvalues: constantsModule (copy)
		return p2[constantsModule.RoduxKey].IsVideoCaptureActive.triggerType
	end)
	local var9, var10 = reactOtterModule.useAnimatedBinding(0, useCallback(function()
		-- upvalues: var7 (ref), var3 (ref), eventNamesModule (copy), var4 (ref), stopVideoCaptureModule (copy)
		if var7 then
			var3.fireEvent(eventNamesModule.CapturesEntrypointVideoDeactivatedAutomatically)
			var4(stopVideoCaptureModule())
			
			return
		end
	end, { var7 }))
	useEffect(function()
		-- upvalues: var7 (ref), var10 (ref), reactOtterModule (copy), maxVideoCaptureDurationSeconds (copy)
		if var7 then
			var10(reactOtterModule.ease(1, {
				duration = maxVideoCaptureDurationSeconds,
				easingStyle = Enum.EasingStyle.Linear
			}))
			
			return
		end
		var10(reactOtterModule.instant(0))
	end, { var10, var7 })
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		VideoCaptureStartCTA = if not var7 then reactModule.createElement(view, {
			LayoutOrder = p1.layoutOrder,
			onActivated = useCallback(function()
				-- upvalues: var7 (ref), var3 (ref), eventNamesModule (copy), var4 (ref), startVideoCaptureModule (copy)
				if var7 then
					return
				end
				var3.fireEvent(eventNamesModule.CapturesEntrypointVideoActivated)
				var4(startVideoCaptureModule())
			end, { var7 }),
			tag = {
				["size-1200-1200"] = true,
				["anchor-center-center auto-xy clip position-center-center radius-circle"] = true
			}
		}, {
			StartIconWithTooltip = reactModule.createElement(tooltip, {
				align = popoverAlign.Center,
				side = p1.popoverSide,
				title = var5.captureVideo
			}, reactModule.createElement(view, { tag = "size-1200-1200" }, {
				Icon = reactModule.createElement(icon, {
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					name = var1,
					size = var2,
					style = var6.Color.Content.Emphasis
				})
			}))
		}) else nil,
		VideoCaptureDisabledStartCTA = if var7 and var8 == captureTriggerTypeModule.LegacyCapture then reactModule.createElement(view, {
			tag = "anchor-center-center auto-xy clip position-center-center radius-circle",
			LayoutOrder = p1.layoutOrder
		}, {
			StartIconWithTooltip = reactModule.createElement(tooltip, {
				align = popoverAlign.Center,
				side = p1.popoverSide,
				title = var5.videoCaptureInProgressTitle
			}, reactModule.createElement(icon, {
				name = var1,
				size = var2,
				style = var6.Color.Content.Muted
			}))
		}) else nil,
		VideoCaptureActiveView = if var7 and (var8 == captureTriggerTypeModule.UserCapture or var8 == captureTriggerTypeModule.DeveloperCapture) then reactModule.createElement(view, {
			tag = "anchor-center-center clip position-center-center radius-circle size-900-900 padding-xxsmall",
			LayoutOrder = p1.layoutOrder
		}, {
			VideoCaptureStopCTA = if var8 == captureTriggerTypeModule.UserCapture then reactModule.createElement(view, {
				tag = "anchor-center-center bg-over-media-300 col flex-evenly position-center-center size-700-700 radius-circle",
				onActivated = useCallback(function()
					-- upvalues: var7 (ref), var3 (ref), eventNamesModule (copy), var4 (ref), stopVideoCaptureModule (copy)
					if var7 then
						var3.fireEvent(eventNamesModule.CapturesEntrypointVideoDeactivated)
						var4(stopVideoCaptureModule())
						
						return
					end
				end, { var7 })
			}, {
				VideoCaptureStopIcon = reactModule.createElement(icon, {
					name = "icons/controls/mediaStop_small",
					size = foundationModule.Enums.IconSize.Small,
					style = var6.Color.System.Alert
				})
			}) else nil,
			VideoCaptureActiveIndicator = if var8 == captureTriggerTypeModule.DeveloperCapture then reactModule.createElement(view, {
				tag = "anchor-center-center col flex-evenly position-center-center size-700-700 radius-circle"
			}, {
				VideoCaptureIndicatorIcon = reactModule.createElement(view, {
					tag = "anchor-center-center bg-alert position-center-center size-300-300 radius-circle"
				})
			}) else nil,
			ProgressBar = reactModule.createElement(radialProgressBarModule, { progress = var9 })
		}) else nil
	})
end