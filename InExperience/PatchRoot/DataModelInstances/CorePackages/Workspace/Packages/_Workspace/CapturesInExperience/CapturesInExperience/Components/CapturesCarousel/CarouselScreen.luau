local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local contextActionService = game:GetService("ContextActionService")
local localizationService = game:GetService("LocalizationService")
local appCommonLibModule = require(parent_1.AppCommonLib)
local IXPServiceWrapper = require(parent_1.IXPServiceWrapper).IXPServiceWrapper
local reactModule = require(parent_1.React)
local roactUtilsModule = require(parent_1.RoactUtils)
local robloxAppHooksModule = require(parent_1.RobloxAppHooks)
local UIBloxModule = require(parent_1.UIBlox)
local images = UIBloxModule.App.ImageSet.Images
local imageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local signal = appCommonLibModule.Signal
local useStyle = UIBloxModule.Core.Style.useStyle
local useCallback = reactModule.useCallback
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useEffect = reactModule.useEffect
local useEffectOnce = roactUtilsModule.Hooks.useEffectOnce
local useRef = reactModule.useRef
local useScreenSize = robloxAppHooksModule.useScreenSize
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useState = reactModule.useState
local capturesCarouselModule = require(parent.Components.CapturesCarousel.CapturesCarousel)
local capturesToastTypeModule = require(parent.Enums.CapturesToastType)
local carouselClosedModule = require(parent.Actions.CarouselClosed)
local carouselCTAContainerModule = require(parent.Components.CapturesCarousel.CarouselCTAContainer)
local constantsModule = require(parent.Constants)
local deleteCaptureModule = require(parent.Thunks.DeleteCapture)
local deleteWarningModalModule = require(parent.Components.Common.DeleteWarningModal)
local eventNamesModule = require(parent.Analytics.EventNames)
local getTimestampFromCaptureModule = require(parent.Utils.getTimestampFromCapture)
local permissionModalModule = require(parent.Components.Common.PermissionModal)
local toastContainerModule = require(parent.Components.Common.ToastContainer)
local toastTriggeredModule = require(parent.Actions.ToastTriggered)
local _ = require(parent.Types)
local useAnalyticsModule = require(parent.Analytics.useAnalytics)
local fFlagUseMediaPlayerInCarousel = require(parent_1.SharedFlags).FFlagUseMediaPlayerInCarousel
local fStringSocialCaptureTakenIXPLayer = require(parent_1.SharedFlags).FStringSocialCaptureTakenIXPLayer
local uDim2 = UDim2.fromOffset(32, 32)

local function getTitle(p0) --[[ line: 55 ]]
	-- upvalues: getTimestampFromCaptureModule (ref), localizationService (ref)
	local var22 = getTimestampFromCaptureModule(p0)
	
	if var22 then
		assert(typeof(var22) == "number", "Expected timestamp to be a number")
		local dateTime = DateTime.fromUnixTimestampMillis(var22)
		local robloxLocaleId = localizationService.RobloxLocaleId
		
		return `{dateTime:FormatLocalTime("L", robloxLocaleId)} {dateTime:FormatLocalTime("LT", robloxLocaleId)}`
	end
	return ""
end

