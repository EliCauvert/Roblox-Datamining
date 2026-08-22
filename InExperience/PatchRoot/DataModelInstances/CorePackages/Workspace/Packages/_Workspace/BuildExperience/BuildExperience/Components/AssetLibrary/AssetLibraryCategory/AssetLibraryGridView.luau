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

return function(value) --[[ line: 34 | named "AssetLibraryGridView" ]]
	-- upvalues: reactModule (ref), view (ref), skeleton (ref), radius (ref), assetLibraryTileModule (ref), scrollView (ref), scrollBarVisibility (ref)
	local var3, var4 = reactModule.useState(Vector2.zero)
	local var5 = reactModule.useRef(nil)
	local clampedValue = math.clamp(math.floor(var3.X / 120), 1, 6)
	local floored = math.floor(math.max(0, var3.X - (clampedValue - 1) * 12) / clampedValue)
	local floored_1 = math.floor(floored * 1.4)
	local ceiled = math.ceil((if value.isLoading then clampedValue else #value.assets) / clampedValue)
	local maxValue = math.max(0, ceiled * floored_1 + math.max(0, ceiled - 1) * 12)
	local var11 = reactModule.useCallback(function() --[[ line: 46 ]]
		-- upvalues: value (ref), var5 (ref)
		if value.hasMore and var5.current ~= #value.assets then
			var5.current = #value.assets
			value.onLoadMore()
		end
	end, { value.assets, value.hasMore, value.onLoadMore })
	reactModule.useEffect(function() --[[ line: 53 ]]
		-- upvalues: value (ref), var3 (ref), maxValue (ref), var11 (ref)
		if value.hasMore and var3.Y > 0 and maxValue <= var3.Y then
			var11()
		end
	end, { var3.Y, maxValue, value.hasMore, var11 })
	local var12 = reactModule.useCallback(function(p0) --[[ line: 59 ]]
		-- upvalues: value (ref), floored_1 (ref), var11 (ref)
		if not value.hasMore or floored_1 <= 0 then return end
		if p0.AbsoluteCanvasSize.Y - floored_1 <= p0.CanvasPosition.Y + p0.AbsoluteWindowSize.Y then
			var11()
		end
	end, { floored_1, value.hasMore, var11 })
	local t = {}
	
	if value.isLoading then
		for i = 1, clampedValue do
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
			t[tostring(v.assetId)] = reactModule.createElement(view, {
				LayoutOrder = i,
				Size = UDim2.fromOffset(floored, floored_1)
			}, {
				Tile = reactModule.createElement(assetLibraryTileModule, {
					subtitle = nil,
					assetId = v.assetId,
					assetType = v.assetType,
					displayName = v.displayName,
					thumbnail = v.thumbnail,
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
		onAbsoluteSizeChanged = function(value) --[[ line: 113 ]]
			-- upvalues: var4 (ref)
			var4(value.AbsoluteSize)
		end
	}, {
		Scroll = reactModule.createElement(scrollView, {
			BorderSizePixel = 0,
			tag = "size-full",
			testId = "AssetLibrary.Category.Grid.Scroll",
			onCanvasPositionChanged = var12,
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