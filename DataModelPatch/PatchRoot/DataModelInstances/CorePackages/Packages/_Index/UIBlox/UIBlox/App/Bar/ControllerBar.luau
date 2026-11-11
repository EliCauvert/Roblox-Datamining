local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local RoactModule = require(Parent2.Roact)
local TModule = require(Parent2.t)
local CryoModule = require(Parent2.Cryo)
local WithStyleModule = require(Parent1.Core.Style.withStyle)
local ControllerBarHintModule = require(script.Parent.ControllerBarHint)
local GetTextSizeModule = require(Parent1.Core.Text.GetTextSize)
local ControllerBarHintInternalPadding = require(script.Parent.BarConstants).ControllerBarHintInternalPadding
local DefaultKeyLabelSize = require(Parent.Menu.MenuConstants).DefaultKeyLabelSize
local ControllerBar = RoactModule.PureComponent:extend("ControllerBar")
local StrictInterfaceResult = TModule.strictInterface({
	keyCode = TModule.enum(Enum.KeyCode),
	text = TModule.string
})
ControllerBar.validateProps = TModule.strictInterface({
	leftHint = StrictInterfaceResult,
	rightHints = TModule.optional(TModule.map(TModule.number, StrictInterfaceResult))
})

function ControllerBar.init(p1)
	p1.state = {
		controllerBarWidth = 0,
		hintStringsConcat = nil,
		requiredSpace = nil,
		hintRatios = nil
	}
end

function ControllerBar.calculateHintRatios(LeftHint, RightHints)
	-- upvalues: CryoModule (copy), GetTextSizeModule (copy), DefaultKeyLabelSize (copy), ControllerBarHintInternalPadding (copy)
	local v1 = 84
	local Text = ""
	local t = {}
	local Total = 0
	local JoinResult = CryoModule.List.join({ LeftHint }, RightHints or {})
	
	for _, value in ipairs(JoinResult) do
		t[value.text] = GetTextSizeModule(value.text, 17, Enum.Font.ArialBold, Vector2.new(10000, 10000)).X
		Total += t[value.text]
		v1 = v1 + DefaultKeyLabelSize + ControllerBarHintInternalPadding
		Text ..= value.text
	end
	for i, value1 in pairs(t) do
		t[i] = value1 / Total
	end
	return t, v1 + math.max(#JoinResult - 2, 0) * 40, Text
end

function ControllerBar.getDerivedStateFromProps(p1)
	-- upvalues: ControllerBar (copy)
	local HintRatios, HintRatios2, HintRatios3 = ControllerBar.calculateHintRatios(p1.leftHint, p1.rightHints)
	
	return {
		hintRatios = HintRatios,
		requiredSpace = HintRatios2,
		hintStringsConcat = HintRatios3
	}
end

function ControllerBar.calculateHintSize(p1, ControllerBarWidth, p2)
	-- upvalues: GetTextSizeModule (copy)
	local ControllerBarWidthDelta = ControllerBarWidth - p1.state.requiredSpace
	local ScaledRelativeSize = p2.Header2.RelativeSize * p2.BaseSize
	local ScaledRelativeMinSize = p2.Header2.RelativeMinSize * p2.BaseSize
	local X = GetTextSizeModule(p1.state.hintStringsConcat, ScaledRelativeMinSize, p2.Header2.Font, Vector2.new(10000, 10000)).X
	
	if X <= ControllerBarWidthDelta then
		local X1 = GetTextSizeModule(p1.state.hintStringsConcat, ScaledRelativeSize, p2.Header2.Font, Vector2.new(10000, 10000)).X
		local ScaledRelativeSizeRatio = (ScaledRelativeSize - ScaledRelativeMinSize) / (X1 - X)
		
		return nil, (math.clamp(ControllerBarWidthDelta * ScaledRelativeSizeRatio + (ScaledRelativeSize - ScaledRelativeSizeRatio * X1), ScaledRelativeMinSize, ScaledRelativeSize))
	end
	local t = {}
	
	for i, hintRatio in pairs(p1.state.hintRatios) do
		t[i] = hintRatio * ControllerBarWidthDelta
	end
	return t
end

function ControllerBar.render(p3)
	-- upvalues: WithStyleModule (copy), CryoModule (copy), RoactModule (copy), ControllerBarHintModule (copy)
	return WithStyleModule(function(p4)
		-- upvalues: p3 (copy), CryoModule (upval), RoactModule (upval), ControllerBarHintModule (upval)
		local Theme = p4.Theme
		local HintSize, HintSize2 = p3:calculateHintSize(p3.state.controllerBarWidth, p4.Font)
		
		local function makeHint(LeftHint, p5)
			-- upvalues: CryoModule (upval), HintSize2 (copy), HintSize (copy), RoactModule (upval), ControllerBarHintModule (upval)
			return RoactModule.createElement(ControllerBarHintModule, (CryoModule.Dictionary.join(LeftHint, {
				key = "Hint" .. tostring(p5),
				hintTextSize = HintSize2,
				maxWidth = HintSize and HintSize[LeftHint.text] or nil
			})))
		end
		
		return RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = Theme.BackgroundUIContrast.Transparency,
			BackgroundColor3 = Theme.BackgroundUIContrast.Color,
			Size = UDim2.new(1, 0, 0, 72),
			Position = UDim2.fromScale(0, 1),
			AnchorPoint = Vector2.new(0, 1),
			[RoactModule.Change.AbsoluteSize] = function(Frame)
				-- upvalues: p3 (upval)
				p3:setState({ controllerBarWidth = Frame.AbsoluteSize.X })
			end,
			[RoactModule.Event.AncestryChanged] = function(Frame)
				-- upvalues: p3 (upval)
				p3:setState({ controllerBarWidth = Frame.AbsoluteSize.X })
			end
		}, {
			Padding = RoactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, 24),
				PaddingRight = UDim.new(0, 24)
			}),
			LeftFrame = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(0.5, 1)
			}, {
				RoactModule.createElement("UIListLayout", {
					key = "Layout",
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, 40)
				}),
				makeHint(p3.props.leftHint, "Left")
			}),
			RightFrame = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(0.5, 1),
				Position = UDim2.fromScale(1, 0),
				AnchorPoint = Vector2.new(1, 0)
			}, {
				Layout = RoactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Right,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, 40)
				}),
				RightHints = if p3.props.rightHints then RoactModule.createFragment(CryoModule.List.map(p3.props.rightHints, makeHint)) else nil
			})
		})
	end)
end

return ControllerBar