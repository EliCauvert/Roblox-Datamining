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
local var1 = if fFlagLuaAppChartsFilterOptionTextTag then nil else 10000

local function _(p1, p2)
	return p1 * p2.Config.UI.Scale
end

return function(p1)
	-- upvalues: useTokens (ref), useDispatch (ref), reactModule (ref), fFlagLuaAppChartsFilterOptionTextTag (ref), var1 (ref), filterClickButtonNameModule (ref), getOptionContextTagModule (ref), fFlagLuaAppChartsActiveFilterChips (ref), filterMenuHeaderModule (ref), filterMenuOptionsModule (ref), filterMenuActionBarModule (ref)
	local uDim2, vector2
	local var2 = useTokens()
	local var3 = useDispatch()
	local var4 = 260 * var2.Config.UI.Scale
	local var5 = 84 * var2.Config.UI.Scale
	local var6, var7 = reactModule.useState(p1.filter.selectedOptionId)
	local scrim = var2.Color.Common.Scrim
	local surface100 = var2.Color.Surface.Surface_100
	local border = var2.Color.ActionStandard.Border
	local _ = nil
	local _ = nil
	
	if p1.openPosition then
		uDim2 = UDim2.fromOffset(p1.openPosition.X, p1.openPosition.Y)
		vector2 = Vector2.new(0, 0)
	else
		uDim2 = UDim2.fromScale(0.5, 0.5)
		vector2 = Vector2.new(0.5, 0.5)
	end
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
		var15 = reactModule.useCallback(function(p2)
			-- upvalues: var18 (write)
			var18(p2.AbsoluteCanvasSize.Y)
		end, {})
	else
		local var19, var20 = reactModule.useBinding(Vector2.new(var1, 0))
		var12 = var19
		var13 = var20
	end
	local var21 = var8:map(function(p2)
		-- upvalues: p1 (ref), var4 (ref)
		local maxValue, maxValue_1
		local _ = nil
		local _ = nil
		
		if p1.openPosition then
			maxValue = math.max(p2.X - p1.openPosition.X - 24, var4)
			maxValue_1 = math.max(p2.Y - p1.openPosition.Y - 24, 0)
		else
			maxValue = p2.X - 48
			maxValue_1 = p2.Y - 48
		end
		return Vector2.new(maxValue, maxValue_1)
	end)
	local var22 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), p1 (ref), filterClickButtonNameModule (copy), var6 (ref), fFlagLuaAppChartsFilterOptionTextTag (copy), getOptionContextTagModule (copy), fFlagLuaAppChartsActiveFilterChips (copy)
		var3(p1.closeCentralOverlayThunk())
		p1.onFilterMenuClosed()
		p1.sendFilterClick(filterClickButtonNameModule.CloseDropdown, p1.filter.selectedOptionId, var6, if fFlagLuaAppChartsFilterOptionTextTag then getOptionContextTagModule(p1.filter, p1.filter.selectedOptionId) else nil, if fFlagLuaAppChartsFilterOptionTextTag then getOptionContextTagModule(p1.filter, var6) else nil, if fFlagLuaAppChartsActiveFilterChips then true else nil)
	end, {
		p1.filter,
		var6,
		p1.closeCentralOverlayThunk,
		p1.onFilterMenuClosed,
		p1.sendFilterClick
	})
	
	return reactModule.createElement("TextButton", {
		BackgroundColor3 = scrim.Color3,
		BackgroundTransparency = scrim.Transparency,
		Size = UDim2.fromScale(1, 1),
		ClipsDescendants = false,
		Text = "",
		AutoButtonColor = false,
		[reactModule.Event.Activated] = var22,
		[reactModule.Change.AbsoluteSize] = function(p2)
			-- upvalues: var9 (ref)
			var9(p2.AbsoluteSize)
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
				var10,
				if fFlagLuaAppChartsFilterOptionTextTag then var14 else var12
			}):map(function(p2)
				-- upvalues: fFlagLuaAppChartsFilterOptionTextTag (copy), var5 (ref)
				local var23 = p2[1]
				
				if fFlagLuaAppChartsFilterOptionTextTag then
					return UDim2.fromOffset(0, var23 + p2[2] + var5)
				end
				local var24 = p2[2]
				
				return UDim2.fromOffset(var24.X, var23 + var24.Y + var5)
			end),
			AutomaticSize = if fFlagLuaAppChartsFilterOptionTextTag then Enum.AutomaticSize.X else nil
		}, {
			Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var2.Radius.Medium) }),
			SizeConstraint = reactModule.createElement("UISizeConstraint", { MinSize = Vector2.new(var4, 0), MaxSize = var21 }),
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalFlex = if fFlagLuaAppChartsFilterOptionTextTag then Enum.UIFlexAlignment.Fill else nil
			}),
			Header = reactModule.createElement(filterMenuHeaderModule, {
				LayoutOrder = 1,
				title = p1.filter.filterDisplayName,
				onCloseButtonActivated = var22,
				onHeightChanged = var11
			}),
			Options = reactModule.createElement(filterMenuOptionsModule, {
				LayoutOrder = 2,
				Size = var10:map(function(p2)
					-- upvalues: fFlagLuaAppChartsFilterOptionTextTag (copy), var5 (ref)
					return UDim2.new(if fFlagLuaAppChartsFilterOptionTextTag then 0 else 1, 0, 1, (-p2) - var5)
				end),
				containerMaxWidthBinding = if fFlagLuaAppChartsFilterOptionTextTag then nil elseif fFlagLuaAppChartsFilterOptionTextTag then nil else var21:map(function(p2)
					return p2.X
				end),
				options = p1.filter.filterOptions,
				selectedOptionId = var6,
				onSelectedOptionChanged = var7,
				onCanvasSizeChanged = if fFlagLuaAppChartsFilterOptionTextTag then var15 else var13
			}),
			ActionBar = reactModule.createElement(filterMenuActionBarModule, {
				LayoutOrder = 3,
				Size = UDim2.new(if fFlagLuaAppChartsFilterOptionTextTag then 0 else 1, 0, 0, var5),
				applyEnabled = var6 ~= p1.filter.selectedOptionId,
				onApply = reactModule.useCallback(function()
					-- upvalues: p1 (ref), var6 (ref), var3 (ref), filterClickButtonNameModule (copy), fFlagLuaAppChartsFilterOptionTextTag (copy), getOptionContextTagModule (copy), fFlagLuaAppChartsActiveFilterChips (copy)
					p1.onFilterApplied(p1.filter.filterType, var6)
					var3(p1.closeCentralOverlayThunk())
					p1.onFilterMenuClosed()
					p1.sendFilterClick(filterClickButtonNameModule.Apply, var6, p1.filter.selectedOptionId, if fFlagLuaAppChartsFilterOptionTextTag then getOptionContextTagModule(p1.filter, var6) else nil, if fFlagLuaAppChartsFilterOptionTextTag then getOptionContextTagModule(p1.filter, p1.filter.selectedOptionId) else nil, if fFlagLuaAppChartsActiveFilterChips then true else nil)
				end, {
					p1.filter, var6, p1.onFilterApplied, p1.closeCentralOverlayThunk,
					p1.onFilterMenuClosed, p1.sendFilterClick
				})
			})
		})
	})
end