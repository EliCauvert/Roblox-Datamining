local AuthCommon = script:FindFirstAncestor("AuthCommon")
local Parent = AuthCommon.Parent
local RoactModule = require(Parent.Roact)
local WithStyleFunction = require(Parent.UIBlox).Style.withStyle
local PasswordBoxModule = require(AuthCommon.Components.PasswordBox)
local GenericTextBoxModule = require(AuthCommon.Components.GenericTextBox)
local AuthStatefulRoundCornerBorderModule = require(AuthCommon.Components.AuthStatefulRoundCornerBorder)
local GetFFlagEnableAuthStatefulTextInputUpdatesFunction = require(Parent.SharedFlags).GetFFlagEnableAuthStatefulTextInputUpdates
local ExtendResult = RoactModule.PureComponent:extend(script.Name)
ExtendResult.defaultProps = {
	text = "",
	textInputHeight = 30,
	textInputListPadding = 12,
	textInputType = Enum.TextInputType.NoSuggestions,
	borderState = AuthStatefulRoundCornerBorderModule.BorderState.Default
}

function ExtendResult.render(p1)
	-- upvalues: GetFFlagEnableAuthStatefulTextInputUpdatesFunction (copy), WithStyleFunction (copy), RoactModule (copy), AuthStatefulRoundCornerBorderModule (copy), PasswordBoxModule (copy), GenericTextBoxModule (copy)
	local Text = p1.props.text
	local TextInputType = p1.props.textInputType
	local TextInputHeight = p1.props.textInputHeight
	local TextInputListPadding = if GetFFlagEnableAuthStatefulTextInputUpdatesFunction() then p1.props.textInputListPadding else 12
	local LayoutOrder = p1.props.layoutOrder
	local BorderState = p1.props.borderState
	local PlaceholderText = p1.props.placeholderText
	local OnChangeTextCallback = p1.props.onChangeTextCallback
	local OnFocused = p1.props.onFocused
	local OnFocusLost = p1.props.onFocusLost
	local LabelText = p1.props.labelText
	local ErrorText = p1.props.errorText
	local MaxLength = p1.props.maxLength
	local IsTextInputTypeMatch = p1.props.textInputType == Enum.TextInputType.Password
	
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy), RoactModule (upval), LayoutOrder (copy), TextInputListPadding (copy), LabelText (copy), AuthStatefulRoundCornerBorderModule (upval), TextInputHeight (copy), GetFFlagEnableAuthStatefulTextInputUpdatesFunction (upval), BorderState (copy), IsTextInputTypeMatch (copy), PasswordBoxModule (upval), Text (copy), PlaceholderText (copy), OnChangeTextCallback (copy), GenericTextBoxModule (upval), TextInputType (copy), OnFocused (copy), OnFocusLost (copy), MaxLength (copy), ErrorText (copy)
		local BodyFont = p2.Font.Body.Font
		local ScaledBaseSize = p2.Font.BaseSize * p2.Font.Body.RelativeSize
		local Color = p2.Theme.TextDefault.Color
		local Transparency = p2.Theme.TextDefault.Transparency
		local Color1 = p2.Theme.BackgroundUIContrast.Color
		local Transparency1 = p2.Theme.BackgroundUIContrast.Transparency
		local Color2 = p2.Theme.UIDefault.Color
		local Color3 = p2.Theme.TextEmphasis.Color
		
		if p1.props.placeholderTextColor then
			Color2 = p1.props.placeholderTextColor
		end
		if p1.props.labelTextColor then
			Color3 = p1.props.labelTextColor
		end
		if p1.props.textBarColor then
			Color1 = p1.props.textBarColor
		end
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = LayoutOrder,
			Size = UDim2.new(1, 0, 0, 0)
		}, {
			ListLayout = RoactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				Padding = UDim.new(0, TextInputListPadding)
			}),
			TextBoxLabel = LabelText and RoactModule.createElement("TextLabel", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				TextWrapped = true,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Text = LabelText,
				Font = p2.Font.CaptionHeader.Font,
				TextSize = p2.Font.BaseSize * p2.Font.CaptionHeader.RelativeSize,
				TextColor3 = Color3,
				TextTransparency = p2.Theme.TextEmphasis.Transparency,
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			TextBox = RoactModule.createElement(AuthStatefulRoundCornerBorderModule, {
				size = UDim2.new(1, 0, 0, TextInputHeight),
				layoutOrder = if GetFFlagEnableAuthStatefulTextInputUpdatesFunction() then 2 else LayoutOrder,
				borderState = BorderState
			}, {
				PasswordBox = IsTextInputTypeMatch and RoactModule.createElement(PasswordBoxModule, {
					ManualFocusRelease = false,
					CaptureFocusOnTapStart = true,
					LayoutOrder = if GetFFlagEnableAuthStatefulTextInputUpdatesFunction() then nil else 2,
					Size = UDim2.new(1, 0, 1, 0),
					Color = Color1,
					Transparency = Transparency1,
					TextSize = ScaledBaseSize,
					TextColor = Color,
					TextTransparency = Transparency,
					TextXAlignment = Enum.TextXAlignment.Left,
					Text = Text,
					PlaceholderText = PlaceholderText,
					PlaceholderColor3 = Color2,
					onChangeText = OnChangeTextCallback
				}),
				GenericTextBox = not IsTextInputTypeMatch and RoactModule.createElement(GenericTextBoxModule, {
					ClearTextOnFocus = false,
					PaddingX = 12,
					LayoutOrder = if GetFFlagEnableAuthStatefulTextInputUpdatesFunction() then nil else 2,
					Size = UDim2.new(1, 0, 1, 0),
					Text = Text,
					Font = BodyFont,
					TextSize = ScaledBaseSize,
					TextColor = Color,
					TextTransparency = Transparency,
					TextXAlignment = Enum.TextXAlignment.Left,
					Color = Color1,
					Transparency = Transparency1,
					TextInputType = TextInputType,
					onChangeText = OnChangeTextCallback,
					PlaceholderText = PlaceholderText,
					PlaceholderColor = Color2,
					onFocused = OnFocused,
					onFocusLost = OnFocusLost,
					TextBoxRef = if GetFFlagEnableAuthStatefulTextInputUpdatesFunction then p1.props.textBoxRef else nil,
					maxLength = MaxLength
				})
			}),
			ErrorText = ErrorText and RoactModule.createElement("TextLabel", {
				LayoutOrder = 3,
				BackgroundTransparency = 1,
				TextWrapped = true,
				Text = ErrorText,
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

return ExtendResult