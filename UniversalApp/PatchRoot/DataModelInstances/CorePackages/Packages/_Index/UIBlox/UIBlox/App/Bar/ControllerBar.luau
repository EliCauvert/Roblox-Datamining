local parent = script.Parent.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local roactModule = require(parent_2.Roact)
local tModule = require(parent_2.t)
local cryoModule = require(parent_2.Cryo)
local withStyleModule = require(parent_1.Core.Style.withStyle)
local controllerBarHintModule = require(script.Parent.ControllerBarHint)
local getTextSizeModule = require(parent_1.Core.Text.GetTextSize)
local controllerBarHintInternalPadding = require(script.Parent.BarConstants).ControllerBarHintInternalPadding
local defaultKeyLabelSize = require(parent.Menu.MenuConstants).DefaultKeyLabelSize
local controllerBar = roactModule.PureComponent:extend("ControllerBar")
local var7 = tModule.strictInterface({
	keyCode = tModule.enum(Enum.KeyCode),
	text = tModule.string
})
controllerBar.validateProps = tModule.strictInterface({
	leftHint = var7,
	rightHints = tModule.optional(tModule.map(tModule.number, var7))
})

function controllerBar.init(p0)
	p0.state = {
		controllerBarWidth = 0,
		hintStringsConcat = nil,
		requiredSpace = nil,
		hintRatios = nil
	}
end

function controllerBar.calculateHintRatios(p1, p2)
	-- upvalues: cryoModule (ref), getTextSizeModule (ref), defaultKeyLabelSize (ref), controllerBarHintInternalPadding (ref)
	local var8 = 84
	local var9 = ""
	local t = {}
	local var11 = 0
	local var12 = cryoModule.List.join({ p1 }, p2 or {})
	
	for i, v in ipairs(var12) do
		t[v.text] = getTextSizeModule(v.text, 17, Enum.Font.ArialBold, Vector2.new(10000, 10000)).X
		var11 += t[v.text]
		var8 = var8 + defaultKeyLabelSize + controllerBarHintInternalPadding
		var9 ..= v.text
	end
	for i_1, v_1 in pairs(t) do
		t[i_1] = v_1 / var11
	end
	return t, var8 + math.max(#var12 - 2, 0) * 40, var9
end

function controllerBar.getDerivedStateFromProps(p3)
	-- upvalues: controllerBar (ref)
	local var13, var14, var15 = controllerBar.calculateHintRatios(p3.leftHint, p3.rightHints)
	
	return {
		hintRatios = var13,
		requiredSpace = var14,
		hintStringsConcat = var15
	}
end

function controllerBar.calculateHintSize(p4, p5, p6)
	-- upvalues: getTextSizeModule (ref)
	local var16 = p5 - p4.state.requiredSpace
	local var17 = p6.Header2.RelativeSize * p6.BaseSize
	local var18 = p6.Header2.RelativeMinSize * p6.BaseSize
	local x = getTextSizeModule(p4.state.hintStringsConcat, var18, p6.Header2.Font, Vector2.new(10000, 10000)).X
	
	if x <= var16 then
		local x_1 = getTextSizeModule(p4.state.hintStringsConcat, var17, p6.Header2.Font, Vector2.new(10000, 10000)).X
		local var19 = (var17 - var18) / (x_1 - x)
		
		return nil, math.clamp(var16 * var19 + (var17 - var19 * x_1), var18, var17)
	end
	local t = {}
	
	for i, v in pairs(p4.state.hintRatios) do
		t[i] = v * var16
	end
	return t
end

function controllerBar.render(p7)
	-- upvalues: withStyleModule (ref), cryoModule (ref), roactModule (ref), controllerBarHintModule (ref)
	return withStyleModule(function(p8)
		-- upvalues: p7 (ref), cryoModule (copy), roactModule (copy), controllerBarHintModule (copy)
		local theme = p8.Theme
		local controllerBarWidth, controllerBarWidth_1 = p7:calculateHintSize(p7.state.controllerBarWidth, p8.Font)
		
		local function makeHint(p9, p10)
			-- upvalues: cryoModule (copy), controllerBarWidth_1 (ref), controllerBarWidth (ref), roactModule (copy), controllerBarHintModule (copy)
			return roactModule.createElement(controllerBarHintModule, cryoModule.Dictionary.join(p9, {
				key = "Hint" .. tostring(p10),
				hintTextSize = controllerBarWidth_1,
				maxWidth = if controllerBarWidth then controllerBarWidth[p9.text] else nil
			}))
		end
		
		return roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = theme.BackgroundUIContrast.Transparency,
			BackgroundColor3 = theme.BackgroundUIContrast.Color,
			Size = UDim2.new(1, 0, 0, 72),
			Position = UDim2.fromScale(0, 1),
			AnchorPoint = Vector2.new(0, 1),
			[roactModule.Change.AbsoluteSize] = function(p11)
				-- upvalues: p7 (copy)
				p7:setState({ controllerBarWidth = p11.AbsoluteSize.X })
			end,
			[roactModule.Event.AncestryChanged] = function(p12)
				-- upvalues: p7 (copy)
				p7:setState({ controllerBarWidth = p12.AbsoluteSize.X })
			end
		}, {
			Padding = roactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, 24),
				PaddingRight = UDim.new(0, 24)
			}),
			LeftFrame = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(0.5, 1)
			}, {
				roactModule.createElement("UIListLayout", {
					key = "Layout",
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, 40)
				}),
				makeHint(p7.props.leftHint, "Left")
			}),
			RightFrame = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(0.5, 1),
				Position = UDim2.fromScale(1, 0),
				AnchorPoint = Vector2.new(1, 0)
			}, {
				Layout = roactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Right,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, 40)
				}),
				RightHints = if p7.props.rightHints then roactModule.createFragment(cryoModule.List.map(p7.props.rightHints, makeHint)) else nil
			})
		})
	end)
end

return controllerBar