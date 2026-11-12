local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ContextActionService = game:GetService("ContextActionService")
local LocalizationService = game:GetService("LocalizationService")
local IXPServiceWrapper = require(Parent1.IXPServiceWrapper).IXPServiceWrapper
local ReactModule = require(Parent1.React)
local RoactUtilsModule = require(Parent1.RoactUtils)
local UIBloxModule = require(Parent1.UIBlox)
local FoundationModule = require(Parent1.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local Signal = require(Parent1.AppCommonLib).Signal
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseCallbackFunction = ReactModule.useCallback
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseEffectFunction = ReactModule.useEffect
local UseEffectOnceFunction = RoactUtilsModule.Hooks.useEffectOnce
local UseRefFunction = ReactModule.useRef
local UseScreenSizeFunction = require(Parent1.RobloxAppHooks).useScreenSize
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseStateFunction = ReactModule.useState
local CapturesCarouselModule = require(Parent.Components.CapturesCarousel.CapturesCarousel)
local CapturesToastTypeModule = require(Parent.Enums.CapturesToastType)
local CarouselClosedModule = require(Parent.Actions.CarouselClosed)
local CarouselCTAContainerModule = require(Parent.Components.CapturesCarousel.CarouselCTAContainer)
local ConstantsModule = require(Parent.Constants)
local DeleteCaptureModule = require(Parent.Thunks.DeleteCapture)
local DeleteWarningModalModule = require(Parent.Components.Common.DeleteWarningModal)
local EventNamesModule = require(Parent.Analytics.EventNames)
local GetTimestampFromCaptureModule = require(Parent.Utils.getTimestampFromCapture)
local PermissionModalModule = require(Parent.Components.Common.PermissionModal)
local ToastContainerModule = require(Parent.Components.Common.ToastContainer)
local ToastTriggeredModule = require(Parent.Actions.ToastTriggered)
local _ = require(Parent.Types)
local UseAnalyticsModule = require(Parent.Analytics.useAnalytics)
local FFlagUseMediaPlayerInCarousel = require(Parent1.SharedFlags).FFlagUseMediaPlayerInCarousel
local FStringSocialCaptureTakenIXPLayer = require(Parent1.SharedFlags).FStringSocialCaptureTakenIXPLayer
local _UDim2 = UDim2.fromOffset(32, 32)

local function getTitle(p1): string
	-- upvalues: GetTimestampFromCaptureModule (copy), LocalizationService (copy)
	local TimestampFromCaptureModule = GetTimestampFromCaptureModule(p1)
	
	if TimestampFromCaptureModule then
		assert(typeof(TimestampFromCaptureModule) == "number", "Expected timestamp to be a number")
		local _DateTime = DateTime.fromUnixTimestampMillis(TimestampFromCaptureModule)
		local RobloxLocaleId = LocalizationService.RobloxLocaleId
		
		return `{_DateTime:FormatLocalTime("L", RobloxLocaleId)} {_DateTime:FormatLocalTime("LT", RobloxLocaleId)}`
	else
		return ""
	end
end

return function(_)
	-- upvalues: UseAnalyticsModule (copy), UseDispatchFunction (copy), UseStyleFunction (copy), UseSelectorFunction (copy), ConstantsModule (copy), UseRefFunction (copy), Signal (copy), UseStateFunction (copy), UseScreenSizeFunction (copy), UseEffectOnceFunction (copy), IXPServiceWrapper (copy), FStringSocialCaptureTakenIXPLayer (copy), UseEffectFunction (copy), ToastTriggeredModule (copy), CapturesToastTypeModule (copy), UseCallbackFunction (copy), EventNamesModule (copy), CarouselClosedModule (copy), DeleteCaptureModule (copy), ContextActionService (copy), getTitle (copy), ReactModule (copy), FFlagUseMediaPlayerInCarousel (copy), ImageSetButton (copy), Images (copy), _UDim2 (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), CapturesCarouselModule (copy), CarouselCTAContainerModule (copy), DeleteWarningModalModule (copy), PermissionModalModule (copy), ToastContainerModule (copy)
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseDispatchResult = UseDispatchFunction()
	local UseStyleResult = UseStyleFunction()
	local UseSelectorResult = UseSelectorFunction(function(p1)
		-- upvalues: ConstantsModule (upval)
		return p1[ConstantsModule.RoduxKey].Captures
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p1)
		-- upvalues: ConstantsModule (upval)
		return p1[ConstantsModule.RoduxKey].Carousel.IsOpen
	end)
	local UseSelectorResult2 = UseSelectorFunction(function(p1)
		-- upvalues: ConstantsModule (upval)
		return p1[ConstantsModule.RoduxKey].Carousel.SelectedCaptureIndex
	end)
	local UseSelectorResult3 = UseSelectorFunction(function(p1)
		-- upvalues: ConstantsModule (upval)
		return p1[ConstantsModule.RoduxKey].Carousel.IsDeleteWarningModalOpen
	end)
	local UseRefResult = UseRefFunction(Signal.new())
	local UseStateResult, UseStateResult2 = UseStateFunction(false)
	local UseStateResult1, UseStateResult2_1 = UseStateFunction(false)
	local UseScreenSizeResult = UseScreenSizeFunction()
	UseEffectOnceFunction(function()
		-- upvalues: IXPServiceWrapper (upval), FStringSocialCaptureTakenIXPLayer (upval)
		IXPServiceWrapper:LogUserLayerExposure(FStringSocialCaptureTakenIXPLayer)
	end, UseSelectorResult1)
	UseEffectFunction(function()
		-- upvalues: UseDispatchResult (copy), ToastTriggeredModule (upval), CapturesToastTypeModule (upval)
		UseDispatchResult(ToastTriggeredModule(CapturesToastTypeModule.None))
	end, { UseSelectorResult1 })
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: UseStateResult2 (copy), UseAnalyticsModuleResult (copy), EventNamesModule (upval), UseDispatchResult (copy), CarouselClosedModule (upval)
		UseStateResult2(false)
		UseAnalyticsModuleResult.fireEvent(EventNamesModule.CapturesCarouselClosed)
		UseDispatchResult(CarouselClosedModule())
	end, {})
	local UseCallbackResult1 = UseCallbackFunction(function()
		-- upvalues: UseStateResult2 (copy), UseAnalyticsModuleResult (copy), EventNamesModule (upval), UseDispatchResult (copy), CarouselClosedModule (upval)
		UseStateResult2(false)
		UseAnalyticsModuleResult.fireEvent(EventNamesModule.CapturesCarouselClosedByKeyboard)
		UseDispatchResult(CarouselClosedModule())
	end, {})
	local UseCallbackResult2 = UseCallbackFunction(function()
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(true)
	end, {})
	local UseCallbackResult3 = UseCallbackFunction(function()
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(false)
	end, {})
	local UseCallbackResult4 = UseCallbackFunction(function()
		-- upvalues: UseStateResult2 (copy), UseSelectorResult (copy), UseSelectorResult2 (copy), UseDispatchResult (copy), DeleteCaptureModule (upval), UseRefResult (copy)
		UseStateResult2(true)
		local UseSelectorResultEntry = UseSelectorResult[UseSelectorResult2]
		UseRefResult.current:fire(function()
			-- upvalues: UseDispatchResult (upval), DeleteCaptureModule (upval), UseSelectorResultEntry (copy), UseStateResult2 (upval)
			UseDispatchResult(DeleteCaptureModule(UseSelectorResultEntry))
			UseStateResult2(false)
		end)
	end, { UseSelectorResult, UseSelectorResult2 })
	UseEffectFunction(function()
		-- upvalues: UseSelectorResult1 (copy), UseSelectorResult3 (copy), ContextActionService (upval), UseCallbackResult1 (copy)
		if not UseSelectorResult1 or UseSelectorResult3 then return end
		ContextActionService:BindCoreAction("CapturesCarouselCloseShortcutAction", function(_, UserInputState)
			-- upvalues: UseCallbackResult1 (upval)
			if UserInputState == Enum.UserInputState.End then
				UseCallbackResult1()
			end
		end, false, Enum.KeyCode.Escape)
		
		return function()
			-- upvalues: ContextActionService (upval)
			ContextActionService:UnbindCoreAction("CapturesCarouselCloseShortcutAction")
		end
	end, {
		UseSelectorResult1,
		UseSelectorResult3,
		UseCallbackResult1
	})
	
	if UseSelectorResult1 then
		local YDelta = UseScreenSizeResult.Y - 32 - 40 - 8 - 16 - 16
		local Title = getTitle(UseSelectorResult[UseSelectorResult2])
		
		return ReactModule.createElement("Frame", {
			Active = true,
			BorderSizePixel = 0,
			BackgroundColor3 = UseStyleResult.Theme.BackgroundContrast.Color,
			BackgroundTransparency = UseStyleResult.Theme.BackgroundContrast.Transparency,
			Position = UDim2.fromOffset(0, 0),
			Size = UDim2.fromScale(1, 1)
		}, {
			CarouselContainer = ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					Padding = UDim.new(0, 8),
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				Padding = ReactModule.createElement("UIPadding", {
					PaddingBottom = UDim.new(0, 16),
					PaddingTop = UDim.new(0, 8)
				}),
				TitleFrame = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, 32),
					ZIndex = if FFlagUseMediaPlayerInCarousel then 1 else 2
				}, {
					CloseButton = ReactModule.createElement(ImageSetButton, {
						AnchorPoint = Vector2.new(0, 0.5),
						BackgroundTransparency = 1,
						Image = Images["icons/navigation/close"],
						ImageColor3 = UseStyleResult.Theme.IconEmphasis.Color,
						ImageTransparency = UseStyleResult.Theme.IconEmphasis.Transparency,
						Position = UDim2.new(0, 42, 0.5, 0),
						Size = _UDim2,
						[ReactModule.Event.Activated] = UseCallbackResult
					}),
					DropShadow = ReactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						ZIndex = 1,
						AnchorPoint = Vector2.new(0.5, 0.5),
						AutomaticSize = Enum.AutomaticSize.X,
						Font = if FoundationFontFaceMigration then nil else UseStyleResult.Font.Header2.Font,
						FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseStyleResult.Tokens.Typography.TitleLarge.Font) else nil,
						Position = UDim2.new(0.5, 0, 0.5, 2),
						Size = UDim2.fromScale(0, 1),
						Text = Title,
						TextColor3 = UseStyleResult.Theme.DropShadow.Color,
						TextSize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.Header2.RelativeSize,
						TextTransparency = UseStyleResult.Theme.DropShadow.Transparency,
						TextXAlignment = Enum.TextXAlignment.Center,
						TextYAlignment = Enum.TextYAlignment.Center
					}, {
						UIStroke = ReactModule.createElement("UIStroke", {
							Thickness = 1,
							ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
							Color = UseStyleResult.Theme.DropShadow.Color,
							LineJoinMode = Enum.LineJoinMode.Round,
							Transparency = UseStyleResult.Theme.DropShadow.Transparency
						})
					}),
					Title = ReactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						ZIndex = 2,
						AnchorPoint = Vector2.new(0.5, 0.5),
						AutomaticSize = Enum.AutomaticSize.X,
						Font = if FoundationFontFaceMigration then nil else UseStyleResult.Font.Header2.Font,
						FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseStyleResult.Tokens.Typography.TitleLarge.Font) else nil,
						Position = UDim2.fromScale(0.5, 0.5),
						Size = UDim2.fromScale(0, 1),
						Text = Title,
						TextColor3 = UseStyleResult.Theme.TextEmphasis.Color,
						TextSize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.Header2.RelativeSize,
						TextXAlignment = Enum.TextXAlignment.Center,
						TextYAlignment = Enum.TextYAlignment.Center
					})
				}),
				CapturesCarousel = ReactModule.createElement(CapturesCarouselModule, {
					LayoutOrder = 2,
					deleteItemSignal = UseRefResult.current,
					isDisabled = UseStateResult,
					maxHeight = YDelta,
					ZIndex = if FFlagUseMediaPlayerInCarousel then 2 else 1
				}),
				CTAContainer = ReactModule.createElement(CarouselCTAContainerModule, {
					height = 40,
					LayoutOrder = 3,
					deleteItem = UseCallbackResult4,
					isDisabled = UseStateResult or UseSelectorResult3,
					openPermissionModal = UseCallbackResult2,
					ZIndex = if FFlagUseMediaPlayerInCarousel then 1 else 2
				})
			}),
			DeleteWarningModal = ReactModule.createElement(DeleteWarningModalModule, { zIndex = 3, deleteItem = UseCallbackResult4 }),
			PermissionModal = ReactModule.createElement(PermissionModalModule, {
				zIndex = 3,
				closeModal = UseCallbackResult3,
				visible = UseStateResult1
			}),
			ToastsFrame = ReactModule.createElement("Frame", {
				Active = false,
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				ZIndex = ConstantsModule.ZIndex.Toasts
			}, {
				ToastContainer = ReactModule.createElement(ToastContainerModule)
			})
		})
	else
		return nil
	end
end