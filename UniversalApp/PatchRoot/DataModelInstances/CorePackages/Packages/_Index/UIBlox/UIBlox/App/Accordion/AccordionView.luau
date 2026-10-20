local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local RoactModule = require(Parent1.Roact)
local TModule = require(Parent1.t)
local SpringAnimatedItemModule = require(Parent.Utility.SpringAnimatedItem)
local SpringOptions = { dampingRatio = 1, frequency = 3.5 }
local AccordionView = RoactModule.PureComponent:extend("AccordionView")
AccordionView.validateProps = TModule.strictInterface({
	items = TModule.table,
	itemWidth = TModule.number,
	itemHeight = TModule.number,
	renderItem = TModule.callback,
	placeholderColor = TModule.Color3,
	placeholderBaseTransparency = TModule.number,
	collapseButtonSize = TModule.number,
	renderCollapseButton = TModule.callback,
	LayoutOrder = TModule.optional(TModule.integer),
	maxItemsInCompactView = TModule.numberPositive,
	onExpand = TModule.optional(TModule.callback),
	onCollapse = TModule.optional(TModule.callback)
})
AccordionView.defaultProps = { maxItemsInCompactView = 3 }

function AccordionView.init(p1)
	-- upvalues: RoactModule (copy)
	p1.state = { expanded = false, isExpandButtonPressed = false }
	
	function p1.onExpandButtonActivated()
		-- upvalues: p1 (copy)
		if p1.props.onExpand then
			p1.props.onExpand()
		end
		p1:setState({ expanded = true, isExpandButtonPressed = false })
	end
	
	function p1.onCollapseButtonActivated()
		-- upvalues: p1 (copy)
		if p1.props.onCollapse then
			p1.props.onCollapse()
		end
		p1:setState({ expanded = false })
	end
	
	function p1:onExpandButtonInputBegan(Input)
		-- upvalues: p1 (copy)
		if Input.UserInputState == Enum.UserInputState.Begin and (Input.UserInputType == Enum.UserInputType.Touch or Input.UserInputType == Enum.UserInputType.MouseButton1) then
			p1:setState({ isExpandButtonPressed = true })
		end
	end
	
	function p1.onExpandButtonInputEnded()
		-- upvalues: p1 (copy)
		if p1.state.isExpandButtonPressed then
			p1:setState({ isExpandButtonPressed = false })
		end
	end
	
	p1.rootFrameRef = RoactModule.createRef()
	
	function p1.onListLayoutAbsoluteContentSizeChanged(p2)
		-- upvalues: p1 (copy)
		if p1.rootFrameRef.current then
			p1.rootFrameRef.current.Size = UDim2.new(0, p1.props.itemWidth, 0, (math.max(p2.AbsoluteContentSize.Y, (p1:getCompactTotalHeight()))))
		end
	end
end

function AccordionView.getCompactTotalHeight(p1): number
	local ItemHeight = p1.props.itemHeight
	local MaxItemsInCompactView: number = p1.props.maxItemsInCompactView
	local CountItems = #p1.props.items
	
	return if CountItems == 0 then 0 else ItemHeight + (math.min(MaxItemsInCompactView, CountItems) - 1) * 10
end

function AccordionView.getLayoutInfo(p1)
	local ItemWidth = p1.props.itemWidth
	local ItemHeight = p1.props.itemHeight
	local PlaceholderBaseTransparency: number = p1.props.placeholderBaseTransparency
	local MaxItemsInCompactView: number = p1.props.maxItemsInCompactView
	local Expanded = p1.state.expanded
	local t = {}
	local CountItems = #p1.props.items
	local Smallest = math.min(MaxItemsInCompactView, CountItems)
	local PlaceholderBaseTransparencyRatio: number = if Smallest > 1 then (1 - PlaceholderBaseTransparency) / (Smallest - 1) else 0
	for i = 1, CountItems do
		if Expanded then
			t[i] = {
				placeholderTransparency = 1,
				itemTransparency = 0,
				width = ItemWidth,
				height = ItemHeight
			}
		elseif i == 1 then
			t[i] = {
				placeholderTransparency = 1,
				itemTransparency = 0,
				width = ItemWidth,
				height = ItemHeight
			}
		elseif i <= MaxItemsInCompactView then
			t[i] = {
				height = 10,
				itemTransparency = 1,
				width = ItemWidth - (i - 1) * 20,
				placeholderTransparency = PlaceholderBaseTransparency + PlaceholderBaseTransparencyRatio * (i - 2)
			}
		else
			t[i] = {
				height = 0,
				placeholderTransparency = 1,
				itemTransparency = 1,
				width = ItemWidth - (i - 1) * 20
			}
		end
	end
	return t
