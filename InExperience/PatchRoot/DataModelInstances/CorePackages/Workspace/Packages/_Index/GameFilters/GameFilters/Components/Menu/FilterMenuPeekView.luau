local gameFilters = script:FindFirstAncestor("GameFilters")
local parent = gameFilters.Parent
local appCommonLibModule = require(parent.AppCommonLib)
local _ = require(parent.DiscoveryTypes)
local peekViewModule = require(parent.PeekView)
local peekView = peekViewModule.PeekView
local peekViewState = peekViewModule.PeekViewState
local reactModule = require(parent.React)
local signal = appCommonLibModule.Signal
local useNavigation = require(parent.Navigation).useNavigation
local useNavigationProps = require(parent.RobloxAppNavigation).useNavigationProps
local filterClickButtonNameModule = require(gameFilters.Analytics.FilterClickButtonName)
local filterMenuActionBarModule = require(gameFilters.Components.Menu.FilterMenuActionBar)
local filterMenuHeaderModule = require(gameFilters.Components.Menu.FilterMenuHeader)
local filterMenuOptionsModule = require(gameFilters.Components.Menu.FilterMenuOptions)
local useTopBarHeightSelectorModule = require(gameFilters.Components.Menu.useTopBarHeightSelector)
local getOptionContextTagModule = require(gameFilters.Analytics.getOptionContextTag)
local fFlagLuaAppChartsFilterOptionTextTag = require(parent.SharedFlags).FFlagLuaAppChartsFilterOptionTextTag
local fFlagLuaAppChartsActiveFilterChips = require(parent.SharedFlags).FFlagLuaAppChartsActiveFilterChips

