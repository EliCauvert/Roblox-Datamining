local accountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local parent = accountUpgrade.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local authCommonModule = require(parent.AuthCommon)
local authSignupModule = require(parent.AuthSignup)
local sharedFlagsModule = require(parent.SharedFlags)
local usernameFieldWithSuggestionsModule = require(script.Parent.UsernameFieldWithSuggestions)
local accountUpgradeFieldErrorModule = require(script.Parent.AccountUpgradeFieldError)
local accountUpgradeFieldModule = require(accountUpgrade.AccountUpgradeField)
local _ = require(accountUpgrade.Utils.resolveFieldStates)
local getFFlagAuthCollapsingValidatorFoundationInput = sharedFlagsModule.GetFFlagAuthCollapsingValidatorFoundationInput
local collapsingTextInputValidator = authSignupModule.Components.CollapsingTextInputValidator
local passwordValidator = authSignupModule.Thunks.PasswordValidator
local view = foundationModule.View
local text = foundationModule.Text
local icon = foundationModule.Icon
local inputLabel = foundationModule.InputLabel
local textInput = foundationModule.TextInput
local chip = foundationModule.Chip
local inputSize = foundationModule.Enums.InputSize
local inputLabelSize = foundationModule.Enums.InputLabelSize
local chipSize = foundationModule.Enums.ChipSize
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local UIConstants = authCommonModule.Common.UIConstants
local userGender = authCommonModule.Enums.UserGender
local formatBoldRichText = authCommonModule.Utils.formatBoldRichText

