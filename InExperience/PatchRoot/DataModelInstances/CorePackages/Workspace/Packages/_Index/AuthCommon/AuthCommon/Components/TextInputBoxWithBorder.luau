local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local roactModule = require(parent.Roact)
local withStyle = require(parent.UIBlox).Style.withStyle
local passwordBoxModule = require(authCommon.Components.PasswordBox)
local genericTextBoxModule = require(authCommon.Components.GenericTextBox)
local authStatefulRoundCornerBorderModule = require(authCommon.Components.AuthStatefulRoundCornerBorder)
local getFFlagEnableAuthStatefulTextInputUpdates = require(parent.SharedFlags).GetFFlagEnableAuthStatefulTextInputUpdates
local name = roactModule.PureComponent:extend(script.Name)
name.defaultProps = {
	text = "",
	textInputHeight = 30,
	textInputListPadding = 12,
	textInputType = Enum.TextInputType.NoSuggestions,
	borderState = authStatefulRoundCornerBorderModule.BorderState.Default
}

function name.render(p1)
	-- upvalues: getFFlagEnableAuthStatefulTextInputUpdates (ref), withStyle (ref), roactModule (ref), authStatefulRoundCornerBorderModule (ref), passwordBoxModule (ref), genericTextBoxModule (ref)
	local text = p1.props.text
	local textInputType = p1.props.textInputType
	local textInputHeight = p1.props.textInputHeight
	local var1 = if getFFlagEnableAuthStatefulTextInputUpdates() then p1.props.textInputListPadding else 12
	local layoutOrder = p1.props.layoutOrder
	local borderState = p1.props.borderState
	local placeholderText = p1.props.placeholderText
	local onChangeTextCallback = p1.props.onChangeTextCallback
	local onFocused = p1.props.onFocused
	local onFocusLost = p1.props.onFocusLost
	local labelText = p1.props.labelText
	local errorText = p1.props.errorText
	local maxLength = p1.props.maxLength
	local var2 = p1.props.textInputType == Enum.TextInputType.Password
	
	return withStyle(function(p2)
		-- upvalues: p1 (ref), roactModule (copy), layoutOrder (ref), var1 (ref), labelText (ref), authStatefulRoundCornerBorderModule (copy), textInputHeight (ref), getFFlagEnableAuthStatefulTextInputUpdates (copy), borderState (ref), var2 (ref), passwordBoxModule (copy), text (ref), placeholderText (ref), onChangeTextCallback (ref), genericTextBoxModule (copy), textInputType (ref), onFocused (ref), onFocusLost (ref), maxLength (ref), errorText (ref)
		local font = p2.Font.Body.Font
		local var3 = p2.Font.BaseSize * p2.Font.Body.RelativeSize
		local color = p2.Theme.TextDefault.Color
		local transparency = p2.Theme.TextDefault.Transparency
		local color_1 = p2.Theme.BackgroundUIContrast.Color
		local transparency_1 = p2.Theme.BackgroundUIContrast.Transparency
		local color_2 = p2.Theme.UIDefault.Color
		local color_3 = p2.Theme.TextEmphasis.Color
		
		if p1.props.placeholderTextColor then
			color_2 = p1.props.placeholderTextColor
		end
		if p1.props.labelTextColor then
			color_3 = p1.props.labelTextColor
		end
		if p1.props.textBarColor then
			color_1 = p1.props.textBarColor
		end
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = layoutOrder,
			Size = UDim2.new(1, 0, 0, 0)
		}, {
			ListLayout = roactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				Padding = UDim.new(0, var1)
			}),
			TextBoxLabel = labelText and roactModule.createElement("TextLabel", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				TextWrapped = true,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Text = labelText,
				Font = p2.Font.CaptionHeader.Font,
				TextSize = p2.Font.BaseSize * p2.Font.CaptionHeader.RelativeSize,
				TextColor3 = color_3,
				TextTransparency = p2.Theme.TextEmphasis.Transparency,
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			TextBox = roactModule.createElement(authStatefulRoundCornerBorderModule, {
				size = UDim2.new(1, 0, 0, textInputHeight),
				layoutOrder = if getFFlagEnableAuthStatefulTextInputUpdates() then 2 else layoutOrder,
				borderState = borderState
			}, {
				PasswordBox = var2 and roactModule.createElement(passwordBoxModule, {
					ManualFocusRelease = false,
					CaptureFocusOnTapStart = true,
					LayoutOrder = if not getFFlagEnableAuthStatefulTextInputUpdates() then 2 else nil,
					Size = UDim2.new(1, 0, 1, 0),
					Color = color_1,
					Transparency = transparency_1,
					TextSize = var3,
					TextColor = color,
					TextTransparency = transparency,
					TextXAlignment = Enum.TextXAlignment.Left,
					Text = text,
					PlaceholderText = placeholderText,
					PlaceholderColor3 = color_2,
					onChangeText = onChangeTextCallback
				}),
				GenericTextBox = not var2 and roactModule.createElement(genericTextBoxModule, {
					ClearTextOnFocus = false,
					PaddingX = 12,
					LayoutOrder = if not getFFlagEnableAuthStatefulTextInputUpdates() then 2 else nil,
					Size = UDim2.new(1, 0, 1, 0),
					Text = text,
					Font = font,
					TextSize = var3,
					TextColor = color,
					TextTransparency = transparency,
					TextXAlignment = Enum.TextXAlignment.Left,
					Color = color_1,
					Transparency = transparency_1,
					TextInputType = textInputType,
					onChangeText = onChangeTextCallback,
					PlaceholderText = placeholderText,
					PlaceholderColor = color_2,
					onFocused = onFocused,
					onFocusLost = onFocusLost,
					TextBoxRef = if getFFlagEnableAuthStatefulTextInputUpdates then p1.props.textBoxRef else nil,
					maxLength = maxLength
				})
			}),
			ErrorText = errorText and roactModule.createElement("TextLabel", {
				LayoutOrder = 3,
				BackgroundTransparency = 1,
				TextWrapped = true,
				Text = errorText,
				TextSize = p2.Font.CaptionBody.RelativeSize * p2.Font.BaseSize,
				Font = p2.Font.SubHeader1.Font,
				TextColor3 = p2.Theme.Alert.Color,
				TextXAlignment = Enum.TextXAlignment.Left,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0)
			})
		})
	end)
end

return name