local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local assetLibraryTileModule = require(script.Parent.Parent.AssetLibraryTile)
local _ = require(script.Parent.Parent.AssetLibraryTypes)
local scrollView = foundationModule.ScrollView
local skeleton = foundationModule.Skeleton
local view = foundationModule.View
local radius = foundationModule.Enums.Radius
local scrollBarVisibility = foundationModule.Enums.ScrollBarVisibility

return function(value)
	-- upvalues: reactModule (ref), view (ref), skeleton (ref), radius (ref), assetLibraryTileModule (ref), scrollView (ref), scrollBarVisibility (ref)
	local var1, var2 = reactModule.useState(Vector2.zero)
	local var3 = reactModule.useRef(nil)
	local floored = math.floor(math.max(0, var1.X - 24) / 3)
	local floored_1 = math.floor(floored * 1.4)
	local ceiled = math.ceil((if value.isLoading then 3 else #value.assets) / 3)
	local maxValue = math.max(0, ceiled * floored_1 + math.max(0, ceiled - 1) * 12)
	local var4 = reactModule.useCallback(function()
		-- upvalues: value (ref), var3 (ref)
		if value.hasMore and var3.current ~= #value.assets then
			var3.current = #value.assets
			value.onLoadMore()
		end
	end, { value.assets, value.hasMore, value.onLoadMore })
	reactModule.useEffect(function()
		-- upvalues: value (ref), var1 (ref), maxValue (ref), var4 (ref)
		if value.hasMore and var1.Y > 0 and maxValue <= var1.Y then
			var4()
		end
	end, { var1.Y, maxValue, value.hasMore, var4 })
	local var5 = reactModule.useCallback(function(p1)
		-- upvalues: value (ref), floored_1 (ref), var4 (ref)
		if not value.hasMore or floored_1 <= 0 then return end
		if p1.AbsoluteCanvasSize.Y - floored_1 <= p1.CanvasPosition.Y + p1.AbsoluteWindowSize.Y then
			var4()
		end
	end, { floored_1, value.hasMore, var4 })
	local t = {}
	
	if value.isLoading then
		for i = 1, 3 do
			t[tostring(i)] = reactModule.createElement(view, {
				tag = "col gap-small",
				LayoutOrder = i,
				Size = UDim2.fromOffset(floored, floored_1),
				testId = `AssetLibrary.Category.Skeleton.{i}`
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
		for i, v in value.assets do
			t[v.tileKey or tostring(v.assetId)] = reactModule.createElement(view, {
				LayoutOrder = i,
				Size = UDim2.fromOffset(floored, floored_1)
			}, {
				Tile = reactModule.createElement(assetLibraryTileModule, {
					subtitle = nil,
					tileKey = v.tileKey,
					assetId = v.assetId,
					assetType = v.assetType,
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
		testId = "AssetLibrary.Category.Grid",
		LayoutOrder = value.LayoutOrder,
		onAbsoluteSizeChanged = function(value)
			-- upvalues: var2 (ref)
			var2(value.AbsoluteSize)
		end
	}, {
		Scroll = reactModule.createElement(scrollView, {
			BorderSizePixel = 0,
			tag = "size-full",
			testId = "AssetLibrary.Category.Grid.Scroll",
			onCanvasPositionChanged = var5,
			scrollingFrameRef = value.scrollingFrameRef,
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