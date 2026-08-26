local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local roactModule = require(parent_1.Roact)
local tModule = require(parent_1.t)
local springAnimatedItemModule = require(parent.Utility.SpringAnimatedItem)
local t = { dampingRatio = 1, frequency = 3.5 }
local accordionView = roactModule.PureComponent:extend("AccordionView")
accordionView.validateProps = tModule.strictInterface({
	items = tModule.table,
	itemWidth = tModule.number,
	itemHeight = tModule.number,
	renderItem = tModule.callback,
	placeholderColor = tModule.Color3,
	placeholderBaseTransparency = tModule.number,
	collapseButtonSize = tModule.number,
	renderCollapseButton = tModule.callback,
	LayoutOrder = tModule.optional(tModule.integer),
	maxItemsInCompactView = tModule.numberPositive,
	onExpand = tModule.optional(tModule.callback),
	onCollapse = tModule.optional(tModule.callback)
})
accordionView.defaultProps = { maxItemsInCompactView = 3 }

function accordionView.init(p1)
	-- upvalues: roactModule (ref)
	p1.state = { expanded = false, isExpandButtonPressed = false }
	
	function p0.onExpandButtonActivated()
		-- upvalues: p1 (ref)
		if p1.props.onExpand then
			p1.props.onExpand()
		end
		p1:setState({ expanded = true, isExpandButtonPressed = false })
	end
	
	function p0.onCollapseButtonActivated()
		-- upvalues: p1 (ref)
		if p1.props.onCollapse then
			p1.props.onCollapse()
		end
		p1:setState({ expanded = false })
	end
	
	function p0.onExpandButtonInputBegan(_, p2)
		-- upvalues: p1 (ref)
		if p2.UserInputState == Enum.UserInputState.Begin and (p2.UserInputType == Enum.UserInputType.Touch or p2.UserInputType == Enum.UserInputType.MouseButton1) then
			p1:setState({ isExpandButtonPressed = true })
		end
	end
	
	function p0.onExpandButtonInputEnded()
		-- upvalues: p1 (ref)
		if p1.state.isExpandButtonPressed then
			p1:setState({ isExpandButtonPressed = false })
		end
	end
	
	p1.rootFrameRef = roactModule.createRef()
	
	function p0.onListLayoutAbsoluteContentSizeChanged(p2)
		-- upvalues: p1 (ref)
		if p1.rootFrameRef.current then
			p1.rootFrameRef.current.Size = UDim2.new(0, p1.props.itemWidth, 0, math.max(p2.AbsoluteContentSize.Y, p1:getCompactTotalHeight()))
		end
	end
end

function accordionView.getCompactTotalHeight(p1)
	local itemsCount = #p1.props.items
	
	return if itemsCount == 0 then 0 else p1.props.itemHeight + (math.min(p1.props.maxItemsInCompactView, itemsCount) - 1) * 10
end

function accordionView.getLayoutInfo(p1)
	local items = p1.props.items
	local itemWidth = p1.props.itemWidth
	local itemHeight = p1.props.itemHeight
	local placeholderBaseTransparency = p1.props.placeholderBaseTransparency
	local maxItemsInCompactView = p1.props.maxItemsInCompactView
	local expanded = p1.state.expanded
	local t = {}
	local itemsCount = #items
	local minValue = math.min(maxItemsInCompactView, itemsCount)
	local var1 = if minValue > 1 then (1 - placeholderBaseTransparency) / (minValue - 1) else 0
	
	for i = 1, itemsCount do
		if expanded then
			t[i] = {
				placeholderTransparency = 1,
				itemTransparency = 0,
				width = itemWidth,
				height = itemHeight
			}
			continue
		end
		if i == 1 then
			t[i] = {
				placeholderTransparency = 1,
				itemTransparency = 0,
				width = itemWidth,
				height = itemHeight
			}
		elseif i <= maxItemsInCompactView then
			t[i] = {
				height = 10,
				itemTransparency = 1,
				width = itemWidth - (i - 1) * 20,
				placeholderTransparency = placeholderBaseTransparency + var1 * (i - 2)
			}
		else
			t[i] = {
				height = 0,
				placeholderTransparency = 1,
				itemTransparency = 1,
				width = itemWidth - (i - 1) * 20
			}
		end
	end
	return t
end

