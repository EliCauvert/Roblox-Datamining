local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local CaptureService = game:GetService("CaptureService")
local ReactModule = require(Parent1.React)
local RoactUtilsModule = require(Parent1.RoactUtils)
local FoundationModule = require(Parent1.Foundation)
local IXPServiceWrapper = require(Parent1.IXPServiceWrapper).IXPServiceWrapper
local SocialStopwatchModule = require(Parent1.SocialStopwatch)
local Icon = FoundationModule.Icon
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local Image = FoundationModule.Image
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local PopoverSide = FoundationModule.Enums.PopoverSide
local Tooltip = FoundationModule.Tooltip
local View = FoundationModule.View
local GalleryButtonContentModule = require(Parent.Components.CoreUI.GalleryButtonContent)
local VideoCaptureControlModule = require(Parent.Components.CoreUI.VideoCaptureControl)
local VoiceChatIndicatorModule = require(Parent.Components.CoreUI.VoiceChatIndicator)
local CapturesContextModule = require(Parent.Context.CapturesContext)
local CarouselOpenedModule = require(Parent.Actions.CarouselOpened)
local ConstantsModule = require(Parent.Constants)
local EventNamesModule = require(Parent.Analytics.EventNames)
local GetLatestCaptureStoreModule = require(Parent.Stores.GetLatestCaptureStore)
local TakeCaptureModule = require(Parent.Thunks.TakeCapture)
local FindCaptureIndexModule = require(Parent.Utils.findCaptureIndex)
local SnapDirectionModule = require(Parent.Enums.SnapDirection)
local UseAnalyticsModule = require(Parent.Analytics.useAnalytics)
local UseCallbackFunction = ReactModule.useCallback
local UseCaptureControlsControllerModule = require(Parent.Hooks.useCaptureControlsController)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseEffectFunction = ReactModule.useEffect
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization
local UsePlayShutterSoundModule = require(Parent.Hooks.usePlayShutterSound)
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseLatestCaptureModule = require(Parent.Hooks.useLatestCapture)
local UseSystemMenuDetectionModule = require(Parent.Hooks.useSystemMenuDetection)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseTopbarInsetModule = require(Parent.Hooks.useTopbarInset)
local DebugOverrideCaptureControlsVideoGuacPolicy = game:DefineFastFlag("DebugOverrideCaptureControlsVideoGuacPolicy", false)
local FStringSocialCaptureIXPLayer = require(Parent1.SharedFlags).FStringSocialCaptureIXPLayer
local FFlagCapturesControlsUseBuilderIconsModule = require(Parent.Flags.FFlagCapturesControlsUseBuilderIcons)
local FFlagCapturesControlsGalleryButtonModule = require(Parent.Flags.FFlagCapturesControlsGalleryButton)
local FrameCameraCenter = if FFlagCapturesControlsUseBuilderIconsModule then IconName.FrameCameraCenter else "icons/controls/screenCapture"
local Large = if FFlagCapturesControlsUseBuilderIconsModule then IconSize.Large else nil
local config = {
	[SnapDirectionModule.Bottom] = PopoverSide.Top,
	[SnapDirectionModule.Left] = PopoverSide.Right,
	[SnapDirectionModule.Right] = PopoverSide.Left,
	[SnapDirectionModule.Top] = PopoverSide.Bottom
}

