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

return function() --[[ line: 35 | named "FilterMenuPeekView" ]]
	-- upvalues: useNavigationProps (ref), reactModule (ref), useNavigation (ref), peekViewState (ref), filterClickButtonNameModule (ref), fFlagLuaAppChartsFilterOptionTextTag (ref), getOptionContextTagModule (ref), fFlagLuaAppChartsActiveFilterChips (ref), useTopBarHeightSelectorModule (ref), signal (ref), peekView (ref), filterMenuActionBarModule (ref), filterMenuHeaderModule (ref), filterMenuOptionsModule (ref)
	local var10 = useNavigationProps(function(_, p0) --[[ line: 36 ]]
		return {
			filter = p0.filter,
			onFilterApplied = p0.onFilterApplied,
			onFilterMenuClosed = p0.onFilterMenuClosed,
			sendFilterClick = p0.sendFilterClick
		}
	end)
	local filter = var10.filter
	local var11, var12 = reactModule.useState(filter.selectedOptionId)
	local var13 = reactModule.useRef(false)
	local var14 = useNavigation()
	local var15 = reactModule.useCallback(function(p1, _) --[[ line: 54 ]]
		-- upvalues: peekViewState (copy), var14 (ref), var10 (ref), var13 (ref), filterClickButtonNameModule (copy), filter (ref), var11 (ref), fFlagLuaAppChartsFilterOptionTextTag (copy), getOptionContextTagModule (copy), fFlagLuaAppChartsActiveFilterChips (copy)
		if p1 == peekViewState.Closed or p1 == peekViewState.Hidden then
			var14.goBack()
			var10.onFilterMenuClosed()
			
			if not var13.current then
				var10.sendFilterClick(filterClickButtonNameModule.ClosePeekView, filter.selectedOptionId, var11, if fFlagLuaAppChartsFilterOptionTextTag then getOptionContextTagModule(filter, filter.selectedOptionId) else nil, if fFlagLuaAppChartsFilterOptionTextTag then getOptionContextTagModule(filter, var11) else nil, if fFlagLuaAppChartsActiveFilterChips then true else nil)
			end
		end
	end, {
		if fFlagLuaAppChartsFilterOptionTextTag then nil else filter.selectedOptionId,
		var11, var14, var10.onFilterMenuClosed, var10.sendFilterClick,
		if fFlagLuaAppChartsFilterOptionTextTag then filter else nil
	})
	local var16 = useTopBarHeightSelectorModule()
	local var17, var18 = reactModule.useBinding(Vector2.new(0, 0))
	local var19, var20 = reactModule.useBinding(0)
	local var21 = nil
	local var22 = nil
	local var23 = nil
	local _ = nil
	local var24 = nil
	
	if fFlagLuaAppChartsFilterOptionTextTag then
		local var27, var28 = reactModule.useBinding(0)
		var23 = var27
		local var29 = var28
		var24 = reactModule.useCallback(function(p2) --[[ line: 92 ]]
			-- upvalues: var29 (write)
			var29(p2.AbsoluteCanvasSize.Y)
		end, {})
	else
		local var25, var26 = reactModule.useBinding(Vector2.new(0, 0))
		var21 = var25
		var22 = var26
	end
	local var30 = if fFlagLuaAppChartsFilterOptionTextTag then nil else var17:map(function(p3) --[[ line: 101 ]]
		return p3.X
	end)
	local var31 = reactModule.joinBindings({
		var17,
		var19,
		if fFlagLuaAppChartsFilterOptionTextTag then var23 else var21
	}):map(function(p4) --[[ line: 109 ]]
		-- upvalues: fFlagLuaAppChartsFilterOptionTextTag (copy), var16 (ref)
		return UDim2.new(1, 0, 0, math.min(p4[2] + (if fFlagLuaAppChartsFilterOptionTextTag then p4[3] else p4[3].Y), p4[1].Y - 84 - 25 - var16))
	end)
	local var32 = var19:map(function(p5) --[[ line: 121 ]]
		return UDim2.new(1, 0, 1, -p5)
	end)
	local var33 = reactModule.useRef(nil)
	local var34 = reactModule.useCallback(function(p6) --[[ line: 127 ]]
		-- upvalues: var33 (ref)
		local current = var33.current
		
		if current then
			local y = p6.AbsoluteSize.Y
			current.AutomaticSize = Enum.AutomaticSize.None
			current.Size = UDim2.new(1, 0, 0, y)
		end
	end, {})
	local var35 = reactModule.useRef(signal.new())
	local var36 = reactModule.useCallback(function() --[[ line: 140 ]]
		-- upvalues: var35 (ref)
		var35.current:fire()
	end, {})
	
	return reactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		ClipsDescendants = false,
		[reactModule.Change.AbsoluteSize] = function(p7) --[[ line: 179 ]]
			-- upvalues: var18 (ref)
			var18(p7.AbsoluteSize)
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
			contentFrameRef = var33,
			closeSignal = var35.current,
			viewStateChanged = var15,
			bottomDockedContainerContent = reactModule.createElement(filterMenuActionBarModule, {
				Size = UDim2.new(1, 0, 0, 84),
				applyEnabled = var11 ~= filter.selectedOptionId,
				onApply = reactModule.useCallback(function() --[[ line: 152 ]]
					-- upvalues: var10 (ref), filter (ref), var11 (ref), var13 (ref), var36 (ref), filterClickButtonNameModule (copy), fFlagLuaAppChartsFilterOptionTextTag (copy), getOptionContextTagModule (copy), fFlagLuaAppChartsActiveFilterChips (copy)
					var10.onFilterApplied(filter.filterType, var11)
					var13.current = true
					var36()
					var10.sendFilterClick(filterClickButtonNameModule.Apply, var11, filter.selectedOptionId, if fFlagLuaAppChartsFilterOptionTextTag then getOptionContextTagModule(filter, var11) else nil, if fFlagLuaAppChartsFilterOptionTextTag then getOptionContextTagModule(filter, filter.selectedOptionId) else nil, if fFlagLuaAppChartsActiveFilterChips then true else nil)
				end, {
					if fFlagLuaAppChartsFilterOptionTextTag then nil else filter.filterType,
					if fFlagLuaAppChartsFilterOptionTextTag then nil else filter.selectedOptionId,
					var11, var10.onFilterApplied, var36, var10.sendFilterClick,
					if fFlagLuaAppChartsFilterOptionTextTag then filter else nil
				})
			})
		}, {
			Content = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = var31,
				[reactModule.Change.AbsoluteSize] = var34
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
					onCloseButtonActivated = var36,
					onHeightChanged = var20
				}),
				Options = reactModule.createElement(filterMenuOptionsModule, {
					LayoutOrder = 2,
					Size = var32,
					containerMaxWidthBinding = if fFlagLuaAppChartsFilterOptionTextTag then nil else var30,
					options = filter.filterOptions,
					selectedOptionId = var11,
					onSelectedOptionChanged = reactModule.useCallback(function(p8) --[[ line: 145 ]]
						-- upvalues: var12 (ref)
						var12(p8)
					end, {}),
					onCanvasSizeChanged = if fFlagLuaAppChartsFilterOptionTextTag then var24 else var22
				})
			})
		})
	})
end