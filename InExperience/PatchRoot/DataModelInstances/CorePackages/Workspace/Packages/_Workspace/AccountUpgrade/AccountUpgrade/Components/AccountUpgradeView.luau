local accountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local parent = accountUpgrade.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local authCommonModule = require(parent.AuthCommon)
local usernameFieldWithSuggestionsModule = require(script.Parent.UsernameFieldWithSuggestions)
local birthdayPickerSheetModule = require(script.Parent.BirthdayPickerSheet)
local accountUpgradeDialogModule = require(accountUpgrade.SuccessModal.AccountUpgradeDialog)
local accountUpgradeDialogActionsModule = require(accountUpgrade.SuccessModal.AccountUpgradeDialogActions)
local authSignupModule = require(parent.AuthSignup)
local sharedFlagsModule = require(parent.SharedFlags)
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
local buttonVariant = foundationModule.Enums.ButtonVariant
local chipSize = foundationModule.Enums.ChipSize
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local UIConstants = authCommonModule.Common.UIConstants
local userGender = authCommonModule.Enums.UserGender

local function FieldError(p1)
	-- upvalues: reactModule (ref), text (ref)
	return if p1.text == nil or p1.text == "" then nil else reactModule.createElement(text, {
		tag = "size-full-0 auto-y text-body-small text-wrap text-align-x-left content-system-alert",
		Text = p1.text,
		LayoutOrder = p1.LayoutOrder,
		testId = p1.testId
	})
end

