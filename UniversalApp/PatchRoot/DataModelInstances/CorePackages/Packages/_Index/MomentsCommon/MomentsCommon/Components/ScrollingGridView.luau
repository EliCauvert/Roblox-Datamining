local parent = script:FindFirstAncestor("MomentsCommon").Parent
local dashModule = require(parent.Dash)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local button = foundationModule.Button
local scrollBarVisibility = foundationModule.Enums.ScrollBarVisibility
local scrollView = foundationModule.ScrollView
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens

local function GridItems(p1)
	-- upvalues: reactModule (ref), view (ref)
	local t = {}
	
	for i, v in p1.items do
		t[i] = reactModule.createElement(view, {
			LayoutOrder = i,
			Size = UDim2.fromOffset(p1.itemSize.X, p1.itemSize.Y)
		}, { Content = p1.renderItem(v, i) })
	end
	return reactModule.createElement(view, {
		tag = "auto-y size-full-0",
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p1.LayoutOrder
	}, {
		UIGridLayout = reactModule.createElement("UIGridLayout", {
			CellPadding = UDim2.fromOffset(p1.itemPadding.X, p1.itemPadding.Y),
			CellSize = UDim2.fromOffset(p1.itemSize.X, p1.itemSize.Y),
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Children = reactModule.createElement(reactModule.Fragment, nil, t)
	})
end

return function(p2)
	-- upvalues: reactModule (ref), useTokens (ref), dashModule (ref), view (ref), scrollView (ref), scrollBarVisibility (ref), GridItems (ref), button (ref), foundationModule (ref)
	local var1, var2 = reactModule.useState(Vector2.new(0, 0))
	local var3, var4 = reactModule.useState(0)
	local var5 = useTokens()
	local var6 = reactModule.useCallback(function(p3)
		-- upvalues: var2 (ref)
		var2(p3.AbsoluteSize)
	end, {})
	local var7 = reactModule.useMemo(function()
		-- upvalues: var1 (ref), p2 (ref)
		return math.clamp(math.floor(var1.X / p2.itemConfig.minItemWidth), 1, p2.itemConfig.maxItemsPerRow)
	end, { var1, p2.itemConfig })
	local var8 = reactModule.useMemo(function()
		-- upvalues: var1 (ref), p2 (ref), var7 (ref)
		local var9 = var1.X - p2.itemConfig.padding * (var7 - 1)
		local minValue = math.min(var9 / var7, var9)
		
		return Vector2.new(math.floor(minValue), math.floor(minValue * p2.aspectRatio))
	end, { var1, var7, p2.aspectRatio, p2.itemConfig })
	local var9 = reactModule.useMemo(function()
		-- upvalues: var1 (ref), var8 (ref), var7 (ref), p2 (ref)
		return if var1.Y <= 0 then 0 else math.max(math.floor(var1.Y / var8.Y) * var7, p2.itemConfig.minItemsPerPage)
	end, { var1, var8, var7, p2.itemConfig })
	local var10 = var1.X > 0 and var1.Y > 0
	local shouldShowShowMoreButton = p2.shouldShowShowMoreButton or var3 < #p2.items
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var9 (ref), var4 (ref)
		if var3 < var9 then
			var4(var9)
		end
	end, { var1, var9, var3 })
	
	return if p2.items == nil or #p2.items == 0 then reactModule.createElement(view, { tag = "shrink size-full", onAbsoluteSizeChanged = var6 }, { EmptyState = p2.renderEmptyState() }) else reactModule.createElement(view, { tag = "shrink size-full", onAbsoluteSizeChanged = var6 }, {
		GridViewContainer = reactModule.createElement(view, { tag = "size-full" }, {
			ScrollView = reactModule.createElement(scrollView, {
				BorderSizePixel = 0,
				tag = "size-full",
				layout = {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Top,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, var5.Padding.Large)
				},
				LayoutOrder = if p2.layoutOrder then p2.layoutOrder else 1,
				scroll = {
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.fromScale(1, 0),
					ScrollingDirection = Enum.ScrollingDirection.Y,
					scrollBarVisibility = scrollBarVisibility.None
				}
			}, {
				UIPadding = if p2.padding then reactModule.createElement("UIPadding", {
					PaddingBottom = p2.padding.bottom,
					PaddingTop = p2.padding.top,
					PaddingLeft = p2.padding.left,
					PaddingRight = p2.padding.right
				}) else nil,
				GridView = if #p2.items > 0 and var10 then reactModule.createElement(GridItems, {
					LayoutOrder = 1,
					itemPadding = Vector2.new(p2.itemConfig.padding, p2.itemConfig.padding),
					items = reactModule.useMemo(function()
						-- upvalues: shouldShowShowMoreButton (ref), p2 (ref), var3 (ref), dashModule (copy)
						return if shouldShowShowMoreButton then dashModule.slice(p2.items, 1, math.min(#p2.items, var3)) else p2.items
					end, { p2.items, shouldShowShowMoreButton, var3 }),
					itemsPerRow = var7,
					itemSize = var8,
					renderItem = p2.renderItem
				}) else nil,
				ShowMore = if shouldShowShowMoreButton then reactModule.createElement(button, {
					LayoutOrder = 2,
					onActivated = reactModule.useCallback(function()
						-- upvalues: var3 (ref), var9 (ref), p2 (ref), var4 (ref)
						if #p2.items < var3 + var9 and p2.shouldShowShowMoreButton then
							p2.onShowMoreCallback()
						end
						var4(var3 + var9)
					end, { var3, var9, p2.items, p2.onShowMoreCallback }),
					size = foundationModule.Enums.InputSize.Small,
					text = p2.showMoreButtonText
				}) else nil
			})
		})
	})
end