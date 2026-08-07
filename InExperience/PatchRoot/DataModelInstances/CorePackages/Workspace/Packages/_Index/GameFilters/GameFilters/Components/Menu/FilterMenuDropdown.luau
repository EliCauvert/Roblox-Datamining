local gameFilters = script:FindFirstAncestor("GameFilters")
local parent = gameFilters.Parent
local _ = require(parent.DiscoveryTypes)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useTokens = foundationModule.Hooks.useTokens
local filterClickButtonNameModule = require(gameFilters.Analytics.FilterClickButtonName)
local filterMenuActionBarModule = require(gameFilters.Components.Menu.FilterMenuActionBar)
local filterMenuHeaderModule = require(gameFilters.Components.Menu.FilterMenuHeader)
local filterMenuOptionsModule = require(gameFilters.Components.Menu.FilterMenuOptions)
local getOptionContextTagModule = require(gameFilters.Analytics.getOptionContextTag)
local fFlagLuaAppChartsFilterOptionTextTag = require(parent.SharedFlags).FFlagLuaAppChartsFilterOptionTextTag
local fFlagLuaAppChartsActiveFilterChips = require(parent.SharedFlags).FFlagLuaAppChartsActiveFilterChips
local var8 = if fFlagLuaAppChartsFilterOptionTextTag then nil else 10000

local function _(p0, p1) --[[ line: 39 | named "applyTokenScaling" ]]
	return p0 * p1.Config.UI.Scale
end