return (require(Parent.App.CapturesPolicy).connect(function(p1)
	-- upvalues: CaptureService (copy), DebugOverrideCaptureControlsVideoGuacPolicy (copy)
	return {
		hasVideoCaptureCapability = p1.hasVideoCaptureCapability() and CaptureService:CanCaptureVideo() or DebugOverrideCaptureControlsVideoGuacPolicy
	}
end)(function(p1)
	-- upvalues: UseAnalyticsModule (copy), UseDispatchFunction (copy), UseLocalizationFunction (copy), FFlagCapturesControlsGalleryButtonModule (copy), UseTokensFunction (copy), ReactModule (copy), CapturesContextModule (copy), UseSystemMenuDetectionModule (copy), UseLatestCaptureModule (copy), UseSelectorFunction (copy), ConstantsModule (copy), UseTopbarInsetModule (copy), UseEffectFunction (copy), IXPServiceWrapper (copy), FStringSocialCaptureIXPLayer (copy), UsePlayShutterSoundModule (copy), UseCaptureControlsControllerModule (copy), EventNamesModule (copy), UseCallbackFunction (copy), SocialStopwatchModule (copy), TakeCaptureModule (copy), GetLatestCaptureStoreModule (copy), FindCaptureIndexModule (copy), CarouselOpenedModule (copy), GalleryButtonContentModule (copy), View (copy), FoundationModule (copy), VideoCaptureControlModule (copy), config (copy), Tooltip (copy), PopoverAlign (copy), Icon (copy), FrameCameraCenter (copy), Large (copy), VoiceChatIndicatorModule (copy), FFlagCapturesControlsUseBuilderIconsModule (copy), IconName (copy), Image (copy)
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		captureScreenshot = "Feature.Captures.Title.CaptureScreenshotTooltip",
		gallery = if FFlagCapturesControlsGalleryButtonModule then "Feature.Captures.Title.Gallery" else nil
	})
	local UseTokensResult = UseTokensFunction()
	local OpenGallery = if FFlagCapturesControlsGalleryButtonModule then ReactModule.useContext(CapturesContextModule).openGallery else nil
	local UseSystemMenuDetectionModuleResult = if FFlagCapturesControlsGalleryButtonModule then UseSystemMenuDetectionModule() else false
	local UseLatestCaptureModuleResult = if FFlagCapturesControlsGalleryButtonModule then UseLatestCaptureModule() else nil
	local UseSelectorResult = if FFlagCapturesControlsGalleryButtonModule then UseSelectorFunction(function(p2)
		-- upvalues: ConstantsModule (upval)
		return p2[ConstantsModule.RoduxKey].Captures
	end) else nil
	local UseTopbarInsetModuleResult = UseTopbarInsetModule()
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		-- upvalues: ConstantsModule (upval)
		return p2[ConstantsModule.RoduxKey].IsActive
	end)
	local UseSelectorResult2 = UseSelectorFunction(function(p2)
		-- upvalues: ConstantsModule (upval)
		return p2[ConstantsModule.RoduxKey].IsVideoCaptureActive.status
	end)
	UseEffectFunction(function()
		-- upvalues: UseSelectorResult1 (copy), IXPServiceWrapper (upval), FStringSocialCaptureIXPLayer (upval)
		if UseSelectorResult1 then
			IXPServiceWrapper:LogFlagLinkedUserLayerExposure(FStringSocialCaptureIXPLayer)
		end
	end, { UseSelectorResult1 })
	local UsePlayShutterSoundModuleResult = UsePlayShutterSoundModule()
	local UseCaptureControlsControllerModuleResult = UseCaptureControlsControllerModule(UseSelectorResult1, (ReactModule.useMemo(function(): Vector2
		-- upvalues: UseTopbarInsetModuleResult (copy), UseTokensResult (copy)
		return Vector2.new(UseTopbarInsetModuleResult.Min.X - UseTokensResult.Padding.Small, UseTopbarInsetModuleResult.Height - UseTokensResult.Padding.XSmall - UseTokensResult.Padding.XXSmall)
	end, { UseTopbarInsetModuleResult, UseTokensResult })))
	local DragContainerRef = UseCaptureControlsControllerModuleResult.dragContainerRef
	local DragDetectorRef = UseCaptureControlsControllerModuleResult.dragDetectorRef
	local DragItemAnchorPointBinding = UseCaptureControlsControllerModuleResult.dragItemAnchorPointBinding
	local DragItemPositionBinding = UseCaptureControlsControllerModuleResult.dragItemPositionBinding
	local DragItemRef = UseCaptureControlsControllerModuleResult.dragItemRef
	local IsItemHorizontal = UseCaptureControlsControllerModuleResult.isItemHorizontal
	local ScreenshotButtonRef = UseCaptureControlsControllerModuleResult.screenshotButtonRef
	local SnapDirection = UseCaptureControlsControllerModuleResult.snapDirection
	UseEffectFunction(function()
		-- upvalues: UseSelectorResult1 (copy), UseAnalyticsModuleResult (copy), EventNamesModule (upval)
		if UseSelectorResult1 then
			UseAnalyticsModuleResult.fireEvent(EventNamesModule.CapturesEntrypointViewed)
		end
	end, { UseSelectorResult1 })
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: SocialStopwatchModule (upval), UseAnalyticsModuleResult (copy), EventNamesModule (upval), UsePlayShutterSoundModuleResult (copy), UseDispatchResult (copy), TakeCaptureModule (upval)
		if not SocialStopwatchModule.Stopwatch.get(SocialStopwatchModule.Events.CaptureTaken) then
			SocialStopwatchModule.Stopwatch.start(SocialStopwatchModule.Events.CaptureTaken)
		end
		UseAnalyticsModuleResult.fireEvent(EventNamesModule.CapturesEntrypointActivated)
		UsePlayShutterSoundModuleResult()
		UseDispatchResult(TakeCaptureModule())
	end, { UsePlayShutterSoundModuleResult })
	local UseCallbackResult1 = if FFlagCapturesControlsGalleryButtonModule then UseCallbackFunction(function()
		-- upvalues: GetLatestCaptureStoreModule (upval), OpenGallery (copy), UseLatestCaptureModuleResult (copy), UseSelectorResult (copy), FindCaptureIndexModule (upval), UseAnalyticsModuleResult (copy), EventNamesModule (upval), UseDispatchResult (copy), CarouselOpenedModule (upval)
		local LatestCaptureFilePath = GetLatestCaptureStoreModule(false).getLatestCaptureFilePath(false)
		
		if not OpenGallery() or UseLatestCaptureModuleResult == nil or UseSelectorResult == nil then return end
		local CaptureIndexModule = FindCaptureIndexModule(UseSelectorResult, UseLatestCaptureModuleResult, LatestCaptureFilePath)
		
		if CaptureIndexModule then
			UseAnalyticsModuleResult.fireEvent(EventNamesModule.CapturesCarouselOpened)
			UseDispatchResult(CarouselOpenedModule(CaptureIndexModule))
		end
	end, {
		OpenGallery,
		UseLatestCaptureModuleResult,
		UseSelectorResult,
		UseAnalyticsModuleResult.fireEvent,
		UseDispatchResult
	}) else nil
	local Element = if FFlagCapturesControlsGalleryButtonModule then ReactModule.createElement(GalleryButtonContentModule, { latestCapture = UseLatestCaptureModuleResult }) else nil
	
	return ReactModule.createElement(View, {
		tag = "padding-x-large padding-y-medium",
		Position = UDim2.fromOffset(0, -UseTopbarInsetModuleResult.Height),
		Size = UDim2.new(1, 0, 1, UseTopbarInsetModuleResult.Height),
		ZIndex = ConstantsModule.ZIndex.Entrypoint
	}, {
		PaddedContainer = ReactModule.createElement(View, {
			tag = "anchor-center-center position-center-center size-full",
			ref = DragContainerRef
		}, {
			CaptureControls = if UseSelectorResult1 then ReactModule.createElement(View, {
				AnchorPoint = DragItemAnchorPointBinding:map(function(Vector): Vector2
					return Vector2.new(Vector.x, Vector.y)
				end),
				onActivated = function() end,
				Position = DragItemPositionBinding:map(function(p2): UDim2
					return UDim2.fromOffset(p2.xOffset, p2.yOffset)
				end),
				ref = DragItemRef,
				stateLayer = {
					affordance = FoundationModule.Enums.StateLayerAffordance.None
				},
				tag = {
					["row auto-x padding-x-small padding-y-xsmall size-0-1100"] = IsItemHorizontal,
					["col auto-y padding-y-small padding-x-xsmall size-1100-0"] = not IsItemHorizontal,
					["align-x-center align-y-center bg-over-media-0 flex-evenly radius-circle"] = true
				}
			}, {
				DragDetector = ReactModule.createElement("UIDragDetector", {
					DragStyle = Enum.UIDragDetectorDragStyle.Scriptable,
					BoundingUI = DragContainerRef,
					ref = DragDetectorRef,
					ResponseStyle = Enum.UIDragDetectorResponseStyle.CustomOffset
				}),
				VideoCaptureControl = if p1.hasVideoCaptureCapability then ReactModule.createElement(VideoCaptureControlModule, { layoutOrder = 1, popoverSide = config[SnapDirection] }) else nil,
				ScreenshotCTA = if UseSelectorResult2 then nil else ReactModule.createElement(View, {
					LayoutOrder = 2,
					tag = {
						["size-1200-1200"] = true,
						["anchor-center-center auto-xy clip position-center-center radius-circle"] = true
					},
					onActivated = UseCallbackResult,
					ref = ScreenshotButtonRef
				}, {
					ScreenshotIconWithTooltip = ReactModule.createElement(Tooltip, {
						align = PopoverAlign.Center,
						side = config[SnapDirection],
						title = UseLocalizationResult.captureScreenshot
					}, ReactModule.createElement(View, { tag = "size-1200-1200" }, {
						ReactModule.createElement(Icon, {
							AnchorPoint = Vector2.new(0.5, 0.5),
							Position = UDim2.fromScale(0.5, 0.5),
							name = FrameCameraCenter,
							size = Large,
							style = UseTokensResult.Color.Content.Emphasis
						})
					}))
				}),
				GalleryCTA = if FFlagCapturesControlsGalleryButtonModule and OpenGallery and not UseSelectorResult2 then ReactModule.createElement(View, {
					LayoutOrder = 3,
					tag = "position-center-center anchor-center-center size-1200-1200 auto-xy radius-circle clip",
					testId = "--social-captures-controls-gallery-button",
					onActivated = UseCallbackResult1
				}, {
					GalleryButtonContent = Element,
					GalleryTooltip = if UseSystemMenuDetectionModuleResult then nil else ReactModule.createElement(Tooltip, {
						align = PopoverAlign.Center,
						side = config[SnapDirection],
						title = UseLocalizationResult.gallery
					}, ReactModule.createElement(View, { tag = "size-1200-1200" }))
				}) else nil,
				VoiceChatIndicator = if UseSelectorResult2 then ReactModule.createElement(VoiceChatIndicatorModule, {
					layoutOrder = if FFlagCapturesControlsGalleryButtonModule then 4 else 3,
					popoverSide = config[SnapDirection]
				}) else nil,
				DragAffordance = ReactModule.createElement(View, {
					tag = "anchor-center-center auto-xy padding-xxsmall position-center-center",
					LayoutOrder = if FFlagCapturesControlsGalleryButtonModule then 5 else 4
				}, {
					DragAffordanceIcon = if FFlagCapturesControlsUseBuilderIconsModule then ReactModule.createElement(Icon, {
						tag = "position-center-center anchor-center-center",
						name = IconName.SixDotsTwoColumnGrid,
						Rotation = if IsItemHorizontal then 0 else 90,
						style = UseTokensResult.Color.Content.Muted
					}) else ReactModule.createElement(Image, {
						Image = "component_assets/dragger_small",
						tag = "anchor-center-center content-muted position-center-center size-600-400",
						Rotation = if IsItemHorizontal then 90 else 0
					})
				})
			}) else nil
		})
	})
end))