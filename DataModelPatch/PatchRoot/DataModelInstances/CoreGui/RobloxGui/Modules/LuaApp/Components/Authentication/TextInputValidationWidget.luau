local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local Text = require(CorePackages.Workspace.Packages.AppCommonLib).Text
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local AuthCommonModule = require(CorePackages.Workspace.Packages.AuthCommon)
local AuthBackAndNextButtonModule = require(Modules.LuaApp.Components.Authentication.AuthBackAndNextButton)
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local GetImageDataFunction = require(CorePackages.Workspace.Packages.RobloxAppAssets).GetImageData
local IssueTrackerModule = require(Modules.LuaApp.Components.Authentication.IssueTracker)
local PasswordBox = AuthCommonModule.Components.PasswordBox
local FitChildrenModule = require(Modules.LuaApp.FitChildren)
local GenericTextBox = AuthCommonModule.Components.GenericTextBox
local AuthStatefulRoundCornerBorder = AuthCommonModule.Components.AuthStatefulRoundCornerBorder
local WithStyleFunction = UIBloxModule.Style.withStyle
local InputValidity = require(CorePackages.Workspace.Packages.AuthCommon).Enums.InputValidity
local TextInputValidationWidget = RoactModule.PureComponent:extend("TextInputValidationWidget")
TextInputValidationWidget.defaultProps = {
	captureFocusOnMount = false,
	continueButtonActionInProgress = false
}