return function(p1)
	-- upvalues: foundationModule (ref), userGender (ref), getFFlagAuthCollapsingValidatorFoundationInput (ref), formatBoldRichText (ref), reactModule (ref), view (ref), accountUpgradeFieldModule (ref), inputLabel (ref), inputLabelSize (ref), text (ref), icon (ref), iconName (ref), iconSize (ref), accountUpgradeFieldErrorModule (ref), usernameFieldWithSuggestionsModule (ref), collapsingTextInputValidator (ref), passwordValidator (ref), inputSize (ref), UIConstants (ref), textInput (ref), chip (ref), chipSize (ref)
	local createElement_1
	local form = p1.form
	local var1 = foundationModule.Hooks.useTokens()
	local var2 = form.gender == userGender.Female
	local var3 = form.gender == userGender.Male
	local var4 = getFFlagAuthCollapsingValidatorFoundationInput()
	local color3 = var1.Color.Content.Default.Color3
	local var5 = form.birthdayError ~= nil and form.birthdayError ~= ""
	local fieldStates = form.fieldStates
	local var6 = form.boldFieldLabels == true
	
	local function _(p2)
		-- upvalues: var6 (ref), formatBoldRichText (copy)
		return if var6 then formatBoldRichText(p2) else p2
	end
	
	local createElement = reactModule.createElement
	local t = {
		tag = "col gap-large size-full-0 auto-y",
		LayoutOrder = p1.LayoutOrder
	}
	local t_1 = {}
	
	if fieldStates[accountUpgradeFieldModule.Birthday] == nil then
		createElement_1 = nil
	else
		createElement_1 = reactModule.createElement
		local var7 = view
		local t_2 = {
			tag = "col gap-small size-full-0 auto-y",
			LayoutOrder = 1
		}
		local t_3 = {}
		local createElement_2 = reactModule.createElement
		local t_4 = {
			isRequired = true,
			LayoutOrder = 1,
			testId = "AccountUpgradeBirthdayLabel"
		}
		local birthdayLabel = form.birthdayLabel
		t_4.Text = if var6 then formatBoldRichText(birthdayLabel) else birthdayLabel
		t_4.RichText = var6
		t_4.size = inputLabelSize.Medium
		t_3.Label = createElement_2(inputLabel, t_4)
		t_3.BirthdayButton = reactModule.createElement(view, {
			LayoutOrder = 2,
			testId = "AccountUpgradeBirthdayField",
			tag = {
				["row flex-between align-y-center size-full-1000 padding-medium stroke-standard stroke-position-inner radius-medium"] = true,
				["stroke-system-alert"] = var5,
				["stroke-emphasis"] = not var5
			},
			onActivated = form.onBirthdayActivated
		}, {
			Text = reactModule.createElement(text, {
				LayoutOrder = 1,
				Text = if form.birthdayText ~= "" then form.birthdayPlaceholder else form.birthdayText,
				tag = {
					["auto-xy text-body-medium text-align-x-left"] = true,
					["content-emphasis"] = form.birthdayText ~= "",
					["content-muted"] = form.birthdayText == ""
				}
			}),
			CalendarIcon = reactModule.createElement(icon, {
				LayoutOrder = 2,
				testId = "AccountUpgradeBirthdayIcon",
				name = iconName.Calendar,
				size = iconSize.Small,
				style = var1.Color.Content.Muted
			})
		})
		t_3.Error = reactModule.createElement(accountUpgradeFieldErrorModule, {
			LayoutOrder = 3,
			testId = "AccountUpgradeBirthdayError",
			text = form.birthdayError
		})
		createElement_1 = createElement_1(var7, t_2, t_3)
	end
	local createElement_2
	t_1.BirthdayField = createElement_1
	t_1.UsernameField = if fieldStates[accountUpgradeFieldModule.Username] ~= nil then nil else reactModule.createElement(usernameFieldWithSuggestionsModule, {
		LayoutOrder = 2,
		titleTextKey = form.usernameTitleTextKey,
		isTitleBold = var6,
		summaryErrorTextKey = form.usernameSummaryErrorTextKey,
		isPrerequisiteMet = form.isUsernamePrerequisiteMet,
		validatorAdditionalProps = form.usernameValidatorAdditionalProps,
		placeholderText = form.usernamePlaceholder,
		username = form.username,
		prefilledUsername = form.prefilledUsername,
		suggestions = form.usernameSuggestions,
		suggestionPrompt = form.usernameSuggestionPrompt,
		onSuggestionSelected = form.onUsernameSuggestionSelected,
		pillClicked = form.pillClicked,
		updatePillClicked = form.updatePillClicked,
		resetPillClicked = form.resetPillClicked,
		onTextChanged = form.onUsernameChanged,
		onTextValidated = form.onUsernameValidated,
		onFocused = form.onUsernameFocused,
		onIssueConditionChanged = form.onUsernameIssueConditionChanged,
		useFoundationTextInput = var4,
		contentGap = var1.Gap.Small,
		colorContentOverride = color3
	})
	t_1.PasswordField = if fieldStates[accountUpgradeFieldModule.Password] ~= nil then nil else reactModule.createElement(view, {
		tag = "col size-full-0 auto-y",
		LayoutOrder = 3,
		testId = "AccountUpgradePasswordField"
	}, {
		Validator = reactModule.createElement(collapsingTextInputValidator, {
			layoutOrder = 1,
			useFoundationTitle = true,
			foundationTitleIsRequired = true,
			paddingTopOverride = 0,
			useTrailingPadding = true,
			titleTextKey = form.passwordTitleTextKey,
			summaryErrorTextKey = form.passwordSummaryErrorTextKey,
			prerequisiteMet = form.isPasswordPrerequisiteMet,
			placeholderText = form.passwordPlaceholder,
			textInputType = if form.hidePassword then Enum.TextInputType.Password else Enum.TextInputType.PasswordShown,
			returnKeyType = Enum.ReturnKeyType.Next,
			validator = passwordValidator,
			validatorAdditionalProps = form.passwordValidatorAdditionalProps,
			onInputTextChanged = form.onPasswordChanged,
			onInputTextValidated = form.onPasswordValidated,
			textBoxFocusedCallback = form.onPasswordFocused,
			useFoundationTextInput = var4,
			foundationInputSize = inputSize.Medium,
			foundationTitleSize = inputLabelSize.Medium,
			foundationTitleIsBold = var6,
			foundationIconTrailing = {
				name = if form.hidePassword then UIConstants.HIDE_PASSWORD_ICON else UIConstants.SHOW_PASSWORD_ICON,
				onActivated = form.onPasswordVisibilityToggle
			},
			contentGapOverride = var1.Gap.Small,
			colorContentOverride = color3
		})
	})
	
	if fieldStates[accountUpgradeFieldModule.Email] == nil then
		createElement_2 = nil
	else
		createElement_2 = reactModule.createElement
		local var8 = view
		local t_2 = {
			tag = "col gap-small size-full-0 auto-y",
			LayoutOrder = 4
		}
		local t_3 = {}
		local createElement_3 = reactModule.createElement
		local t_4 = { LayoutOrder = 1, testId = "AccountUpgradeEmailLabel" }
		local emailLabel = form.emailLabel
		t_4.Text = if var6 then formatBoldRichText(emailLabel) else emailLabel
		t_4.RichText = var6
		t_4.size = inputLabelSize.Medium
		t_3.Label = createElement_3(inputLabel, t_4)
		t_3.Input = reactModule.createElement(textInput, {
			label = "",
			LayoutOrder = 2,
			testId = "AccountUpgradeEmailInput",
			text = form.email,
			placeholder = form.emailPlaceholder,
			textInputType = Enum.TextInputType.Email,
			onChanged = form.onEmailChanged,
			hasError = form.emailError ~= nil and form.emailError ~= "",
			width = UDim.new(1, 0),
			size = inputSize.Medium
		})
		t_3.Error = reactModule.createElement(accountUpgradeFieldErrorModule, { LayoutOrder = 3, text = form.emailError })
		createElement_2 = createElement_2(var8, t_2, t_3)
	end
	local createElement_3
	t_1.EmailField = createElement_2
	
	if fieldStates[accountUpgradeFieldModule.Gender] == nil then
		createElement_3 = nil
	else
		createElement_3 = reactModule.createElement
		local var9 = view
		local t_2 = {
			tag = "col gap-small size-full-0 auto-y",
			LayoutOrder = 5
		}
		local t_3 = {}
		local createElement_4 = reactModule.createElement
		local t_4 = { LayoutOrder = 1, testId = "AccountUpgradeGenderLabel" }
		local genderLabel = form.genderLabel
		t_4.Text = if var6 then formatBoldRichText(genderLabel) else genderLabel
		t_4.RichText = var6
		t_4.size = inputLabelSize.Medium
		t_3.Label = createElement_4(inputLabel, t_4)
		t_3.Options = reactModule.createElement(view, {
			tag = "row gap-small size-full-0 auto-y",
			LayoutOrder = 2
		}, {
			Female = reactModule.createElement(chip, {
				LayoutOrder = 1,
				testId = "AccountUpgradeGenderFemale",
				text = form.femaleText,
				leading = iconName.HeadFemale,
				size = chipSize.Medium,
				isChecked = var2,
				onActivated = function()
					-- upvalues: form (ref), var2 (ref), userGender (copy)
					form.onGenderChanged(if var2 then userGender.Unknown else userGender.Female)
				end
			}),
			Male = reactModule.createElement(chip, {
				LayoutOrder = 2,
				testId = "AccountUpgradeGenderMale",
				text = form.maleText,
				leading = iconName.HeadMale,
				size = chipSize.Medium,
				isChecked = var3,
				onActivated = function()
					-- upvalues: form (ref), var3 (ref), userGender (copy)
					form.onGenderChanged(if var3 then userGender.Unknown else userGender.Male)
				end
			})
		})
		createElement_3 = createElement_3(var9, t_2, t_3)
	end
	t_1.GenderField = createElement_3
	
	return createElement(view, t, t_1)
end