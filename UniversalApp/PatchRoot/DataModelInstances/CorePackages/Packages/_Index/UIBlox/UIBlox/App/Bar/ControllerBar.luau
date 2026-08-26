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
local var1 = tModule.strictInterface({
	keyCode = tModule.enum(Enum.KeyCode),
	text = tModule.string
})
controllerBar.validateProps = tModule.strictInterface({
	leftHint = var1,
	rightHints = tModule.optional(tModule.map(tModule.number, var1))
})

function controllerBar.init(p1)
	p1.state = {
		controllerBarWidth = 0,
		hintStringsConcat = nil,
		requiredSpace = nil,
		hintRatios = nil
	}
end

function controllerBar.calculateHintRatios(p1, p2)
	-- upvalues: cryoModule (ref), getTextSizeModule (ref), defaultKeyLabelSize (ref), controllerBarHintInternalPadding (ref)
	local var2 = 84
	local var3 = ""
	local t = {}
	local var4 = 0
	local var5 = cryoModule.List.join({ p1 }, p2 or {})
	
	for i, v in ipairs(var5) do
		t[v.text] = getTextSizeModule(v.text, 17, Enum.Font.ArialBold, Vector2.new(10000, 10000)).X
		var4 += t[v.text]
		var2 = var2 + defaultKeyLabelSize + controllerBarHintInternalPadding
		var3 ..= v.text
	end
	for i_1, v_1 in pairs(t) do
		t[i_1] = v_1 / var4
	end
	return t, var2 + math.max(#var5 - 2, 0) * 40, var3
end

function controllerBar.getDerivedStateFromProps(p3)
	-- upvalues: controllerBar (ref)
	local var6, var7, var8 = controllerBar.calculateHintRatios(p3.leftHint, p3.rightHints)
	
	return {
		hintRatios = var6,
		requiredSpace = var7,
		hintStringsConcat = var8
	}
end

function controllerBar.calculateHintSize(p3, p4, p5)
	-- upvalues: getTextSizeModule (ref)
	local var6 = p4 - p3.state.requiredSpace
	local var7 = p5.Header2.RelativeSize * p5.BaseSize
	local var8 = p5.Header2.RelativeMinSize * p5.BaseSize
	local x = getTextSizeModule(p3.state.hintStringsConcat, var8, p5.Header2.Font, Vector2.new(10000, 10000)).X
	
	if x <= var6 then
		local x_1 = getTextSizeModule(p3.state.hintStringsConcat, var7, p5.Header2.Font, Vector2.new(10000, 10000)).X
		local var9 = (var7 - var8) / (x_1 - x)
		
		return nil, math.clamp(var6 * var9 + (var7 - var9 * x_1), var8, var7)
	end
	local t = {}
	
	for i, v in pairs(p3.state.hintRatios) do
		t[i] = v * var6
	end
	return t
end

function controllerBar.render(p6)
	-- upvalues: withStyleModule (ref), cryoModule (ref), roactModule (ref), controllerBarHintModule (ref)
	return withStyleModule(function(p7)
		-- upvalues: p6 (ref), cryoModule (copy), roactModule (copy), controllerBarHintModule (copy)
		local theme = p7.Theme
		local controllerBarWidth, controllerBarWidth_1 = p6:calculateHintSize(p6.state.controllerBarWidth, p7.Font)
		
		local function makeHint(p8, p9)
			-- upvalues: cryoModule (copy), controllerBarWidth_1 (ref), controllerBarWidth (ref), roactModule (copy), controllerBarHintModule (copy)
			return roactModule.createElement(controllerBarHintModule, cryoModule.Dictionary.join(p8, {
				key = "Hint" .. tostring(p9),
				hintTextSize = controllerBarWidth_1,
				maxWidth = if controllerBarWidth then controllerBarWidth[p8.text] else nil
			}))
		end
		
		return roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = theme.BackgroundUIContrast.Transparency,
			BackgroundColor3 = theme.BackgroundUIContrast.Color,
			Size = UDim2.new(1, 0, 0, 72),
			Position = UDim2.fromScale(0, 1),
			AnchorPoint = Vector2.new(0, 1),
			[roactModule.Change.AbsoluteSize] = function(p8)
				-- upvalues: p6 (copy)
				p6:setState({ controllerBarWidth = p8.AbsoluteSize.X })
			end,
			[roactModule.Event.AncestryChanged] = function(p8)
				-- upvalues: p6 (copy)
				p6:setState({ controllerBarWidth = p8.AbsoluteSize.X })
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
				makeHint(p6.props.leftHint, "Left")
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
				RightHints = if p6.props.rightHints then roactModule.createFragment(cryoModule.List.map(p6.props.rightHints, makeHint)) else nil
			})
		})
	end)
end

return controllerBar