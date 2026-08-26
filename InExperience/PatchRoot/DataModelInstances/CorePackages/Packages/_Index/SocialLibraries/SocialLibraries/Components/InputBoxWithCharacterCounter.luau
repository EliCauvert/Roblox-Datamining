local socialLibraries = script:FindFirstAncestor("SocialLibraries")
local dependenciesModule = require(socialLibraries.dependencies)
local cryo = dependenciesModule.Cryo
local roact = dependenciesModule.Roact
local text = dependenciesModule.Text
local testStyleModule = require(socialLibraries.Components.Style.TestStyle)
local callbackInputBoxModule = require(script.Parent.CallbackInputBox)
local inputBoxWithCharacterCounter = roact.PureComponent:extend("InputBoxWithCharacterCounter")
inputBoxWithCharacterCounter.defaultProps = {
	initialInputText = "",
	validInputTextTransparency = 0,
	invalidInputTextTransparency = 0,
	counterTextPadding = 0,
	characterLimit = 150,
	validInputTextColor3 = Color3.fromRGB(0, 255, 0),
	invalidInputTextColor3 = Color3.fromRGB(255, 0, 0),
	style = testStyleModule
}

function inputBoxWithCharacterCounter.init(p1)
	p1.state = { inputText = p1.props.initialInputText }
	
	function p0.textChangedCallback(p2)
		-- upvalues: p1 (ref)
		p1:setState({ inputText = p2 })
	end
end

function inputBoxWithCharacterCounter.render(p1)
	-- upvalues: text (ref), cryo (ref), roact (ref), callbackInputBoxModule (ref)
	local validInputTextColor3, validInputTextTransparency
	local style = p1.props.style
	local inputTextCount = #p1.state.inputText
	local text_1 = inputTextCount .. "/" .. p2.props.characterLimit
	local font = style.Font.CaptionSubHeader.Font
	local var1 = style.Font.BaseSize * style.Font.CaptionSubHeader.RelativeSize
	local _ = nil
	local _ = nil
	local textHeight = text.GetTextHeight(text_1, font, var1, text.GetTextWidth(text_1, font, var1))
	
	if inputTextCount <= p1.props.characterLimit then
		validInputTextColor3 = p1.props.validInputTextColor3
		validInputTextTransparency = p1.props.validInputTextTransparency
	else
		validInputTextColor3 = p1.props.invalidInputTextColor3
		validInputTextTransparency = p1.props.invalidInputTextTransparency
	end
	return roact.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		layout = roact.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		inputBoxContainer = roact.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 1, -textHeight)
		}, {
			border = roact.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				Image = "rbxasset://textures/ui/LuaChat/9-slice/input-default.png",
				Size = UDim2.new(1, 0, 1, 0),
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(3, 3, 4, 4)
			}),
			inputBox = roact.createElement(callbackInputBoxModule, cryo.Dictionary.join(p1.props, {
				inputText = p1.state.inputText,
				textChangedCallback = p1.textChangedCallback
			}))
		}),
		characterCounter = roact.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, textHeight)
		}, {
			layout = roact.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Bottom,
				HorizontalAlignment = Enum.HorizontalAlignment.Right
			}),
			padding = roact.createElement("UIPadding", { PaddingRight = UDim.new(0, p1.props.counterTextPadding) }),
			characterCountLabel = roact.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				Text = text_1,
				TextColor3 = validInputTextColor3,
				TextTransparency = validInputTextTransparency,
				TextSize = var1,
				TextXAlignment = Enum.TextXAlignment.Right,
				TextYAlignment = Enum.TextYAlignment.Top,
				Font = font
			})
		})
	})
end

return inputBoxWithCharacterCounter