return function()
	-- upvalues: useNavigationProps (ref), reactModule (ref), useNavigation (ref), peekViewState (ref), filterClickButtonNameModule (ref), fFlagLuaAppChartsFilterOptionTextTag (ref), getOptionContextTagModule (ref), fFlagLuaAppChartsActiveFilterChips (ref), useTopBarHeightSelectorModule (ref), signal (ref), peekView (ref), filterMenuActionBarModule (ref), filterMenuHeaderModule (ref), filterMenuOptionsModule (ref)
	local var1 = useNavigationProps(function(_, p1)
		return {
			filter = p1.filter,
			onFilterApplied = p1.onFilterApplied,
			onFilterMenuClosed = p1.onFilterMenuClosed,
			sendFilterClick = p1.sendFilterClick
		}
	end)
	local filter = var1.filter
	local var2, var3 = reactModule.useState(filter.selectedOptionId)
	local var4 = reactModule.useRef(false)
	local var5 = useNavigation()
	local var6 = reactModule.useCallback(function(p1, _)
		-- upvalues: peekViewState (copy), var5 (ref), var1 (ref), var4 (ref), filterClickButtonNameModule (copy), filter (ref), var2 (ref), fFlagLuaAppChartsFilterOptionTextTag (copy), getOptionContextTagModule (copy), fFlagLuaAppChartsActiveFilterChips (copy)
		if p1 == peekViewState.Closed or p1 == peekViewState.Hidden then
			var5.goBack()
			var1.onFilterMenuClosed()
			
			if not var4.current then
				var1.sendFilterClick(filterClickButtonNameModule.ClosePeekView, filter.selectedOptionId, var2, if fFlagLuaAppChartsFilterOptionTextTag then getOptionContextTagModule(filter, filter.selectedOptionId) else nil, if fFlagLuaAppChartsFilterOptionTextTag then getOptionContextTagModule(filter, var2) else nil, if fFlagLuaAppChartsActiveFilterChips then true else nil)
			end
		end
	end, {
		if fFlagLuaAppChartsFilterOptionTextTag then nil else filter.selectedOptionId,
		var2, var5, var1.onFilterMenuClosed, var1.sendFilterClick,
		if fFlagLuaAppChartsFilterOptionTextTag then filter else nil
	})
	local var7 = useTopBarHeightSelectorModule()
	local var8, var9 = reactModule.useBinding(Vector2.new(0, 0))
	local var10, var11 = reactModule.useBinding(0)
	local var12 = nil
	local var13 = nil
	local var14 = nil
	local _ = nil
	local var15 = nil
	
	if fFlagLuaAppChartsFilterOptionTextTag then
		local var16, var17 = reactModule.useBinding(0)
		var14 = var16
		local var18 = var17
		var15 = reactModule.useCallback(function(p1)
			-- upvalues: var18 (write)
			var18(p1.AbsoluteCanvasSize.Y)
		end, {})
	else
		local var19, var20 = reactModule.useBinding(Vector2.new(0, 0))
		var12 = var19
		var13 = var20
	end
	local var21 = if fFlagLuaAppChartsFilterOptionTextTag then nil else var8:map(function(p1)
		return p1.X
	end)
	local var22 = reactModule.joinBindings({
		var8,
		var10,
		if fFlagLuaAppChartsFilterOptionTextTag then var14 else var12
	}):map(function(p1)
		-- upvalues: fFlagLuaAppChartsFilterOptionTextTag (copy), var7 (ref)
		return UDim2.new(1, 0, 0, math.min(p1[2] + (if fFlagLuaAppChartsFilterOptionTextTag then p1[3] else p1[3].Y), p1[1].Y - 84 - 25 - var7))
	end)
	local var23 = var10:map(function(p1)
		return UDim2.new(1, 0, 1, -p1)
	end)
	local var24 = reactModule.useRef(nil)
	local var25 = reactModule.useCallback(function(p1)
		-- upvalues: var24 (ref)
		local current = var24.current
		
		if current then
			local y = p1.AbsoluteSize.Y
			current.AutomaticSize = Enum.AutomaticSize.None
			current.Size = UDim2.new(1, 0, 0, y)
		end
	end, {})
	local var26 = reactModule.useRef(signal.new())
	local var27 = reactModule.useCallback(function()
		-- upvalues: var26 (ref)
		var26.current:fire()
	end, {})
	
	return reactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		ClipsDescendants = false,
		[reactModule.Change.AbsoluteSize] = function(p1)
			-- upvalues: var9 (ref)
			var9(p1.AbsoluteSize)
		end
	}, {
		PeekView = reactModule.createElement(peekView, {
			hasScrim = true,
			mountAsFullView = true,
			returnToFullView = true,
			showDraggerInClosedState = false,
			thumbstickScrollEnabled = true,
			bottomDockedContainerHeight = 84,
			briefViewContentHeight = UDim.new(0, 0),
			contentFrameRef = var24,
			closeSignal = var26.current,
			viewStateChanged = var6,
			bottomDockedContainerContent = reactModule.createElement(filterMenuActionBarModule, {
				Size = UDim2.new(1, 0, 0, 84),
				applyEnabled = var2 ~= filter.selectedOptionId,
				onApply = reactModule.useCallback(function()
					-- upvalues: var1 (ref), filter (ref), var2 (ref), var4 (ref), var27 (ref), filterClickButtonNameModule (copy), fFlagLuaAppChartsFilterOptionTextTag (copy), getOptionContextTagModule (copy), fFlagLuaAppChartsActiveFilterChips (copy)
					var1.onFilterApplied(filter.filterType, var2)
					var4.current = true
					var27()
					var1.sendFilterClick(filterClickButtonNameModule.Apply, var2, filter.selectedOptionId, if fFlagLuaAppChartsFilterOptionTextTag then getOptionContextTagModule(filter, var2) else nil, if fFlagLuaAppChartsFilterOptionTextTag then getOptionContextTagModule(filter, filter.selectedOptionId) else nil, if fFlagLuaAppChartsActiveFilterChips then true else nil)
				end, {
					if fFlagLuaAppChartsFilterOptionTextTag then nil else filter.filterType,
					if fFlagLuaAppChartsFilterOptionTextTag then nil else filter.selectedOptionId,
					var2, var1.onFilterApplied, var27, var1.sendFilterClick,
					if fFlagLuaAppChartsFilterOptionTextTag then filter else nil
				})
			})
		}, {
			Content = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = var22,
				[reactModule.Change.AbsoluteSize] = var25
			}, {
				Layout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					HorizontalFlex = Enum.UIFlexAlignment.Fill,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				Header = reactModule.createElement(filterMenuHeaderModule, {
					LayoutOrder = 1,
					title = filter.filterDisplayName,
					onCloseButtonActivated = var27,
					onHeightChanged = var11
				}),
				Options = reactModule.createElement(filterMenuOptionsModule, {
					LayoutOrder = 2,
					Size = var23,
					containerMaxWidthBinding = if fFlagLuaAppChartsFilterOptionTextTag then nil else var21,
					options = filter.filterOptions,
					selectedOptionId = var2,
					onSelectedOptionChanged = reactModule.useCallback(function(p1)
						-- upvalues: var3 (ref)
						var3(p1)
					end, {}),
					onCanvasSizeChanged = if fFlagLuaAppChartsFilterOptionTextTag then var15 else var13
				})
			})
		})
	})
end