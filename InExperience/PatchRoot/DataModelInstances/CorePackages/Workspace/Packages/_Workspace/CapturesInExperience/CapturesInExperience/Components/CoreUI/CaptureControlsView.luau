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
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
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
local debugOverrideCaptureControlsVideoGuacPolicy = game:DefineFastFlag("DebugOverrideCaptureControlsVideoGuacPolicy", false)
local fStringSocialCaptureIXPLayer = require(parent_1.SharedFlags).FStringSocialCaptureIXPLayer
local fFlagCapturesControlsUseBuilderIconsModule = require(parent.Flags.FFlagCapturesControlsUseBuilderIcons)
local var1 = if fFlagCapturesControlsUseBuilderIconsModule then iconName.FrameCameraCenter else "icons/controls/screenCapture"
local var2 = if fFlagCapturesControlsUseBuilderIconsModule then iconSize.Large else nil
local t = {
	[snapDirectionModule.Bottom] = popoverSide.Top,
	[snapDirectionModule.Left] = popoverSide.Right,
	[snapDirectionModule.Right] = popoverSide.Left,
	[snapDirectionModule.Top] = popoverSide.Bottom
}

return capturesPolicyModule.connect(function(p1)
	-- upvalues: captureService (ref), debugOverrideCaptureControlsVideoGuacPolicy (ref)
	return {
		hasVideoCaptureCapability = p1.hasVideoCaptureCapability() and captureService:CanCaptureVideo() or debugOverrideCaptureControlsVideoGuacPolicy
	}
end)(function(p1)
	-- upvalues: useAnalyticsModule (ref), useDispatch (ref), useLocalization (ref), useTokens (ref), useTopbarInsetModule (ref), useSelector (ref), constantsModule (ref), useEffect (ref), IXPServiceWrapper (ref), fStringSocialCaptureIXPLayer (ref), usePlayShutterSoundModule (ref), reactModule (ref), useCaptureControlsControllerModule (ref), eventNamesModule (ref), useCallback (ref), socialStopwatchModule (ref), takeCaptureModule (ref), view (ref), foundationModule (ref), videoCaptureControlModule (ref), t (ref), tooltip (ref), popoverAlign (ref), icon (ref), var1 (ref), var2 (ref), voiceChatIndicatorModule (ref), fFlagCapturesControlsUseBuilderIconsModule (ref), iconName (ref), image (ref)
	local var3 = useAnalyticsModule()
	local var4 = useDispatch()
	local var5 = useLocalization({
		captureScreenshot = "Feature.Captures.Title.CaptureScreenshotTooltip"
	})
	local var6 = useTokens()
	local var7 = useTopbarInsetModule()
	local var8 = useSelector(function(p2)
		-- upvalues: constantsModule (copy)
		return p2[constantsModule.RoduxKey].IsActive
	end)
	local var9 = useSelector(function(p2)
		-- upvalues: constantsModule (copy)
		return p2[constantsModule.RoduxKey].IsVideoCaptureActive.status
	end)
	useEffect(function()
		-- upvalues: var8 (ref), IXPServiceWrapper (copy), fStringSocialCaptureIXPLayer (copy)
		if var8 then
			IXPServiceWrapper:LogFlagLinkedUserLayerExposure(fStringSocialCaptureIXPLayer)
		end
	end, { var8 })
	local var10 = usePlayShutterSoundModule()
	local var11 = useCaptureControlsControllerModule(var8, reactModule.useMemo(function()
		-- upvalues: var7 (ref), var6 (ref)
		return Vector2.new(var7.Min.X - var6.Padding.Small, var7.Height - var6.Padding.XSmall - var6.Padding.XXSmall)
	end, { var7, var6 }))
	local dragContainerRef = var11.dragContainerRef
	local dragDetectorRef = var11.dragDetectorRef
	local dragItemAnchorPointBinding = var11.dragItemAnchorPointBinding
	local dragItemPositionBinding = var11.dragItemPositionBinding
	local dragItemRef = var11.dragItemRef
	local isItemHorizontal = var11.isItemHorizontal
	local screenshotButtonRef = var11.screenshotButtonRef
	local snapDirection = var11.snapDirection
	useEffect(function()
		-- upvalues: var8 (ref), var3 (ref), eventNamesModule (copy)
		if var8 then
			var3.fireEvent(eventNamesModule.CapturesEntrypointViewed)
		end
	end, { var8 })
	
	return reactModule.createElement(view, {
		tag = "padding-x-large padding-y-medium",
		Position = UDim2.fromOffset(0, -var7.Height),
		Size = UDim2.new(1, 0, 1, var7.Height),
		ZIndex = constantsModule.ZIndex.Entrypoint
	}, {
		PaddedContainer = reactModule.createElement(view, {
			tag = "anchor-center-center position-center-center size-full",
			ref = dragContainerRef
		}, {
			CaptureControls = if var8 then reactModule.createElement(view, {
				AnchorPoint = dragItemAnchorPointBinding:map(function(p2)
					return Vector2.new(p2.x, p2.y)
				end),
				onActivated = function() end,
				Position = dragItemPositionBinding:map(function(p2)
					return UDim2.fromOffset(p2.xOffset, p2.yOffset)
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
				VideoCaptureControl = if p1.hasVideoCaptureCapability then reactModule.createElement(videoCaptureControlModule, { layoutOrder = 1, popoverSide = t[snapDirection] }) else nil,
				ScreenshotCTA = if not var9 then reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = {
						["size-1200-1200"] = true,
						["anchor-center-center auto-xy clip position-center-center radius-circle"] = true
					},
					onActivated = useCallback(function()
						-- upvalues: socialStopwatchModule (copy), var3 (ref), eventNamesModule (copy), var10 (ref), var4 (ref), takeCaptureModule (copy)
						if not socialStopwatchModule.Stopwatch.get(socialStopwatchModule.Events.CaptureTaken) then
							socialStopwatchModule.Stopwatch.start(socialStopwatchModule.Events.CaptureTaken)
						end
						var3.fireEvent(eventNamesModule.CapturesEntrypointActivated)
						var10()
						var4(takeCaptureModule())
					end, { var10 }),
					ref = screenshotButtonRef
				}, {
					ScreenshotIconWithTooltip = reactModule.createElement(tooltip, {
						align = popoverAlign.Center,
						side = t[snapDirection],
						title = var5.captureScreenshot
					}, reactModule.createElement(view, { tag = "size-1200-1200" }, {
						reactModule.createElement(icon, {
							AnchorPoint = Vector2.new(0.5, 0.5),
							Position = UDim2.fromScale(0.5, 0.5),
							name = var1,
							size = var2,
							style = var6.Color.Content.Emphasis
						})
					}))
				}) else nil,
				VoiceChatIndicator = if var9 then reactModule.createElement(voiceChatIndicatorModule, { layoutOrder = 3, popoverSide = t[snapDirection] }) else nil,
				DragAffordance = reactModule.createElement(view, {
					LayoutOrder = 4,
					tag = "anchor-center-center auto-xy padding-xxsmall position-center-center"
				}, {
					DragAffordanceIcon = if fFlagCapturesControlsUseBuilderIconsModule then reactModule.createElement(icon, {
						tag = "position-center-center anchor-center-center",
						name = iconName.SixDotsTwoColumnGrid,
						Rotation = if isItemHorizontal then 0 else 90,
						style = var6.Color.Content.Muted
					}) else reactModule.createElement(image, {
						Image = "component_assets/dragger_small",
						tag = "anchor-center-center content-muted position-center-center size-600-400",
						Rotation = if isItemHorizontal then 90 else 0
					})
				})
			}) else nil
		})
	})
end)