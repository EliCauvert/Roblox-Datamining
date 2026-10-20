local GameFilters = script:FindFirstAncestor("GameFilters")
local Parent = GameFilters.Parent
local _ = require(Parent.DiscoveryTypes)
local PeekViewModule = require(Parent.PeekView)
local PeekView = PeekViewModule.PeekView
local PeekViewState = PeekViewModule.PeekViewState
local ReactModule = require(Parent.React)
local Signal = require(Parent.AppCommonLib).Signal
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseNavigationPropsFunction = require(Parent.RobloxAppNavigation).useNavigationProps
local FilterClickButtonNameModule = require(GameFilters.Analytics.FilterClickButtonName)
local FilterMenuActionBarModule = require(GameFilters.Components.Menu.FilterMenuActionBar)
local FilterMenuHeaderModule = require(GameFilters.Components.Menu.FilterMenuHeader)
local FilterMenuOptionsModule = require(GameFilters.Components.Menu.FilterMenuOptions)
local UseTopBarHeightSelectorModule = require(GameFilters.Components.Menu.useTopBarHeightSelector)
local GetOptionContextTagModule = require(GameFilters.Analytics.getOptionContextTag)
local FFlagLuaAppChartsFilterOptionTextTag = require(Parent.SharedFlags).FFlagLuaAppChartsFilterOptionTextTag

