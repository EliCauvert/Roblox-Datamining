local Parent = script:FindFirstAncestor("MomentsCommon").Parent
local DashModule = require(Parent.Dash)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Button = FoundationModule.Button
local ScrollBarVisibility = FoundationModule.Enums.ScrollBarVisibility
local ScrollView = FoundationModule.ScrollView
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens

local function GridItems(Frame)
	-- upvalues: ReactModule (copy), View (copy)
	local Elements = {}
	
	for Key, item in Frame.items do
		Elements[Key] = ReactModule.createElement(View, {
			key = Key,
			LayoutOrder = Key,
			Size = UDim2.fromOffset(Frame.itemSize.X, Frame.itemSize.Y)
		}, { Content = Frame.renderItem(item, Key) })
	end
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y",
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = Frame.LayoutOrder
	}, {
		UIGridLayout = ReactModule.createElement("UIGridLayout", {
			CellPadding = UDim2.fromOffset(Frame.itemPadding.X, Frame.itemPadding.Y),
			CellSize = UDim2.fromOffset(Frame.itemSize.X, Frame.itemSize.Y),
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Children = ReactModule.createElement(ReactModule.Fragment, nil, Elements)
	})
end

return function(p1)
	-- upvalues: ReactModule (copy), UseTokensFunction (copy), DashModule (copy), View (copy), ScrollView (copy), ScrollBarVisibility (copy), GridItems (copy), Button (copy), FoundationModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.new(0, 0))
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(0)
	local UseTokensResult = UseTokensFunction()
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(Frame.AbsoluteSize)
	end, {})
	local UseMemoResult = ReactModule.useMemo(function(): number
		-- upvalues: UseStateResult (copy), p1 (copy)
		return (math.clamp(math.floor(UseStateResult.X / p1.itemConfig.minItemWidth), 1, p1.itemConfig.maxItemsPerRow))
	end, { UseStateResult, p1.itemConfig })
	local UseMemoResult1 = ReactModule.useMemo(function(): Vector2
		-- upvalues: UseStateResult (copy), p1 (copy), UseMemoResult (copy)
		local XDelta = UseStateResult.X - p1.itemConfig.padding * (UseMemoResult - 1)
		local Smallest = math.min(XDelta / UseMemoResult, XDelta)
		
		return Vector2.new(math.floor(Smallest), (math.floor(Smallest * p1.aspectRatio)))
	end, {
		UseStateResult,
		UseMemoResult,
		p1.aspectRatio,
		p1.itemConfig
	})
	local UseMemoResult2 = ReactModule.useMemo(function(): number
		-- upvalues: UseStateResult (copy), UseMemoResult1 (copy), UseMemoResult (copy), p1 (copy)
		return if UseStateResult.Y <= 0 then 0 else math.max(math.floor(UseStateResult.Y / UseMemoResult1.Y) * UseMemoResult, p1.itemConfig.minItemsPerPage)
	end, {
		UseStateResult,
		UseMemoResult1,
		UseMemoResult,
		p1.itemConfig
	})
	local IsYAbove: boolean = UseStateResult.X > 0 and UseStateResult.Y > 0
	local ShouldShowShowMoreButton = p1.shouldShowShowMoreButton or UseStateResult1 < #p1.items
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult1 (copy), UseMemoResult2 (copy), UseStateResult2_1 (copy)
		if UseStateResult1 < UseMemoResult2 then
			UseStateResult2_1(UseMemoResult2)
		end
	end, { UseStateResult, UseMemoResult2, UseStateResult1 })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult1 (copy), UseMemoResult2 (copy), p1 (copy), UseStateResult2_1 (copy)
		if #p1.items < UseStateResult1 + UseMemoResult2 and p1.shouldShowShowMoreButton then
			p1.onShowMoreCallback()
		end
		UseStateResult2_1(UseStateResult1 + UseMemoResult2)
	end, {
		UseStateResult1,
		UseMemoResult2,
		p1.items,
		p1.onShowMoreCallback,
		p1.shouldShowShowMoreButton
	})
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: ShouldShowShowMoreButton (copy), p1 (copy), UseStateResult1 (copy), DashModule (upval)
		return if ShouldShowShowMoreButton then DashModule.slice(p1.items, 1, (math.min(#p1.items, UseStateResult1))) else p1.items
	end, { p1.items, ShouldShowShowMoreButton, UseStateResult1 })
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), ShouldShowShowMoreButton (copy), UseStateResult (copy), UseMemoResult1 (copy), UseMemoResult (copy), UseStateResult1 (copy), UseMemoResult3 (copy), UseResult1 (copy)
		if not p1.enableInfiniteScroll or not ShouldShowShowMoreButton then return end
		if UseStateResult.Y <= 0 or UseMemoResult1.Y <= 0 or UseMemoResult <= 0 then return end
		if #p1.items < UseStateResult1 then return end
		if math.ceil(#UseMemoResult3 / UseMemoResult) * UseMemoResult1.Y <= UseStateResult.Y then
			UseResult1()
		end
	end, {
		UseStateResult, UseMemoResult3, ShouldShowShowMoreButton,
		p1.enableInfiniteScroll, p1.items, UseMemoResult, UseMemoResult1, UseResult1
	})
	local UseResult2 = ReactModule.useCallback(function(ScrollFrame)
		-- upvalues: ShouldShowShowMoreButton (copy), UseMemoResult1 (copy), UseResult1 (copy)
		if not ShouldShowShowMoreButton then return end
		if ScrollFrame.AbsoluteCanvasSize.Y - UseMemoResult1.Y <= ScrollFrame.CanvasPosition.Y + ScrollFrame.AbsoluteSize.Y then
			UseResult1()
		end
	end, { ShouldShowShowMoreButton, UseResult1, UseMemoResult1 })
	
	return if p1.items == nil or #p1.items == 0 then ReactModule.createElement(View, {
		tag = "shrink size-full",
		onAbsoluteSizeChanged = UseResult
	}, { EmptyState = p1.renderEmptyState() }) else ReactModule.createElement(View, {
		tag = "shrink size-full",
		onAbsoluteSizeChanged = UseResult
	}, {
		GridViewContainer = ReactModule.createElement(View, { tag = "size-full" }, {
			ScrollView = ReactModule.createElement(ScrollView, {
				BorderSizePixel = 0,
				tag = "size-full",
				layout = {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Top,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, UseTokensResult.Padding.Large)
				},
				LayoutOrder = if p1.layoutOrder then p1.layoutOrder else 1,
				onCanvasPositionChanged = if p1.enableInfiniteScroll then UseResult2 else nil,
				scroll = {
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.fromScale(1, 0),
					ScrollingDirection = Enum.ScrollingDirection.Y,
					scrollBarVisibility = ScrollBarVisibility.None
				},
				padding = p1.padding
			}, {
				GridView = if #p1.items > 0 and IsYAbove then ReactModule.createElement(GridItems, {
					LayoutOrder = 1,
					itemPadding = Vector2.new(p1.itemConfig.padding, p1.itemConfig.padding),
					items = UseMemoResult3,
					itemsPerRow = UseMemoResult,
					itemSize = UseMemoResult1,
					renderItem = p1.renderItem
				}) else nil,
				ShowMore = if ShouldShowShowMoreButton and not p1.enableInfiniteScroll then ReactModule.createElement(Button, {
					LayoutOrder = 2,
					onActivated = UseResult1,
					size = FoundationModule.Enums.InputSize.Small,
					text = p1.showMoreButtonText
				}) else nil,
				Footer = if ShouldShowShowMoreButton or p1.footer == nil or UseMemoResult2 >= #p1.items then nil else ReactModule.createElement(View, {
					LayoutOrder = 3,
					tag = "size-full-0 auto-y align-x-center align-y-center"
				}, { Content = p1.footer })
			})
		})
	})
end