return function(p1)
	-- upvalues: foundationModule (ref), userGender (ref), getFFlagAuthCollapsingValidatorFoundationInput (ref), accountUpgradeFieldModule (ref), reactModule (ref), view (ref), text (ref), inputLabel (ref), inputLabelSize (ref), icon (ref), iconName (ref), iconSize (ref), FieldError (ref), usernameFieldWithSuggestionsModule (ref), collapsingTextInputValidator (ref), passwordValidator (ref), inputSize (ref), UIConstants (ref), textInput (ref), chip (ref), chipSize (ref), accountUpgradeDialogActionsModule (ref), buttonVariant (ref), accountUpgradeDialogModule (ref), birthdayPickerSheetModule (ref)
	local var1
	local var2 = foundationModule.Hooks.useTokens()
	local var3 = p1.gender == userGender.Female
	local var4 = p1.gender == userGender.Male
	local var5 = not p1.isSaveEnabled and not p1.isSubmitting
	local var6 = getFFlagAuthCollapsingValidatorFoundationInput()
	local color3 = var2.Color.Content.Default.Color3
	local var7 = p1.birthdayError ~= nil and p1.birthdayError ~= ""
	local fieldStates = p1.fieldStates
	local var8 = fieldStates[accountUpgradeFieldModule.Birthday] ~= nil
	local var9 = fieldStates[accountUpgradeFieldModule.Username] ~= nil
	local var10 = fieldStates[accountUpgradeFieldModule.Password] ~= nil
	local var11 = fieldStates[accountUpgradeFieldModule.Email] ~= nil
	local var12 = fieldStates[accountUpgradeFieldModule.Gender] ~= nil
	local onClose = p1.onClose
	local var13 = reactModule.useCallback(function(_)
		-- upvalues: onClose (ref)
		if onClose then
			onClose()
		end
	end, { onClose })
	local createElement = reactModule.createElement
	local t = {
		tag = "col gap-large size-full-0 auto-y",
		testId = "AccountUpgradeContent"
	}
	local t_1 = {
		Subtitle = reactModule.createElement(text, {
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
			LayoutOrder = 1,
			testId = "AccountUpgradeSubtitle",
			Text = p1.subtitleText
		})
	}
	local createElement_1 = reactModule.createElement
	local t_2 = {
		tag = "col gap-xxlarge size-full-0 auto-y",
		LayoutOrder = 2,
		testId = "AccountUpgradeBody"
	}
	local t_3 = {}
	local createElement_2 = reactModule.createElement
	local t_4 = {
		tag = "col gap-large size-full-0 auto-y",
		LayoutOrder = 1
	}
	local t_5 = {
		BirthdayField = if var8 then reactModule.createElement(view, {
			tag = "col gap-small size-full-0 auto-y",
			LayoutOrder = 1
		}, {
			Label = reactModule.createElement(inputLabel, {
				isRequired = true,
				LayoutOrder = 1,
				testId = "AccountUpgradeBirthdayLabel",
				Text = p1.birthdayLabel,
				size = inputLabelSize.Medium
			}),
			BirthdayButton = reactModule.createElement(view, {
				LayoutOrder = 2,
				testId = "AccountUpgradeBirthdayField",
				tag = {
					["row flex-between align-y-center size-full-1000 padding-medium stroke-standard stroke-position-inner radius-medium"] = true,
					["stroke-system-alert"] = var7,
					["stroke-emphasis"] = not var7
				},
				onActivated = p1.onBirthdayActivated
			}, {
				Text = reactModule.createElement(text, {
					LayoutOrder = 1,
					Text = if p1.birthdayText ~= "" then p1.birthdayPlaceholder else p1.birthdayText,
					tag = {
						["auto-xy text-body-medium text-align-x-left"] = true,
						["content-emphasis"] = p1.birthdayText ~= "",
						["content-muted"] = p1.birthdayText == ""
					}
				}),
				CalendarIcon = reactModule.createElement(icon, {
					LayoutOrder = 2,
					testId = "AccountUpgradeBirthdayIcon",
					name = iconName.Calendar,
					size = iconSize.Small,
					style = var2.Color.Content.Muted
				})
			}),
			Error = reactModule.createElement(FieldError, {
				LayoutOrder = 3,
				testId = "AccountUpgradeBirthdayError",
				text = p1.birthdayError
			})
		}) else nil,
		UsernameField = if var9 then reactModule.createElement(usernameFieldWithSuggestionsModule, {
			LayoutOrder = 2,
			titleTextKey = p1.usernameTitleTextKey,
			summaryErrorTextKey = p1.usernameSummaryErrorTextKey,
			isPrerequisiteMet = p1.isUsernamePrerequisiteMet,
			validatorAdditionalProps = p1.usernameValidatorAdditionalProps,
			placeholderText = p1.usernamePlaceholder,
			username = p1.username,
			prefilledUsername = p1.prefilledUsername,
			suggestions = p1.usernameSuggestions,
			suggestionPrompt = p1.usernameSuggestionPrompt,
			onSuggestionSelected = p1.onUsernameSuggestionSelected,
			pillClicked = p1.pillClicked,
			updatePillClicked = p1.updatePillClicked,
			resetPillClicked = p1.resetPillClicked,
			onTextChanged = p1.onUsernameChanged,
			onTextValidated = p1.onUsernameValidated,
			onIssueConditionChanged = p1.onUsernameIssueConditionChanged,
			useFoundationTextInput = var6,
			contentGap = var2.Gap.Small,
			colorContentOverride = color3
		}) else nil,
		PasswordField = if var10 then reactModule.createElement(view, {
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
				titleTextKey = p1.passwordTitleTextKey,
				summaryErrorTextKey = p1.passwordSummaryErrorTextKey,
				prerequisiteMet = p1.isPasswordPrerequisiteMet,
				placeholderText = p1.passwordPlaceholder,
				textInputType = if p1.hidePassword then Enum.TextInputType.Password else Enum.TextInputType.PasswordShown,
				returnKeyType = Enum.ReturnKeyType.Next,
				validator = passwordValidator,
				validatorAdditionalProps = p1.passwordValidatorAdditionalProps,
				onInputTextChanged = p1.onPasswordChanged,
				onInputTextValidated = p1.onPasswordValidated,
				useFoundationTextInput = var6,
				foundationInputSize = inputSize.Medium,
				foundationTitleSize = inputLabelSize.Medium,
				foundationIconTrailing = {
					name = if p1.hidePassword then UIConstants.HIDE_PASSWORD_ICON else UIConstants.SHOW_PASSWORD_ICON,
					onActivated = p1.onPasswordVisibilityToggle
				},
				contentGapOverride = var2.Gap.Small,
				colorContentOverride = color3
			})
		}) else nil
	}
	
	if var11 then
		var1 = reactModule.createElement
		var1 = var1(view, {
			tag = "col gap-small size-full-0 auto-y",
			LayoutOrder = 4
		}, {
			Label = reactModule.createElement(inputLabel, {
				LayoutOrder = 1,
				testId = "AccountUpgradeEmailLabel",
				Text = p1.emailLabel,
				size = inputLabelSize.Medium
			}),
			Input = reactModule.createElement(textInput, {
				label = "",
				LayoutOrder = 2,
				testId = "AccountUpgradeEmailInput",
				text = p1.email,
				placeholder = p1.emailPlaceholder,
				textInputType = Enum.TextInputType.Email,
				onChanged = p1.onEmailChanged,
				hasError = p1.emailError ~= nil and p1.emailError ~= "",
				width = UDim.new(1, 0),
				size = inputSize.Medium
			}),
			Error = reactModule.createElement(FieldError, { LayoutOrder = 3, text = p1.emailError })
		})
	else
		var1 = nil
	end
	t_5.EmailField = var1
	t_5.GenderField = if var12 then reactModule.createElement(view, {
		tag = "col gap-small size-full-0 auto-y",
		LayoutOrder = 5
	}, {
		Label = reactModule.createElement(inputLabel, {
			LayoutOrder = 1,
			Text = p1.genderLabel,
			size = inputLabelSize.Medium
		}),
		Options = reactModule.createElement(view, {
			tag = "row gap-small size-full-0 auto-y",
			LayoutOrder = 2
		}, {
			Female = reactModule.createElement(chip, {
				LayoutOrder = 1,
				testId = "AccountUpgradeGenderFemale",
				text = p1.femaleText,
				leading = iconName.HeadFemale,
				size = chipSize.Medium,
				isChecked = var3,
				onActivated = function()
					-- upvalues: p1 (ref), var3 (ref), userGender (copy)
					p1.onGenderChanged(if var3 then userGender.Unknown else userGender.Female)
				end
			}),
			Male = reactModule.createElement(chip, {
				LayoutOrder = 2,
				testId = "AccountUpgradeGenderMale",
				text = p1.maleText,
				leading = iconName.HeadMale,
				size = chipSize.Medium,
				isChecked = var4,
				onActivated = function()
					-- upvalues: p1 (ref), var4 (ref), userGender (copy)
					p1.onGenderChanged(if var4 then userGender.Unknown else userGender.Male)
				end
			})
		})
	}) else nil
	t_3.Fields = createElement_2(view, t_4, t_5)
	t_3.Actions = reactModule.createElement(accountUpgradeDialogActionsModule, {
		LayoutOrder = 2,
		buttons = {
			{
				text = p1.saveText,
				variant = if var5 then buttonVariant.Standard else buttonVariant.Emphasis,
				onActivated = p1.onSaveActivated,
				isDisabled = var5,
				isLoading = p1.isSubmitting
			}
		}
	})
	t_1.Body = createElement_1(view, t_2, t_3)
	
	return reactModule.createElement(accountUpgradeDialogModule, {
		title = p1.titleText,
		onClose = if onClose then var13 else nil,
		hasBackdrop = p1.hasBackdrop,
		children = {
			Content = createElement(view, t, t_1),
			BirthdayPicker = if var8 then reactModule.createElement(birthdayPickerSheetModule, {
				isOpen = p1.isBirthdayPickerOpen,
				birthday = p1.birthday,
				onClose = p1.onBirthdayPickerClosed,
				onConfirm = p1.onBirthdayConfirmed
			}) else nil
		}
	})
end