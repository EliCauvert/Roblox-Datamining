local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local AuthCommonModule = require(CorePackages.Workspace.Packages.AuthCommon)
local GenericTextBox = AuthCommonModule.Components.GenericTextBox
local PasswordBox = AuthCommonModule.Components.PasswordBox
local PromiseModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Promise)
local TextBoxStateWrapper = AuthCommonModule.Components.TextBoxStateWrapper
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local ExtendResult = RoactModule.PureComponent:extend(script.Name)

local function OnChanged()
	-- upvalues: PromiseModule (copy)
	return PromiseModule.resolve(true)
end

ExtendResult.defaultProps = {
	onChanged = OnChanged,
	onFocused = OnChanged,
	setError = OnChanged,
	setValue = OnChanged,
	textInputType = Enum.TextInputType.NoSuggestions,
	validate = OnChanged
}

function ExtendResult.init(p1)
	function p1.validateAndSetStateForInput(p2)
		-- upvalues: p1 (copy)
		local Text = p2.text
		p1.props.onChanged(Text)
		p1.props.setValue(Text)
		p1.props.validate(Text):andThen(p1.props.setError):catch(print)
	end
end

function ExtendResult.render(p1)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), TextBoxStateWrapper (copy), PasswordBox (copy), GenericTextBox (copy)
	local ErrorText = p1.props.errorText
	local HelpComponent = p1.props.helpComponent
	local LabelText = p1.props.labelText
	local LayoutOrder = p1.props.layoutOrder
	local OnFocused = p1.props.onFocused
	local PlaceholderText = p1.props.placeholderText
	local TextInputType = p1.props.textInputType
	local SetValue = p1.props.setValue
	
	return WithStyleFunction(function(p2)
		-- upvalues: RoactModule (upval), TextBoxStateWrapper (upval), TextInputType (copy), PasswordBox (upval), GenericTextBox (upval), ErrorText (copy), SetValue (copy), HelpComponent (copy), LabelText (copy), LayoutOrder (copy), p1 (copy), OnFocused (copy), PlaceholderText (copy)
		return RoactModule.createElement(TextBoxStateWrapper, {
			ChildClass = TextInputType == Enum.TextInputType.Password and PasswordBox or GenericTextBox,
			ErrorState = ErrorText ~= nil,
			ErrorText = SetValue ~= "" and ErrorText,
			HelpComponent = HelpComponent,
			LabelText = LabelText,
			LayoutOrder = LayoutOrder,
			Size = UDim2.new(1, 0, 0, 36),
			ChildProps = {
				ClearTextOnFocus = false,
				PaddingX = 12,
				Text = "",
				Color = p2.Theme.BackgroundUIContrast.Color,
				Font = p2.Font.Body.Font,
				onChangeText = p1.validateAndSetStateForInput,
				onFocused = OnFocused,
				PlaceholderColor = p2.Theme.UIDefault.Color,
				PlaceholderText = PlaceholderText,
				TextColor = p2.Theme.TextDefault.Color,
				TextInputType = TextInputType,
				TextSize = p2.Font.BaseSize * p2.Font.Body.RelativeSize,
				TextTransparency = p2.Theme.TextDefault.Transparency,
				TextXAlignment = Enum.TextXAlignment.Left,
				Transparency = p2.Theme.BackgroundUIContrast.Transparency
			}
		})
	end)
end

return ExtendResult