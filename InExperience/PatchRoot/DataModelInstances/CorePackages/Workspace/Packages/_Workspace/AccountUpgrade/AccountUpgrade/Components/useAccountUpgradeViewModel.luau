local accountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local parent = accountUpgrade.Parent
local localizationService = game:GetService("LocalizationService")
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local authCommonModule = require(parent.AuthCommon)
local authAnalyticsModule = require(parent.AuthAnalytics)
local eventStreamConstants = authAnalyticsModule.EventStreamConstants
local authButtonClick = authAnalyticsModule.Events.authButtonClick
local usernameSuggestor = require(parent.AuthSignup).Thunks.UsernameSuggestor
local fFlagAllowCurrentUsernameOnSignup = require(parent.SharedFlags).FFlagAllowCurrentUsernameOnSignup
local dateHelper = require(parent.Time).DateHelper
local computeIsAccountUpgradeButtonEnabledModule = require(accountUpgrade.Utils.computeIsAccountUpgradeButtonEnabled)
local useTextFieldValueModule = require(accountUpgrade.Hooks.useTextFieldValue)
local fIntAccountUpgradeMinimumAgeModule = require(accountUpgrade.Flags.FIntAccountUpgradeMinimumAge)
local _ = require(script.Parent.AccountUpgradeView)
local inputValidity = authCommonModule.Enums.InputValidity
local userGender = authCommonModule.Enums.UserGender
local usernameValidationContext = authCommonModule.Enums.UsernameValidationContext
local isStringEmail = authCommonModule.Utils.isStringEmail

local function reportEmail() end

