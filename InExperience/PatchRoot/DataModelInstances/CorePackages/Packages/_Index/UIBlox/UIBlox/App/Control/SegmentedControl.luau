local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local core = parent.Core
local roactModule = require(parent_1.Roact)
local tModule = require(parent_1.t)
local cryoModule = require(parent_1.Cryo)
local withStyleModule = require(parent.Core.Style.withStyle)
local otterModule = require(parent_1.Otter)
local imagesModule = require(parent.App.ImageSet.Images)
local roactGamepadModule = require(parent_1.RoactGamepad)
local controlStateModule = require(core.Control.Enum.ControlState)
local segmentedControlTabNameModule = require(script.Parent.SegmentedControlTabName)
local imageSetComponentModule = require(core.ImageSet.ImageSetComponent)
local getContentStyleModule = require(core.Button.getContentStyle)
local getTextSizeModule = require(parent.Core.Text.GetTextSize)
local var1 = require(parent.App.ImageSet.getIconSize)(require(parent.App.ImageSet.Enum.IconSize).Medium)
local t = { frequency = 10, dampingRatio = 1 }
local circle17 = imagesModule["component_assets/circle_17"]
local t_1 = { [controlStateModule.Default] = "BackgroundUIDefault" }
local t_2 = { [controlStateModule.Default] = "Divider" }
local t_3 = { [controlStateModule.Default] = "UIEmphasis" }
local t_4 = {
	[controlStateModule.Default] = "SecondaryDefault",
	[controlStateModule.Hover] = "SecondaryOnHover"
}
local segmentedControl = roactModule.Component:extend("SegmentedControl")
segmentedControl.validateProps = tModule.strictInterface({
	tabs = function(p1)
		-- upvalues: tModule (ref)
		local var2, var3 = tModule.array(tModule.strictInterface({
			tabName = tModule.string,
			isDisabled = tModule.optional(tModule.boolean),
			icon = tModule.optional(tModule.table)
		}))(p1)
		
		if not var2 then
			return var2, var3
		end
		local var4, var5 = tModule.numberMin(2)(#p1)
		
		if not var4 then
			return var4, var5
		end
		local var6, var7 = tModule.numberMax(4)(#p1)
		
		if var6 then
			return true
		end
		return var6, var7
	end,
	width = tModule.UDim,
	height = tModule.optional(tModule.number),
	maxWidth = tModule.optional(tModule.number),
	selectedTabIndex = tModule.number,
	onTabActivated = tModule.callback,
	NextSelectionLeft = tModule.optional(tModule.table),
	NextSelectionRight = tModule.optional(tModule.table),
	NextSelectionUp = tModule.optional(tModule.table),
	NextSelectionDown = tModule.optional(tModule.table),
	layoutOrder = tModule.optional(tModule.number)
})
segmentedControl.defaultProps = { height = 44 }

function segmentedControl.init(p1)
	-- upvalues: roactModule (ref), roactGamepadModule (ref), otterModule (ref), t (ref)
	p1.rootRef = roactModule.createRef()
	p1.tabRefs = roactGamepadModule.createRefCache()
	local var2, var3 = roactModule.createBinding(0)
	p1.selectedBackgroundPositionX = var2
	p1.setSelectedBackgroundPositionX = var3
	p1.selectedBackgroundMotor = otterModule.createSingleMotor(4)
	p1.selectedBackgroundMotor:onStep(function(p2)
		-- upvalues: p1 (ref)
		p1.setSelectedBackgroundPositionX(p2)
	end)
	p1:setState({ tabWidth = 0, computedMinFrameWidth = 0 })
	
	function p1.onTabActivated(p2)
		-- upvalues: p1 (ref)
		p1.props.onTabActivated(p2)
	end
	
	function p1.setSize(p2)
		-- upvalues: p1 (ref), otterModule (copy), t (copy)
		local floored = math.floor((math.max(p2.AbsoluteSize.X, p1.state.computedMinFrameWidth) - 8) / #p1.props.tabs)
		p1.selectedBackgroundMotor:setGoal(otterModule.spring(4 + floored * (p1.props.selectedTabIndex - 1), t))
		p1:setState({ tabWidth = floored })
	end
end

function segmentedControl.render(p1)
	-- upvalues: withStyleModule (ref), controlStateModule (ref), getContentStyleModule (ref), t_1 (ref), t_2 (ref), t_3 (ref), var1 (ref), getTextSizeModule (ref), roactModule (ref), roactGamepadModule (ref), cryoModule (ref), segmentedControlTabNameModule (ref), t_4 (ref), imageSetComponentModule (ref), circle17 (ref)
	return withStyleModule(function(p2)
		-- upvalues: p1 (ref), controlStateModule (copy), getContentStyleModule (copy), t_1 (copy), t_2 (copy), t_3 (copy), var1 (copy), getTextSizeModule (copy), roactModule (copy), roactGamepadModule (copy), cryoModule (copy), segmentedControlTabNameModule (copy), t_4 (copy), imageSetComponentModule (copy), circle17 (copy)
		local controlState = p1.state.controlState
		local tabsCount = #p1.props.tabs
		local var2 = if p1.props.tabs[p1.props.selectedTabIndex].isDisabled then controlStateModule.Disabled else controlState
		local var3 = getContentStyleModule(t_1, controlState, p2)
		local var4 = getContentStyleModule(t_2, controlState, p2)
		local var5 = getContentStyleModule(t_3, var2, p2)
		local tabWidth = p1.state.tabWidth
		local var6 = if p1.props.icon then var1 else 0
		local height = p1.props.height
		local var7 = p1.props.height - 12
		local var8 = p1.props.height - 16
		local var9 = p2.Font.Header2.RelativeSize * p2.Font.BaseSize
		
		if p1.state.computedMinFrameWidth == 0 then
			local var10 = 0
			
			for i = 1, tabsCount do
				var10 = math.max(var10, getTextSizeModule(p1.props.tabs[i].tabName, var9, Enum.Font.BuilderSans, Vector2.new(1e999, 1e999)).X)
			end
			local var11 = (var6 + (var10 + 8)) * tabsCount + 8
			p1:setState({
				computedMinFrameWidth = if p1.props.maxWidth then math.min(var11, p1.props.maxWidth) else math.max(var11, (var6 + 80) * tabsCount + 8)
			})
		end
		local t = {}
		
		for i_1 = 1, tabsCount - 1 do
			if i_1 ~= p1.props.selectedTabIndex and i_1 ~= p1.props.selectedTabIndex - 1 then
				table.insert(t, i_1, roactModule.createElement("Frame", {
					Size = UDim2.fromOffset(1, var8),
					BackgroundTransparency = var4.Transparency,
					BackgroundColor3 = var4.Color,
					Position = UDim2.fromOffset(4 + tabWidth * i_1, (height - var8) / 2)
				}))
			end
		end
		return roactGamepadModule.withFocusController(function(p3)
			-- upvalues: p1 (copy), tabsCount (ref), cryoModule (copy), roactModule (copy), roactGamepadModule (copy), tabWidth (ref), height (ref), segmentedControlTabNameModule (copy), t_4 (copy), imageSetComponentModule (copy), var7 (ref), circle17 (copy), var3 (ref), t (ref), var8 (ref), var5 (ref)
			local _ = function(p4)
				-- upvalues: p3 (ref), p1 (copy)
				if p4 > 1 then
					p3.moveFocusTo(p1.tabRefs[p4 - 1])
				end
			end
			
			local _ = function(p4)
				-- upvalues: tabsCount (copy), p3 (ref), p1 (copy)
				if p4 < tabsCount then
					p3.moveFocusTo(p1.tabRefs[p4 + 1])
				end
			end
			
			local var12 = function()
				-- upvalues: p3 (ref), p1 (copy)
				p3.moveFocusTo(p1.rootRef)
			end
			
			return roactModule.createElement("Frame", {
				Size = UDim2.new(p1.props.width.Scale, p1.props.width.Offset, 0, height),
				BackgroundTransparency = 1,
				[roactModule.Change.AbsoluteSize] = p1.setSize,
				LayoutOrder = p1.props.layoutOrder
			}, {
				SizeConstraint = roactModule.createElement("UISizeConstraint", {
					MinSize = Vector2.new(p1.state.computedMinFrameWidth, height),
					MaxSize = Vector2.new(640, height)
				}),
				Background = roactModule.createElement(imageSetComponentModule.Label, {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					ZIndex = 1,
					Size = UDim2.new(1, 0, 0, var7),
					Position = UDim2.fromOffset(0, (height - var7) / 2),
					Image = circle17,
					ImageColor3 = var3.Color,
					ImageTransparency = var3.Transparency,
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = Rect.new(8, 8, 9, 9)
				}),
				Dividers = roactModule.createElement(roactGamepadModule.Focusable.Frame, {
					Size = UDim2.new(1, 0, 0, height),
					Position = UDim2.fromOffset(0, 0),
					BackgroundTransparency = 1,
					ZIndex = 2,
					NextSelectionLeft = p1.props.NextSelectionLeft,
					NextSelectionRight = p1.props.NextSelectionRight,
					NextSelectionUp = p1.props.NextSelectionUp,
					NextSelectionDown = p1.props.NextSelectionDown,
					[roactModule.Ref] = p1.rootRef,
					inputBindings = {
						Enter = roactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonA, function()
							-- upvalues: p3 (ref), p1 (copy)
							p3.moveFocusTo(p1.tabRefs[p1.props.selectedTabIndex])
						end)
					}
				}, t),
				SelectedBackground = roactModule.createElement(imageSetComponentModule.Label, {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					ZIndex = 4,
					Size = UDim2.fromOffset(tabWidth, var8),
					Position = p1.selectedBackgroundPositionX:map(function(p4)
						-- upvalues: height (copy), var8 (copy)
						return UDim2.fromOffset(p4, (height - var8) / 2)
					end),
					Image = circle17,
					ImageColor3 = var5.Color,
					ImageTransparency = var5.Transparency,
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = Rect.new(8, 8, 9, 9)
				}),
				TabContainer = roactModule.createElement(roactGamepadModule.Focusable.Frame, {
					BackgroundTransparency = 1,
					ZIndex = 5,
					Size = UDim2.fromScale(1, 1),
					Position = UDim2.fromScale(0, 0),
					defaultChild = p1.tabRefs[p1.props.selectedTabIndex]
				}, {
					TabLayout = roactModule.createElement("UIListLayout", {
						VerticalAlignment = Enum.VerticalAlignment.Center,
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					roactModule.createFragment(cryoModule.List.map(p1.props.tabs, function(p4, p5)
						-- upvalues: roactModule (copy), roactGamepadModule (copy), tabWidth (copy), height (copy), p1 (copy), tabsCount (copy), var12 (ref), p3 (ref), segmentedControlTabNameModule (copy), t_4 (copy)
						return roactModule.createElement(roactGamepadModule.Focusable.Frame, {
							key = p4.tabName,
							LayoutOrder = p5,
							Size = UDim2.fromOffset(tabWidth, height),
							BackgroundTransparency = 1,
							[roactModule.Ref] = p1.tabRefs[p5],
							NextSelectionLeft = if p5 > 1 then p1.tabRefs[p5 - 1] else nil,
							NextSelectionRight = if p5 < tabsCount then p1.tabRefs[p5 + 1] else nil,
							inputBindings = {
								LeaveA = roactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonA, var12),
								LeaveB = roactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonB, var12),
								SelectNext1 = roactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonR1, function()
									-- upvalues: p5 (ref), tabsCount (copy), p3 (copy), p1 (copy)
									if p5 < tabsCount then
										p3.moveFocusTo(p1.tabRefs[p5 + 1])
									end
								end),
								SelectPre1 = roactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonL1, function()
									-- upvalues: p5 (ref), p3 (copy), p1 (copy)
									if p5 > 1 then
										p3.moveFocusTo(p1.tabRefs[p5 - 1])
									end
								end),
								SelectNext2 = roactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonR2, function()
									-- upvalues: p5 (ref), tabsCount (copy), p3 (copy), p1 (copy)
									if p5 < tabsCount then
										p3.moveFocusTo(p1.tabRefs[p5 + 1])
									end
								end),
								SelectPre2 = roactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonL2, function()
									-- upvalues: p5 (ref), p3 (copy), p1 (copy)
									if p5 > 1 then
										p3.moveFocusTo(p1.tabRefs[p5 - 1])
									end
								end),
								SelectNext3 = roactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonR3, function()
									-- upvalues: p5 (ref), tabsCount (copy), p3 (copy), p1 (copy)
									if p5 < tabsCount then
										p3.moveFocusTo(p1.tabRefs[p5 + 1])
									end
								end),
								SelectPre3 = roactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonL3, function()
									-- upvalues: p5 (ref), p3 (copy), p1 (copy)
									if p5 > 1 then
										p3.moveFocusTo(p1.tabRefs[p5 - 1])
									end
								end)
							}
						}, {
							Tab = roactModule.createElement(segmentedControlTabNameModule, {
								text = p4.tabName,
								onActivated = function()
									-- upvalues: p1 (copy), p5 (ref)
									p1.onTabActivated(p5)
								end,
								Size = UDim2.fromScale(1, 1),
								isDisabled = p4.isDisabled,
								isSelectedStyle = p1.props.selectedTabIndex == p5,
								icon = p4.icon,
								iconStateColorMap = t_4
							})
						})
					end))
				})
			})
		end)
	end)
end

function segmentedControl.didUpdate(p3, p4)
	-- upvalues: otterModule (ref), t (ref)
	if p4.selectedTabIndex ~= p3.props.selectedTabIndex then
		p3.selectedBackgroundMotor:setGoal(otterModule.spring(4 + p3.state.tabWidth * (p3.props.selectedTabIndex - 1), t))
	end
end

return segmentedControl