return function(p2) --[[ line: 44 | named "FilterMenuDropdown" ]]
	-- upvalues: useTokens (ref), useDispatch (ref), reactModule (ref), fFlagLuaAppChartsFilterOptionTextTag (ref), var8 (ref), filterClickButtonNameModule (ref), getOptionContextTagModule (ref), fFlagLuaAppChartsActiveFilterChips (ref), filterMenuHeaderModule (ref), filterMenuOptionsModule (ref), filterMenuActionBarModule (ref)
	local uDim2, vector2
	local var9 = useTokens()
	local var10 = useDispatch()
	local var11 = 260 * var9.Config.UI.Scale
	local var12 = 84 * var9.Config.UI.Scale
	local var13, var14 = reactModule.useState(p2.filter.selectedOptionId)
	local scrim = var9.Color.Common.Scrim
	local surface100 = var9.Color.Surface.Surface_100
	local border = var9.Color.ActionStandard.Border
	local _ = nil
	local _ = nil
	
	if p2.openPosition then
		uDim2 = UDim2.fromOffset(p2.openPosition.X, p2.openPosition.Y)
		vector2 = Vector2.new(0, 0)
	else
		uDim2 = UDim2.fromScale(0.5, 0.5)
		vector2 = Vector2.new(0.5, 0.5)
	end
	local var17, var18 = reactModule.useBinding(Vector2.new(0, 0))
	local var19, var20 = reactModule.useBinding(0)
	local var21 = nil
	local var22 = nil
	local var23 = nil
	local _ = nil
	local var24 = nil
	
	if fFlagLuaAppChartsFilterOptionTextTag then
		local var25, var26 = reactModule.useBinding(0)
		var23 = var25
		local var27 = var26
		var24 = reactModule.useCallback(function(p3) --[[ line: 74 ]]
			-- upvalues: var27 (write)
			var27(p3.AbsoluteCanvasSize.Y)
		end, {})
	else
		local var28, var29 = reactModule.useBinding(Vector2.new(var8, 0))
		var21 = var28
		var22 = var29
	end
	local var30 = var17:map(function(p4) --[[ line: 81 ]]
		-- upvalues: p2 (ref), var11 (ref)
		local maxValue, maxValue_1
		local _ = nil
		local _ = nil
		
		if p2.openPosition then
			maxValue = math.max(p4.X - p2.openPosition.X - 24, var11)
			maxValue_1 = math.max(p4.Y - p2.openPosition.Y - 24, 0)
		else
			maxValue = p4.X - 48
			maxValue_1 = p4.Y - 48
		end
		return Vector2.new(maxValue, maxValue_1)
	end)
	local var31 = reactModule.useCallback(function() --[[ line: 122 ]]
		-- upvalues: var10 (ref), p2 (ref), filterClickButtonNameModule (copy), var13 (ref), fFlagLuaAppChartsFilterOptionTextTag (copy), getOptionContextTagModule (copy), fFlagLuaAppChartsActiveFilterChips (copy)
		var10(p2.closeCentralOverlayThunk())
		p2.onFilterMenuClosed()
		p2.sendFilterClick(filterClickButtonNameModule.CloseDropdown, p2.filter.selectedOptionId, var13, if fFlagLuaAppChartsFilterOptionTextTag then getOptionContextTagModule(p2.filter, p2.filter.selectedOptionId) else nil, if fFlagLuaAppChartsFilterOptionTextTag then getOptionContextTagModule(p2.filter, var13) else nil, if fFlagLuaAppChartsActiveFilterChips then true else nil)
	end, {
		p2.filter,
		var13,
		p2.closeCentralOverlayThunk,
		p2.onFilterMenuClosed,
		p2.sendFilterClick
	})
	
	return reactModule.createElement("TextButton", {
		BackgroundColor3 = scrim.Color3,
		BackgroundTransparency = scrim.Transparency,
		Size = UDim2.fromScale(1, 1),
		ClipsDescendants = false,
		Text = "",
		AutoButtonColor = false,
		[reactModule.Event.Activated] = var31,
		[reactModule.Change.AbsoluteSize] = function(p5) --[[ line: 179 ]]
			-- upvalues: var18 (ref)
			var18(p5.AbsoluteSize)
		end,
		Selectable = false
	}, {
		Dropdown = reactModule.createElement("TextButton", {
			ClipsDescendants = true,
			Text = "",
			AutoButtonColor = false,
			Selectable = false,
			BackgroundColor3 = surface100.Color3,
			BackgroundTransparency = surface100.Transparency,
			BorderColor3 = border.Color3,
			Position = uDim2,
			AnchorPoint = vector2,
			Size = reactModule.joinBindings({
				var19,
				if fFlagLuaAppChartsFilterOptionTextTag then var23 else var21
			}):map(function(p6) --[[ line: 105 ]]
				-- upvalues: fFlagLuaAppChartsFilterOptionTextTag (copy), var12 (ref)
				local var34 = p6[1]
				
				if fFlagLuaAppChartsFilterOptionTextTag then
					return UDim2.fromOffset(0, var34 + p6[2] + var12)
				end
				local var35 = p6[2]
				
				return UDim2.fromOffset(var35.X, var34 + var35.Y + var12)
			end),
			AutomaticSize = if fFlagLuaAppChartsFilterOptionTextTag then Enum.AutomaticSize.X else nil
		}, {
			Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var9.Radius.Medium) }),
			SizeConstraint = reactModule.createElement("UISizeConstraint", { MinSize = Vector2.new(var11, 0), MaxSize = var30 }),
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalFlex = if fFlagLuaAppChartsFilterOptionTextTag then Enum.UIFlexAlignment.Fill else nil
			}),
			Header = reactModule.createElement(filterMenuHeaderModule, {
				LayoutOrder = 1,
				title = p2.filter.filterDisplayName,
				onCloseButtonActivated = var31,
				onHeightChanged = var20
			}),
			Options = reactModule.createElement(filterMenuOptionsModule, {
				LayoutOrder = 2,
				Size = var19:map(function(p7) --[[ line: 118 ]]
					-- upvalues: fFlagLuaAppChartsFilterOptionTextTag (copy), var12 (ref)
					return UDim2.new(if fFlagLuaAppChartsFilterOptionTextTag then 0 else 1, 0, 1, (-p7) - var12)
				end),
				containerMaxWidthBinding = if fFlagLuaAppChartsFilterOptionTextTag then nil elseif fFlagLuaAppChartsFilterOptionTextTag then nil else var30:map(function(p8) --[[ line: 98 ]]
					return p8.X
				end),
				options = p2.filter.filterOptions,
				selectedOptionId = var13,
				onSelectedOptionChanged = var14,
				onCanvasSizeChanged = if fFlagLuaAppChartsFilterOptionTextTag then var24 else var22
			}),
			ActionBar = reactModule.createElement(filterMenuActionBarModule, {
				LayoutOrder = 3,
				Size = UDim2.new(if fFlagLuaAppChartsFilterOptionTextTag then 0 else 1, 0, 0, var12),
				applyEnabled = var13 ~= p2.filter.selectedOptionId,
				onApply = reactModule.useCallback(function() --[[ line: 146 ]]
					-- upvalues: p2 (ref), var13 (ref), var10 (ref), filterClickButtonNameModule (copy), fFlagLuaAppChartsFilterOptionTextTag (copy), getOptionContextTagModule (copy), fFlagLuaAppChartsActiveFilterChips (copy)
					p2.onFilterApplied(p2.filter.filterType, var13)
					var10(p2.closeCentralOverlayThunk())
					p2.onFilterMenuClosed()
					p2.sendFilterClick(filterClickButtonNameModule.Apply, var13, p2.filter.selectedOptionId, if fFlagLuaAppChartsFilterOptionTextTag then getOptionContextTagModule(p2.filter, var13) else nil, if fFlagLuaAppChartsFilterOptionTextTag then getOptionContextTagModule(p2.filter, p2.filter.selectedOptionId) else nil, if fFlagLuaAppChartsActiveFilterChips then true else nil)
				end, {
					p2.filter, var13, p2.onFilterApplied, p2.closeCentralOverlayThunk,
					p2.onFilterMenuClosed, p2.sendFilterClick
				})
			})
		})
	})
end