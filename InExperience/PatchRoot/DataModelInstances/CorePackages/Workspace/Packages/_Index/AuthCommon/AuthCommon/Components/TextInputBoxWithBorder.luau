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

function name.render(p0) --[[ line: 29 ]]
	-- upvalues: getFFlagEnableAuthStatefulTextInputUpdates (ref), withStyle (ref), roactModule (ref), authStatefulRoundCornerBorderModule (ref), passwordBoxModule (ref), genericTextBoxModule (ref)
	local text = p0.props.text
	local textInputType = p0.props.textInputType
	local textInputHeight = p0.props.textInputHeight
	local var6 = if getFFlagEnableAuthStatefulTextInputUpdates() then p0.props.textInputListPadding else 12
	local layoutOrder = p0.props.layoutOrder
	local borderState = p0.props.borderState
	local placeholderText = p0.props.placeholderText
	local onChangeTextCallback = p0.props.onChangeTextCallback
	local onFocused = p0.props.onFocused
	local onFocusLost = p0.props.onFocusLost
	local labelText = p0.props.labelText
	local errorText = p0.props.errorText
	local maxLength = p0.props.maxLength
	local var7 = p0.props.textInputType == Enum.TextInputType.Password
	
	return withStyle(function(p1) --[[ line: 48 ]]
		-- upvalues: p0 (ref), roactModule (copy), layoutOrder (ref), var6 (ref), labelText (ref), authStatefulRoundCornerBorderModule (copy), textInputHeight (ref), getFFlagEnableAuthStatefulTextInputUpdates (copy), borderState (ref), var7 (ref), passwordBoxModule (copy), text (ref), placeholderText (ref), onChangeTextCallback (ref), genericTextBoxModule (copy), textInputType (ref), onFocused (ref), onFocusLost (ref), maxLength (ref), errorText (ref)
		local font = p1.Font.Body.Font
		local var8 = p1.Font.BaseSize * p1.Font.Body.RelativeSize
		local color = p1.Theme.TextDefault.Color
		local transparency = p1.Theme.TextDefault.Transparency
		local color_1 = p1.Theme.BackgroundUIContrast.Color
		local transparency_1 = p1.Theme.BackgroundUIContrast.Transparency
		local color_2 = p1.Theme.UIDefault.Color
		local color_3 = p1.Theme.TextEmphasis.Color
		
		if p0.props.placeholderTextColor then
			color_2 = p0.props.placeholderTextColor
		end
		if p0.props.labelTextColor then
			color_3 = p0.props.labelTextColor
		end
		if p0.props.textBarColor then
			color_1 = p0.props.textBarColor
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
				Padding = UDim.new(0, var6)
			}),
			TextBoxLabel = labelText and roactModule.createElement("TextLabel", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				TextWrapped = true,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Text = labelText,
				Font = p1.Font.CaptionHeader.Font,
				TextSize = p1.Font.BaseSize * p1.Font.CaptionHeader.RelativeSize,
				TextColor3 = color_3,
				TextTransparency = p1.Theme.TextEmphasis.Transparency,
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			TextBox = roactModule.createElement(authStatefulRoundCornerBorderModule, {
				size = UDim2.new(1, 0, 0, textInputHeight),
				layoutOrder = if getFFlagEnableAuthStatefulTextInputUpdates() then 2 else layoutOrder,
				borderState = borderState
			}, {
				PasswordBox = var7 and roactModule.createElement(passwordBoxModule, {
					ManualFocusRelease = false,
					CaptureFocusOnTapStart = true,
					LayoutOrder = if not getFFlagEnableAuthStatefulTextInputUpdates() then 2 else nil,
					Size = UDim2.new(1, 0, 1, 0),
					Color = color_1,
					Transparency = transparency_1,
					TextSize = var8,
					TextColor = color,
					TextTransparency = transparency,
					TextXAlignment = Enum.TextXAlignment.Left,
					Text = text,
					PlaceholderText = placeholderText,
					PlaceholderColor3 = color_2,
					onChangeText = onChangeTextCallback
				}),
				GenericTextBox = not var7 and roactModule.createElement(genericTextBoxModule, {
					ClearTextOnFocus = false,
					PaddingX = 12,
					LayoutOrder = if not getFFlagEnableAuthStatefulTextInputUpdates() then 2 else nil,
					Size = UDim2.new(1, 0, 1, 0),
					Text = text,
					Font = font,
					TextSize = var8,
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
					TextBoxRef = if getFFlagEnableAuthStatefulTextInputUpdates then p0.props.textBoxRef else nil,
					maxLength = maxLength
				})
			}),
			ErrorText = errorText and roactModule.createElement("TextLabel", {
				LayoutOrder = 3,
				BackgroundTransparency = 1,
				TextWrapped = true,
				Text = errorText,
				TextSize = p1.Font.CaptionBody.RelativeSize * p1.Font.BaseSize,
				Font = p1.Font.SubHeader1.Font,
				TextColor3 = p1.Theme.Alert.Color,
				TextXAlignment = Enum.TextXAlignment.Left,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0)
			})
		})
	end)
end

return name