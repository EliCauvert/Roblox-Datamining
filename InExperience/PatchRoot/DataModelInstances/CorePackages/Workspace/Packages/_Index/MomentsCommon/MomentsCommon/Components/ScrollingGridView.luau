local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local dashModule = require(parent.Dash)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local fFlagMomentsProfileGridInfiniteLoadModule = require(momentsCommon.Flags.FFlagMomentsProfileGridInfiniteLoad)
local button = foundationModule.Button
local scrollBarVisibility = foundationModule.Enums.ScrollBarVisibility
local scrollView = foundationModule.ScrollView
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens

local function GridItems(p0) --[[ line: 35 ]]
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

return function(p1) --[[ line: 95 ]]
	-- upvalues: reactModule (ref), useTokens (ref), dashModule (ref), fFlagMomentsProfileGridInfiniteLoadModule (ref), view (ref), scrollView (ref), scrollBarVisibility (ref), GridItems (ref), button (ref), foundationModule (ref)
	local var7, var8 = reactModule.useState(Vector2.new(0, 0))
	local var9, var10 = reactModule.useState(0)
	local var11 = useTokens()
	local var12 = reactModule.useCallback(function(p2) --[[ line: 101 ]]
		-- upvalues: var8 (ref)
		var8(p2.AbsoluteSize)
	end, {})
	local var13 = reactModule.useMemo(function() --[[ line: 105 ]]
		-- upvalues: var7 (ref), p1 (ref)
		return math.clamp(math.floor(var7.X / p1.itemConfig.minItemWidth), 1, p1.itemConfig.maxItemsPerRow)
	end, { var7, p1.itemConfig })
	local var14 = reactModule.useMemo(function() --[[ line: 113 ]]
		-- upvalues: var7 (ref), p1 (ref), var13 (ref)
		local var20 = var7.X - p1.itemConfig.padding * (var13 - 1)
		local minValue = math.min(var20 / var13, var20)
		
		return Vector2.new(math.floor(minValue), math.floor(minValue * p1.aspectRatio))
	end, { var7, var13, p1.aspectRatio, p1.itemConfig })
	local var15 = reactModule.useMemo(function() --[[ line: 123 ]]
		-- upvalues: var7 (ref), var14 (ref), var13 (ref), p1 (ref)
		return if var7.Y <= 0 then 0 else math.max(math.floor(var7.Y / var14.Y) * var13, p1.itemConfig.minItemsPerPage)
	end, { var7, var14, var13, p1.itemConfig })
	local var16 = var7.X > 0 and var7.Y > 0
	local shouldShowShowMoreButton = p1.shouldShowShowMoreButton or var9 < #p1.items
	reactModule.useEffect(function() --[[ line: 137 ]]
		-- upvalues: var9 (ref), var15 (ref), var10 (ref)
		if var9 < var15 then
			var10(var15)
		end
	end, { var7, var15, var9 })
	local var18 = reactModule.useCallback(function() --[[ line: 144 ]]
		-- upvalues: var9 (ref), var15 (ref), p1 (ref), var10 (ref)
		if #p1.items < var9 + var15 and p1.shouldShowShowMoreButton then
			p1.onShowMoreCallback()
		end
		var10(var9 + var15)
	end, {
		var9,
		var15,
		p1.items,
		p1.onShowMoreCallback,
		p1.shouldShowShowMoreButton
	})
	local var19 = reactModule.useMemo(function() --[[ line: 155 ]]
		-- upvalues: shouldShowShowMoreButton (ref), p1 (ref), var9 (ref), dashModule (copy)
		return if shouldShowShowMoreButton then dashModule.slice(p1.items, 1, math.min(#p1.items, var9)) else p1.items
	end, { p1.items, shouldShowShowMoreButton, var9 })
	
	if fFlagMomentsProfileGridInfiniteLoadModule then
		reactModule.useEffect(function() --[[ line: 167 ]]
			-- upvalues: p1 (ref), shouldShowShowMoreButton (ref), var7 (ref), var14 (ref), var13 (ref), var9 (ref), var19 (ref), var18 (ref)
			if not p1.enableInfiniteScroll or not shouldShowShowMoreButton then return end
			if var7.Y <= 0 or var14.Y <= 0 or var13 <= 0 then return end
			if #p1.items < var9 then return end
			if math.ceil(#var19 / var13) * var14.Y <= var7.Y then
				var18()
			end
		end, {
			var7, var19, shouldShowShowMoreButton, p1.enableInfiniteScroll, p1.items,
			var13, var14, var18
		})
	end
	return if p1.items == nil or #p1.items == 0 then reactModule.createElement(view, { tag = "shrink size-full", onAbsoluteSizeChanged = var12 }, { EmptyState = p1.renderEmptyState() }) else reactModule.createElement(view, { tag = "shrink size-full", onAbsoluteSizeChanged = var12 }, {
		GridViewContainer = reactModule.createElement(view, { tag = "size-full" }, {
			ScrollView = reactModule.createElement(scrollView, {
				BorderSizePixel = 0,
				tag = "size-full",
				layout = {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Top,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, var11.Padding.Large)
				},
				LayoutOrder = if p1.layoutOrder then p1.layoutOrder else 1,
				onCanvasPositionChanged = if p1.enableInfiniteScroll then if fFlagMomentsProfileGridInfiniteLoadModule then reactModule.useCallback(function(p3) --[[ line: 201 ]]
					-- upvalues: shouldShowShowMoreButton (ref), var14 (ref), var18 (ref)
					if not shouldShowShowMoreButton then return end
					if p3.AbsoluteCanvasSize.Y - var14.Y <= p3.CanvasPosition.Y + p3.AbsoluteSize.Y then
						var18()
					end
				end, { shouldShowShowMoreButton, var18, var14 }) else nil else nil,
				scroll = {
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.fromScale(1, 0),
					ScrollingDirection = Enum.ScrollingDirection.Y,
					scrollBarVisibility = scrollBarVisibility.None
				},
				padding = p1.padding
			}, {
				GridView = if #p1.items > 0 and var16 then reactModule.createElement(GridItems, {
					LayoutOrder = 1,
					itemPadding = Vector2.new(p1.itemConfig.padding, p1.itemConfig.padding),
					items = var19,
					itemsPerRow = var13,
					itemSize = var14,
					renderItem = p1.renderItem
				}) else nil,
				ShowMore = if shouldShowShowMoreButton and not p1.enableInfiniteScroll then reactModule.createElement(button, {
					LayoutOrder = 2,
					onActivated = var18,
					size = foundationModule.Enums.InputSize.Small,
					text = p1.showMoreButtonText
				}) else nil,
				Footer = if shouldShowShowMoreButton or p1.footer == nil or var15 >= #p1.items then nil else reactModule.createElement(view, {
					LayoutOrder = 3,
					tag = "size-full-0 auto-y align-x-center align-y-center"
				}, { Content = p1.footer })
			})
		})
	})
end