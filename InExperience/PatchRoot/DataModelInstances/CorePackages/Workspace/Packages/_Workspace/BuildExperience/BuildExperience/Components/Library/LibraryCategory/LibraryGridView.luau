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
	-- upvalues: foundationModule (ref), reactModule (ref), view (ref), skeleton (ref), radius (ref), libraryTileModule (ref), scrollView (ref), scrollBarVisibility (ref)
	local var1 = foundationModule.Hooks.useTokens()
	local medium = var1.Gap.Medium
	local var2 = foundationModule.Hooks.useScaledValue(180)
	local size1200 = var1.Size.Size_1200
	local var3, var4 = reactModule.useState(Vector2.zero)
	local maxValue = math.max(3, math.ceil((var3.X + medium) / (var2 + medium)))
	local floored = math.floor(math.max(0, var3.X - medium * (maxValue - 1)) / maxValue)
	local var5 = floored + size1200
	local ceiled = math.ceil((if p1.isLoading then maxValue else #p1.items) / maxValue)
	local maxValue_1 = math.max(0, ceiled * var5 + math.max(0, ceiled - 1) * medium)
	local var6 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		if p1.hasMore then
			p1.onLoadMore()
		end
	end, { p1.hasMore, p1.onLoadMore })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var3 (ref), maxValue_1 (ref), var6 (ref)
		if p1.hasMore and var3.Y > 0 and maxValue_1 <= var3.Y then
			var6()
		end
	end, { var3.Y, maxValue_1, p1.hasMore, var6 })
	local var7 = reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref), var5 (ref), var6 (ref)
		if not p1.hasMore or var5 <= 0 then return end
		if p2.AbsoluteCanvasSize.Y - var5 <= p2.CanvasPosition.Y + p2.AbsoluteWindowSize.Y then
			var6()
		end
	end, { var5, p1.hasMore, var6 })
	local t = {}
	
	if p1.isLoading then
		for i = 1, maxValue do
			t[tostring(i)] = reactModule.createElement(view, {
				tag = "col gap-small",
				LayoutOrder = i,
				Size = UDim2.fromOffset(floored, var5),
				testId = `Library.Category.Skeleton.{i}`
			}, {
				Thumbnail = reactModule.createElement(skeleton, {
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 1, -size1200),
					radius = radius.Medium
				}),
				Title = reactModule.createElement(skeleton, {
					LayoutOrder = 2,
					Size = UDim2.new(0.75, 0, 0, var1.Size.Size_500),
					radius = radius.Small
				})
			})
		end
	else
		for i, v in p1.items do
			t[v.tileKey or (v.itemId or v.displayName)] = reactModule.createElement(view, { LayoutOrder = i, Size = UDim2.fromOffset(floored, var5) }, {
				Tile = reactModule.createElement(libraryTileModule, {
					tileKey = v.tileKey,
					itemId = v.itemId,
					itemKind = v.itemKind,
					isFolder = v.isFolder,
					folderPreview = v.folderPreview,
					displayName = v.displayName,
					unavailableText = v.unavailableText,
					thumbnail = v.thumbnail,
					model = v.model,
					onActivated = v.onActivated,
					Size = UDim2.fromScale(1, 1),
					mediaSize = UDim2.new(1, 0, 1, -size1200)
				})
			})
		end
	end
	return reactModule.createElement(view, {
		tag = "size-full",
		testId = "Library.Category.Grid",
		LayoutOrder = p1.LayoutOrder,
		onAbsoluteSizeChanged = function(value)
			-- upvalues: var4 (ref)
			var4(value.AbsoluteSize)
		end
	}, {
		Scroll = reactModule.createElement(scrollView, {
			BorderSizePixel = 0,
			tag = "size-full",
			testId = "Library.Category.Grid.Scroll",
			onCanvasPositionChanged = var7,
			scrollingFrameRef = p1.scrollingFrameRef,
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.new(1, 0, 0, maxValue_1),
				ScrollingDirection = Enum.ScrollingDirection.Y,
				scrollBarVisibility = scrollBarVisibility.None
			}
		}, {
			Layout = reactModule.createElement("UIGridLayout", {
				CellPadding = UDim2.fromOffset(medium, medium),
				CellSize = UDim2.fromOffset(floored, var5),
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			Items = reactModule.createElement(reactModule.Fragment, nil, t)
		})
	})
end