return function(p1)
	-- upvalues: useRoactService (ref), roactNetworking (ref), fFlagAllowCurrentUsernameOnSignup (ref), reactModule (ref), inputValidity (ref), userGender (ref), useTextFieldValueModule (ref), reportEmail (ref), isStringEmail (ref), dateHelper (ref), fIntAccountUpgradeMinimumAgeModule (ref), useLocalization (ref), localizationService (ref), usernameValidationContext (ref), usernameSuggestor (ref), computeIsAccountUpgradeButtonEnabledModule (ref), authButtonClick (ref), eventStreamConstants (ref)
	local var1 = useRoactService(roactNetworking)
	local var2 = if fFlagAllowCurrentUsernameOnSignup then p1.currentUsername else nil
	local var3, var4 = reactModule.useState(nil)
	local useState = reactModule.useState
	local var5 = if var2 == nil or var2 == "" then inputValidity.Unvalidated else inputValidity.Valid
	useState, var13 = useState(var5)
	local var6, var7 = reactModule.useState(inputValidity.Unvalidated)
	local var8, var9 = reactModule.useState(userGender.Unknown)
	local var10, var11 = reactModule.useState(false)
	local var12, var13 = reactModule.useState(false)
	local var14, var15 = reactModule.useState(true)
	local var16, var17 = reactModule.useState({})
	local var18, var19 = reactModule.useState(false)
	local var20 = reactModule.useCallback(function()
		-- upvalues: var7 (ref), inputValidity (copy)
		var7(inputValidity.Unvalidated)
	end, {})
	local var21 = useTextFieldValueModule(var2, reactModule.useCallback(function()
		-- upvalues: var5 (ref), inputValidity (copy), var17 (ref)
		var5(inputValidity.Unvalidated)
		var17({})
	end, {}))
	local var22 = reactModule.useRef(var2)
	local var23 = useTextFieldValueModule(nil, var20)
	local var24 = useTextFieldValueModule(nil, reportEmail)
	local value = var21.value
	local value_1 = var23.value
	local value_2 = var24.value
	local var25 = if value_2 ~= "" then isStringEmail(value_2) else true
	local var26 = if value_2 == "" or var25 then nil else "Authentication.SignUp.Response.InvalidEmail"
	local var27 = var3 ~= nil
	local var28 = var27 and var3:GetAgeInYears() < fIntAccountUpgradeMinimumAgeModule
	local var29 = useLocalization({
		titleText = "Authentication.SignUp.Header.SetUpYourRobloxAccount",
		subtitleText = "Authentication.SignUp.Subtitle.YourProgressCarriesOver",
		birthdayLabel = "Authentication.SignUp.Label.Birthday",
		birthdayPlaceholder = "Authentication.SignUp.Description.BirthdayHint",
		usernamePlaceholder = "Authentication.SignUp.Message.Username.NoRealNameUse",
		usernameSuggestionPrompt = "Authentication.SignUp.Description.Try",
		passwordPlaceholder = "Authentication.SignUp.Label.PasswordPlaceholder",
		emailLabel = "Authentication.Login.Label.Email",
		emailPlaceholder = "Authentication.SignUp.Label.EnterYourEmail",
		genderLabel = "Authentication.SignUp.Label.Gender",
		femaleText = "Authentication.SignUp.Label.GenderFemale",
		maleText = "Authentication.SignUp.Label.GenderMale",
		saveText = "Authentication.Login.Action.Save",
		emailError = var26,
		birthdayError = if var28 then "Authentication.SignUp.Label.Error.MinimumAgeNotMet" else nil,
		monthText = if var3 then dateHelper.MonthsLocalizationKeys[var3.Month] else nil,
		dayAffix = dateHelper.DayAffixLocalizationKey,
		yearAffix = dateHelper.YearAffixLocalizationKey
	})
	local var30 = if not (var3 == nil or var29.monthText == nil) then dateHelper:GetFormattedFullString(var29.monthText, var3.Day, var29.dayAffix, var3.Year, var29.yearAffix, " ", localizationService.RobloxLocaleId) else ""
	local var31 = value ~= "" and useState ~= inputValidity.Invalid
	local var32 = if var3 then var3:FormatForEndpoint() else ""
	
	return {
		titleText = var29.titleText,
		subtitleText = var29.subtitleText,
		birthdayLabel = var29.birthdayLabel,
		birthday = var3,
		birthdayText = var30,
		birthdayPlaceholder = var29.birthdayPlaceholder,
		birthdayError = var29.birthdayError,
		usernameTitleTextKey = "Authentication.Login.Label.Username",
		usernameSummaryErrorTextKey = if var27 then "Authentication.SignUp.Label.ErrorsWithUsername" else "Authentication.SignUp.Response.BirthdayMustBeSetFirst",
		isUsernamePrerequisiteMet = var27,
		usernameValidatorAdditionalProps = reactModule.useMemo(function()
			-- upvalues: var32 (ref), usernameValidationContext (copy), var2 (ref)
			return {
				birthday = var32,
				context = usernameValidationContext.Signup,
				currentUsername = var2
			}
		end, { var32, var2 }),
		usernamePlaceholder = var29.usernamePlaceholder,
		username = value,
		prefilledUsername = var22.current,
		usernameSuggestions = if useState == inputValidity.Invalid and #var16 > 0 then var16 else {},
		usernameSuggestionPrompt = `{var29.usernameSuggestionPrompt}:`,
		onUsernameSuggestionSelected = reactModule.useCallback(function(p2)
			-- upvalues: var21 (ref), var17 (ref), authButtonClick (copy), eventStreamConstants (copy)
			var21.onChanged(p2)
			var17({})
			authButtonClick(eventStreamConstants.Context.SinglePageSignUpScreen, eventStreamConstants.Button.UsernameSuggestion, p2)
		end, { var21.onChanged }),
		pillClicked = var18,
		updatePillClicked = reactModule.useCallback(function()
			-- upvalues: var19 (ref)
			var19(true)
		end, {}),
		resetPillClicked = reactModule.useCallback(function()
			-- upvalues: var19 (ref)
			var19(false)
		end, {}),
		onUsernameValidated = reactModule.useCallback(function(p2, p3)
			-- upvalues: var5 (ref), var27 (ref), usernameSuggestor (copy), var1 (ref), var32 (ref), usernameValidationContext (copy), var21 (ref), var17 (ref)
			var5(p3)
			
			if var27 and p2 ~= "" then
				usernameSuggestor.suggestUsernames(var1, p2, var32, usernameValidationContext.Signup):andThen(function(p4)
					-- upvalues: var21 (copy), p2 (ref), var17 (copy)
					if var21.valueRef.current == p2 and p4.shouldUpdateState then
						var17(p4.suggestions or {})
					end
				end)
				
				return
			end
		end, { var1, var27, var32, var21.valueRef }),
		passwordTitleTextKey = "CommonUI.Messages.Label.Password",
		passwordSummaryErrorTextKey = if not var27 then "Authentication.SignUp.Response.BirthdayMustBeSetFirst" elseif not var31 then "Authentication.SignUp.Response.UsernameMustBeSetFirst" else "Authentication.SignUp.Label.ErrorsWithPassword",
		isPasswordPrerequisiteMet = var27 and var31,
		passwordValidatorAdditionalProps = reactModule.useMemo(function()
			-- upvalues: value (ref)
			return { username = value }
		end, { value }),
		passwordPlaceholder = var29.passwordPlaceholder,
		onPasswordValidated = reactModule.useCallback(function(_, p2)
			-- upvalues: var7 (ref)
			var7(p2)
		end, {}),
		hidePassword = var14,
		emailLabel = var29.emailLabel,
		emailPlaceholder = var29.emailPlaceholder,
		email = value_2,
		emailError = var29.emailError,
		genderLabel = var29.genderLabel,
		femaleText = var29.femaleText,
		maleText = var29.maleText,
		gender = var8,
		saveText = var29.saveText,
		isSaveEnabled = computeIsAccountUpgradeButtonEnabledModule({
			birthday = var3,
			username = value,
			password = value_1,
			usernameValid = useState,
			passwordValid = var6,
			email = value_2,
			emailValid = var25,
			isBirthdayOldEnough = not var28,
			isSubmitting = var12
		}),
		isSubmitting = var12,
		isBirthdayPickerOpen = var10,
		hasBackdrop = p1.hasBackdrop,
		onClose = p1.onClose,
		onBirthdayActivated = reactModule.useCallback(function()
			-- upvalues: var11 (ref)
			var11(true)
		end, {}),
		onBirthdayConfirmed = reactModule.useCallback(function(p2)
			-- upvalues: var4 (ref), var11 (ref)
			var4(p2)
			var11(false)
		end, {}),
		onBirthdayPickerClosed = reactModule.useCallback(function()
			-- upvalues: var11 (ref)
			var11(false)
		end, {}),
		onUsernameChanged = var21.onChanged,
		onPasswordChanged = var23.onChanged,
		onEmailChanged = var24.onChanged,
		onGenderChanged = var9,
		onPasswordVisibilityToggle = reactModule.useCallback(function()
			-- upvalues: var15 (ref)
			var15(function(p2)
				return not p2
			end)
		end, {}),
		onSaveActivated = reactModule.useCallback(function()
			-- upvalues: var12 (ref), var13 (ref), p1 (ref), var2 (ref), value (ref)
			if var12 then return end
			var13(true)
			p1.onSignUpComplete({
				isSuccess = true,
				username = if var2 ~= nil then nil else value,
				displayName = if var2 == nil or value == var2 then nil else value
			})
		end, { var2, var12, p1.onSignUpComplete, value })
	}
end