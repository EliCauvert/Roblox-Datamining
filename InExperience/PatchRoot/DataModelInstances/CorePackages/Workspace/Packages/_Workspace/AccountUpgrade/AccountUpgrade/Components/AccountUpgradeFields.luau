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
	-- upvalues: inputSize (ref), inputLabelSize (ref), chipSize (ref), foundationModule (ref), userGender (ref), getFFlagAuthCollapsingValidatorFoundationInput (ref), formatBoldRichText (ref), reactModule (ref), view (ref), accountUpgradeFieldModule (ref), inputLabel (ref), text (ref), icon (ref), iconName (ref), iconSize (ref), usernameFieldWithSuggestionsModule (ref), collapsingTextInputValidator (ref), passwordValidator (ref), UIConstants (ref), textInput (ref), accountUpgradeFieldErrorModule (ref), chip (ref)
	local createElement_1
	local form = p1.form
	local var1 = p1.size == inputSize.Large
	local var2 = if var1 then inputSize.Large else inputSize.Medium
	local var3 = if var1 then inputLabelSize.Large else inputLabelSize.Medium
	local var4 = if var1 then chipSize.Large else chipSize.Medium
	local var5 = foundationModule.Hooks.useTokens()
	local var6 = form.gender == userGender.Female
	local var7 = form.gender == userGender.Male
	local var8 = getFFlagAuthCollapsingValidatorFoundationInput()
	local color3 = var5.Color.Content.Default.Color3
	local fieldStates = form.fieldStates
	local var9 = if p1.boldLabels ~= true then form.boldFieldLabels == true else true
	
	local function _(p2)
		-- upvalues: var9 (ref), formatBoldRichText (copy)
		return if var9 then formatBoldRichText(p2) else p2
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
		local var10 = view
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
		t_4.Text = if var9 then formatBoldRichText(birthdayLabel) else birthdayLabel
		t_4.RichText = var9
		t_4.size = var3
		t_3.Label = createElement_2(inputLabel, t_4)
		t_3.BirthdayButton = reactModule.createElement(view, {
			LayoutOrder = 2,
			testId = "AccountUpgradeBirthdayField",
			tag = {
				["row flex-between align-y-center padding-medium stroke-standard stroke-position-inner radius-medium stroke-emphasis"] = true,
				["size-full-1000"] = not var1,
				["size-full-1200"] = var1
			},
			onActivated = form.onBirthdayActivated
		}, {
			Text = reactModule.createElement(text, {
				LayoutOrder = 1,
				Text = if form.birthdayText ~= "" then form.birthdayPlaceholder else form.birthdayText,
				tag = {
					["auto-xy text-align-x-left"] = true,
					["text-body-medium"] = not var1,
					["text-body-large"] = var1,
					["content-emphasis"] = form.birthdayText ~= "",
					["content-muted"] = form.birthdayText == ""
				}
			}),
			CalendarIcon = reactModule.createElement(icon, {
				LayoutOrder = 2,
				testId = "AccountUpgradeBirthdayIcon",
				name = iconName.Calendar,
				size = iconSize.Small,
				style = var5.Color.Content.Muted
			})
		})
		createElement_1 = createElement_1(var10, t_2, t_3)
	end
	local createElement_2
	t_1.BirthdayField = createElement_1
	t_1.UsernameField = if fieldStates[accountUpgradeFieldModule.Username] ~= nil then nil else reactModule.createElement(usernameFieldWithSuggestionsModule, {
		LayoutOrder = 2,
		titleTextKey = form.usernameTitleTextKey,
		isTitleBold = var9,
		inputSize = var2,
		titleSize = var3,
		summaryErrorTextKey = form.usernameSummaryErrorTextKey,
		isPrerequisiteMet = form.isUsernamePrerequisiteMet,
		validatorAdditionalProps = form.usernameValidatorAdditionalProps,
		placeholderText = form.usernamePlaceholder,
		username = form.username,
		prefilledUsername = form.prefilledUsername,
		suggestions = form.usernameSuggestions,
		suggestionPrompt = form.usernameSuggestionPrompt,
		eventContext = form.usernameSuggestionEventContext,
		onSuggestionSelected = form.onUsernameSuggestionSelected,
		pillClicked = form.pillClicked,
		updatePillClicked = form.updatePillClicked,
		resetPillClicked = form.resetPillClicked,
		onTextChanged = form.onUsernameChanged,
		onTextValidated = form.onUsernameValidated,
		onFocused = form.onUsernameFocused,
		onIssueConditionChanged = form.onUsernameIssueConditionChanged,
		useFoundationTextInput = var8,
		contentGap = var5.Gap.Small,
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
			useFoundationTextInput = var8,
			foundationInputSize = var2,
			foundationTitleSize = var3,
			foundationTitleIsBold = var9,
			foundationIconTrailing = {
				name = if form.hidePassword then UIConstants.HIDE_PASSWORD_ICON else UIConstants.SHOW_PASSWORD_ICON,
				onActivated = form.onPasswordVisibilityToggle
			},
			contentGapOverride = var5.Gap.Small,
			colorContentOverride = color3
		})
	})
	
	if fieldStates[accountUpgradeFieldModule.Email] == nil then
		createElement_2 = nil
	else
		createElement_2 = reactModule.createElement
		local var11 = view
		local t_2 = {
			tag = "col gap-small size-full-0 auto-y",
			LayoutOrder = 4
		}
		local t_3 = {}
		local createElement_3 = reactModule.createElement
		local t_4 = { LayoutOrder = 1, testId = "AccountUpgradeEmailLabel" }
		local emailLabel = form.emailLabel
		t_4.Text = if var9 then formatBoldRichText(emailLabel) else emailLabel
		t_4.RichText = var9
		t_4.size = var3
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
			size = var2
		})
		t_3.Error = reactModule.createElement(accountUpgradeFieldErrorModule, { LayoutOrder = 3, text = form.emailError })
		createElement_2 = createElement_2(var11, t_2, t_3)
	end
	local createElement_3
	t_1.EmailField = createElement_2
	
	if fieldStates[accountUpgradeFieldModule.Gender] == nil then
		createElement_3 = nil
	else
		createElement_3 = reactModule.createElement
		local var12 = view
		local t_2 = {
			tag = "col gap-small size-full-0 auto-y",
			LayoutOrder = 5
		}
		local t_3 = {}
		local createElement_4 = reactModule.createElement
		local t_4 = { LayoutOrder = 1, testId = "AccountUpgradeGenderLabel" }
		local genderLabel = form.genderLabel
		t_4.Text = if var9 then formatBoldRichText(genderLabel) else genderLabel
		t_4.RichText = var9
		t_4.size = var3
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
				size = var4,
				isChecked = var6,
				onActivated = function()
					-- upvalues: form (ref), var6 (ref), userGender (copy)
					form.onGenderChanged(if var6 then userGender.Unknown else userGender.Female)
				end
			}),
			Male = reactModule.createElement(chip, {
				LayoutOrder = 2,
				testId = "AccountUpgradeGenderMale",
				text = form.maleText,
				leading = iconName.HeadMale,
				size = var4,
				isChecked = var7,
				onActivated = function()
					-- upvalues: form (ref), var7 (ref), userGender (copy)
					form.onGenderChanged(if var7 then userGender.Unknown else userGender.Male)
				end
			})
		})
		createElement_3 = createElement_3(var12, t_2, t_3)
	end
	t_1.GenderField = createElement_3
	
	return createElement(view, t, t_1)
end