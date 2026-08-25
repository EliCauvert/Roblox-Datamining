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
local var12 = require(parent.App.ImageSet.getIconSize)(require(parent.App.ImageSet.Enum.IconSize).Medium)
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
	tabs = function(p0)
		-- upvalues: tModule (ref)
		local var19, var20 = tModule.array(tModule.strictInterface({
			tabName = tModule.string,
			isDisabled = tModule.optional(tModule.boolean),
			icon = tModule.optional(tModule.table)
		}))(p0)
		
		if not var19 then
			return var19, var20
		end
		local var21, var22 = tModule.numberMin(2)(#p0)
		
		if not var21 then
			return var21, var22
		end
		local var23, var24 = tModule.numberMax(4)(#p0)
		
		if var23 then
			return true
		end
		return var23, var24
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
	local var25, var26 = roactModule.createBinding(0)
	p1.selectedBackgroundPositionX = var25
	p1.setSelectedBackgroundPositionX = var26
	p1.selectedBackgroundMotor = otterModule.createSingleMotor(4)
	p1.selectedBackgroundMotor:onStep(function(p2)
		-- upvalues: p1 (ref)
		p1.setSelectedBackgroundPositionX(p2)
	end)
	p1:setState({ tabWidth = 0, computedMinFrameWidth = 0 })
	
	function p1.onTabActivated(p3)
		-- upvalues: p1 (ref)
		p1.props.onTabActivated(p3)
	end
	
	function p1.setSize(p4)
		-- upvalues: p1 (ref), otterModule (copy), t (copy)
		local floored = math.floor((math.max(p4.AbsoluteSize.X, p1.state.computedMinFrameWidth) - 8) / #p1.props.tabs)
		p1.selectedBackgroundMotor:setGoal(otterModule.spring(4 + floored * (p1.props.selectedTabIndex - 1), t))
		p1:setState({ tabWidth = floored })
	end
end

function segmentedControl.render(p5)
	-- upvalues: withStyleModule (ref), controlStateModule (ref), getContentStyleModule (ref), t_1 (ref), t_2 (ref), t_3 (ref), var12 (ref), getTextSizeModule (ref), roactModule (ref), roactGamepadModule (ref), cryoModule (ref), segmentedControlTabNameModule (ref), t_4 (ref), imageSetComponentModule (ref), circle17 (ref)
	return withStyleModule(function(p6)
		-- upvalues: p5 (ref), controlStateModule (copy), getContentStyleModule (copy), t_1 (copy), t_2 (copy), t_3 (copy), var12 (copy), getTextSizeModule (copy), roactModule (copy), roactGamepadModule (copy), cryoModule (copy), segmentedControlTabNameModule (copy), t_4 (copy), imageSetComponentModule (copy), circle17 (copy)
		local controlState = p5.state.controlState
		local tabsCount = #p5.props.tabs
		local var29 = if p5.props.tabs[p5.props.selectedTabIndex].isDisabled then controlStateModule.Disabled else controlState
		local var30 = getContentStyleModule(t_1, controlState, p6)
		local var31 = getContentStyleModule(t_2, controlState, p6)
		local var32 = getContentStyleModule(t_3, var29, p6)
		local tabWidth = p5.state.tabWidth
		local var33 = if p5.props.icon then var12 else 0
		local height = p5.props.height
		local var34 = p5.props.height - 12
		local var35 = p5.props.height - 16
		local var36 = p6.Font.Header2.RelativeSize * p6.Font.BaseSize
		
		if p5.state.computedMinFrameWidth == 0 then
			local var37 = 0
			
			for i = 1, tabsCount do
				var37 = math.max(var37, getTextSizeModule(p5.props.tabs[i].tabName, var36, Enum.Font.BuilderSans, Vector2.new(1e999, 1e999)).X)
			end
			local var38 = (var33 + (var37 + 8)) * tabsCount + 8
			p5:setState({
				computedMinFrameWidth = if p5.props.maxWidth then math.min(var38, p5.props.maxWidth) else math.max(var38, (var33 + 80) * tabsCount + 8)
			})
		end
		local t = {}
		
		for i_1 = 1, tabsCount - 1 do
			if i_1 ~= p5.props.selectedTabIndex and i_1 ~= p5.props.selectedTabIndex - 1 then
				table.insert(t, i_1, roactModule.createElement("Frame", {
					Size = UDim2.fromOffset(1, var35),
					BackgroundTransparency = var31.Transparency,
					BackgroundColor3 = var31.Color,
					Position = UDim2.fromOffset(4 + tabWidth * i_1, (height - var35) / 2)
				}))
			end
		end
		return roactGamepadModule.withFocusController(function(p7)
			-- upvalues: p5 (copy), tabsCount (ref), cryoModule (copy), roactModule (copy), roactGamepadModule (copy), tabWidth (ref), height (ref), segmentedControlTabNameModule (copy), t_4 (copy), imageSetComponentModule (copy), var34 (ref), circle17 (copy), var30 (ref), t (ref), var35 (ref), var32 (ref)
			local _ = function(p8)
				-- upvalues: p7 (ref), p5 (copy)
				if p8 > 1 then
					p7.moveFocusTo(p5.tabRefs[p8 - 1])
				end
			end
			
			local _ = function(p9)
				-- upvalues: tabsCount (copy), p7 (ref), p5 (copy)
				if p9 < tabsCount then
					p7.moveFocusTo(p5.tabRefs[p9 + 1])
				end
			end
			
			local var40 = function()
				-- upvalues: p7 (ref), p5 (copy)
				p7.moveFocusTo(p5.rootRef)
			end
			
			return roactModule.createElement("Frame", {
				Size = UDim2.new(p5.props.width.Scale, p5.props.width.Offset, 0, height),
				BackgroundTransparency = 1,
				[roactModule.Change.AbsoluteSize] = p5.setSize,
				LayoutOrder = p5.props.layoutOrder
			}, {
				SizeConstraint = roactModule.createElement("UISizeConstraint", {
					MinSize = Vector2.new(p5.state.computedMinFrameWidth, height),
					MaxSize = Vector2.new(640, height)
				}),
				Background = roactModule.createElement(imageSetComponentModule.Label, {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					ZIndex = 1,
					Size = UDim2.new(1, 0, 0, var34),
					Position = UDim2.fromOffset(0, (height - var34) / 2),
					Image = circle17,
					ImageColor3 = var30.Color,
					ImageTransparency = var30.Transparency,
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = Rect.new(8, 8, 9, 9)
				}),
				Dividers = roactModule.createElement(roactGamepadModule.Focusable.Frame, {
					Size = UDim2.new(1, 0, 0, height),
					Position = UDim2.fromOffset(0, 0),
					BackgroundTransparency = 1,
					ZIndex = 2,
					NextSelectionLeft = p5.props.NextSelectionLeft,
					NextSelectionRight = p5.props.NextSelectionRight,
					NextSelectionUp = p5.props.NextSelectionUp,
					NextSelectionDown = p5.props.NextSelectionDown,
					[roactModule.Ref] = p5.rootRef,
					inputBindings = {
						Enter = roactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonA, function()
							-- upvalues: p7 (ref), p5 (copy)
							p7.moveFocusTo(p5.tabRefs[p5.props.selectedTabIndex])
						end)
					}
				}, t),
				SelectedBackground = roactModule.createElement(imageSetComponentModule.Label, {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					ZIndex = 4,
					Size = UDim2.fromOffset(tabWidth, var35),
					Position = p5.selectedBackgroundPositionX:map(function(p10)
						-- upvalues: height (copy), var35 (copy)
						return UDim2.fromOffset(p10, (height - var35) / 2)
					end),
					Image = circle17,
					ImageColor3 = var32.Color,
					ImageTransparency = var32.Transparency,
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = Rect.new(8, 8, 9, 9)
				}),
				TabContainer = roactModule.createElement(roactGamepadModule.Focusable.Frame, {
					BackgroundTransparency = 1,
					ZIndex = 5,
					Size = UDim2.fromScale(1, 1),
					Position = UDim2.fromScale(0, 0),
					defaultChild = p5.tabRefs[p5.props.selectedTabIndex]
				}, {
					TabLayout = roactModule.createElement("UIListLayout", {
						VerticalAlignment = Enum.VerticalAlignment.Center,
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					roactModule.createFragment(cryoModule.List.map(p5.props.tabs, function(p11, p12)
						-- upvalues: roactModule (copy), roactGamepadModule (copy), tabWidth (copy), height (copy), p5 (copy), tabsCount (copy), var40 (ref), p7 (ref), segmentedControlTabNameModule (copy), t_4 (copy)
						return roactModule.createElement(roactGamepadModule.Focusable.Frame, {
							key = p11.tabName,
							LayoutOrder = p12,
							Size = UDim2.fromOffset(tabWidth, height),
							BackgroundTransparency = 1,
							[roactModule.Ref] = p5.tabRefs[p12],
							NextSelectionLeft = if p12 > 1 then p5.tabRefs[p12 - 1] else nil,
							NextSelectionRight = if p12 < tabsCount then p5.tabRefs[p12 + 1] else nil,
							inputBindings = {
								LeaveA = roactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonA, var40),
								LeaveB = roactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonB, var40),
								SelectNext1 = roactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonR1, function()
									-- upvalues: p12 (ref), tabsCount (copy), p7 (copy), p5 (copy)
									if p12 < tabsCount then
										p7.moveFocusTo(p5.tabRefs[p12 + 1])
									end
								end),
								SelectPre1 = roactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonL1, function()
									-- upvalues: p12 (ref), p7 (copy), p5 (copy)
									if p12 > 1 then
										p7.moveFocusTo(p5.tabRefs[p12 - 1])
									end
								end),
								SelectNext2 = roactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonR2, function()
									-- upvalues: p12 (ref), tabsCount (copy), p7 (copy), p5 (copy)
									if p12 < tabsCount then
										p7.moveFocusTo(p5.tabRefs[p12 + 1])
									end
								end),
								SelectPre2 = roactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonL2, function()
									-- upvalues: p12 (ref), p7 (copy), p5 (copy)
									if p12 > 1 then
										p7.moveFocusTo(p5.tabRefs[p12 - 1])
									end
								end),
								SelectNext3 = roactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonR3, function()
									-- upvalues: p12 (ref), tabsCount (copy), p7 (copy), p5 (copy)
									if p12 < tabsCount then
										p7.moveFocusTo(p5.tabRefs[p12 + 1])
									end
								end),
								SelectPre3 = roactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonL3, function()
									-- upvalues: p12 (ref), p7 (copy), p5 (copy)
									if p12 > 1 then
										p7.moveFocusTo(p5.tabRefs[p12 - 1])
									end
								end)
							}
						}, {
							Tab = roactModule.createElement(segmentedControlTabNameModule, {
								text = p11.tabName,
								onActivated = function()
									-- upvalues: p5 (copy), p12 (ref)
									p5.onTabActivated(p12)
								end,
								Size = UDim2.fromScale(1, 1),
								isDisabled = p11.isDisabled,
								isSelectedStyle = p5.props.selectedTabIndex == p12,
								icon = p11.icon,
								iconStateColorMap = t_4
							})
						})
					end))
				})
			})
		end)
	end)
end

function segmentedControl.didUpdate(p13, p14)
	-- upvalues: otterModule (ref), t (ref)
	if p14.selectedTabIndex ~= p13.props.selectedTabIndex then
		p13.selectedBackgroundMotor:setGoal(otterModule.spring(4 + p13.state.tabWidth * (p13.props.selectedTabIndex - 1), t))
	end
end

return segmentedControl