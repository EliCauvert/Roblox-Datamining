local AccountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local Parent = AccountUpgrade.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local AuthCommonModule = require(Parent.AuthCommon)
local AuthSignupModule = require(Parent.AuthSignup)
local UsernameFieldWithSuggestionsModule = require(script.Parent.UsernameFieldWithSuggestions)
local AccountUpgradeFieldErrorModule = require(script.Parent.AccountUpgradeFieldError)
local AccountUpgradeFieldModule = require(AccountUpgrade.AccountUpgradeField)
local _ = require(AccountUpgrade.Utils.resolveFieldStates)
local GetFFlagAuthCollapsingValidatorFoundationInputFunction = require(Parent.SharedFlags).GetFFlagAuthCollapsingValidatorFoundationInput
local CollapsingTextInputValidator = AuthSignupModule.Components.CollapsingTextInputValidator
local PasswordValidator = AuthSignupModule.Thunks.PasswordValidator
local View = FoundationModule.View
local Text = FoundationModule.Text
local Icon = FoundationModule.Icon
local InputLabel = FoundationModule.InputLabel
local TextInput = FoundationModule.TextInput
local Chip = FoundationModule.Chip
local InputSize = FoundationModule.Enums.InputSize
local InputLabelSize = FoundationModule.Enums.InputLabelSize
local ChipSize = FoundationModule.Enums.ChipSize
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local UIConstants = AuthCommonModule.Common.UIConstants
local UserGender = AuthCommonModule.Enums.UserGender
local FormatBoldRichTextFunction = AuthCommonModule.Utils.formatBoldRichText