return function(_) --[[ line: 73 ]]
	-- upvalues: useAnalyticsModule (ref), useDispatch (ref), useStyle (ref), useSelector (ref), constantsModule (ref), useRef (ref), signal (ref), useState (ref), useScreenSize (ref), useEffectOnce (ref), IXPServiceWrapper (ref), fStringSocialCaptureTakenIXPLayer (ref), useEffect (ref), toastTriggeredModule (ref), capturesToastTypeModule (ref), useCallback (ref), eventNamesModule (ref), carouselClosedModule (ref), deleteCaptureModule (ref), contextActionService (ref), getTitle (ref), reactModule (ref), fFlagUseMediaPlayerInCarousel (ref), imageSetButton (ref), images (ref), uDim2 (ref), capturesCarouselModule (ref), carouselCTAContainerModule (ref), deleteWarningModalModule (ref), permissionModalModule (ref), toastContainerModule (ref)
	local var24 = useAnalyticsModule()
	local var25 = useDispatch()
	local var26 = useStyle()
	local var27 = useSelector(function(p1) --[[ line: 78 ]]
		-- upvalues: constantsModule (copy)
		return p1[constantsModule.RoduxKey].Captures
	end)
	local var28 = useSelector(function(p2) --[[ line: 82 ]]
		-- upvalues: constantsModule (copy)
		return p2[constantsModule.RoduxKey].Carousel.IsOpen
	end)
	local var29 = useSelector(function(p3) --[[ line: 86 ]]
		-- upvalues: constantsModule (copy)
		return p3[constantsModule.RoduxKey].Carousel.SelectedCaptureIndex
	end)
	local var30 = useSelector(function(p4) --[[ line: 90 ]]
		-- upvalues: constantsModule (copy)
		return p4[constantsModule.RoduxKey].Carousel.IsDeleteWarningModalOpen
	end)
	local var31 = useRef(signal.new())
	local var32, var33 = useState(false)
	local var34, var35 = useState(false)
	local var36 = useScreenSize()
	useEffectOnce(function() --[[ line: 99 ]]
		-- upvalues: IXPServiceWrapper (copy), fStringSocialCaptureTakenIXPLayer (copy)
		IXPServiceWrapper:LogUserLayerExposure(fStringSocialCaptureTakenIXPLayer)
	end, var28)
	useEffect(function() --[[ line: 103 ]]
		-- upvalues: var25 (ref), toastTriggeredModule (copy), capturesToastTypeModule (copy)
		var25(toastTriggeredModule(capturesToastTypeModule.None))
	end, { var28 })
	local var37 = useCallback(function() --[[ line: 107 ]]
		-- upvalues: var33 (ref), var24 (ref), eventNamesModule (copy), var25 (ref), carouselClosedModule (copy)
		var33(false)
		var24.fireEvent(eventNamesModule.CapturesCarouselClosed)
		var25(carouselClosedModule())
	end, {})
	local var38 = useCallback(function() --[[ line: 113 ]]
		-- upvalues: var33 (ref), var24 (ref), eventNamesModule (copy), var25 (ref), carouselClosedModule (copy)
		var33(false)
		var24.fireEvent(eventNamesModule.CapturesCarouselClosedByKeyboard)
		var25(carouselClosedModule())
	end, {})
	local var39 = useCallback(function() --[[ line: 119 ]]
		-- upvalues: var35 (ref)
		var35(true)
	end, {})
	local var40 = useCallback(function() --[[ line: 123 ]]
		-- upvalues: var35 (ref)
		var35(false)
	end, {})
	local var41 = useCallback(function() --[[ line: 127 ]]
		-- upvalues: var33 (ref), var27 (ref), var29 (ref), var25 (ref), deleteCaptureModule (copy), var31 (ref)
		var33(true)
		local var43 = var27[var29]
		var31.current:fire(function() --[[ line: 131 ]]
			-- upvalues: var25 (copy), deleteCaptureModule (copy), var43 (ref), var33 (copy)
			var25(deleteCaptureModule(var43))
			var33(false)
		end)
	end, { var27, var29 })
	useEffect(function() --[[ line: 139 ]]
		-- upvalues: var28 (ref), var30 (ref), contextActionService (copy), var38 (ref)
		if var28 and not var30 then
			contextActionService:BindCoreAction("CapturesCarouselCloseShortcutAction", function(_, p5) --[[ line: 144 ]]
				-- upvalues: var38 (copy)
				if p5 == Enum.UserInputState.End then
					var38()
				end
			end, false, Enum.KeyCode.Escape)
			
			return function() --[[ line: 150 ]]
				-- upvalues: contextActionService (copy)
				contextActionService:UnbindCoreAction("CapturesCarouselCloseShortcutAction")
			end
		end
	end, { var28, var30, var38 })
	
	if var28 then
		local var42 = getTitle(var27[var29])
		
		return reactModule.createElement("Frame", {
			Active = true,
			BorderSizePixel = 0,
			BackgroundColor3 = var26.Theme.BackgroundContrast.Color,
			BackgroundTransparency = var26.Theme.BackgroundContrast.Transparency,
			Position = UDim2.fromOffset(0, 0),
			Size = UDim2.fromScale(1, 1)
		}, {
			CarouselContainer = reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
				UIListLayout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					Padding = UDim.new(0, 8),
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				Padding = reactModule.createElement("UIPadding", {
					PaddingBottom = UDim.new(0, 16),
					PaddingTop = UDim.new(0, 8)
				}),
				TitleFrame = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, 32),
					ZIndex = if fFlagUseMediaPlayerInCarousel then 1 else 2
				}, {
					CloseButton = reactModule.createElement(imageSetButton, {
						AnchorPoint = Vector2.new(0, 0.5),
						BackgroundTransparency = 1,
						Image = images["icons/navigation/close"],
						ImageColor3 = var26.Theme.IconEmphasis.Color,
						ImageTransparency = var26.Theme.IconEmphasis.Transparency,
						Position = UDim2.new(0, 42, 0.5, 0),
						Size = uDim2,
						[reactModule.Event.Activated] = var37
					}),
					DropShadow = reactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						ZIndex = 1,
						AnchorPoint = Vector2.new(0.5, 0.5),
						AutomaticSize = Enum.AutomaticSize.X,
						Font = var26.Font.Header2.Font,
						Position = UDim2.new(0.5, 0, 0.5, 2),
						Size = UDim2.fromScale(0, 1),
						Text = var42,
						TextColor3 = var26.Theme.DropShadow.Color,
						TextSize = var26.Font.BaseSize * var26.Font.Header2.RelativeSize,
						TextTransparency = var26.Theme.DropShadow.Transparency,
						TextXAlignment = Enum.TextXAlignment.Center,
						TextYAlignment = Enum.TextYAlignment.Center
					}, {
						UIStroke = reactModule.createElement("UIStroke", {
							Thickness = 1,
							ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
							Color = var26.Theme.DropShadow.Color,
							LineJoinMode = Enum.LineJoinMode.Round,
							Transparency = var26.Theme.DropShadow.Transparency
						})
					}),
					Title = reactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						ZIndex = 2,
						AnchorPoint = Vector2.new(0.5, 0.5),
						AutomaticSize = Enum.AutomaticSize.X,
						Font = var26.Font.Header2.Font,
						Position = UDim2.fromScale(0.5, 0.5),
						Size = UDim2.fromScale(0, 1),
						Text = var42,
						TextColor3 = var26.Theme.TextEmphasis.Color,
						TextSize = var26.Font.BaseSize * var26.Font.Header2.RelativeSize,
						TextXAlignment = Enum.TextXAlignment.Center,
						TextYAlignment = Enum.TextYAlignment.Center
					})
				}),
				CapturesCarousel = reactModule.createElement(capturesCarouselModule, {
					LayoutOrder = 2,
					deleteItemSignal = var31.current,
					isDisabled = var32,
					maxHeight = var36.Y - 32 - 40 - 8 - 16 - 16,
					ZIndex = if fFlagUseMediaPlayerInCarousel then 2 else 1
				}),
				CTAContainer = reactModule.createElement(carouselCTAContainerModule, {
					height = 40,
					LayoutOrder = 3,
					deleteItem = var41,
					isDisabled = var32 or var30,
					openPermissionModal = var39,
					ZIndex = if fFlagUseMediaPlayerInCarousel then 1 else 2
				})
			}),
			DeleteWarningModal = reactModule.createElement(deleteWarningModalModule, { zIndex = 3, deleteItem = var41 }),
			PermissionModal = reactModule.createElement(permissionModalModule, { zIndex = 3, closeModal = var40, visible = var34 }),
			ToastsFrame = reactModule.createElement("Frame", {
				Active = false,
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				ZIndex = constantsModule.ZIndex.Toasts
			}, {
				ToastContainer = reactModule.createElement(toastContainerModule)
			})
		})
	end
	return nil
end