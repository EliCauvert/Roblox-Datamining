local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local libraryTileModule = require(script.Parent.Parent.LibraryTile)
local _ = require(script.Parent.Parent.LibraryTypes)
local scrollView = foundationModule.ScrollView
local skeleton = foundationModule.Skeleton
local view = foundationModule.View
local radius = foundationModule.Enums.Radius
local scrollBarVisibility = foundationModule.Enums.ScrollBarVisibility

return function(p1)
	-- upvalues: reactModule (ref), view (ref), skeleton (ref), radius (ref), libraryTileModule (ref), scrollView (ref), scrollBarVisibility (ref)
	local var1, var2 = reactModule.useState(Vector2.zero)
	local floored = math.floor(math.max(0, var1.X - 24) / 3)
	local floored_1 = math.floor(floored * 1.4)
	local ceiled = math.ceil((if p1.isLoading then 3 else #p1.items) / 3)
	local maxValue = math.max(0, ceiled * floored_1 + math.max(0, ceiled - 1) * 12)
	local var3 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		if p1.hasMore and not p1.isLoadingMore then
			p1.onLoadMore()
		end
	end, { p1.hasMore, p1.isLoadingMore, p1.onLoadMore })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var1 (ref), maxValue (ref), var3 (ref)
		if p1.hasMore and var1.Y > 0 and maxValue <= var1.Y then
			var3()
		end
	end, { var1.Y, maxValue, p1.hasMore, var3 })
	local var4 = reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref), floored_1 (ref), var3 (ref)
		if not p1.hasMore or floored_1 <= 0 then return end
		if p2.AbsoluteCanvasSize.Y - floored_1 <= p2.CanvasPosition.Y + p2.AbsoluteWindowSize.Y then
			var3()
		end
	end, { floored_1, p1.hasMore, var3 })
	local t = {}
	
	if p1.isLoading then
		for i = 1, 3 do
			t[tostring(i)] = reactModule.createElement(view, {
				tag = "col gap-small",
				LayoutOrder = i,
				Size = UDim2.fromOffset(floored, floored_1),
				testId = `Library.Category.Skeleton.{i}`
			}, {
				Thumbnail = reactModule.createElement(skeleton, {
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 1, -48),
					radius = radius.Medium
				}),
				Title = reactModule.createElement(skeleton, {
					LayoutOrder = 2,
					Size = UDim2.new(0.75, 0, 0, 20),
					radius = radius.Small
				})
			})
		end
	else
		for i, v in p1.items do
			t[v.tileKey or (v.itemId or v.displayName)] = reactModule.createElement(view, {
				LayoutOrder = i,
				Size = UDim2.fromOffset(floored, floored_1)
			}, {
				Tile = reactModule.createElement(libraryTileModule, {
					subtitle = nil,
					tileKey = v.tileKey,
					itemId = v.itemId,
					itemKind = v.itemKind,
					displayName = v.displayName,
					thumbnail = v.thumbnail,
					model = v.model,
					onActivated = v.onActivated,
					Size = UDim2.fromScale(1, 1),
					mediaSize = UDim2.new(1, 0, 1, -48)
				})
			})
		end
	end
	return reactModule.createElement(view, {
		tag = "size-full",
		testId = "Library.Category.Grid",
		LayoutOrder = p1.LayoutOrder,
		onAbsoluteSizeChanged = function(value)
			-- upvalues: var2 (ref)
			var2(value.AbsoluteSize)
		end
	}, {
		Scroll = reactModule.createElement(scrollView, {
			BorderSizePixel = 0,
			tag = "size-full",
			testId = "Library.Category.Grid.Scroll",
			onCanvasPositionChanged = var4,
			scrollingFrameRef = p1.scrollingFrameRef,
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.fromScale(1, 0),
				ScrollingDirection = Enum.ScrollingDirection.Y,
				scrollBarVisibility = scrollBarVisibility.None
			}
		}, {
			Content = reactModule.createElement(view, { Size = UDim2.new(1, 0, 0, maxValue) }, {
				Layout = reactModule.createElement("UIGridLayout", {
					CellPadding = UDim2.fromOffset(12, 12),
					CellSize = UDim2.fromOffset(floored, floored_1),
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				Items = reactModule.createElement(reactModule.Fragment, nil, t)
			})
		})
	})
end