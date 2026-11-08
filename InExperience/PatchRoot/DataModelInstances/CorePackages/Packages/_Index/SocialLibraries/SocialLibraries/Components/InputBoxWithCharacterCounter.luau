local SocialLibraries = script:FindFirstAncestor("SocialLibraries")
local DependenciesModule = require(SocialLibraries.dependencies)
local Cryo = DependenciesModule.Cryo
local Roact = DependenciesModule.Roact
local CallbackInputBoxModule = require(script.Parent.CallbackInputBox)
local GetTextBoundsAsyncFunction = DependenciesModule.Foundation.Utility.getTextBoundsAsync
local NormalizeFontFaceFunction = DependenciesModule.Foundation.Utility.normalizeFontFace
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
	-- upvalues: GetTextBoundsAsyncFunction (copy)
	p1.state = { inputText = p1.props.initialInputText }
	
	function p1.textChangedCallback(InputText)
		-- upvalues: p1 (copy)
		p1:setState({ inputText = InputText })
	end
	
	p1.isMounted = false
	p1.measurementId = 0
	
	function p1.measureText()
		-- upvalues: p1 (copy), GetTextBoundsAsyncFunction (upval)
		local Style = p1.props.style
		local Text = #p1.state.inputText .. "/" .. p1.props.characterLimit
		local CaptionSubHeaderFont = Style.Font.CaptionSubHeader.Font
		local ScaledBaseSize = Style.Font.BaseSize * Style.Font.CaptionSubHeader.RelativeSize
		
		if p1.measuredText ~= Text or p1.measuredFont ~= CaptionSubHeaderFont or p1.measuredFontSize ~= ScaledBaseSize then
			p1.measuredText = Text
			p1.measuredFont = CaptionSubHeaderFont
			p1.measuredFontSize = ScaledBaseSize
			p1.measurementId += 1
			local MeasurementId = p1.measurementId
			task.spawn(function()
				-- upvalues: GetTextBoundsAsyncFunction (upval), Text (copy), CaptionSubHeaderFont (copy), ScaledBaseSize (copy), p1 (upval), MeasurementId (copy)
				local TextBoundsAsync = GetTextBoundsAsyncFunction(Text, CaptionSubHeaderFont, ScaledBaseSize)
				
				if p1.isMounted and p1.measurementId == MeasurementId then
					p1:setState({ textBounds = TextBoundsAsync })
				end
			end)
			
			return
		end
	end
end

function InputBoxWithCharacterCounter.didMount(p1)
	p1.isMounted = true
	p1.measureText()
end

function InputBoxWithCharacterCounter.didUpdate(p1)
	p1.measureText()
end

function InputBoxWithCharacterCounter.willUnmount(p1)
	p1.isMounted = false
	p1.measurementId += 1
end

function InputBoxWithCharacterCounter.render(p1)
	-- upvalues: Cryo (copy), Roact (copy), CallbackInputBoxModule (copy), NormalizeFontFaceFunction (copy)
	local Style = p1.props.style
	local CountInputText = #p1.state.inputText
	local Text = CountInputText .. "/" .. p1.props.characterLimit
	local CaptionSubHeaderFont = Style.Font.CaptionSubHeader.Font
	local ScaledBaseSize = Style.Font.BaseSize * Style.Font.CaptionSubHeader.RelativeSize
	local Y = (p1.state.textBounds or Vector2.new(0, ScaledBaseSize)).Y
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
			Size = UDim2.new(1, 0, 1, -Y)
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
			Size = UDim2.new(1, 0, 0, Y)
		}, {
			layout = Roact.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Bottom,
				HorizontalAlignment = Enum.HorizontalAlignment.Right
			}),
			padding = Roact.createElement("UIPadding", { PaddingRight = UDim.new(0, p1.props.counterTextPadding) }),
			characterCountLabel = Roact.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				Text = Text,
				TextColor3 = ValidInputTextColor3,
				TextTransparency = ValidInputTextTransparency,
				TextSize = ScaledBaseSize,
				TextXAlignment = Enum.TextXAlignment.Right,
				TextYAlignment = Enum.TextYAlignment.Top,
				FontFace = NormalizeFontFaceFunction(CaptionSubHeaderFont)
			})
		})
	})
end

return InputBoxWithCharacterCounter