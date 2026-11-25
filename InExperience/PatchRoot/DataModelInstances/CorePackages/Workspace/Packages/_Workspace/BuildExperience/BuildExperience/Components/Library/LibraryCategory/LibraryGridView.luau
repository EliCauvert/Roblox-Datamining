local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local LibraryTileModule = require(script.Parent.Parent.LibraryTile)
local _ = require(script.Parent.Parent.LibraryTypes)
local UseHardwareInsetsModule = require(BuildExperience.Components.ChatSheet.useHardwareInsets)
local ScrollView = FoundationModule.ScrollView
local Skeleton = FoundationModule.Skeleton
local View = FoundationModule.View
local Radius = FoundationModule.Enums.Radius
local ScrollBarVisibility = FoundationModule.Enums.ScrollBarVisibility

return function(Frame)
	-- upvalues: FoundationModule (copy), UseHardwareInsetsModule (copy), ReactModule (copy), View (copy), Skeleton (copy), Radius (copy), LibraryTileModule (copy), ScrollView (copy), ScrollBarVisibility (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local Bottom = UseHardwareInsetsModule().bottom
	local Medium = UseTokensResult.Gap.Medium
	local UseScaledValueResult = FoundationModule.Hooks.useScaledValue(180)
	local Size1200: number = UseTokensResult.Size.Size_1200
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.zero)
	local Largest = math.max(3, (math.ceil((UseStateResult.X + Medium) / (UseScaledValueResult + Medium))))
	local Floored = math.floor(math.max(0, UseStateResult.X - Medium * (Largest - 1)) / Largest)
	local YOffset = Floored + Size1200
	local Ceiled = math.ceil((if Frame.isLoading then Largest else #Frame.items) / Largest)
	local Largest1 = math.max(0, Ceiled * YOffset + math.max(0, Ceiled - 1) * Medium)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: Frame (copy)
		if Frame.hasMore then
			Frame.onLoadMore()
		end
	end, { Frame.hasMore, Frame.onLoadMore })
	ReactModule.useEffect(function()
		-- upvalues: Frame (copy), UseStateResult (copy), Largest1 (copy), UseResult (copy)
		if Frame.hasMore and UseStateResult.Y > 0 and Largest1 <= UseStateResult.Y then
			UseResult()
		end
	end, { UseStateResult.Y, Largest1, Frame.hasMore, UseResult })
	local UseResult1 = ReactModule.useCallback(function(ScrollFrame)
		-- upvalues: Frame (copy), YOffset (copy), UseResult (copy)
		if not Frame.hasMore or YOffset <= 0 then return end
		if ScrollFrame.AbsoluteCanvasSize.Y - YOffset <= ScrollFrame.CanvasPosition.Y + ScrollFrame.AbsoluteWindowSize.Y then
			UseResult()
		end
	end, { YOffset, Frame.hasMore, UseResult })
	local Elements = {}
	
	if Frame.isLoading then
		for i = 1, Largest do
			Elements[tostring(i)] = ReactModule.createElement(View, {
				tag = "col gap-small",
				LayoutOrder = i,
				Size = UDim2.fromOffset(Floored, YOffset),
				testId = `Library.Category.Skeleton.{i}`
			}, {
				Thumbnail = ReactModule.createElement(Skeleton, {
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 1, -Size1200),
					radius = Radius.Medium
				}),
				Title = ReactModule.createElement(Skeleton, {
					LayoutOrder = 2,
					Size = UDim2.new(0.75, 0, 0, UseTokensResult.Size.Size_500),
					radius = Radius.Small
				})
			})
		end
	else
		for LayoutOrder, item in Frame.items do
			Elements[item.tileKey or (item.itemId or item.displayName)] = ReactModule.createElement(View, {
				LayoutOrder = LayoutOrder,
				Size = UDim2.fromOffset(Floored, YOffset)
			}, {
				Tile = ReactModule.createElement(LibraryTileModule, {
					tileKey = item.tileKey,
					itemId = item.itemId,
					itemKind = item.itemKind,
					isFolder = item.isFolder,
					folderPreview = item.folderPreview,
					displayName = item.displayName,
					unavailableText = item.unavailableText,
					thumbnail = item.thumbnail,
					model = item.model,
					onActivated = item.onActivated,
					Size = UDim2.fromScale(1, 1),
					mediaSize = UDim2.new(1, 0, 1, -Size1200)
				})
			})
		end
	end
	return ReactModule.createElement(View, {
		tag = "size-full",
		testId = "Library.Category.Grid",
		LayoutOrder = Frame.LayoutOrder,
		onAbsoluteSizeChanged = function(Frame)
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(Frame.AbsoluteSize)
		end
	}, {
		Scroll = ReactModule.createElement(ScrollView, {
			BorderSizePixel = 0,
			tag = "size-full",
			testId = "Library.Category.Grid.Scroll",
			onCanvasPositionChanged = UseResult1,
			scrollingFrameRef = Frame.scrollingFrameRef,
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.new(1, 0, 0, Largest1),
				ScrollingDirection = Enum.ScrollingDirection.Y,
				scrollBarVisibility = ScrollBarVisibility.None
			}
		}, {
			Content = ReactModule.createElement(View, {
				tag = "size-full-0 auto-y",
				testId = "Library.Category.Grid.Content",
				padding = { bottom = UDim.new(0, Bottom) }
			}, {
				Layout = ReactModule.createElement("UIGridLayout", {
					CellPadding = UDim2.fromOffset(Medium, Medium),
					CellSize = UDim2.fromOffset(Floored, YOffset),
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				Items = ReactModule.createElement(ReactModule.Fragment, nil, Elements)
			})
		})
	})
end