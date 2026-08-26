local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local dashModule = require(parent_1.Dash)
local foundationModule = require(parent_1.Foundation)
local localizationModule = require(parent_1.Localization)
local reactModule = require(parent_1.React)
local roactUtilsModule = require(parent_1.RoactUtils)
local robloxAppHooksModule = require(parent_1.RobloxAppHooks)
local UIBloxModule = require(parent_1.UIBlox)
local images = UIBloxModule.App.ImageSet.Images
local imageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local gridView = UIBloxModule.App.Grid.GridView
local useStyle = UIBloxModule.Core.Style.useStyle
local scrollBarVisibility = foundationModule.Enums.ScrollBarVisibility
local scrollView = foundationModule.ScrollView
local text = foundationModule.Text
local view = foundationModule.View
local useAnalyticsModule = require(parent.Analytics.useAnalytics)
local useCallback = reactModule.useCallback
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useLocalization = localizationModule.Hooks.useLocalization
local useScreenSize = robloxAppHooksModule.useScreenSize
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useState = reactModule.useState
local useTopbarInsetHeightModule = require(parent.Hooks.useTopbarInsetHeight)
local captureManagerClosedModule = require(parent.Actions.CaptureManagerClosed)
local captureManagerItemModule = require(parent.Components.CaptureManager.CaptureManagerItem)
local captureManagerCTAContainerModule = require(parent.Components.CaptureManager.CaptureManagerCTAContainer)
local constantsModule = require(parent.Constants)
local deleteCapturesModule = require(parent.Thunks.DeleteCaptures)
local deleteWarningModalModule = require(parent.Components.Common.DeleteWarningModal)
local eventNamesModule = require(parent.Analytics.EventNames)
local permissionModalModule = require(parent.Components.Common.PermissionModal)
local showMoreButtonModule = require(parent.Components.Common.ShowMoreButton)
local toastContainerModule = require(parent.Components.Common.ToastContainer)
local _ = require(parent.Types)
local updateSelectedCapturesModule = require(parent.Actions.UpdateSelectedCaptures)
local uDim2 = UDim2.fromOffset(32, 32)

local function _(p1)
	return math.clamp(math.floor(p1 / 90), 1, 3)
end

local _ = function(p1, p2)
	local clampedValue = math.clamp(math.floor(p2 / 90), 1, 3)
	local var1 = (p2 - (clampedValue - 1) * 4) / clampedValue
	
	return Vector2.new(math.floor(var1), math.floor(var1 * p1))
end

local function renderItem(p1, p2)
	-- upvalues: reactModule (ref), captureManagerItemModule (ref)
	return reactModule.createElement(captureManagerItemModule, { capture = p1, captureIndex = p2 })
end

