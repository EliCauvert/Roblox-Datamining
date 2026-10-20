local GameFilters = script:FindFirstAncestor("GameFilters")
local Parent = GameFilters.Parent
local _ = require(Parent.DiscoveryTypes)
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local FilterClickButtonNameModule = require(GameFilters.Analytics.FilterClickButtonName)
local FilterMenuActionBarModule = require(GameFilters.Components.Menu.FilterMenuActionBar)
local FilterMenuHeaderModule = require(GameFilters.Components.Menu.FilterMenuHeader)
local FilterMenuOptionsModule = require(GameFilters.Components.Menu.FilterMenuOptions)
local GetOptionContextTagModule = require(GameFilters.Analytics.getOptionContextTag)
local FFlagLuaAppChartsFilterOptionTextTag = require(Parent.SharedFlags).FFlagLuaAppChartsFilterOptionTextTag
local FFlagLuaAppChartsActiveFilterChips = require(Parent.SharedFlags).FFlagLuaAppChartsActiveFilterChips
local X = if FFlagLuaAppChartsFilterOptionTextTag then nil else 10000

local function _(p1, p2)
	return p1 * p2.Config.UI.Scale
end

return function(p1)
	-- upvalues: UseTokensFunction (copy), UseDispatchFunction (copy), ReactModule (copy), FFlagLuaAppChartsFilterOptionTextTag (copy), X (copy), FilterClickButtonNameModule (copy), GetOptionContextTagModule (copy), FFlagLuaAppChartsActiveFilterChips (copy), FilterMenuHeaderModule (copy), FilterMenuOptionsModule (copy), FilterMenuActionBarModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseDispatchResult = UseDispatchFunction()
	local ScaledScale = 260 * UseTokensResult.Config.UI.Scale
	local ScaledScale1 = 84 * UseTokensResult.Config.UI.Scale
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1.filter.selectedOptionId)
	local Scrim = UseTokensResult.Color.Common.Scrim
	local Surface100 = UseTokensResult.Color.Surface.Surface_100
	local Border = UseTokensResult.Color.ActionStandard.Border
	local _UDim2 = nil
	local _Vector2 = nil
	
	if p1.openPosition then
		_UDim2 = UDim2.fromOffset(p1.openPosition.X, p1.openPosition.Y)
		_Vector2 = Vector2.new(0, 0)
	else
		_UDim2 = UDim2.fromScale(0.5, 0.5)
		_Vector2 = Vector2.new(0.5, 0.5)
	end
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(Vector2.new(0, 0))
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(0)
	local v1 = nil
	local v2 = nil
	local v3 = nil
	local UseBindingResult2_2 = nil
	local UseResult = nil
	
	if FFlagLuaAppChartsFilterOptionTextTag then
		v3, UseBindingResult2_2 = ReactModule.useBinding(0)
		UseResult = ReactModule.useCallback(function(ScrollFrame)
			-- upvalues: UseBindingResult2_2 (ref)
			UseBindingResult2_2(ScrollFrame.AbsoluteCanvasSize.Y)
		end, {})
	else
		v1, v28 = ReactModule.useBinding(Vector2.new(X, 0))
	end
	local MapResult = UseBindingResult:map(function(Vector): Vector2
		-- upvalues: p1 (copy), ScaledScale (copy)
		local Largest = nil
		local Largest1 = nil
		if p1.openPosition then
			Largest = math.max(Vector.X - p1.openPosition.X - 24, ScaledScale)
			Largest1 = math.max(Vector.Y - p1.openPosition.Y - 24, 0)
		else
			Largest = Vector.X - 48
			Largest1 = Vector.Y - 48
		end
		return Vector2.new(Largest, Largest1)
	end)
	local MapResult1 = if FFlagLuaAppChartsFilterOptionTextTag then nil else MapResult:map(function(p2)
		return p2.X
	end)
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), p1 (copy), FilterClickButtonNameModule (upval), UseStateResult (copy), FFlagLuaAppChartsFilterOptionTextTag (upval), GetOptionContextTagModule (upval), FFlagLuaAppChartsActiveFilterChips (upval)
		UseDispatchResult(p1.closeCentralOverlayThunk())
		p1.onFilterMenuClosed()
		p1.sendFilterClick(FilterClickButtonNameModule.CloseDropdown, p1.filter.selectedOptionId, UseStateResult, if FFlagLuaAppChartsFilterOptionTextTag then GetOptionContextTagModule(p1.filter, p1.filter.selectedOptionId) else nil, if FFlagLuaAppChartsFilterOptionTextTag then GetOptionContextTagModule(p1.filter, UseStateResult) else nil, if FFlagLuaAppChartsActiveFilterChips then true else nil)
	end, {
		p1.filter,
		UseStateResult,
		p1.closeCentralOverlayThunk,
		p1.onFilterMenuClosed,
		p1.sendFilterClick
	})
	
	return ReactModule.createElement("TextButton", {
		BackgroundColor3 = Scrim.Color3,
		BackgroundTransparency = Scrim.Transparency,
		Size = UDim2.fromScale(1, 1),
		ClipsDescendants = false,
		Text = "",
		AutoButtonColor = false,
		[ReactModule.Event.Activated] = UseResult1,
		[ReactModule.Change.AbsoluteSize] = function(Frame)
			-- upvalues: UseBindingResult2 (copy)
			UseBindingResult2(Frame.AbsoluteSize)
		end,
		Selectable = false
	}, {
		Dropdown = ReactModule.createElement("TextButton", {
			ClipsDescendants = true,
			Text = "",
			AutoButtonColor = false,
			Selectable = false,
			BackgroundColor3 = Surface100.Color3,
			BackgroundTransparency = Surface100.Transparency,
			BorderColor3 = Border.Color3,
			Position = _UDim2,
			AnchorPoint = _Vector2,
			Size = ReactModule.joinBindings({
				UseBindingResult1,
				if FFlagLuaAppChartsFilterOptionTextTag then v3 else v1
			}):map(function(Entry): UDim2
				-- upvalues: FFlagLuaAppChartsFilterOptionTextTag (upval), ScaledScale1 (copy)
				local Entry1 = Entry[1]
				
				if FFlagLuaAppChartsFilterOptionTextTag then
					return UDim2.fromOffset(0, Entry1 + Entry[2] + ScaledScale1)
				else
					local Entry2 = Entry[2]
					
					return UDim2.fromOffset(Entry2.X, Entry1 + Entry2.Y + ScaledScale1)
				end
			end),
			AutomaticSize = if FFlagLuaAppChartsFilterOptionTextTag then Enum.AutomaticSize.X else nil
		}, {
			Corner = ReactModule.createElement("UICorner", {
				CornerRadius = UDim.new(0, UseTokensResult.Radius.Medium)
			}),
			SizeConstraint = ReactModule.createElement("UISizeConstraint", {
				MinSize = Vector2.new(ScaledScale, 0),
				MaxSize = MapResult
			}),
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalFlex = if FFlagLuaAppChartsFilterOptionTextTag then Enum.UIFlexAlignment.Fill else nil
			}),
			Header = ReactModule.createElement(FilterMenuHeaderModule, {
				LayoutOrder = 1,
				title = p1.filter.filterDisplayName,
				onCloseButtonActivated = UseResult1,
				onHeightChanged = UseBindingResult2_1
			}),
			Options = ReactModule.createElement(FilterMenuOptionsModule, {
				LayoutOrder = 2,
				Size = UseBindingResult1:map(function(p2): UDim2
					-- upvalues: FFlagLuaAppChartsFilterOptionTextTag (upval), ScaledScale1 (copy)
					return UDim2.new(if FFlagLuaAppChartsFilterOptionTextTag then 0 else 1, 0, 1, -p2 - ScaledScale1)
				end),
				containerMaxWidthBinding = if FFlagLuaAppChartsFilterOptionTextTag then nil else MapResult1,
				options = p1.filter.filterOptions,
				selectedOptionId = UseStateResult,
				onSelectedOptionChanged = UseStateResult2,
				onCanvasSizeChanged = if FFlagLuaAppChartsFilterOptionTextTag then UseResult else v2
			}),
			ActionBar = ReactModule.createElement(FilterMenuActionBarModule, {
				LayoutOrder = 3,
				Size = UDim2.new(if FFlagLuaAppChartsFilterOptionTextTag then 0 else 1, 0, 0, ScaledScale1),
				applyEnabled = UseStateResult ~= p1.filter.selectedOptionId,
				onApply = ReactModule.useCallback(function()
					-- upvalues: p1 (copy), UseStateResult (copy), UseDispatchResult (copy), FilterClickButtonNameModule (upval), FFlagLuaAppChartsFilterOptionTextTag (upval), GetOptionContextTagModule (upval), FFlagLuaAppChartsActiveFilterChips (upval)
					p1.onFilterApplied(p1.filter.filterType, UseStateResult)
					UseDispatchResult(p1.closeCentralOverlayThunk())
					p1.onFilterMenuClosed()
					p1.sendFilterClick(FilterClickButtonNameModule.Apply, UseStateResult, p1.filter.selectedOptionId, if FFlagLuaAppChartsFilterOptionTextTag then GetOptionContextTagModule(p1.filter, UseStateResult) else nil, if FFlagLuaAppChartsFilterOptionTextTag then GetOptionContextTagModule(p1.filter, p1.filter.selectedOptionId) else nil, if FFlagLuaAppChartsActiveFilterChips then true else nil)
				end, {
					p1.filter, UseStateResult, p1.onFilterApplied, p1.closeCentralOverlayThunk,
					p1.onFilterMenuClosed, p1.sendFilterClick
				})
			})
		})
	})
end