function TextInputValidationWidget.init(p1)
	-- upvalues: InputValidity (copy), RoactModule (copy), Text (copy), WithStyleFunction (copy), WithLocalizationModule (copy), PasswordBox (copy), GenericTextBox (copy)
	p1.state = {
		inputTextToValidate = "",
		validatedInputText = "",
		textBoxFocused = false,
		inputValidity = InputValidity.Unvalidated,
		inputTextBoxAlignment = Enum.TextXAlignment.Left
	}
	p1.isMounted = false
	p1.inputBoxRef = RoactModule.createRef()
	
	function p1.onInputTextChanged(Frame)
		-- upvalues: p1 (copy)
		p1.updateTextBoxAlignment(Frame)
		p1.textInputChangedCallback(Frame)
	end
	
	function p1.updateTextBoxAlignment(Frame)
		-- upvalues: p1 (copy), Text (upval)
		local InputTextBoxAlignment = p1.state.inputTextBoxAlignment
		local Right = nil
		Right = if Frame.AbsoluteSize.X < Text.GetTextWidth(Frame.Text, Frame.Font, Frame.TextSize) then Enum.TextXAlignment.Right else Enum.TextXAlignment.Left
		spawn(function()
			-- upvalues: p1 (upval), InputTextBoxAlignment (copy), Right (ref)
			if p1.isMounted and InputTextBoxAlignment ~= Right then
				p1:setState({ inputTextBoxAlignment = Right })
			end
		end)
	end
	
	function p1.textInputChangedCallback(Frame)
		-- upvalues: p1 (copy)
		spawn(function()
			-- upvalues: p1 (upval), Frame (copy)
			if p1.isMounted then
				p1:setState({ inputTextToValidate = Frame.Text })
			end
		end)
	end
	
	function p1.onTextValidated(ValidatedInputText, InputValid)
		-- upvalues: p1 (copy)
		spawn(function()
			-- upvalues: p1 (upval), ValidatedInputText (copy), InputValid (copy)
			if p1.isMounted and p1.state.inputTextToValidate == ValidatedInputText then
				p1:setState({
					validatedInputText = ValidatedInputText,
					inputValid = InputValid,
					inputValidity = InputValid
				})
			end
		end)
	end
	
	function p1:continueButtonActivated()
		-- upvalues: p1 (copy), InputValidity (upval)
		if p1.state.inputValidity == InputValidity.Valid and p1.props.continueButtonActivated then
			p1.props.continueButtonActivated(p1.state.inputTextToValidate)
		end
	end
	
	function p1.onTextInputBoxFocused()
		-- upvalues: p1 (copy)
		spawn(function()
			-- upvalues: p1 (upval)
			if p1.isMounted then
				p1:setState({ textBoxFocused = true })
				p1.props.textInputOnFocus()
			end
		end)
	end
	
	function p1.onTextInputBoxFocusLost()
		-- upvalues: p1 (copy)
		spawn(function()
			-- upvalues: p1 (upval)
			if p1.isMounted then
				p1:setState({ textBoxFocused = false })
			end
		end)
	end
	
	function p1.textInputBox(p2)
		-- upvalues: WithStyleFunction (upval), p1 (copy), WithLocalizationModule (upval), RoactModule (upval), PasswordBox (upval), GenericTextBox (upval)
		return WithStyleFunction(function(p3)
			-- upvalues: p1 (upval), p2 (copy), WithLocalizationModule (upval), RoactModule (upval), PasswordBox (upval), GenericTextBox (upval)
			local InputTextBoxAlignment = p1.state.inputTextBoxAlignment
			local BodyFont = p3.Font.Body.Font
			local ScaledBaseSize = p3.Font.BaseSize * p3.Font.Body.RelativeSize
			local Color = p3.Theme.TextDefault.Color
			local Transparency = p3.Theme.TextDefault.Transparency
			local Color1 = p3.Theme.BackgroundUIContrast.Color
			local Transparency1 = p3.Theme.BackgroundUIContrast.Transparency
			local Color2 = p3.Theme.UIDefault.Color
			local LayoutOrder = p2.layoutOrder
			local TextInputType = p1.props.textInputType
			local ReturnKeyType = p1.props.returnKeyType
			
			return WithLocalizationModule({
				passwordPlaceholderText = "Authentication.Login.Label.Password",
				usernamePlaceholderText = "Authentication.Login.Label.Username"
			})(function(p4)
				-- upvalues: TextInputType (copy), RoactModule (upval), PasswordBox (upval), LayoutOrder (copy), Color1 (copy), ScaledBaseSize (copy), Color (copy), Transparency (copy), ReturnKeyType (copy), p1 (upval), Color2 (copy), GenericTextBox (upval), BodyFont (copy), InputTextBoxAlignment (copy), Transparency1 (copy)
				return if TextInputType == Enum.TextInputType.Password then RoactModule.createElement(PasswordBox, {
					Text = "",
					LayoutOrder = LayoutOrder,
					Size = UDim2.new(1, 0, 0, 36),
					Position = UDim2.new(0, 0, 0, 0),
					Color = Color1,
					TextSize = ScaledBaseSize,
					TextColor = Color,
					TextTransparency = Transparency,
					ReturnKeyType = ReturnKeyType,
					TextBoxRef = p1.inputBoxRef,
					onChangeText = p1.onInputTextChanged,
					onReturnPressedFromOnScreenKeyboard = p1.continueButtonActivated,
					onFocused = p1.onTextInputBoxFocused,
					onFocusLost = p1.onTextInputBoxFocusLost,
					PlaceholderText = p4.passwordPlaceholderText,
					PlaceholderColor = Color2
				}) else RoactModule.createElement(GenericTextBox, {
					Text = "",
					ClearTextOnFocus = false,
					PaddingX = 8,
					LayoutOrder = LayoutOrder,
					Size = UDim2.new(1, 0, 0, 36),
					Font = BodyFont,
					TextSize = ScaledBaseSize,
					onChangeText = p1.onInputTextChanged,
					TextXAlignment = InputTextBoxAlignment,
					TextColor = Color,
					TextTransparency = Transparency,
					Color = Color1,
					Transparency = Transparency1,
					TextInputType = TextInputType,
					ReturnKeyType = ReturnKeyType,
					TextBoxRef = p1.inputBoxRef,
					onReturnPressedFromOnScreenKeyboard = p1.continueButtonActivated,
					onFocused = p1.onTextInputBoxFocused,
					onFocusLost = p1.onTextInputBoxFocusLost,
					PlaceholderText = p4.usernamePlaceholderText,
					PlaceholderColor = Color2
				})
			end)
		end)
	end
end

TextInputValidationWidget.defaultProps = {
	widgetHeight = 0,
	continueButtonKey = "Authentication.SignUp.Label.Continue"
}

function TextInputValidationWidget.didMount(p1)
	p1.isMounted = true
	local CaptureFocusOnMount = p1.props.captureFocusOnMount
	spawn(function()
		-- upvalues: CaptureFocusOnMount (copy), p1 (copy)
		if CaptureFocusOnMount and p1.inputBoxRef.current then
			p1.inputBoxRef.current:captureFocus()
		end
	end)
end

function TextInputValidationWidget.willUnmount(p1)
	p1.isMounted = false
end

