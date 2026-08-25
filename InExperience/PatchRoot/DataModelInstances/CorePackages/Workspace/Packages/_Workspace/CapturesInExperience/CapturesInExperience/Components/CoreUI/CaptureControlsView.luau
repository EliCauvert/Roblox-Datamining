local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local captureService = game:GetService("CaptureService")
local reactModule = require(parent_1.React)
local roactUtilsModule = require(parent_1.RoactUtils)
local foundationModule = require(parent_1.Foundation)
local IXPServiceWrapper = require(parent_1.IXPServiceWrapper).IXPServiceWrapper
local localizationModule = require(parent_1.Localization)
local socialStopwatchModule = require(parent_1.SocialStopwatch)
local icon = foundationModule.Icon
local image = foundationModule.Image
local popoverAlign = foundationModule.Enums.PopoverAlign
local popoverSide = foundationModule.Enums.PopoverSide
local tooltip = foundationModule.Tooltip
local view = foundationModule.View
local videoCaptureControlModule = require(parent.Components.CoreUI.VideoCaptureControl)
local voiceChatIndicatorModule = require(parent.Components.CoreUI.VoiceChatIndicator)
local capturesPolicyModule = require(parent.App.CapturesPolicy)
local constantsModule = require(parent.Constants)
local eventNamesModule = require(parent.Analytics.EventNames)
local takeCaptureModule = require(parent.Thunks.TakeCapture)
local snapDirectionModule = require(parent.Enums.SnapDirection)
local useAnalyticsModule = require(parent.Analytics.useAnalytics)
local useCallback = reactModule.useCallback
local useCaptureControlsControllerModule = require(parent.Hooks.useCaptureControlsController)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useEffect = reactModule.useEffect
local useLocalization = localizationModule.Hooks.useLocalization
local usePlayShutterSoundModule = require(parent.Hooks.usePlayShutterSound)
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useTokens = foundationModule.Hooks.useTokens
local useTopbarInsetModule = require(parent.Hooks.useTopbarInset)
local capturesLayerExposureLoggingEnabled = game:DefineFastFlag("CapturesLayerExposureLoggingEnabled", false)
local debugOverrideCaptureControlsVideoGuacPolicy = game:DefineFastFlag("DebugOverrideCaptureControlsVideoGuacPolicy", false)
local fStringSocialCaptureIXPLayer = require(parent_1.SharedFlags).FStringSocialCaptureIXPLayer
local t = {
	[snapDirectionModule.Bottom] = popoverSide.Top,
	[snapDirectionModule.Left] = popoverSide.Right,
	[snapDirectionModule.Right] = popoverSide.Left,
	[snapDirectionModule.Top] = popoverSide.Bottom
}