return function()
	-- upvalues: UseNavigationPropsFunction (copy), ReactModule (copy), UseNavigationFunction (copy), PeekViewState (copy), FilterClickButtonNameModule (copy), FFlagLuaAppChartsFilterOptionTextTag (copy), GetOptionContextTagModule (copy), UseTopBarHeightSelectorModule (copy), Signal (copy), PeekView (copy), FilterMenuActionBarModule (copy), FilterMenuHeaderModule (copy), FilterMenuOptionsModule (copy)
	local UseNavigationPropsResult = UseNavigationPropsFunction(function(_, p1)
		return {
			filter = p1.filter,
			onFilterApplied = p1.onFilterApplied,
			onFilterMenuClosed = p1.onFilterMenuClosed,
			sendFilterClick = p1.sendFilterClick
		}
	end)
	local Filter = UseNavigationPropsResult.filter
	local UseStateResult, UseStateResult2 = ReactModule.useState(Filter.selectedOptionId)
	local UseRefResult = ReactModule.useRef(false)
	local UseNavigationResult = UseNavigationFunction()
	local UseResult = ReactModule.useCallback(function(Closed, _)
		-- upvalues: PeekViewState (upval), UseNavigationResult (copy), UseNavigationPropsResult (copy), UseRefResult (copy), FilterClickButtonNameModule (upval), Filter (copy), UseStateResult (copy), FFlagLuaAppChartsFilterOptionTextTag (upval), GetOptionContextTagModule (upval)
		if Closed == PeekViewState.Closed or Closed == PeekViewState.Hidden then
			UseNavigationResult.goBack()
			UseNavigationPropsResult.onFilterMenuClosed()
			
			if not UseRefResult.current then
				UseNavigationPropsResult.sendFilterClick(FilterClickButtonNameModule.ClosePeekView, Filter.selectedOptionId, UseStateResult, if FFlagLuaAppChartsFilterOptionTextTag then GetOptionContextTagModule(Filter, Filter.selectedOptionId) else nil, if FFlagLuaAppChartsFilterOptionTextTag then GetOptionContextTagModule(Filter, UseStateResult) else nil, true)
			end
		end
	end, {
		if FFlagLuaAppChartsFilterOptionTextTag then nil else Filter.selectedOptionId,
		UseStateResult, UseNavigationResult,
		UseNavigationPropsResult.onFilterMenuClosed,
		UseNavigationPropsResult.sendFilterClick,
		if FFlagLuaAppChartsFilterOptionTextTag then Filter else nil
	})
	local UseTopBarHeightSelectorModuleResult = UseTopBarHeightSelectorModule()
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(Vector2.new(0, 0))
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(0)
	local v1 = nil
	local v2 = nil
	local v3 = nil
	local UseBindingResult2_2 = nil
	local UseResult1 = nil
	
	if FFlagLuaAppChartsFilterOptionTextTag then
		v3, UseBindingResult2_2 = ReactModule.useBinding(0)
		UseResult1 = ReactModule.useCallback(function(ScrollFrame)
			-- upvalues: UseBindingResult2_2 (ref)
			UseBindingResult2_2(ScrollFrame.AbsoluteCanvasSize.Y)
		end, {})
	else
		v1, v28 = ReactModule.useBinding(Vector2.new(0, 0))
	end
	local MapResult = if FFlagLuaAppChartsFilterOptionTextTag then nil else UseBindingResult:map(function(p1)
		return p1.X
	end)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(Signal.new())
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult2 (copy)
		UseRefResult2.current:fire()
	end, {})
	
	return ReactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		ClipsDescendants = false,
		[ReactModule.Change.AbsoluteSize] = function(Frame)
			-- upvalues: UseBindingResult2 (copy)
			UseBindingResult2(Frame.AbsoluteSize)
		end
	}, {
		PeekView = ReactModule.createElement(PeekView, {
			hasScrim = true,
			mountAsFullView = true,
			returnToFullView = true,
			showDraggerInClosedState = false,
			thumbstickScrollEnabled = true,
			bottomDockedContainerHeight = 84,
			briefViewContentHeight = UDim.new(0, 0),
			contentFrameRef = UseRefResult1,
			closeSignal = UseRefResult2.current,
			viewStateChanged = UseResult,
			bottomDockedContainerContent = ReactModule.createElement(FilterMenuActionBarModule, {
				Size = UDim2.new(1, 0, 0, 84),
				applyEnabled = UseStateResult ~= Filter.selectedOptionId,
				onApply = ReactModule.useCallback(function()
					-- upvalues: UseNavigationPropsResult (copy), Filter (copy), UseStateResult (copy), UseRefResult (copy), UseResult2 (copy), FilterClickButtonNameModule (upval), FFlagLuaAppChartsFilterOptionTextTag (upval), GetOptionContextTagModule (upval)
					UseNavigationPropsResult.onFilterApplied(Filter.filterType, UseStateResult)
					UseRefResult.current = true
					UseResult2()
					UseNavigationPropsResult.sendFilterClick(FilterClickButtonNameModule.Apply, UseStateResult, Filter.selectedOptionId, if FFlagLuaAppChartsFilterOptionTextTag then GetOptionContextTagModule(Filter, UseStateResult) else nil, if FFlagLuaAppChartsFilterOptionTextTag then GetOptionContextTagModule(Filter, Filter.selectedOptionId) else nil, true)
				end, {
					if FFlagLuaAppChartsFilterOptionTextTag then nil else Filter.filterType,
					if FFlagLuaAppChartsFilterOptionTextTag then nil else Filter.selectedOptionId,
					UseStateResult, UseNavigationPropsResult.onFilterApplied, UseResult2,
					UseNavigationPropsResult.sendFilterClick,
					if FFlagLuaAppChartsFilterOptionTextTag then Filter else nil
				})
			})
		}, {
			Content = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = ReactModule.joinBindings({
					UseBindingResult,
					UseBindingResult1,
					if FFlagLuaAppChartsFilterOptionTextTag then v3 else v1
				}):map(function(Entry): UDim2
					-- upvalues: FFlagLuaAppChartsFilterOptionTextTag (upval), UseTopBarHeightSelectorModuleResult (copy)
					return UDim2.new(1, 0, 0, (math.min(Entry[2] + (if FFlagLuaAppChartsFilterOptionTextTag then Entry[3] else Entry[3].Y), Entry[1].Y - 84 - 25 - UseTopBarHeightSelectorModuleResult)))
				end),
				[ReactModule.Change.AbsoluteSize] = ReactModule.useCallback(function(Frame)
					-- upvalues: UseRefResult1 (copy)
					local Current = UseRefResult1.current
					
					if Current then
						local Y = Frame.AbsoluteSize.Y
						Current.AutomaticSize = Enum.AutomaticSize.None
						Current.Size = UDim2.new(1, 0, 0, Y)
					end
				end, {})
			}, {
				Layout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					HorizontalFlex = Enum.UIFlexAlignment.Fill,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				Header = ReactModule.createElement(FilterMenuHeaderModule, {
					LayoutOrder = 1,
					title = Filter.filterDisplayName,
					onCloseButtonActivated = UseResult2,
					onHeightChanged = UseBindingResult2_1
				}),
				Options = ReactModule.createElement(FilterMenuOptionsModule, {
					LayoutOrder = 2,
					Size = UseBindingResult1:map(function(p1): UDim2
						return UDim2.new(1, 0, 1, -p1)
					end),
					containerMaxWidthBinding = if FFlagLuaAppChartsFilterOptionTextTag then nil else MapResult,
					options = Filter.filterOptions,
					selectedOptionId = UseStateResult,
					onSelectedOptionChanged = ReactModule.useCallback(function(p1)
						-- upvalues: UseStateResult2 (copy)
						UseStateResult2(p1)
					end, {}),
					onCanvasSizeChanged = if FFlagLuaAppChartsFilterOptionTextTag then UseResult1 else v2
				})
			})
		})
	})
end