local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local reactOtterModule = require(parent_1.ReactOtter)
local roactUtilsModule = require(parent_1.RoactUtils)
local foundationModule = require(parent_1.Foundation)
local localizationModule = require(parent_1.Localization)
local icon = foundationModule.Icon
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

return function(p0) --[[ line: 44 ]]
	-- upvalues: useAnalyticsModule (ref), useDispatch (ref), useLocalization (ref), useTokens (ref), useSelector (ref), constantsModule (ref), useCallback (ref), eventNamesModule (ref), stopVideoCaptureModule (ref), reactOtterModule (ref), useEffect (ref), maxVideoCaptureDurationSeconds (ref), startVideoCaptureModule (ref), reactModule (ref), view (ref), tooltip (ref), popoverAlign (ref), icon (ref), captureTriggerTypeModule (ref), foundationModule (ref), radialProgressBarModule (ref)
	local var13 = useAnalyticsModule()
	local var14 = useDispatch()
	local var15 = useLocalization({
		captureVideo = "Feature.Captures.Title.CaptureVideoTooltip",
		videoCaptureInProgressTitle = "Feature.Captures.Title.VideoCaptureInProgressTooltip"
	})
	local var16 = useTokens()
	local var17 = useSelector(function(p1) --[[ line: 53 ]]
		-- upvalues: constantsModule (copy)
		return p1[constantsModule.RoduxKey].IsVideoCaptureActive.status
	end)
	local var18 = useSelector(function(p2) --[[ line: 57 ]]
		-- upvalues: constantsModule (copy)
		return p2[constantsModule.RoduxKey].IsVideoCaptureActive.triggerType
	end)
	local var19, var20 = reactOtterModule.useAnimatedBinding(0, useCallback(function() --[[ line: 61 ]]
		-- upvalues: var17 (ref), var13 (ref), eventNamesModule (copy), var14 (ref), stopVideoCaptureModule (copy)
		if var17 then
			var13.fireEvent(eventNamesModule.CapturesEntrypointVideoDeactivatedAutomatically)
			var14(stopVideoCaptureModule())
			
			return
		end
	end, { var17 }))
	useEffect(function() --[[ line: 73 ]]
		-- upvalues: var17 (ref), var20 (ref), reactOtterModule (copy), maxVideoCaptureDurationSeconds (copy)
		if var17 then
			var20(reactOtterModule.ease(1, {
				duration = maxVideoCaptureDurationSeconds,
				easingStyle = Enum.EasingStyle.Linear
			}))
			
			return
		end
		var20(reactOtterModule.instant(0))
	end, { var20, var17 })
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		VideoCaptureStartCTA = if not var17 then reactModule.createElement(view, {
			LayoutOrder = p0.layoutOrder,
			onActivated = useCallback(function() --[[ line: 84 ]]
				-- upvalues: var17 (ref), var13 (ref), eventNamesModule (copy), var14 (ref), startVideoCaptureModule (copy)
				if var17 then
					return
				end
				var13.fireEvent(eventNamesModule.CapturesEntrypointVideoActivated)
				var14(startVideoCaptureModule())
			end, { var17 }),
			tag = {
				["size-1200-1200"] = true,
				["anchor-center-center auto-xy clip position-center-center radius-circle"] = true
			}
		}, {
			StartIconWithTooltip = reactModule.createElement(tooltip, {
				align = popoverAlign.Center,
				side = p0.popoverSide,
				title = var15.captureVideo
			}, reactModule.createElement(view, { tag = "size-1200-1200" }, {
				Icon = reactModule.createElement(icon, {
					name = "icons/controls/screenRecord_alt",
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					style = var16.Color.Content.Emphasis
				})
			}))
		}) else nil,
		VideoCaptureDisabledStartCTA = if var17 and var18 == captureTriggerTypeModule.LegacyCapture then reactModule.createElement(view, {
			tag = "anchor-center-center auto-xy clip position-center-center radius-circle",
			LayoutOrder = p0.layoutOrder
		}, {
			StartIconWithTooltip = reactModule.createElement(tooltip, {
				align = popoverAlign.Center,
				side = p0.popoverSide,
				title = var15.videoCaptureInProgressTitle
			}, reactModule.createElement(icon, {
				name = "icons/controls/screenRecord_alt",
				style = var16.Color.Content.Muted
			}))
		}) else nil,
		VideoCaptureActiveView = if var17 and (var18 == captureTriggerTypeModule.UserCapture or var18 == captureTriggerTypeModule.DeveloperCapture) then reactModule.createElement(view, {
			tag = "anchor-center-center clip position-center-center radius-circle size-900-900 padding-xxsmall",
			LayoutOrder = p0.layoutOrder
		}, {
			VideoCaptureStopCTA = if var18 == captureTriggerTypeModule.UserCapture then reactModule.createElement(view, {
				tag = "anchor-center-center bg-over-media-300 col flex-evenly position-center-center size-700-700 radius-circle",
				onActivated = useCallback(function() --[[ line: 94 ]]
					-- upvalues: var17 (ref), var13 (ref), eventNamesModule (copy), var14 (ref), stopVideoCaptureModule (copy)
					if var17 then
						var13.fireEvent(eventNamesModule.CapturesEntrypointVideoDeactivated)
						var14(stopVideoCaptureModule())
						
						return
					end
				end, { var17 })
			}, {
				VideoCaptureStopIcon = reactModule.createElement(icon, {
					name = "icons/controls/mediaStop_small",
					size = foundationModule.Enums.IconSize.Small,
					style = var16.Color.System.Alert
				})
			}) else nil,
			VideoCaptureActiveIndicator = if var18 == captureTriggerTypeModule.DeveloperCapture then reactModule.createElement(view, {
				tag = "anchor-center-center col flex-evenly position-center-center size-700-700 radius-circle"
			}, {
				VideoCaptureIndicatorIcon = reactModule.createElement(view, {
					tag = "anchor-center-center bg-alert position-center-center size-300-300 radius-circle"
				})
			}) else nil,
			ProgressBar = reactModule.createElement(radialProgressBarModule, { progress = var19 })
		}) else nil
	})
end