function TextInputValidationWidget.render(p1)
	-- upvalues: FormFactor (copy), WithStyleFunction (copy), WithLocalizationModule (copy), AuthStatefulRoundCornerBorder (copy), InputValidity (copy), RoactModule (copy), ImageSetLabel (copy), GetImageDataFunction (copy), FitChildrenModule (copy), IssueTrackerModule (copy), AuthBackAndNextButtonModule (copy)
	local WidgetHeight = p1.props.widgetHeight
	local ContinueButtonKey = p1.props.continueButtonKey
	local ContinueButtonActionInProgress = p1.props.continueButtonActionInProgress
	local IsFormFactorMatch = p1.props.formFactor == FormFactor.WIDE
	local Validator = p1.props.validator
	local ValidatorAdditionalProps = p1.props.validatorAdditionalProps
	local InputTextToValidate = p1.state.inputTextToValidate
	
	return WithStyleFunction(function(p2)
		-- upvalues: WithLocalizationModule (upval), ContinueButtonKey (copy), AuthStatefulRoundCornerBorder (upval), p1 (copy), InputValidity (upval), IsFormFactorMatch (copy), RoactModule (upval), ImageSetLabel (upval), WidgetHeight (copy), GetImageDataFunction (upval), FitChildrenModule (upval), IssueTrackerModule (upval), Validator (copy), ValidatorAdditionalProps (copy), InputTextToValidate (copy), AuthBackAndNextButtonModule (upval), ContinueButtonActionInProgress (copy)
		return WithLocalizationModule({ ["continue"] = ContinueButtonKey })(function(p3)
			-- upvalues: p2 (copy), AuthStatefulRoundCornerBorder (upval), p1 (upval), InputValidity (upval), IsFormFactorMatch (upval), RoactModule (upval), ImageSetLabel (upval), WidgetHeight (upval), GetImageDataFunction (upval), FitChildrenModule (upval), IssueTrackerModule (upval), Validator (upval), ValidatorAdditionalProps (upval), InputTextToValidate (upval), AuthBackAndNextButtonModule (upval), ContinueButtonActionInProgress (upval)
			local Transparency = p2.Theme.BackgroundDefault.Transparency
			local Default = AuthStatefulRoundCornerBorder.BorderState.Default
			local IsInputValidityMatch = p1.state.inputValidity == InputValidity.Valid
			
			if p1.state.inputValidity == InputValidity.Invalid then
				Default = AuthStatefulRoundCornerBorder.BorderState.Error
			elseif p1.state.textBoxFocused then
				Default = AuthStatefulRoundCornerBorder.BorderState.Focused
			end
			if IsFormFactorMatch then
				Transparency = 1
			end
			return RoactModule.createElement(ImageSetLabel, {
				BorderSizePixel = 0,
				ClipsDescendants = true,
				Size = UDim2.new(1, 0, 0, WidgetHeight),
				BackgroundColor3 = p2.Theme.BackgroundDefault.Color,
				BackgroundTransparency = Transparency,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(9, 9, 9, 9),
				Image = GetImageDataFunction("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill",
				ImageColor3 = p2.Theme.BackgroundDefault.Color,
				ImageTransparency = p2.Theme.BackgroundDefault.Transparency
			}, {
				UIPadding = RoactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 8),
					PaddingRight = UDim.new(0, 12),
					PaddingLeft = UDim.new(0, 12),
					PaddingBottom = UDim.new(0, 8)
				}),
				UsernameInputField = RoactModule.createElement(FitChildrenModule.FitFrame, {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					fitAxis = FitChildrenModule.FitAxis.Height
				}, {
					UIListLayout = RoactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, 5)
					}),
					TextInputBorder = RoactModule.createElement(AuthStatefulRoundCornerBorder, {
						layoutOrder = 1,
						size = UDim2.new(1, 0, 0, 36),
						borderState = Default
					}, { TextInput = RoactModule.createElement(p1.textInputBox) }),
					IssueTrackerWrapper = RoactModule.createElement(FitChildrenModule.FitFrame, {
						LayoutOrder = 2,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, 0),
						fitAxis = FitChildrenModule.FitAxis.Height
					}, {
						Padding = RoactModule.createElement("UIPadding", {
							PaddingRight = UDim.new(0, 12),
							PaddingLeft = UDim.new(0, 12)
						}),
						IssueTracker = RoactModule.createElement(IssueTrackerModule, {
							height = WidgetHeight - 36 - 36 - 16 - 5,
							validator = Validator,
							validatorAdditionalProps = ValidatorAdditionalProps,
							textToValidate = InputTextToValidate,
							onTextValidated = p1.onTextValidated
						})
					})
				}),
				AuthBackAndNextButton = RoactModule.createElement(AuthBackAndNextButtonModule, {
					size = UDim2.new(1, 0, 0, 36),
					position = UDim2.new(0.5, 0, 1, 0),
					anchorPoint = Vector2.new(0.5, 1),
					backButtonIsDisabled = ContinueButtonActionInProgress,
					nextButtonText = p3["continue"],
					nextButtonIsDisabled = not IsInputValidityMatch,
					nextButtonIsLoading = ContinueButtonActionInProgress,
					nextButtonOnActivated = p1.continueButtonActivated
				})
			})
		end)
	end)
end

return TextInputValidationWidget