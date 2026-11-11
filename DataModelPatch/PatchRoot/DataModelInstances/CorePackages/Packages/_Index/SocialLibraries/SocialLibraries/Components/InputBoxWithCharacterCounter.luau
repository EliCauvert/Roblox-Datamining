local SocialLibraries = script:FindFirstAncestor("SocialLibraries")
local DependenciesModule = require(SocialLibraries.dependencies)
local Cryo = DependenciesModule.Cryo
local Roact = DependenciesModule.Roact
local Text = DependenciesModule.Text
local CallbackInputBoxModule = require(script.Parent.CallbackInputBox)
local InputBoxWithCharacterCounter = Roact.PureComponent:extend("InputBoxWithCharacterCounter")
InputBoxWithCharacterCounter.defaultProps = {
	initialInputText = "",
	validInputTextTransparency = 0,
	invalidInputTextTransparency = 0,
	counterTextPadding = 0,
	characterLimit = 150,
	validInputTextColor3 = Color3.fromRGB(0, 255, 0),
	invalidInputTextColor3 = Color3.fromRGB(255, 0, 0),
	style = require(SocialLibraries.Components.Style.TestStyle)
}

function InputBoxWithCharacterCounter.init(p1)
	p1.state = { inputText = p1.props.initialInputText }
	
	function p1.textChangedCallback(InputText)
		-- upvalues: p1 (copy)
		p1:setState({ inputText = InputText })
	end
end

function InputBoxWithCharacterCounter.render(p1)
	-- upvalues: Text (copy), Cryo (copy), Roact (copy), CallbackInputBoxModule (copy)
	local Style = p1.props.style
	local CountInputText = #p1.state.inputText
	local Text1 = CountInputText .. "/" .. p1.props.characterLimit
	local CaptionSubHeaderFont = Style.Font.CaptionSubHeader.Font
	local ScaledBaseSize = Style.Font.BaseSize * Style.Font.CaptionSubHeader.RelativeSize
	local TextHeight = Text.GetTextHeight(Text1, CaptionSubHeaderFont, ScaledBaseSize, (Text.GetTextWidth(Text1, CaptionSubHeaderFont, ScaledBaseSize)))
	local ValidInputTextColor3 = nil
	local ValidInputTextTransparency = nil
	
	if CountInputText <= p1.props.characterLimit then
		ValidInputTextColor3 = p1.props.validInputTextColor3
		ValidInputTextTransparency = p1.props.validInputTextTransparency
	else
		ValidInputTextColor3 = p1.props.invalidInputTextColor3
		ValidInputTextTransparency = p1.props.invalidInputTextTransparency
	end
	return Roact.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		layout = Roact.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		inputBoxContainer = Roact.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 1, -TextHeight)
		}, {
			border = Roact.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				Image = "rbxasset://textures/ui/LuaChat/9-slice/input-default.png",
				Size = UDim2.new(1, 0, 1, 0),
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(3, 3, 4, 4)
			}),
			inputBox = Roact.createElement(CallbackInputBoxModule, (Cryo.Dictionary.join(p1.props, {
				inputText = p1.state.inputText,
				textChangedCallback = p1.textChangedCallback
			})))
		}),
		characterCounter = Roact.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, TextHeight)
		}, {
			layout = Roact.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Bottom,
				HorizontalAlignment = Enum.HorizontalAlignment.Right
			}),
			padding = Roact.createElement("UIPadding", { PaddingRight = UDim.new(0, p1.props.counterTextPadding) }),
			characterCountLabel = Roact.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				Text = Text1,
				TextColor3 = ValidInputTextColor3,
				TextTransparency = ValidInputTextTransparency,
				TextSize = ScaledBaseSize,
				TextXAlignment = Enum.TextXAlignment.Right,
				TextYAlignment = Enum.TextYAlignment.Top,
				Font = CaptionSubHeaderFont
			})
		})
	})
end

return InputBoxWithCharacterCounter