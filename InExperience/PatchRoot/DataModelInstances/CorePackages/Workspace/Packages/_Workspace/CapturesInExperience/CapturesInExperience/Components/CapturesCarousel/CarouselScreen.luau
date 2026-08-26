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

local function getTitle(p1)
	-- upvalues: getTimestampFromCaptureModule (ref), localizationService (ref)
	local var1 = getTimestampFromCaptureModule(p1)
	
	if var1 then
		assert(typeof(var1) == "number", "Expected timestamp to be a number")
		local dateTime = DateTime.fromUnixTimestampMillis(var1)
		local robloxLocaleId = localizationService.RobloxLocaleId
		
		return `{dateTime:FormatLocalTime("L", robloxLocaleId)} {dateTime:FormatLocalTime("LT", robloxLocaleId)}`
	end
	return ""
end

return function(_)
	-- upvalues: useAnalyticsModule (ref), useDispatch (ref), useStyle (ref), useSelector (ref), constantsModule (ref), useRef (ref), signal (ref), useState (ref), useScreenSize (ref), useEffectOnce (ref), IXPServiceWrapper (ref), fStringSocialCaptureTakenIXPLayer (ref), useEffect (ref), toastTriggeredModule (ref), capturesToastTypeModule (ref), useCallback (ref), eventNamesModule (ref), carouselClosedModule (ref), deleteCaptureModule (ref), contextActionService (ref), getTitle (ref), reactModule (ref), fFlagUseMediaPlayerInCarousel (ref), imageSetButton (ref), images (ref), uDim2 (ref), capturesCarouselModule (ref), carouselCTAContainerModule (ref), deleteWarningModalModule (ref), permissionModalModule (ref), toastContainerModule (ref)
	local var1 = useAnalyticsModule()
	local var2 = useDispatch()
	local var3 = useStyle()
	local var4 = useSelector(function(p1)
		-- upvalues: constantsModule (copy)
		return p1[constantsModule.RoduxKey].Captures
	end)
	local var5 = useSelector(function(p1)
		-- upvalues: constantsModule (copy)
		return p1[constantsModule.RoduxKey].Carousel.IsOpen
	end)
	local var6 = useSelector(function(p1)
		-- upvalues: constantsModule (copy)
		return p1[constantsModule.RoduxKey].Carousel.SelectedCaptureIndex
	end)
	local var7 = useSelector(function(p1)
		-- upvalues: constantsModule (copy)
		return p1[constantsModule.RoduxKey].Carousel.IsDeleteWarningModalOpen
	end)
	local var8 = useRef(signal.new())
	local var9, var10 = useState(false)
	local var11, var12 = useState(false)
	local var13 = useScreenSize()
	useEffectOnce(function()
		-- upvalues: IXPServiceWrapper (copy), fStringSocialCaptureTakenIXPLayer (copy)
		IXPServiceWrapper:LogUserLayerExposure(fStringSocialCaptureTakenIXPLayer)
	end, var5)
	useEffect(function()
		-- upvalues: var2 (ref), toastTriggeredModule (copy), capturesToastTypeModule (copy)
		var2(toastTriggeredModule(capturesToastTypeModule.None))
	end, { var5 })
	local var14 = useCallback(function()
		-- upvalues: var10 (ref), var1 (ref), eventNamesModule (copy), var2 (ref), carouselClosedModule (copy)
		var10(false)
		var1.fireEvent(eventNamesModule.CapturesCarouselClosed)
		var2(carouselClosedModule())
	end, {})
	local var15 = useCallback(function()
		-- upvalues: var10 (ref), var1 (ref), eventNamesModule (copy), var2 (ref), carouselClosedModule (copy)
		var10(false)
		var1.fireEvent(eventNamesModule.CapturesCarouselClosedByKeyboard)
		var2(carouselClosedModule())
	end, {})
	local var16 = useCallback(function()
		-- upvalues: var12 (ref)
		var12(true)
	end, {})
	local var17 = useCallback(function()
		-- upvalues: var12 (ref)
		var12(false)
	end, {})
	local var18 = useCallback(function()
		-- upvalues: var10 (ref), var4 (ref), var6 (ref), var2 (ref), deleteCaptureModule (copy), var8 (ref)
		var10(true)
		local var19 = var4[var6]
		var8.current:fire(function()
			-- upvalues: var2 (copy), deleteCaptureModule (copy), var19 (ref), var10 (copy)
			var2(deleteCaptureModule(var19))
			var10(false)
		end)
	end, { var4, var6 })
	useEffect(function()
		-- upvalues: var5 (ref), var7 (ref), contextActionService (copy), var15 (ref)
		if var5 and not var7 then
			contextActionService:BindCoreAction("CapturesCarouselCloseShortcutAction", function(_, p1)
				-- upvalues: var15 (copy)
				if p1 == Enum.UserInputState.End then
					var15()
				end
			end, false, Enum.KeyCode.Escape)
			
			return function()
				-- upvalues: contextActionService (copy)
				contextActionService:UnbindCoreAction("CapturesCarouselCloseShortcutAction")
			end
		end
	end, { var5, var7, var15 })
	
	if var5 then
		local var19 = getTitle(var4[var6])
		
		return reactModule.createElement("Frame", {
			Active = true,
			BorderSizePixel = 0,
			BackgroundColor3 = var3.Theme.BackgroundContrast.Color,
			BackgroundTransparency = var3.Theme.BackgroundContrast.Transparency,
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
						ImageColor3 = var3.Theme.IconEmphasis.Color,
						ImageTransparency = var3.Theme.IconEmphasis.Transparency,
						Position = UDim2.new(0, 42, 0.5, 0),
						Size = uDim2,
						[reactModule.Event.Activated] = var14
					}),
					DropShadow = reactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						ZIndex = 1,
						AnchorPoint = Vector2.new(0.5, 0.5),
						AutomaticSize = Enum.AutomaticSize.X,
						Font = var3.Font.Header2.Font,
						Position = UDim2.new(0.5, 0, 0.5, 2),
						Size = UDim2.fromScale(0, 1),
						Text = var19,
						TextColor3 = var3.Theme.DropShadow.Color,
						TextSize = var3.Font.BaseSize * var3.Font.Header2.RelativeSize,
						TextTransparency = var3.Theme.DropShadow.Transparency,
						TextXAlignment = Enum.TextXAlignment.Center,
						TextYAlignment = Enum.TextYAlignment.Center
					}, {
						UIStroke = reactModule.createElement("UIStroke", {
							Thickness = 1,
							ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
							Color = var3.Theme.DropShadow.Color,
							LineJoinMode = Enum.LineJoinMode.Round,
							Transparency = var3.Theme.DropShadow.Transparency
						})
					}),
					Title = reactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						ZIndex = 2,
						AnchorPoint = Vector2.new(0.5, 0.5),
						AutomaticSize = Enum.AutomaticSize.X,
						Font = var3.Font.Header2.Font,
						Position = UDim2.fromScale(0.5, 0.5),
						Size = UDim2.fromScale(0, 1),
						Text = var19,
						TextColor3 = var3.Theme.TextEmphasis.Color,
						TextSize = var3.Font.BaseSize * var3.Font.Header2.RelativeSize,
						TextXAlignment = Enum.TextXAlignment.Center,
						TextYAlignment = Enum.TextYAlignment.Center
					})
				}),
				CapturesCarousel = reactModule.createElement(capturesCarouselModule, {
					LayoutOrder = 2,
					deleteItemSignal = var8.current,
					isDisabled = var9,
					maxHeight = var13.Y - 32 - 40 - 8 - 16 - 16,
					ZIndex = if fFlagUseMediaPlayerInCarousel then 2 else 1
				}),
				CTAContainer = reactModule.createElement(carouselCTAContainerModule, {
					height = 40,
					LayoutOrder = 3,
					deleteItem = var18,
					isDisabled = var9 or var7,
					openPermissionModal = var16,
					ZIndex = if fFlagUseMediaPlayerInCarousel then 1 else 2
				})
			}),
			DeleteWarningModal = reactModule.createElement(deleteWarningModalModule, { zIndex = 3, deleteItem = var18 }),
			PermissionModal = reactModule.createElement(permissionModalModule, { zIndex = 3, closeModal = var17, visible = var11 }),
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