return function(Frame)
	-- upvalues: InputSize (copy), InputLabelSize (copy), ChipSize (copy), FoundationModule (copy), UserGender (copy), GetFFlagAuthCollapsingValidatorFoundationInputFunction (copy), FormatBoldRichTextFunction (copy), ReactModule (copy), View (copy), AccountUpgradeFieldModule (copy), InputLabel (copy), Text (copy), Icon (copy), IconName (copy), IconSize (copy), UsernameFieldWithSuggestionsModule (copy), CollapsingTextInputValidator (copy), PasswordValidator (copy), UIConstants (copy), TextInput (copy), AccountUpgradeFieldErrorModule (copy), Chip (copy)
	local Form = Frame.form
	local IsSizeMatch = Frame.size == InputSize.Large
	local Large = if IsSizeMatch then InputSize.Large else InputSize.Medium
	local Large1 = if IsSizeMatch then InputLabelSize.Large else InputLabelSize.Medium
	local Large2 = if IsSizeMatch then ChipSize.Large else ChipSize.Medium
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local IsGenderMatch = Form.gender == UserGender.Female
	local IsGenderMatch1 = Form.gender == UserGender.Male
	local FFlagAuthCollapsingValidatorFoundationInput = GetFFlagAuthCollapsingValidatorFoundationInputFunction()
	local DefaultColor3 = UseTokensResult.Color.Content.Default.Color3
	local FieldStates = Form.fieldStates
	local IsBoldLabels: boolean = Frame.boldLabels == true or Form.boldFieldLabels == true
	
	local function _(p1)
		-- upvalues: IsBoldLabels (copy), FormatBoldRichTextFunction (upval)
		return if IsBoldLabels then FormatBoldRichTextFunction(p1) else p1
	end
	
	local CreateElementFunction = ReactModule.createElement
	local config = {
		tag = "col gap-large size-full-0 auto-y",
		LayoutOrder = Frame.LayoutOrder
	}
	local t = {}
	local Element = nil
	
	if FieldStates[AccountUpgradeFieldModule.Birthday] == nil then
		Element = nil
	else
		local BirthdayLabel = Form.birthdayLabel
		Element = ReactModule.createElement(View, {
			tag = "col gap-small size-full-0 auto-y",
			LayoutOrder = 1
		}, {
			Label = ReactModule.createElement(InputLabel, {
				isRequired = true,
				LayoutOrder = 1,
				testId = "AccountUpgradeBirthdayLabel",
				Text = if IsBoldLabels then FormatBoldRichTextFunction(BirthdayLabel) else BirthdayLabel,
				RichText = IsBoldLabels,
				size = Large1
			}),
			BirthdayButton = ReactModule.createElement(View, {
				LayoutOrder = 2,
				testId = "AccountUpgradeBirthdayField",
				tag = {
					["row flex-between align-y-center padding-medium stroke-standard stroke-position-inner radius-medium stroke-emphasis"] = true,
					["size-full-1000"] = not IsSizeMatch,
					["size-full-1200"] = IsSizeMatch
				},
				onActivated = Form.onBirthdayActivated
			}, {
				Text = ReactModule.createElement(Text, {
					LayoutOrder = 1,
					Text = if Form.birthdayText == "" then Form.birthdayPlaceholder else Form.birthdayText,
					tag = {
						["auto-xy text-align-x-left"] = true,
						["text-body-medium"] = not IsSizeMatch,
						["text-body-large"] = IsSizeMatch,
						["content-emphasis"] = Form.birthdayText ~= "",
						["content-muted"] = Form.birthdayText == ""
					}
				}),
				CalendarIcon = ReactModule.createElement(Icon, {
					LayoutOrder = 2,
					testId = "AccountUpgradeBirthdayIcon",
					name = IconName.Calendar,
					size = IconSize.Small,
					style = UseTokensResult.Color.Content.Muted
				})
			})
		})
	end
	t.BirthdayField = Element
	t.UsernameField = if FieldStates[AccountUpgradeFieldModule.Username] == nil then nil else ReactModule.createElement(UsernameFieldWithSuggestionsModule, {
		LayoutOrder = 2,
		titleTextKey = Form.usernameTitleTextKey,
		isTitleBold = IsBoldLabels,
		inputSize = Large,
		titleSize = Large1,
		summaryErrorTextKey = Form.usernameSummaryErrorTextKey,
		isPrerequisiteMet = Form.isUsernamePrerequisiteMet,
		validatorAdditionalProps = Form.usernameValidatorAdditionalProps,
		placeholderText = Form.usernamePlaceholder,
		username = Form.username,
		prefilledUsername = Form.prefilledUsername,
		suggestions = Form.usernameSuggestions,
		suggestionPrompt = Form.usernameSuggestionPrompt,
		eventContext = Form.usernameSuggestionEventContext,
		onSuggestionSelected = Form.onUsernameSuggestionSelected,
		pillClicked = Form.pillClicked,
		updatePillClicked = Form.updatePillClicked,
		resetPillClicked = Form.resetPillClicked,
		onTextChanged = Form.onUsernameChanged,
		onTextValidated = Form.onUsernameValidated,
		onFocused = Form.onUsernameFocused,
		onIssueConditionChanged = Form.onUsernameIssueConditionChanged,
		useFoundationTextInput = FFlagAuthCollapsingValidatorFoundationInput,
		contentGap = UseTokensResult.Gap.Small,
		colorContentOverride = DefaultColor3
	})
	t.PasswordField = if FieldStates[AccountUpgradeFieldModule.Password] == nil then nil else ReactModule.createElement(View, {
		tag = "col size-full-0 auto-y",
		LayoutOrder = 3,
		testId = "AccountUpgradePasswordField"
	}, {
		Validator = ReactModule.createElement(CollapsingTextInputValidator, {
			layoutOrder = 1,
			useFoundationTitle = true,
			foundationTitleIsRequired = true,
			paddingTopOverride = 0,
			useTrailingPadding = true,
			titleTextKey = Form.passwordTitleTextKey,
			summaryErrorTextKey = Form.passwordSummaryErrorTextKey,
			prerequisiteMet = Form.isPasswordPrerequisiteMet,
			placeholderText = Form.passwordPlaceholder,
			textInputType = if Form.hidePassword then Enum.TextInputType.Password else Enum.TextInputType.PasswordShown,
			returnKeyType = Enum.ReturnKeyType.Next,
			validator = PasswordValidator,
			validatorAdditionalProps = Form.passwordValidatorAdditionalProps,
			onInputTextChanged = Form.onPasswordChanged,
			onInputTextValidated = Form.onPasswordValidated,
			textBoxFocusedCallback = Form.onPasswordFocused,
			useFoundationTextInput = FFlagAuthCollapsingValidatorFoundationInput,
			foundationInputSize = Large,
			foundationTitleSize = Large1,
			foundationTitleIsBold = IsBoldLabels,
			foundationIconTrailing = {
				name = if Form.hidePassword then UIConstants.HIDE_PASSWORD_ICON else UIConstants.SHOW_PASSWORD_ICON,
				onActivated = Form.onPasswordVisibilityToggle
			},
			contentGapOverride = UseTokensResult.Gap.Small,
			colorContentOverride = DefaultColor3
		})
	})
	local Element1 = nil
	
	if FieldStates[AccountUpgradeFieldModule.Email] == nil then
		Element1 = nil
	else
		local EmailLabel = Form.emailLabel
		Element1 = ReactModule.createElement(View, {
			tag = "col gap-small size-full-0 auto-y",
			LayoutOrder = 4
		}, {
			Label = ReactModule.createElement(InputLabel, {
				LayoutOrder = 1,
				testId = "AccountUpgradeEmailLabel",
				Text = if IsBoldLabels then FormatBoldRichTextFunction(EmailLabel) else EmailLabel,
				RichText = IsBoldLabels,
				size = Large1
			}),
			Input = ReactModule.createElement(TextInput, {
				label = "",
				LayoutOrder = 2,
				testId = "AccountUpgradeEmailInput",
				text = Form.email,
				placeholder = Form.emailPlaceholder,
				textInputType = Enum.TextInputType.Email,
				onChanged = Form.onEmailChanged,
				hasError = Form.emailError ~= nil and Form.emailError ~= "",
				width = UDim.new(1, 0),
				size = Large
			}),
			Error = ReactModule.createElement(AccountUpgradeFieldErrorModule, { LayoutOrder = 3, text = Form.emailError })
		})
	end
	t.EmailField = Element1
	local Element2 = nil
	
	if FieldStates[AccountUpgradeFieldModule.Gender] == nil then
		Element2 = nil
	else
		local GenderLabel = Form.genderLabel
		Element2 = ReactModule.createElement(View, {
			tag = "col gap-small size-full-0 auto-y",
			LayoutOrder = 5
		}, {
			Label = ReactModule.createElement(InputLabel, {
				LayoutOrder = 1,
				testId = "AccountUpgradeGenderLabel",
				Text = if IsBoldLabels then FormatBoldRichTextFunction(GenderLabel) else GenderLabel,
				RichText = IsBoldLabels,
				size = Large1
			}),
			Options = ReactModule.createElement(View, {
				tag = "row gap-small size-full-0 auto-y",
				LayoutOrder = 2
			}, {
				Female = ReactModule.createElement(Chip, {
					LayoutOrder = 1,
					testId = "AccountUpgradeGenderFemale",
					text = Form.femaleText,
					leading = IconName.HeadFemale,
					size = Large2,
					isChecked = IsGenderMatch,
					onActivated = function()
						-- upvalues: Form (copy), IsGenderMatch (copy), UserGender (upval)
						Form.onGenderChanged(if IsGenderMatch then UserGender.Unknown else UserGender.Female)
					end
				}),
				Male = ReactModule.createElement(Chip, {
					LayoutOrder = 2,
					testId = "AccountUpgradeGenderMale",
					text = Form.maleText,
					leading = IconName.HeadMale,
					size = Large2,
					isChecked = IsGenderMatch1,
					onActivated = function()
						-- upvalues: Form (copy), IsGenderMatch1 (copy), UserGender (upval)
						Form.onGenderChanged(if IsGenderMatch1 then UserGender.Unknown else UserGender.Male)
					end
				})
			})
		})
	end
	t.GenderField = Element2
	
	return CreateElementFunction(View, config, t)
end