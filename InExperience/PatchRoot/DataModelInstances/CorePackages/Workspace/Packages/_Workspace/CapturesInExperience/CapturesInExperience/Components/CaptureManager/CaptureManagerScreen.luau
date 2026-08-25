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

local function _(p0)
	return math.clamp(math.floor(p0 / 90), 1, 3)
end

local _ = function(p1, p2)
	local clampedValue = math.clamp(math.floor(p2 / 90), 1, 3)
	local var23 = (p2 - (clampedValue - 1) * 4) / clampedValue
	
	return Vector2.new(math.floor(var23), math.floor(var23 * p1))
end

local function renderItem(p3, p4)
	-- upvalues: reactModule (ref), captureManagerItemModule (ref)
	return reactModule.createElement(captureManagerItemModule, { capture = p3, captureIndex = p4 })
end

return function(_)
	-- upvalues: useAnalyticsModule (ref), useDispatch (ref), useStyle (ref), useTopbarInsetHeightModule (ref), useSelector (ref), constantsModule (ref), useLocalization (ref), reactModule (ref), useState (ref), useScreenSize (ref), useCallback (ref), captureManagerClosedModule (ref), deleteCapturesModule (ref), updateSelectedCapturesModule (ref), eventNamesModule (ref), dashModule (ref), view (ref), imageSetButton (ref), images (ref), uDim2 (ref), text (ref), scrollView (ref), scrollBarVisibility (ref), gridView (ref), renderItem (ref), showMoreButtonModule (ref), captureManagerCTAContainerModule (ref), deleteWarningModalModule (ref), permissionModalModule (ref), toastContainerModule (ref)
	local var24 = useAnalyticsModule()
	local var25 = useDispatch()
	local var26 = useStyle()
	local var27 = useTopbarInsetHeightModule()
	local var28 = useSelector(function(p5)
		-- upvalues: constantsModule (copy)
		return p5[constantsModule.RoduxKey].Captures
	end)
	local var29 = useSelector(function(p6)
		-- upvalues: constantsModule (copy)
		return p6[constantsModule.RoduxKey].CaptureManager.SelectedCaptures
	end)
	local var30 = useSelector(function(p7)
		-- upvalues: constantsModule (copy)
		return p7[constantsModule.RoduxKey].CaptureManager.IsOpen
	end)
	local var31 = useLocalization({
		cancelSelectAllAction = "Feature.Captures.Action.CancelSelectAllCaptures",
		selectAllAction = "Feature.Captures.Action.SelectAllCaptures"
	})
	local var32 = reactModule.useRef(nil)
	local var33, var34 = useState(Vector2.new(0, 0))
	local var35, var36 = useState(false)
	local var37, var38 = useState(false)
	local var39, var40 = reactModule.useState(24)
	local var41 = if #var29 == 0 then var31.selectAllAction else var31.cancelSelectAllAction
	local var42 = useScreenSize()
	reactModule.useEffect(function()
		-- upvalues: var32 (ref), var34 (ref)
		if var32.current then
			var34(var32.current.AbsoluteSize)
		end
	end, {})
	local var43 = useCallback(function(p8)
		-- upvalues: var34 (ref)
		var34(p8.AbsoluteSize)
	end, {})
	local var44 = useCallback(function()
		-- upvalues: var36 (ref), var25 (ref), captureManagerClosedModule (copy)
		var36(false)
		var25(captureManagerClosedModule())
	end, {})
	local var45 = useCallback(function()
		-- upvalues: var38 (ref)
		var38(true)
	end, {})
	local var46 = useCallback(function()
		-- upvalues: var38 (ref)
		var38(false)
	end, {})
	local var47 = useCallback(function()
		-- upvalues: var25 (ref), deleteCapturesModule (copy), var29 (ref)
		var25(deleteCapturesModule(var29))
	end, { var29 })
	local var48 = useCallback(function()
		-- upvalues: var29 (ref), var25 (ref), updateSelectedCapturesModule (copy), var28 (ref), var24 (ref), eventNamesModule (copy)
		if #var29 == 0 then
			var25(updateSelectedCapturesModule(var28))
			var24.fireEvent(eventNamesModule.CapturesManagerSelectAllActivated)
			
			return
		end
		var25(updateSelectedCapturesModule({}))
	end, { var29, var28 })
	local var49 = reactModule.useCallback(function()
		-- upvalues: var40 (ref), var39 (ref)
		var40(var39 + 24)
	end, { var39 })
	local var50 = reactModule.useMemo(function()
		-- upvalues: var28 (ref), var39 (ref), dashModule (copy)
		return dashModule.slice(var28, 1, math.min(#var28, var39))
	end, { var28, var39 })
	
	if var30 then
		local var51 = var33.X > 0 and var33.Y > 0
		local clampedValue = math.clamp(var42.Y / var42.X, 0.428571428571, 1)
		local y = var33.Y
		local var53 = var33.X - 41
		local clampedValue_1 = math.clamp(math.floor(var53 / 90), 1, 3)
		local var55 = (var53 - (clampedValue_1 - 1) * 4) / clampedValue_1
		local vector2 = Vector2.new(math.floor(var55), math.floor(var55 * clampedValue))
		local var57 = y < var53
		local var58 = if var57 then 44 else 82
		
		return reactModule.createElement(view, {
			BorderSizePixel = 0,
			tag = "bg-surface-100",
			onAbsoluteSizeChanged = var43,
			Position = UDim2.fromOffset(0, -var27),
			ref = var32,
			Size = UDim2.new(1, 0, 1, var27)
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
						ImageColor3 = var26.Theme.IconEmphasis.Color,
						ImageTransparency = var26.Theme.IconEmphasis.Transparency,
						Position = UDim2.new(0, 0, 0.5, 0),
						Size = uDim2,
						[reactModule.Event.Activated] = var44
					}),
					SelectOrDeselectAllButton = reactModule.createElement(text, {
						LayoutOrder = 1,
						tag = "auto-x anchor-center-right bg-action-subtle size-0-full text-defaults text-align-x-center text-align-y-center text-title-large",
						ZIndex = 2,
						onActivated = var48,
						Position = UDim2.new(1, -16, 0.5, 2),
						Text = var41
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
					Size = UDim2.new(1, 0, 1, -(var58 + 40))
				}, {
					GridView = var51 and reactModule.createElement(gridView, {
						LayoutOrder = 1,
						itemPadding = Vector2.new(4, 4),
						items = var50,
						itemSize = vector2,
						maxHeight = (vector2.Y + 4) * math.ceil(#var28 / math.clamp(math.floor(var53 / 90), 1, 3)),
						renderItem = renderItem,
						Size = UDim2.fromScale(1, 0.9)
					}),
					ShowMoreButton = var39 < #var28 and reactModule.createElement(showMoreButtonModule, { buttonHeight = 40, LayoutOrder = 2, onActivated = var49 })
				}),
				CTAContainer = reactModule.createElement(captureManagerCTAContainerModule, {
					LayoutOrder = 3,
					ZIndex = 2,
					deleteItem = var47,
					height = var58,
					isDisabled = var35,
					isHorizontal = var57,
					openPermissionModal = var45,
					width = var53
				})
			}),
			DeleteWarningModal = reactModule.createElement(deleteWarningModalModule, { zIndex = 3, deleteItem = var47 }),
			PermissionModal = reactModule.createElement(permissionModalModule, { zIndex = 3, closeModal = var46, visible = var37 }),
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