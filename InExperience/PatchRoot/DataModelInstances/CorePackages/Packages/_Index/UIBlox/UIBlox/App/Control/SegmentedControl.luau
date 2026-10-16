local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local Core = Parent.Core
local RoactModule = require(Parent1.Roact)
local TModule = require(Parent1.t)
local CryoModule = require(Parent1.Cryo)
local FoundationFontFaceMigration = require(Parent1.Foundation).Utility.Flags.FoundationFontFaceMigration
local WithStyleModule = require(Parent.Core.Style.withStyle)
local OtterModule = require(Parent1.Otter)
local RoactGamepadModule = require(Parent1.RoactGamepad)
local ControlStateModule = require(Core.Control.Enum.ControlState)
local SegmentedControlTabNameModule = require(script.Parent.SegmentedControlTabName)
local ImageSetComponentModule = require(Core.ImageSet.ImageSetComponent)
local GetContentStyleModule = require(Core.Button.getContentStyle)
local GetTextSizeModule = require(Parent.Core.Text.GetTextSize)
local GetFontFromFontStyleModule = require(Parent.Core.Text.GetFontFromFontStyle)
local v1 = require(Parent.App.ImageSet.getIconSize)(require(Parent.App.ImageSet.Enum.IconSize).Medium)
local config = { frequency = 10, dampingRatio = 1 }
local ComponentAssetsCircle17 = require(Parent.App.ImageSet.Images)["component_assets/circle_17"]
local config1 = { [ControlStateModule.Default] = "BackgroundUIDefault" }
local config2 = { [ControlStateModule.Default] = "Divider" }
local config3 = { [ControlStateModule.Default] = "UIEmphasis" }
local IconStateColorMap = {
	[ControlStateModule.Default] = "SecondaryDefault",
	[ControlStateModule.Hover] = "SecondaryOnHover"
}
local SegmentedControl = RoactModule.Component:extend("SegmentedControl")
SegmentedControl.validateProps = TModule.strictInterface({
	tabs = function(p1) --[[ Line: 52 ]]
		-- upvalues: TModule (copy)
		local v2, v3 = TModule.array(TModule.strictInterface({
			tabName = TModule.string,
			isDisabled = TModule.optional(TModule.boolean),
			icon = TModule.optional(TModule.table)
		}))(p1)
		
		if not v2 then
			return v2, v3
		end
		local v4, v5 = TModule.numberMin(2)(#p1)
		
		if not v4 then
			return v4, v5
		end
		local v6, v7 = TModule.numberMax(4)(#p1)
		
		if v6 then
			return true
		else
			return v6, v7
		end
	end,
	width = TModule.UDim,
	height = TModule.optional(TModule.number),
	maxWidth = TModule.optional(TModule.number),
	selectedTabIndex = TModule.number,
	onTabActivated = TModule.callback,
	NextSelectionLeft = TModule.optional(TModule.table),
	NextSelectionRight = TModule.optional(TModule.table),
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table),
	layoutOrder = TModule.optional(TModule.number)
})
SegmentedControl.defaultProps = { height = 44 }

function SegmentedControl.init(p1) --[[ Line: 115 ]]
	-- upvalues: RoactModule (copy), RoactGamepadModule (copy), OtterModule (copy), config (copy)
	p1.rootRef = RoactModule.createRef()
	p1.tabRefs = RoactGamepadModule.createRefCache()
	p1.selectedBackgroundPositionX, p1.setSelectedBackgroundPositionX = RoactModule.createBinding(0)
	p1.selectedBackgroundMotor = OtterModule.createSingleMotor(4)
	p1.selectedBackgroundMotor:onStep(function(p2) --[[ Line: 121 ]]
		-- upvalues: p1 (copy)
		p1.setSelectedBackgroundPositionX(p2)
	end)
	p1:setState({ tabWidth = 0, computedMinFrameWidth = 0 })
	
	function p1.onTabActivated(LayoutOrder) --[[ Line: 130 ]]
		-- upvalues: p1 (copy)
		p1.props.onTabActivated(LayoutOrder)
	end
	
	function p1.setSize(Frame) --[[ Line: 134 ]]
		-- upvalues: p1 (copy), OtterModule (upval), config (upval)
		local Floored = math.floor((math.max(Frame.AbsoluteSize.X, p1.state.computedMinFrameWidth) - 8) / #p1.props.tabs)
		p1.selectedBackgroundMotor:setGoal(OtterModule.spring(4 + Floored * (p1.props.selectedTabIndex - 1), config))
		p1:setState({ tabWidth = Floored })
	end
end

function SegmentedControl.render(p1) --[[ Line: 147 ]]
	-- upvalues: WithStyleModule (copy), ControlStateModule (copy), GetContentStyleModule (copy), config1 (copy), config2 (copy), config3 (copy), v1 (copy), GetTextSizeModule (copy), FoundationFontFaceMigration (copy), GetFontFromFontStyleModule (copy), RoactModule (copy), RoactGamepadModule (copy), CryoModule (copy), SegmentedControlTabNameModule (copy), IconStateColorMap (copy), ImageSetComponentModule (copy), ComponentAssetsCircle17 (copy)
	return WithStyleModule(function(p2) --[[ Line: 148 ]]
		-- upvalues: p1 (copy), ControlStateModule (upval), GetContentStyleModule (upval), config1 (upval), config2 (upval), config3 (upval), v1 (upval), GetTextSizeModule (upval), FoundationFontFaceMigration (upval), GetFontFromFontStyleModule (upval), RoactModule (upval), RoactGamepadModule (upval), CryoModule (upval), SegmentedControlTabNameModule (upval), IconStateColorMap (upval), ImageSetComponentModule (upval), ComponentAssetsCircle17 (upval)
		local ControlState = p1.state.controlState
		local CountTabs = #p1.props.tabs
		local Disabled = p1.props.tabs[p1.props.selectedTabIndex].isDisabled and ControlStateModule.Disabled or ControlState
		local ContentStyleModule = GetContentStyleModule(config1, ControlState, p2)
		local ContentStyleModule1 = GetContentStyleModule(config2, ControlState, p2)
		local ContentStyleModule2 = GetContentStyleModule(config3, Disabled, p2)
		local TabWidth = p1.state.tabWidth
		local v2 = if p1.props.icon then v1 else 0
		local Height: number = p1.props.height
		local HeightDelta = p1.props.height - 12
		local HeightDelta1 = p1.props.height - 16
		local ScaledRelativeSize = p2.Font.Header2.RelativeSize * p2.Font.BaseSize
		
		if p1.state.computedMinFrameWidth == 0 then
			local Largest = 0
			
			for i = 1, CountTabs do
				Largest = math.max(Largest, GetTextSizeModule(p1.props.tabs[i].tabName, ScaledRelativeSize, if FoundationFontFaceMigration then GetFontFromFontStyleModule(p2.Font.Header2) else Enum.Font.BuilderSans, Vector2.new(1e999, 1e999)).X)
			end
			local NewCountTabs = (v2 + 80) * CountTabs + 8
			local NewLargest = (v2 + (Largest + 8)) * CountTabs + 8
			p1:setState({
				computedMinFrameWidth = if p1.props.maxWidth then math.min(NewLargest, p1.props.maxWidth) else math.max(NewLargest, NewCountTabs)
			})
		end
		local Frames = {}
		
		for i1 = 1, CountTabs - 1 do
			if i1 ~= p1.props.selectedTabIndex and i1 ~= p1.props.selectedTabIndex - 1 then
				table.insert(Frames, i1, RoactModule.createElement("Frame", {
					Size = UDim2.fromOffset(1, HeightDelta1),
					BackgroundTransparency = ContentStyleModule1.Transparency,
					BackgroundColor3 = ContentStyleModule1.Color,
					Position = UDim2.fromOffset(4 + TabWidth * i1, (Height - HeightDelta1) / 2)
				}))
			end
		end
		return RoactGamepadModule.withFocusController(function(p3) --[[ Line: 214 ]]
			-- upvalues: p1 (upval), CountTabs (copy), CryoModule (upval), RoactModule (upval), RoactGamepadModule (upval), TabWidth (copy), Height (copy), SegmentedControlTabNameModule (upval), IconStateColorMap (upval), ImageSetComponentModule (upval), HeightDelta (copy), ComponentAssetsCircle17 (upval), ContentStyleModule (copy), Frames (copy), HeightDelta1 (copy), ContentStyleModule2 (copy)
			local function _(p4: number) --[[ Line: 215 ]]
				-- upvalues: p3 (copy), p1 (upval)
				if p4 > 1 then
					p3.moveFocusTo(p1.tabRefs[p4 - 1])
				end
			end
			
			local _ = function(p4: number) --[[ Line: 220 ]]
				-- upvalues: CountTabs (upval), p3 (copy), p1 (upval)
				if p4 < CountTabs then
					p3.moveFocusTo(p1.tabRefs[p4 + 1])
				end
			end
			
			local function v49() --[[ Line: 225 ]]
				-- upvalues: p3 (copy), p1 (upval)
				p3.moveFocusTo(p1.rootRef)
			end
			
			return RoactModule.createElement("Frame", {
				Size = UDim2.new(p1.props.width.Scale, p1.props.width.Offset, 0, Height),
				BackgroundTransparency = 1,
				[RoactModule.Change.AbsoluteSize] = p1.setSize,
				LayoutOrder = p1.props.layoutOrder
			}, {
				SizeConstraint = RoactModule.createElement("UISizeConstraint", {
					MinSize = Vector2.new(p1.state.computedMinFrameWidth, Height),
					MaxSize = Vector2.new(640, Height)
				}),
				Background = RoactModule.createElement(ImageSetComponentModule.Label, {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					ZIndex = 1,
					Size = UDim2.new(1, 0, 0, HeightDelta),
					Position = UDim2.fromOffset(0, (Height - HeightDelta) / 2),
					Image = ComponentAssetsCircle17,
					ImageColor3 = ContentStyleModule.Color,
					ImageTransparency = ContentStyleModule.Transparency,
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = Rect.new(8, 8, 9, 9)
				}),
				Dividers = RoactModule.createElement(RoactGamepadModule.Focusable.Frame, {
					Size = UDim2.new(1, 0, 0, Height),
					Position = UDim2.fromOffset(0, 0),
					BackgroundTransparency = 1,
					ZIndex = 2,
					NextSelectionLeft = p1.props.NextSelectionLeft,
					NextSelectionRight = p1.props.NextSelectionRight,
					NextSelectionUp = p1.props.NextSelectionUp,
					NextSelectionDown = p1.props.NextSelectionDown,
					[RoactModule.Ref] = p1.rootRef,
					inputBindings = {
						Enter = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonA, function() --[[ Line: 311 ]]
							-- upvalues: p3 (copy), p1 (upval)
							p3.moveFocusTo(p1.tabRefs[p1.props.selectedTabIndex])
						end)
					}
				}, Frames),
				SelectedBackground = RoactModule.createElement(ImageSetComponentModule.Label, {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					ZIndex = 4,
					Size = UDim2.fromOffset(TabWidth, HeightDelta1),
					Position = p1.selectedBackgroundPositionX:map(function(XOffset): UDim2 --[[ Line: 319 ]]
						-- upvalues: Height (upval), HeightDelta1 (upval)
						return UDim2.fromOffset(XOffset, (Height - HeightDelta1) / 2)
					end),
					Image = ComponentAssetsCircle17,
					ImageColor3 = ContentStyleModule2.Color,
					ImageTransparency = ContentStyleModule2.Transparency,
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = Rect.new(8, 8, 9, 9)
				}),
				TabContainer = RoactModule.createElement(RoactGamepadModule.Focusable.Frame, {
					BackgroundTransparency = 1,
					ZIndex = 5,
					Size = UDim2.fromScale(1, 1),
					Position = UDim2.fromScale(0, 0),
					defaultChild = p1.tabRefs[p1.props.selectedTabIndex]
				}, {
					TabLayout = RoactModule.createElement("UIListLayout", {
						VerticalAlignment = Enum.VerticalAlignment.Center,
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					RoactModule.createFragment((CryoModule.List.map(p1.props.tabs, function(p4, LayoutOrder: number) --[[ Line: 230 ]]
						-- upvalues: RoactModule (upval), RoactGamepadModule (upval), TabWidth (upval), Height (upval), p1 (upval), CountTabs (upval), v49 (copy), p3 (copy), SegmentedControlTabNameModule (upval), IconStateColorMap (upval)
						return RoactModule.createElement(RoactGamepadModule.Focusable.Frame, {
							key = p4.tabName,
							LayoutOrder = LayoutOrder,
							Size = UDim2.fromOffset(TabWidth, Height),
							BackgroundTransparency = 1,
							[RoactModule.Ref] = p1.tabRefs[LayoutOrder],
							NextSelectionLeft = LayoutOrder > 1 and p1.tabRefs[LayoutOrder - 1] or nil,
							NextSelectionRight = LayoutOrder < CountTabs and p1.tabRefs[LayoutOrder + 1] or nil,
							inputBindings = {
								LeaveA = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonA, v49),
								LeaveB = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonB, v49),
								SelectNext1 = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonR1, function() --[[ Line: 242 ]]
									-- upvalues: LayoutOrder (copy), CountTabs (upval), p3 (upval), p1 (upval)
									if LayoutOrder < CountTabs then
										p3.moveFocusTo(p1.tabRefs[LayoutOrder + 1])
									end
								end),
								SelectPre1 = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonL1, function() --[[ Line: 245 ]]
									-- upvalues: LayoutOrder (copy), p3 (upval), p1 (upval)
									if LayoutOrder > 1 then
										p3.moveFocusTo(p1.tabRefs[LayoutOrder - 1])
									end
								end),
								SelectNext2 = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonR2, function() --[[ Line: 248 ]]
									-- upvalues: LayoutOrder (copy), CountTabs (upval), p3 (upval), p1 (upval)
									if LayoutOrder < CountTabs then
										p3.moveFocusTo(p1.tabRefs[LayoutOrder + 1])
									end
								end),
								SelectPre2 = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonL2, function() --[[ Line: 251 ]]
									-- upvalues: LayoutOrder (copy), p3 (upval), p1 (upval)
									if LayoutOrder > 1 then
										p3.moveFocusTo(p1.tabRefs[LayoutOrder - 1])
									end
								end),
								SelectNext3 = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonR3, function() --[[ Line: 254 ]]
									-- upvalues: LayoutOrder (copy), CountTabs (upval), p3 (upval), p1 (upval)
									if LayoutOrder < CountTabs then
										p3.moveFocusTo(p1.tabRefs[LayoutOrder + 1])
									end
								end),
								SelectPre3 = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonL3, function() --[[ Line: 257 ]]
									-- upvalues: LayoutOrder (copy), p3 (upval), p1 (upval)
									if LayoutOrder > 1 then
										p3.moveFocusTo(p1.tabRefs[LayoutOrder - 1])
									end
								end)
							}
						}, {
							Tab = RoactModule.createElement(SegmentedControlTabNameModule, {
								text = p4.tabName,
								onActivated = function() --[[ Line: 264 ]]
									-- upvalues: p1 (upval), LayoutOrder (copy)
									p1.onTabActivated(LayoutOrder)
								end,
								Size = UDim2.fromScale(1, 1),
								isDisabled = p4.isDisabled,
								isSelectedStyle = p1.props.selectedTabIndex == LayoutOrder,
								icon = p4.icon,
								iconStateColorMap = IconStateColorMap
							})
						})
					end)))
				})
			})
		end)
	end)
end

function SegmentedControl.didUpdate(p3, p4) --[[ Line: 352 ]]
	-- upvalues: OtterModule (copy), config (copy)
	if p4.selectedTabIndex ~= p3.props.selectedTabIndex then
		p3.selectedBackgroundMotor:setGoal(OtterModule.spring(4 + p3.state.tabWidth * (p3.props.selectedTabIndex - 1), config))
	end
end

return SegmentedControl