local socialLibraries = script:FindFirstAncestor("SocialLibraries")
local dependenciesModule = require(socialLibraries.dependencies)
local cryo = dependenciesModule.Cryo
local roact = dependenciesModule.Roact
local text = dependenciesModule.Text
local testStyleModule = require(socialLibraries.Components.Style.TestStyle)
local callbackInputBoxModule = require(script.Parent.CallbackInputBox)
local foundationFontFaceMigration = dependenciesModule.Foundation.Utility.Flags.FoundationFontFaceMigration
local getTextBoundsAsync = dependenciesModule.Foundation.Utility.getTextBoundsAsync
local normalizeFontFace = dependenciesModule.Foundation.Utility.normalizeFontFace
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
	-- upvalues: foundationFontFaceMigration (ref), getTextBoundsAsync (ref)
	p1.state = { inputText = p1.props.initialInputText }
	
	function p0.textChangedCallback(p2)
		-- upvalues: p1 (ref)
		p1:setState({ inputText = p2 })
	end
	
	if foundationFontFaceMigration then
		p1.isMounted = false
		p1.measurementId = 0
		
		function p0.measureText()
			-- upvalues: p1 (ref), getTextBoundsAsync (copy)
			local style = p1.props.style
			local text = #p1.state.inputText .. "/" .. p0.props.characterLimit
			local font = style.Font.CaptionSubHeader.Font
			local var1 = style.Font.BaseSize * style.Font.CaptionSubHeader.RelativeSize
			
			if p1.measuredText == text and p1.measuredFont == font and p1.measuredFontSize == var1 then
				return
			end
			p1.measuredText = text
			p1.measuredFont = font
			p1.measuredFontSize = var1
			p1.measurementId += 1
			local measurementId = p1.measurementId
			task.spawn(function()
				-- upvalues: getTextBoundsAsync (copy), text (ref), font (ref), var1 (ref), p1 (copy), measurementId (ref)
				local var2 = getTextBoundsAsync(text, font, var1)
				
				if p1.isMounted and p1.measurementId == measurementId then
					p1:setState({ textBounds = var2 })
				end
			end)
		end
	end
end

function inputBoxWithCharacterCounter.didMount(p1)
	-- upvalues: foundationFontFaceMigration (ref)
	if foundationFontFaceMigration then
		p1.isMounted = true
		p1.measureText()
	end
end

function inputBoxWithCharacterCounter.didUpdate(p1)
	-- upvalues: foundationFontFaceMigration (ref)
	if foundationFontFaceMigration then
		p1.measureText()
	end
end

function inputBoxWithCharacterCounter.willUnmount(p1)
	-- upvalues: foundationFontFaceMigration (ref)
	if foundationFontFaceMigration then
		p1.isMounted = false
		p1.measurementId += 1
	end
end

function inputBoxWithCharacterCounter.render(p1)
	-- upvalues: foundationFontFaceMigration (ref), text (ref), cryo (ref), roact (ref), callbackInputBoxModule (ref), normalizeFontFace (ref)
	local y
	local style = p1.props.style
	local inputTextCount = #p1.state.inputText
	local text_1 = inputTextCount .. "/" .. p5.props.characterLimit
	local font = style.Font.CaptionSubHeader.Font
	local var1 = style.Font.BaseSize * style.Font.CaptionSubHeader.RelativeSize
	local _ = nil
	local _ = nil
	local x = nil
	local _ = nil
	
	if foundationFontFaceMigration then
		local textBounds = p1.state.textBounds or Vector2.new(0, var1)
		x = textBounds.X
		y = textBounds.Y
	else
		y = text.GetTextHeight(text_1, font, var1, text.GetTextWidth(text_1, font, var1))
	end
	local validInputTextColor3, validInputTextTransparency
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
			Size = UDim2.new(1, 0, 1, -y)
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
			Size = UDim2.new(1, 0, 0, y)
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
				Font = if foundationFontFaceMigration then nil else font,
				FontFace = if foundationFontFaceMigration then normalizeFontFace(font) else nil
			})
		})
	})
end

return inputBoxWithCharacterCounter