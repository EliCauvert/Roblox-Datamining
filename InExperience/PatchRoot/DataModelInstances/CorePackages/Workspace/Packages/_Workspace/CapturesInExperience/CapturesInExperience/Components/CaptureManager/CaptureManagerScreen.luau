local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local DashModule = require(Parent1.Dash)
local FoundationModule = require(Parent1.Foundation)
local ReactModule = require(Parent1.React)
local RoactUtilsModule = require(Parent1.RoactUtils)
local UIBloxModule = require(Parent1.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local GridView = UIBloxModule.App.Grid.GridView
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local ScrollBarVisibility = FoundationModule.Enums.ScrollBarVisibility
local ScrollView = FoundationModule.ScrollView
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseAnalyticsModule = require(Parent.Analytics.useAnalytics)
local UseCallbackFunction = ReactModule.useCallback
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization
local UseScreenSizeFunction = require(Parent1.RobloxAppHooks).useScreenSize
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseStateFunction = ReactModule.useState
local UseTopbarInsetHeightModule = require(Parent.Hooks.useTopbarInsetHeight)
local CaptureManagerClosedModule = require(Parent.Actions.CaptureManagerClosed)
local CaptureManagerItemModule = require(Parent.Components.CaptureManager.CaptureManagerItem)
local CaptureManagerCTAContainerModule = require(Parent.Components.CaptureManager.CaptureManagerCTAContainer)
local ConstantsModule = require(Parent.Constants)
local DeleteCapturesModule = require(Parent.Thunks.DeleteCaptures)
local DeleteWarningModalModule = require(Parent.Components.Common.DeleteWarningModal)
local EventNamesModule = require(Parent.Analytics.EventNames)
local PermissionModalModule = require(Parent.Components.Common.PermissionModal)
local ShowMoreButtonModule = require(Parent.Components.Common.ShowMoreButton)
local ToastContainerModule = require(Parent.Components.Common.ToastContainer)
local _ = require(Parent.Types)
local UpdateSelectedCapturesModule = require(Parent.Actions.UpdateSelectedCaptures)
local _UDim2 = UDim2.fromOffset(32, 32)

local function _(p1: number): number --[[ Line: 66 | Named "getItemsPerRow" ]]
	return (math.clamp(math.floor(p1 / 90), 1, 3))
end

local _ = function(p1, p2: number): Vector2 --[[ Line: 70 | Named "getGalleryItemSize" ]]
	local ClampedValue = math.clamp(math.floor(p2 / 90), 1, 3)
	local Value = (p2 - (ClampedValue - 1) * 4) / ClampedValue
	
	return Vector2.new(math.floor(Value), (math.floor(Value * p1)))
end

local function renderItem(Capture, CaptureIndex) --[[ Line: 80 ]]
	-- upvalues: ReactModule (copy), CaptureManagerItemModule (copy)
	return ReactModule.createElement(CaptureManagerItemModule, { capture = Capture, captureIndex = CaptureIndex })
end

return function(_) --[[ Line: 87 ]]
	-- upvalues: UseAnalyticsModule (copy), UseDispatchFunction (copy), UseStyleFunction (copy), UseTopbarInsetHeightModule (copy), UseSelectorFunction (copy), ConstantsModule (copy), UseLocalizationFunction (copy), ReactModule (copy), UseStateFunction (copy), UseScreenSizeFunction (copy), UseCallbackFunction (copy), CaptureManagerClosedModule (copy), DeleteCapturesModule (copy), UpdateSelectedCapturesModule (copy), EventNamesModule (copy), DashModule (copy), View (copy), ImageSetButton (copy), Images (copy), _UDim2 (copy), Text (copy), ScrollView (copy), ScrollBarVisibility (copy), GridView (copy), renderItem (copy), ShowMoreButtonModule (copy), CaptureManagerCTAContainerModule (copy), DeleteWarningModalModule (copy), PermissionModalModule (copy), ToastContainerModule (copy)
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseDispatchResult = UseDispatchFunction()
	local UseStyleResult = UseStyleFunction()
	local UseTopbarInsetHeightModuleResult = UseTopbarInsetHeightModule()
	local UseSelectorResult = UseSelectorFunction(function(p1) --[[ Line: 94 ]]
		-- upvalues: ConstantsModule (upval)
		return p1[ConstantsModule.RoduxKey].Captures
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p1) --[[ Line: 98 ]]
		-- upvalues: ConstantsModule (upval)
		return p1[ConstantsModule.RoduxKey].CaptureManager.SelectedCaptures
	end)
	local UseSelectorResult2 = UseSelectorFunction(function(p1) --[[ Line: 102 ]]
		-- upvalues: ConstantsModule (upval)
		return p1[ConstantsModule.RoduxKey].CaptureManager.IsOpen
	end)
	local UseLocalizationResult = UseLocalizationFunction({
		cancelSelectAllAction = "Feature.Captures.Action.CancelSelectAllCaptures",
		selectAllAction = "Feature.Captures.Action.SelectAllCaptures"
	})
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = UseStateFunction(Vector2.new(0, 0))
	local UseStateResult1, UseStateResult2_1 = UseStateFunction(false)
	local UseStateResult3, UseStateResult2_2 = UseStateFunction(false)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(24)
	local SelectAllAction = if #UseSelectorResult1 == 0 then UseLocalizationResult.selectAllAction else UseLocalizationResult.cancelSelectAllAction
	local UseScreenSizeResult = UseScreenSizeFunction()
	ReactModule.useEffect(function() --[[ Line: 121 ]]
		-- upvalues: UseRefResult (copy), UseStateResult2 (copy)
		if UseRefResult.current then
			UseStateResult2(UseRefResult.current.AbsoluteSize)
		end
	end, {})
	local UseCallbackResult = UseCallbackFunction(function(Frame) --[[ Line: 127 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(Frame.AbsoluteSize)
	end, {})
	local UseCallbackResult1 = UseCallbackFunction(function() --[[ Line: 131 ]]
		-- upvalues: UseStateResult2_1 (copy), UseDispatchResult (copy), CaptureManagerClosedModule (upval)
		UseStateResult2_1(false)
		UseDispatchResult(CaptureManagerClosedModule())
	end, {})
	local UseCallbackResult2 = UseCallbackFunction(function() --[[ Line: 136 ]]
		-- upvalues: UseStateResult2_2 (copy)
		UseStateResult2_2(true)
	end, {})
	local UseCallbackResult3 = UseCallbackFunction(function() --[[ Line: 140 ]]
		-- upvalues: UseStateResult2_2 (copy)
		UseStateResult2_2(false)
	end, {})
	local UseCallbackResult4 = UseCallbackFunction(function() --[[ Line: 144 ]]
		-- upvalues: UseDispatchResult (copy), DeleteCapturesModule (upval), UseSelectorResult1 (copy)
		UseDispatchResult(DeleteCapturesModule(UseSelectorResult1))
	end, { UseSelectorResult1 })
	local UseCallbackResult5 = UseCallbackFunction(function() --[[ Line: 148 ]]
		-- upvalues: UseSelectorResult1 (copy), UseDispatchResult (copy), UpdateSelectedCapturesModule (upval), UseSelectorResult (copy), UseAnalyticsModuleResult (copy), EventNamesModule (upval)
		if #UseSelectorResult1 == 0 then
			UseDispatchResult(UpdateSelectedCapturesModule(UseSelectorResult))
			UseAnalyticsModuleResult.fireEvent(EventNamesModule.CapturesManagerSelectAllActivated)
			
			return
		else
			UseDispatchResult(UpdateSelectedCapturesModule({}))
		end
	end, { UseSelectorResult1, UseSelectorResult })
	local UseResult = ReactModule.useCallback(function() --[[ Line: 157 ]]
		-- upvalues: UseStateResult2_3 (copy), UseStateResult4 (copy)
		UseStateResult2_3(UseStateResult4 + 24)
	end, { UseStateResult4 })
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 161 ]]
		-- upvalues: UseSelectorResult (copy), UseStateResult4 (copy), DashModule (upval)
		return DashModule.slice(UseSelectorResult, 1, (math.min(#UseSelectorResult, UseStateResult4)))
	end, { UseSelectorResult, UseStateResult4 })
	
	if UseSelectorResult2 then
		local XDelta = UseStateResult.X - 41
		local ClampedValue = math.clamp(math.floor(XDelta / 90), 1, 3)
		local Value = (XDelta - (ClampedValue - 1) * 4) / ClampedValue
		local _Vector2 = Vector2.new(math.floor(Value), (math.floor(Value * math.clamp(UseScreenSizeResult.Y / UseScreenSizeResult.X, 0.42857142857142855, 1))))
		local IsYBelow = UseStateResult.Y < XDelta
		local Height: number = if IsYBelow then 44 else 82
		local ScaledY = (_Vector2.Y + 4) * math.ceil(#UseSelectorResult / math.clamp(math.floor(XDelta / 90), 1, 3))
		
		return ReactModule.createElement(View, {
			BorderSizePixel = 0,
			tag = "bg-surface-100",
			onAbsoluteSizeChanged = UseCallbackResult,
			Position = UDim2.fromOffset(0, -UseTopbarInsetHeightModuleResult),
			ref = UseRefResult,
			Size = UDim2.new(1, 0, 1, UseTopbarInsetHeightModuleResult)
		}, {
			CaptureManagerContainer = ReactModule.createElement(View, {
				tag = "bg-action-subtle size-full padding-bottom-small padding-right-small padding-left-xxlarge padding-top-xxlarge gap-xsmall col align-x-center align-y-top"
			}, {
				TitleFrame = ReactModule.createElement(View, {
					LayoutOrder = 1,
					tag = "bg-action-subtle",
					ZIndex = 2,
					Size = UDim2.new(1, 0, 0, 32)
				}, {
					CloseButton = ReactModule.createElement(ImageSetButton, {
						AnchorPoint = Vector2.new(0, 0.5),
						BackgroundTransparency = 1,
						Image = Images["icons/navigation/close"],
						ImageColor3 = UseStyleResult.Theme.IconEmphasis.Color,
						ImageTransparency = UseStyleResult.Theme.IconEmphasis.Transparency,
						Position = UDim2.new(0, 0, 0.5, 0),
						Size = _UDim2,
						[ReactModule.Event.Activated] = UseCallbackResult1
					}),
					SelectOrDeselectAllButton = ReactModule.createElement(Text, {
						LayoutOrder = 1,
						tag = "auto-x anchor-center-right bg-action-subtle size-0-full text-defaults text-align-x-center text-align-y-center text-title-large",
						ZIndex = 2,
						onActivated = UseCallbackResult5,
						Position = UDim2.new(1, -16, 0.5, 2),
						Text = SelectAllAction
					})
				}),
				ScrollingFrame = ReactModule.createElement(ScrollView, {
					BorderSizePixel = 0,
					LayoutOrder = 2,
					tag = "bg-action-subtle gap-xsmall col align-x-center align-y-top",
					scroll = {
						AutomaticCanvasSize = Enum.AutomaticSize.Y,
						CanvasSize = UDim2.fromScale(1, 0),
						ScrollingDirection = Enum.ScrollingDirection.Y,
						scrollBarVisibility = ScrollBarVisibility.None
					},
					Size = UDim2.new(1, 0, 1, -(Height + 40))
				}, {
					GridView = UseStateResult.X > 0 and UseStateResult.Y > 0 and ReactModule.createElement(GridView, {
						LayoutOrder = 1,
						itemPadding = Vector2.new(4, 4),
						items = UseMemoResult,
						itemSize = _Vector2,
						maxHeight = ScaledY,
						renderItem = renderItem,
						Size = UDim2.fromScale(1, 0.9)
					}),
					ShowMoreButton = UseStateResult4 < #UseSelectorResult and ReactModule.createElement(ShowMoreButtonModule, {
						buttonHeight = 40,
						LayoutOrder = 2,
						onActivated = UseResult
					})
				}),
				CTAContainer = ReactModule.createElement(CaptureManagerCTAContainerModule, {
					LayoutOrder = 3,
					ZIndex = 2,
					deleteItem = UseCallbackResult4,
					height = Height,
					isDisabled = UseStateResult1,
					isHorizontal = IsYBelow,
					openPermissionModal = UseCallbackResult2,
					width = XDelta
				})
			}),
			DeleteWarningModal = ReactModule.createElement(DeleteWarningModalModule, { zIndex = 3, deleteItem = UseCallbackResult4 }),
			PermissionModal = ReactModule.createElement(PermissionModalModule, {
				zIndex = 3,
				closeModal = UseCallbackResult3,
				visible = UseStateResult3
			}),
			ToastsFrame = ReactModule.createElement(View, {
				tag = "bg-action-subtle size-full",
				ZIndex = ConstantsModule.ZIndex.Toasts
			}, {
				ToastContainer = ReactModule.createElement(ToastContainerModule)
			})
		})
	else
		return nil
	end
end