-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:50 2026 Pacific Standard Time.

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

function accordionView.init(p0) --[[ line: 48 ]]
	-- upvalues: roactModule (ref)
	p0.state = { expanded = false, isExpandButtonPressed = false }
	
	function p0.onExpandButtonActivated() --[[ line: 54 ]]
		-- upvalues: p0 (ref)
		if p0.props.onExpand then
			p0.props.onExpand()
		end
		p0:setState({ expanded = true, isExpandButtonPressed = false })
	end
	
	function p0.onCollapseButtonActivated() --[[ line: 64 ]]
		-- upvalues: p0 (ref)
		if p0.props.onCollapse then
			p0.props.onCollapse()
		end
		p0:setState({ expanded = false })
	end
	
	function p0.onExpandButtonInputBegan(_, p1) --[[ line: 73 ]]
		-- upvalues: p0 (ref)
		if p1.UserInputState == Enum.UserInputState.Begin and (p1.UserInputType == Enum.UserInputType.Touch or p1.UserInputType == Enum.UserInputType.MouseButton1) then
			p0:setState({ isExpandButtonPressed = true })
		end
	end
	
	function p0.onExpandButtonInputEnded() --[[ line: 87 ]]
		-- upvalues: p0 (ref)
		if p0.state.isExpandButtonPressed then
			p0:setState({ isExpandButtonPressed = false })
		end
	end
	
	p0.rootFrameRef = roactModule.createRef()
	
	function p0.onListLayoutAbsoluteContentSizeChanged(p2) --[[ line: 97 ]]
		-- upvalues: p0 (ref)
		if p0.rootFrameRef.current then
			p0.rootFrameRef.current.Size = UDim2.new(0, p0.props.itemWidth, 0, math.max(p2.AbsoluteContentSize.Y, p0:getCompactTotalHeight()))
		end
	end
end

function accordionView.getCompactTotalHeight(p3) --[[ line: 108 ]]
	local itemsCount = #p3.props.items
	
	return if itemsCount == 0 then 0 else p3.props.itemHeight + (math.min(p3.props.maxItemsInCompactView, itemsCount) - 1) * 10
end

function accordionView.getLayoutInfo(p4) --[[ line: 121 ]]
	local items = p4.props.items
	local itemWidth = p4.props.itemWidth
	local itemHeight = p4.props.itemHeight
	local placeholderBaseTransparency = p4.props.placeholderBaseTransparency
	local maxItemsInCompactView = p4.props.maxItemsInCompactView
	local expanded = p4.state.expanded
	local t = {}
	local itemsCount = #items
	local minValue = math.min(maxItemsInCompactView, itemsCount)
	local var9 = if minValue > 1 then (1 - placeholderBaseTransparency) / (minValue - 1) else 0
	
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
				placeholderTransparency = placeholderBaseTransparency + var9 * (i - 2)
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

function accordionView.render(p5) --[[ line: 175 ]]
	-- upvalues: roactModule (ref), springAnimatedItemModule (ref), t (ref)
	local items = p5.props.items
	local itemsCount = #items
	
	if itemsCount == 0 then
		return nil
	end
	local layoutOrder = p5.props.LayoutOrder
	local itemWidth = p5.props.itemWidth
	local renderItem = p5.props.renderItem
	local placeholderColor = p5.props.placeholderColor
	local collapseButtonSize = p5.props.collapseButtonSize
	local renderCollapseButton = p5.props.renderCollapseButton
	local expanded = p5.state.expanded
	local layoutInfo = p5:getLayoutInfo()
	local t_1 = {
		Layout = roactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, if expanded then 10 else 0),
			[roactModule.Change.AbsoluteContentSize] = p5.onListLayoutAbsoluteContentSizeChanged
		}),
		Scaler = roactModule.createElement(springAnimatedItemModule.AnimatedUIScale, {
			springOptions = t,
			animatedValues = {
				scale = if p5.state.isExpandButtonPressed then 0.9 else 1
			},
			mapValuesToProps = function(p6) --[[ line: 208 ]]
				return { Scale = p6.scale }
			end
		}),
		CollapseButton = roactModule.createElement(springAnimatedItemModule.AnimatedFrame, {
			springOptions = t,
			animatedValues = {
				sizeOffsetY = if expanded then collapseButtonSize + 1 else 0
			},
			mapValuesToProps = function(p7) --[[ line: 221 ]]
				-- upvalues: collapseButtonSize (ref)
				return {
					Size = UDim2.new(0, collapseButtonSize, 0, p7.sizeOffsetY)
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
						mapValuesToProps = function(p8) --[[ line: 235 ]]
							return { Position = UDim2.new(0, 0, 0, p8.positionOffsetY) }
						end,
						regularProps = {
							Size = UDim2.new(0, collapseButtonSize, 0, collapseButtonSize),
							BackgroundTransparency = 1,
							[roactModule.Children] = {
								Button = renderCollapseButton(p5.onCollapseButtonActivated)
							}
						}
					})
				}
			}
		})
	}
	
	for i, v in ipairs(items) do
		local var13 = layoutInfo[i]
		t_1["Item" .. tostring(i)] = roactModule.createElement(springAnimatedItemModule.AnimatedFrame, {
			springOptions = t,
			animatedValues = { width = var13.width, height = var13.height },
			mapValuesToProps = function(p9) --[[ line: 262 ]]
				return { Size = UDim2.new(0, p9.width, 0, p9.height) }
			end,
			regularProps = {
				Size = UDim2.new(1, 0, 0, 0),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = i + 1,
				ZIndex = itemsCount + 1 - i,
				ClipsDescendants = true,
				[roactModule.Children] = {
					Item = renderItem(items[i], var13.itemTransparency, t),
					Placeholder = roactModule.createElement(springAnimatedItemModule.AnimatedFrame, {
						key = "Placeholder",
						springOptions = t,
						animatedValues = { transparency = var13.placeholderTransparency },
						mapValuesToProps = function(p10) --[[ line: 282 ]]
							return { BackgroundTransparency = p10.transparency }
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
		[roactModule.Ref] = p5.rootFrameRef
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
			[roactModule.Event.Activated] = p5.onExpandButtonActivated,
			[roactModule.Event.InputBegan] = p5.onExpandButtonInputBegan,
			[roactModule.Event.InputEnded] = p5.onExpandButtonInputEnded
		})
	})
end

return accordionView