function accordionView.render(p2)
	-- upvalues: roactModule (ref), springAnimatedItemModule (ref), t (ref)
	local items = p2.props.items
	local itemsCount = #items
	
	if itemsCount == 0 then
		return nil
	end
	local layoutOrder = p2.props.LayoutOrder
	local itemWidth = p2.props.itemWidth
	local renderItem = p2.props.renderItem
	local placeholderColor = p2.props.placeholderColor
	local collapseButtonSize = p2.props.collapseButtonSize
	local renderCollapseButton = p2.props.renderCollapseButton
	local expanded = p2.state.expanded
	local layoutInfo = p2:getLayoutInfo()
	local t_1 = {
		Layout = roactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, if expanded then 10 else 0),
			[roactModule.Change.AbsoluteContentSize] = p2.onListLayoutAbsoluteContentSizeChanged
		}),
		Scaler = roactModule.createElement(springAnimatedItemModule.AnimatedUIScale, {
			springOptions = t,
			animatedValues = {
				scale = if p2.state.isExpandButtonPressed then 0.9 else 1
			},
			mapValuesToProps = function(p3)
				return { Scale = p3.scale }
			end
		}),
		CollapseButton = roactModule.createElement(springAnimatedItemModule.AnimatedFrame, {
			springOptions = t,
			animatedValues = {
				sizeOffsetY = if expanded then collapseButtonSize + 1 else 0
			},
			mapValuesToProps = function(p3)
				-- upvalues: collapseButtonSize (ref)
				return {
					Size = UDim2.new(0, collapseButtonSize, 0, p3.sizeOffsetY)
				}
			end,
			regularProps = {
				BackgroundTransparency = 1,
				ClipsDescendants = true,
				[roactModule.Children] = {
					ButtonMoveContainer = roactModule.createElement(springAnimatedItemModule.AnimatedFrame, {
						springOptions = t,
						animatedValues = {
							positionOffsetY = if expanded then 0 else collapseButtonSize / 2
						},
						mapValuesToProps = function(p3)
							return { Position = UDim2.new(0, 0, 0, p3.positionOffsetY) }
						end,
						regularProps = {
							Size = UDim2.new(0, collapseButtonSize, 0, collapseButtonSize),
							BackgroundTransparency = 1,
							[roactModule.Children] = {
								Button = renderCollapseButton(p2.onCollapseButtonActivated)
							}
						}
					})
				}
			}
		})
	}
	
	for i, v in ipairs(items) do
		local var2 = layoutInfo[i]
		t_1["Item" .. tostring(i)] = roactModule.createElement(springAnimatedItemModule.AnimatedFrame, {
			springOptions = t,
			animatedValues = { width = var2.width, height = var2.height },
			mapValuesToProps = function(p3)
				return { Size = UDim2.new(0, p3.width, 0, p3.height) }
			end,
			regularProps = {
				Size = UDim2.new(1, 0, 0, 0),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = i + 1,
				ZIndex = itemsCount + 1 - i,
				ClipsDescendants = true,
				[roactModule.Children] = {
					Item = renderItem(items[i], var2.itemTransparency, t),
					Placeholder = roactModule.createElement(springAnimatedItemModule.AnimatedFrame, {
						key = "Placeholder",
						springOptions = t,
						animatedValues = { transparency = var2.placeholderTransparency },
						mapValuesToProps = function(p3)
							return { BackgroundTransparency = p3.transparency }
						end,
						regularProps = {
							BorderSizePixel = 0,
							Size = UDim2.new(1, 0, 1, 0),
							BackgroundColor3 = placeholderColor
						}
					})
				}
			}
		})
	end
	return roactModule.createElement("Frame", {
		Size = UDim2.new(0, itemWidth, 0, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = layoutOrder,
		[roactModule.Ref] = p2.rootFrameRef
	}, {
		ContentFrame = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5)
		}, t_1),
		ClickToExpandButton = itemsCount > 1 and not expanded and roactModule.createElement("TextButton", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = itemsCount + 1,
			Text = "",
			[roactModule.Event.Activated] = p2.onExpandButtonActivated,
			[roactModule.Event.InputBegan] = p2.onExpandButtonInputBegan,
			[roactModule.Event.InputEnded] = p2.onExpandButtonInputEnded
		})
	})
end

return accordionView