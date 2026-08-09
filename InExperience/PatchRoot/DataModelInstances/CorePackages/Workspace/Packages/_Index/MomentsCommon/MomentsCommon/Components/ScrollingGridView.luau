local parent = script:FindFirstAncestor("MomentsCommon").Parent
local dashModule = require(parent.Dash)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local button = foundationModule.Button
local scrollBarVisibility = foundationModule.Enums.ScrollBarVisibility
local scrollView = foundationModule.ScrollView
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens

local function GridItems(p0) --[[ line: 33 ]]
	-- upvalues: reactModule (ref), view (ref)
	local t = {}
	
	for i, v in p0.items do
		t[i] = reactModule.createElement(view, {
			key = i,
			LayoutOrder = i,
			Size = UDim2.fromOffset(p0.itemSize.X, p0.itemSize.Y)
		}, { Content = p0.renderItem(v, i) })
	end
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y",
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p0.LayoutOrder
	}, {
		UIGridLayout = reactModule.createElement("UIGridLayout", {
			CellPadding = UDim2.fromOffset(p0.itemPadding.X, p0.itemPadding.Y),
			CellSize = UDim2.fromOffset(p0.itemSize.X, p0.itemSize.Y),
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Children = reactModule.createElement(reactModule.Fragment, nil, t)
	})
end

return function(p1) --[[ line: 89 ]]
	-- upvalues: reactModule (ref), useTokens (ref), dashModule (ref), view (ref), scrollView (ref), scrollBarVisibility (ref), GridItems (ref), button (ref), foundationModule (ref)
	local var5, var6 = reactModule.useState(Vector2.new(0, 0))
	local var7, var8 = reactModule.useState(0)
	local var9 = useTokens()
	local var10 = reactModule.useCallback(function(p2) --[[ line: 95 ]]
		-- upvalues: var6 (ref)
		var6(p2.AbsoluteSize)
	end, {})
	local var11 = reactModule.useMemo(function() --[[ line: 99 ]]
		-- upvalues: var5 (ref), p1 (ref)
		return math.clamp(math.floor(var5.X / p1.itemConfig.minItemWidth), 1, p1.itemConfig.maxItemsPerRow)
	end, { var5, p1.itemConfig })
	local var12 = reactModule.useMemo(function() --[[ line: 107 ]]
		-- upvalues: var5 (ref), p1 (ref), var11 (ref)
		local var16 = var5.X - p1.itemConfig.padding * (var11 - 1)
		local minValue = math.min(var16 / var11, var16)
		
		return Vector2.new(math.floor(minValue), math.floor(minValue * p1.aspectRatio))
	end, { var5, var11, p1.aspectRatio, p1.itemConfig })
	local var13 = reactModule.useMemo(function() --[[ line: 117 ]]
		-- upvalues: var5 (ref), var12 (ref), var11 (ref), p1 (ref)
		return if var5.Y <= 0 then 0 else math.max(math.floor(var5.Y / var12.Y) * var11, p1.itemConfig.minItemsPerPage)
	end, { var5, var12, var11, p1.itemConfig })
	local var14 = var5.X > 0 and var5.Y > 0
	local shouldShowShowMoreButton = p1.shouldShowShowMoreButton or var7 < #p1.items
	reactModule.useEffect(function() --[[ line: 131 ]]
		-- upvalues: var7 (ref), var13 (ref), var8 (ref)
		if var7 < var13 then
			var8(var13)
		end
	end, { var5, var13, var7 })
	
	return if p1.items == nil or #p1.items == 0 then reactModule.createElement(view, { tag = "shrink size-full", onAbsoluteSizeChanged = var10 }, { EmptyState = p1.renderEmptyState() }) else reactModule.createElement(view, { tag = "shrink size-full", onAbsoluteSizeChanged = var10 }, {
		GridViewContainer = reactModule.createElement(view, { tag = "size-full" }, {
			ScrollView = reactModule.createElement(scrollView, {
				BorderSizePixel = 0,
				tag = "size-full",
				layout = {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Top,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, var9.Padding.Large)
				},
				LayoutOrder = if p1.layoutOrder then p1.layoutOrder else 1,
				scroll = {
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.fromScale(1, 0),
					ScrollingDirection = Enum.ScrollingDirection.Y,
					scrollBarVisibility = scrollBarVisibility.None
				},
				padding = p1.padding
			}, {
				GridView = if #p1.items > 0 and var14 then reactModule.createElement(GridItems, {
					LayoutOrder = 1,
					itemPadding = Vector2.new(p1.itemConfig.padding, p1.itemConfig.padding),
					items = reactModule.useMemo(function() --[[ line: 149 ]]
						-- upvalues: shouldShowShowMoreButton (ref), p1 (ref), var7 (ref), dashModule (copy)
						return if shouldShowShowMoreButton then dashModule.slice(p1.items, 1, math.min(#p1.items, var7)) else p1.items
					end, { p1.items, shouldShowShowMoreButton, var7 }),
					itemsPerRow = var11,
					itemSize = var12,
					renderItem = p1.renderItem
				}) else nil,
				ShowMore = if shouldShowShowMoreButton then reactModule.createElement(button, {
					LayoutOrder = 2,
					onActivated = reactModule.useCallback(function() --[[ line: 138 ]]
						-- upvalues: var7 (ref), var13 (ref), p1 (ref), var8 (ref)
						if #p1.items < var7 + var13 and p1.shouldShowShowMoreButton then
							p1.onShowMoreCallback()
						end
						var8(var7 + var13)
					end, {
						var7,
						var13,
						p1.items,
						p1.onShowMoreCallback,
						p1.shouldShowShowMoreButton
					}),
					size = foundationModule.Enums.InputSize.Small,
					text = p1.showMoreButtonText
				}) else nil
			})
		})
	})
end