return function(_)
	-- upvalues: useAnalyticsModule (ref), useDispatch (ref), useStyle (ref), useTopbarInsetHeightModule (ref), useSelector (ref), constantsModule (ref), useLocalization (ref), reactModule (ref), useState (ref), useScreenSize (ref), useCallback (ref), captureManagerClosedModule (ref), deleteCapturesModule (ref), updateSelectedCapturesModule (ref), eventNamesModule (ref), dashModule (ref), view (ref), imageSetButton (ref), images (ref), uDim2 (ref), text (ref), scrollView (ref), scrollBarVisibility (ref), gridView (ref), renderItem (ref), showMoreButtonModule (ref), captureManagerCTAContainerModule (ref), deleteWarningModalModule (ref), permissionModalModule (ref), toastContainerModule (ref)
	local var1 = useAnalyticsModule()
	local var2 = useDispatch()
	local var3 = useStyle()
	local var4 = useTopbarInsetHeightModule()
	local var5 = useSelector(function(p1)
		-- upvalues: constantsModule (copy)
		return p1[constantsModule.RoduxKey].Captures
	end)
	local var6 = useSelector(function(p1)
		-- upvalues: constantsModule (copy)
		return p1[constantsModule.RoduxKey].CaptureManager.SelectedCaptures
	end)
	local var7 = useSelector(function(p1)
		-- upvalues: constantsModule (copy)
		return p1[constantsModule.RoduxKey].CaptureManager.IsOpen
	end)
	local var8 = useLocalization({
		cancelSelectAllAction = "Feature.Captures.Action.CancelSelectAllCaptures",
		selectAllAction = "Feature.Captures.Action.SelectAllCaptures"
	})
	local var9 = reactModule.useRef(nil)
	local var10, var11 = useState(Vector2.new(0, 0))
	local var12, var13 = useState(false)
	local var14, var15 = useState(false)
	local var16, var17 = reactModule.useState(24)
	local var18 = if #var6 == 0 then var8.selectAllAction else var8.cancelSelectAllAction
	local var19 = useScreenSize()
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), var11 (ref)
		if var9.current then
			var11(var9.current.AbsoluteSize)
		end
	end, {})
	local var20 = useCallback(function(p1)
		-- upvalues: var11 (ref)
		var11(p1.AbsoluteSize)
	end, {})
	local var21 = useCallback(function()
		-- upvalues: var13 (ref), var2 (ref), captureManagerClosedModule (copy)
		var13(false)
		var2(captureManagerClosedModule())
	end, {})
	local var22 = useCallback(function()
		-- upvalues: var15 (ref)
		var15(true)
	end, {})
	local var23 = useCallback(function()
		-- upvalues: var15 (ref)
		var15(false)
	end, {})
	local var24 = useCallback(function()
		-- upvalues: var2 (ref), deleteCapturesModule (copy), var6 (ref)
		var2(deleteCapturesModule(var6))
	end, { var6 })
	local var25 = useCallback(function()
		-- upvalues: var6 (ref), var2 (ref), updateSelectedCapturesModule (copy), var5 (ref), var1 (ref), eventNamesModule (copy)
		if #var6 == 0 then
			var2(updateSelectedCapturesModule(var5))
			var1.fireEvent(eventNamesModule.CapturesManagerSelectAllActivated)
			
			return
		end
		var2(updateSelectedCapturesModule({}))
	end, { var6, var5 })
	local var26 = reactModule.useCallback(function()
		-- upvalues: var17 (ref), var16 (ref)
		var17(var16 + 24)
	end, { var16 })
	local var27 = reactModule.useMemo(function()
		-- upvalues: var5 (ref), var16 (ref), dashModule (copy)
		return dashModule.slice(var5, 1, math.min(#var5, var16))
	end, { var5, var16 })
	
	if var7 then
		local var28 = var10.X > 0 and var10.Y > 0
		local clampedValue = math.clamp(var19.Y / var19.X, 0.428571428571, 1)
		local y = var10.Y
		local var29 = var10.X - 41
		local clampedValue_1 = math.clamp(math.floor(var29 / 90), 1, 3)
		local var30 = (var29 - (clampedValue_1 - 1) * 4) / clampedValue_1
		local vector2 = Vector2.new(math.floor(var30), math.floor(var30 * clampedValue))
		local var31 = y < var29
		local var32 = if var31 then 44 else 82
		
		return reactModule.createElement(view, {
			BorderSizePixel = 0,
			tag = "bg-surface-100",
			onAbsoluteSizeChanged = var20,
			Position = UDim2.fromOffset(0, -var4),
			ref = var9,
			Size = UDim2.new(1, 0, 1, var4)
		}, {
			CaptureManagerContainer = reactModule.createElement(view, {
				tag = "bg-action-subtle size-full padding-bottom-small padding-right-small padding-left-xxlarge padding-top-xxlarge gap-xsmall col align-x-center align-y-top"
			}, {
				TitleFrame = reactModule.createElement(view, {
					LayoutOrder = 1,
					tag = "bg-action-subtle",
					ZIndex = 2,
					Size = UDim2.new(1, 0, 0, 32)
				}, {
					CloseButton = reactModule.createElement(imageSetButton, {
						AnchorPoint = Vector2.new(0, 0.5),
						BackgroundTransparency = 1,
						Image = images["icons/navigation/close"],
						ImageColor3 = var3.Theme.IconEmphasis.Color,
						ImageTransparency = var3.Theme.IconEmphasis.Transparency,
						Position = UDim2.new(0, 0, 0.5, 0),
						Size = uDim2,
						[reactModule.Event.Activated] = var21
					}),
					SelectOrDeselectAllButton = reactModule.createElement(text, {
						LayoutOrder = 1,
						tag = "auto-x anchor-center-right bg-action-subtle size-0-full text-defaults text-align-x-center text-align-y-center text-title-large",
						ZIndex = 2,
						onActivated = var25,
						Position = UDim2.new(1, -16, 0.5, 2),
						Text = var18
					})
				}),
				ScrollingFrame = reactModule.createElement(scrollView, {
					BorderSizePixel = 0,
					LayoutOrder = 2,
					tag = "bg-action-subtle gap-xsmall col align-x-center align-y-top",
					scroll = {
						AutomaticCanvasSize = Enum.AutomaticSize.Y,
						CanvasSize = UDim2.fromScale(1, 0),
						ScrollingDirection = Enum.ScrollingDirection.Y,
						scrollBarVisibility = scrollBarVisibility.None
					},
					Size = UDim2.new(1, 0, 1, -(var32 + 40))
				}, {
					GridView = var28 and reactModule.createElement(gridView, {
						LayoutOrder = 1,
						itemPadding = Vector2.new(4, 4),
						items = var27,
						itemSize = vector2,
						maxHeight = (vector2.Y + 4) * math.ceil(#var5 / math.clamp(math.floor(var29 / 90), 1, 3)),
						renderItem = renderItem,
						Size = UDim2.fromScale(1, 0.9)
					}),
					ShowMoreButton = var16 < #var5 and reactModule.createElement(showMoreButtonModule, { buttonHeight = 40, LayoutOrder = 2, onActivated = var26 })
				}),
				CTAContainer = reactModule.createElement(captureManagerCTAContainerModule, {
					LayoutOrder = 3,
					ZIndex = 2,
					deleteItem = var24,
					height = var32,
					isDisabled = var12,
					isHorizontal = var31,
					openPermissionModal = var22,
					width = var29
				})
			}),
			DeleteWarningModal = reactModule.createElement(deleteWarningModalModule, { zIndex = 3, deleteItem = var24 }),
			PermissionModal = reactModule.createElement(permissionModalModule, { zIndex = 3, closeModal = var23, visible = var14 }),
			ToastsFrame = reactModule.createElement(view, {
				tag = "bg-action-subtle size-full",
				ZIndex = constantsModule.ZIndex.Toasts
			}, {
				ToastContainer = reactModule.createElement(toastContainerModule)
			})
		})
	end
	return nil
end