return capturesPolicyModule.connect(function(p5)
	-- upvalues: captureService (ref), debugOverrideCaptureControlsVideoGuacPolicy (ref)
	return {
		hasVideoCaptureCapability = p5.hasVideoCaptureCapability() and captureService:CanCaptureVideo() or debugOverrideCaptureControlsVideoGuacPolicy
	}
end)(function(p0)
	-- upvalues: useAnalyticsModule (ref), useDispatch (ref), useLocalization (ref), useTokens (ref), useTopbarInsetModule (ref), useSelector (ref), constantsModule (ref), useEffect (ref), capturesLayerExposureLoggingEnabled (ref), IXPServiceWrapper (ref), fStringSocialCaptureIXPLayer (ref), usePlayShutterSoundModule (ref), reactModule (ref), useCaptureControlsControllerModule (ref), eventNamesModule (ref), useCallback (ref), socialStopwatchModule (ref), takeCaptureModule (ref), view (ref), foundationModule (ref), videoCaptureControlModule (ref), t (ref), tooltip (ref), popoverAlign (ref), icon (ref), voiceChatIndicatorModule (ref), image (ref)
	local var20 = useAnalyticsModule()
	local var21 = useDispatch()
	local var22 = useLocalization({
		captureScreenshot = "Feature.Captures.Title.CaptureScreenshotTooltip"
	})
	local var23 = useTokens()
	local var24 = useTopbarInsetModule()
	local var25 = useSelector(function(p1)
		-- upvalues: constantsModule (copy)
		return p1[constantsModule.RoduxKey].IsActive
	end)
	local var26 = useSelector(function(p2)
		-- upvalues: constantsModule (copy)
		return p2[constantsModule.RoduxKey].IsVideoCaptureActive.status
	end)
	useEffect(function()
		-- upvalues: capturesLayerExposureLoggingEnabled (copy), var25 (ref), IXPServiceWrapper (copy), fStringSocialCaptureIXPLayer (copy)
		if capturesLayerExposureLoggingEnabled and var25 then
			IXPServiceWrapper:LogFlagLinkedUserLayerExposure(fStringSocialCaptureIXPLayer)
		end
	end, { var25 })
	local var27 = usePlayShutterSoundModule()
	local var28 = useCaptureControlsControllerModule(var25, reactModule.useMemo(function()
		-- upvalues: var24 (ref), var23 (ref)
		return Vector2.new(var24.Min.X - var23.Padding.Small, var24.Height - var23.Padding.XSmall - var23.Padding.XXSmall)
	end, { var24, var23 }))
	local dragContainerRef = var28.dragContainerRef
	local dragDetectorRef = var28.dragDetectorRef
	local dragItemAnchorPointBinding = var28.dragItemAnchorPointBinding
	local dragItemPositionBinding = var28.dragItemPositionBinding
	local dragItemRef = var28.dragItemRef
	local isItemHorizontal = var28.isItemHorizontal
	local screenshotButtonRef = var28.screenshotButtonRef
	local snapDirection = var28.snapDirection
	useEffect(function()
		-- upvalues: var25 (ref), var20 (ref), eventNamesModule (copy)
		if var25 then
			var20.fireEvent(eventNamesModule.CapturesEntrypointViewed)
		end
	end, { var25 })
	
	return reactModule.createElement(view, {
		tag = "padding-x-large padding-y-medium",
		Position = UDim2.fromOffset(0, -var24.Height),
		Size = UDim2.new(1, 0, 1, var24.Height),
		ZIndex = constantsModule.ZIndex.Entrypoint
	}, {
		PaddedContainer = reactModule.createElement(view, {
			tag = "anchor-center-center position-center-center size-full",
			ref = dragContainerRef
		}, {
			CaptureControls = if var25 then reactModule.createElement(view, {
				AnchorPoint = dragItemAnchorPointBinding:map(function(p3)
					return Vector2.new(p3.x, p3.y)
				end),
				onActivated = function() end,
				Position = dragItemPositionBinding:map(function(p4)
					return UDim2.fromOffset(p4.xOffset, p4.yOffset)
				end),
				ref = dragItemRef,
				stateLayer = {
					affordance = foundationModule.Enums.StateLayerAffordance.None
				},
				tag = {
					["row auto-x padding-x-small padding-y-xsmall size-0-1100"] = isItemHorizontal,
					["col auto-y padding-y-small padding-x-xsmall size-1100-0"] = not isItemHorizontal,
					["align-x-center align-y-center bg-over-media-0 flex-evenly radius-circle"] = true
				}
			}, {
				DragDetector = reactModule.createElement("UIDragDetector", {
					DragStyle = Enum.UIDragDetectorDragStyle.Scriptable,
					BoundingUI = dragContainerRef,
					ref = dragDetectorRef,
					ResponseStyle = Enum.UIDragDetectorResponseStyle.CustomOffset
				}),
				VideoCaptureControl = if p0.hasVideoCaptureCapability then reactModule.createElement(videoCaptureControlModule, { layoutOrder = 1, popoverSide = t[snapDirection] }) else nil,
				ScreenshotCTA = if not var26 then reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = {
						["size-1200-1200"] = true,
						["anchor-center-center auto-xy clip position-center-center radius-circle"] = true
					},
					onActivated = useCallback(function()
						-- upvalues: socialStopwatchModule (copy), var20 (ref), eventNamesModule (copy), var27 (ref), var21 (ref), takeCaptureModule (copy)
						if not socialStopwatchModule.Stopwatch.get(socialStopwatchModule.Events.CaptureTaken) then
							socialStopwatchModule.Stopwatch.start(socialStopwatchModule.Events.CaptureTaken)
						end
						var20.fireEvent(eventNamesModule.CapturesEntrypointActivated)
						var27()
						var21(takeCaptureModule())
					end, { var27 }),
					ref = screenshotButtonRef
				}, {
					ScreenshotIconWithTooltip = reactModule.createElement(tooltip, {
						align = popoverAlign.Center,
						side = t[snapDirection],
						title = var22.captureScreenshot
					}, reactModule.createElement(view, { tag = "size-1200-1200" }, {
						reactModule.createElement(icon, {
							name = "icons/controls/screenCapture",
							AnchorPoint = Vector2.new(0.5, 0.5),
							Position = UDim2.fromScale(0.5, 0.5),
							style = var23.Color.Content.Emphasis
						})
					}))
				}) else nil,
				VoiceChatIndicator = if var26 then reactModule.createElement(voiceChatIndicatorModule, { layoutOrder = 3, popoverSide = t[snapDirection] }) else nil,
				DragAffordance = reactModule.createElement(view, {
					LayoutOrder = 4,
					tag = "anchor-center-center auto-xy padding-xxsmall position-center-center"
				}, {
					DragAffordanceIcon = reactModule.createElement(image, {
						Image = "component_assets/dragger_small",
						tag = "anchor-center-center content-muted position-center-center size-600-400",
						Rotation = if isItemHorizontal then 90 else 0
					})
				})
			}) else nil
		})
	})
end)