end

function AccordionView.render(p2)
	-- upvalues: RoactModule (copy), SpringAnimatedItemModule (copy), SpringOptions (copy)
	local Items = p2.props.items
	local CountItems = #Items
	
	if CountItems == 0 then
		return nil
	end
	local LayoutOrder = p2.props.LayoutOrder
	local ItemWidth = p2.props.itemWidth
	local RenderItemFunction = p2.props.renderItem
	local PlaceholderColor = p2.props.placeholderColor
	local CollapseButtonSize: number = p2.props.collapseButtonSize
	local Expanded = p2.state.expanded
	local IsExpandButtonPressed = p2.state.isExpandButtonPressed
	local LayoutInfo = p2:getLayoutInfo()
	local config = {
		Layout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, if Expanded then 10 else 0),
			[RoactModule.Change.AbsoluteContentSize] = p2.onListLayoutAbsoluteContentSizeChanged
		}),
		Scaler = RoactModule.createElement(SpringAnimatedItemModule.AnimatedUIScale, {
			springOptions = SpringOptions,
			animatedValues = { scale = if IsExpandButtonPressed then 0.9 else 1 },
			mapValuesToProps = function(p3)
				return { Scale = p3.scale }
			end
		}),
		CollapseButton = RoactModule.createElement(SpringAnimatedItemModule.AnimatedFrame, {
			springOptions = SpringOptions,
			animatedValues = { sizeOffsetY = Expanded and CollapseButtonSize + 1 or 0 },
			mapValuesToProps = function(p3)
				-- upvalues: CollapseButtonSize (copy)
				return {
					Size = UDim2.new(0, CollapseButtonSize, 0, p3.sizeOffsetY)
				}
			end,
			regularProps = {
				BackgroundTransparency = 1,
				ClipsDescendants = true,
				[RoactModule.Children] = {
					ButtonMoveContainer = RoactModule.createElement(SpringAnimatedItemModule.AnimatedFrame, {
						springOptions = SpringOptions,
						animatedValues = {
							positionOffsetY = if Expanded then 0 else CollapseButtonSize / 2
						},
						mapValuesToProps = function(p3)
							return { Position = UDim2.new(0, 0, 0, p3.positionOffsetY) }
						end,
						regularProps = {
							Size = UDim2.new(0, CollapseButtonSize, 0, CollapseButtonSize),
							BackgroundTransparency = 1,
							[RoactModule.Children] = {
								Button = p2.props.renderCollapseButton(p2.onCollapseButtonActivated)
							}
						}
					})
				}
			}
		})
	}
	
	for i, _ in ipairs(Items) do
		local Layout = LayoutInfo[i]
		config["Item" .. tostring(i)] = RoactModule.createElement(SpringAnimatedItemModule.AnimatedFrame, {
			springOptions = SpringOptions,
			animatedValues = { width = Layout.width, height = Layout.height },
			mapValuesToProps = function(p3)
				return { Size = UDim2.new(0, p3.width, 0, p3.height) }
			end,
			regularProps = {
				Size = UDim2.new(1, 0, 0, 0),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = i + 1,
				ZIndex = CountItems + 1 - i,
				ClipsDescendants = true,
				[RoactModule.Children] = {
					Item = RenderItemFunction(Items[i], Layout.itemTransparency, SpringOptions),
					Placeholder = RoactModule.createElement(SpringAnimatedItemModule.AnimatedFrame, {
						key = "Placeholder",
						springOptions = SpringOptions,
						animatedValues = { transparency = Layout.placeholderTransparency },
						mapValuesToProps = function(p3)
							return { BackgroundTransparency = p3.transparency }
						end,
						regularProps = {
							BorderSizePixel = 0,
							Size = UDim2.new(1, 0, 1, 0),
							BackgroundColor3 = PlaceholderColor
						}
					})
				}
			}
		})
	end
	return RoactModule.createElement("Frame", {
		Size = UDim2.new(0, ItemWidth, 0, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = LayoutOrder,
		[RoactModule.Ref] = p2.rootFrameRef
	}, {
		ContentFrame = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5)
		}, config),
		ClickToExpandButton = CountItems > 1 and not Expanded and RoactModule.createElement("TextButton", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = CountItems + 1,
			Text = "",
			[RoactModule.Event.Activated] = p2.onExpandButtonActivated,
			[RoactModule.Event.InputBegan] = p2.onExpandButtonInputBegan,
			[RoactModule.Event.InputEnded] = p2.onExpandButtonInputEnded
		})
	})
end

return AccordionView