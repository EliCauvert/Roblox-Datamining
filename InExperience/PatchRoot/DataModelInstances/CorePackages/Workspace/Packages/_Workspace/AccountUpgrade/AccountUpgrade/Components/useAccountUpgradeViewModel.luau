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
local accountUpgradeFieldModule = require(accountUpgrade.AccountUpgradeField)
local accountUpgradeFlowModule = require(accountUpgrade.AccountUpgradeFlow)
local getFlowSpec = require(accountUpgrade.FlowSpec).getFlowSpec
local computeIsAccountUpgradeButtonEnabledModule = require(accountUpgrade.Utils.computeIsAccountUpgradeButtonEnabled)
local resolveFieldStatesModule = require(accountUpgrade.Utils.resolveFieldStates)
local useTextFieldValueModule = require(accountUpgrade.Hooks.useTextFieldValue)
local fIntAccountUpgradeMinimumAgeModule = require(accountUpgrade.Flags.FIntAccountUpgradeMinimumAge)
local _ = require(script.Parent.AccountUpgradeView)
local inputValidity = authCommonModule.Enums.InputValidity
local userGender = authCommonModule.Enums.UserGender
local usernameValidationContext = authCommonModule.Enums.UsernameValidationContext
local isStringEmail = authCommonModule.Utils.isStringEmail
local t = {
	[accountUpgradeFieldModule.Birthday] = "Authentication.SignUp.Response.BirthdayMustBeSetFirst",
	[accountUpgradeFieldModule.Username] = "Authentication.SignUp.Response.UsernameMustBeSetFirst"
}

local function _(p1, p2)
	-- upvalues: t (ref)
	local blockingField = p1.blockingField
	
	return if blockingField == nil then p2 else assert(t[blockingField], `Account upgrade field has no blocker error key: {blockingField}`)
end

local function reportEmail() end

return function(p1)
	-- upvalues: accountUpgradeFlowModule (ref), getFlowSpec (ref), useRoactService (ref), roactNetworking (ref), fFlagAllowCurrentUsernameOnSignup (ref), reactModule (ref), inputValidity (ref), userGender (ref), useTextFieldValueModule (ref), reportEmail (ref), isStringEmail (ref), dateHelper (ref), fIntAccountUpgradeMinimumAgeModule (ref), useLocalization (ref), localizationService (ref), resolveFieldStatesModule (ref), accountUpgradeFieldModule (ref), usernameValidationContext (ref), usernameSuggestor (ref), computeIsAccountUpgradeButtonEnabledModule (ref), authButtonClick (ref), eventStreamConstants (ref), t (ref)
	local flow = p1.flow or accountUpgradeFlowModule.Pioneer
	local var1 = getFlowSpec(flow)
	assert(var1 ~= nil, `Unsupported account upgrade flow: {flow}`)
	local var2 = useRoactService(roactNetworking)
	local var3 = if fFlagAllowCurrentUsernameOnSignup then p1.currentUsername else nil
	local var4, var5 = reactModule.useState(nil)
	local useState = reactModule.useState
	local var6 = if var3 == nil or var3 == "" then inputValidity.Unvalidated else inputValidity.Valid
	useState, var19 = useState(var6)
	local var7, var8 = reactModule.useState(inputValidity.Unvalidated)
	local var9, var10 = reactModule.useState(userGender.Unknown)
	local var11, var12 = reactModule.useState(false)
	local var13, var14 = reactModule.useState(false)
	local var15, var16 = reactModule.useState(true)
	local var17, var18 = reactModule.useState({})
	local var19, var20 = reactModule.useState(false)
	local var21 = reactModule.useCallback(function()
		-- upvalues: var8 (ref), inputValidity (copy)
		var8(inputValidity.Unvalidated)
	end, {})
	local var22 = useTextFieldValueModule(var3, reactModule.useCallback(function()
		-- upvalues: var6 (ref), inputValidity (copy), var18 (ref)
		var6(inputValidity.Unvalidated)
		var18({})
	end, {}))
	local var23 = reactModule.useRef(var3)
	local var24 = useTextFieldValueModule(nil, var21)
	local var25 = useTextFieldValueModule(nil, reportEmail)
	local value = var22.value
	local value_1 = var24.value
	local value_2 = var25.value
	local var26 = if value_2 ~= "" then isStringEmail(value_2) else true
	local var27 = var4 ~= nil and var4:GetAgeInYears() < fIntAccountUpgradeMinimumAgeModule
	local var28 = useLocalization({
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
		titleText = var1.titleTextKey,
		subtitleText = var1.subtitleTextKey,
		emailError = if value_2 == "" or var26 then nil else "Authentication.SignUp.Response.InvalidEmail",
		birthdayError = if var27 then "Authentication.SignUp.Label.Error.MinimumAgeNotMet" else nil,
		monthText = if var4 then dateHelper.MonthsLocalizationKeys[var4.Month] else nil,
		dayAffix = dateHelper.DayAffixLocalizationKey,
		yearAffix = dateHelper.YearAffixLocalizationKey
	})
	local var29 = if not (var4 == nil or var28.monthText == nil) then dateHelper:GetFormattedFullString(var28.monthText, var4.Day, var28.dayAffix, var4.Year, var28.yearAffix, " ", localizationService.RobloxLocaleId) else ""
	local var30 = resolveFieldStatesModule({
		spec = var1,
		isSatisfied = {
			[accountUpgradeFieldModule.Birthday] = var4 ~= nil,
			[accountUpgradeFieldModule.Username] = value ~= "" and useState ~= inputValidity.Invalid,
			[accountUpgradeFieldModule.Password] = value_1 ~= "" and var7 == inputValidity.Valid
		}
	})
	local username = var30[accountUpgradeFieldModule.Username]
	local password = var30[accountUpgradeFieldModule.Password]
	assert(username ~= nil, "Account upgrade flow must include a username state")
	assert(password ~= nil, "Account upgrade flow must include a password state")
	local var31 = reactModule.useMemo(function()
		-- upvalues: var4 (ref), usernameValidationContext (copy), var3 (ref)
		return {
			birthday = if var4 then var4:FormatForEndpoint() else "",
			context = usernameValidationContext.Signup,
			currentUsername = var3
		}
	end, { var4, var3 })
	local var32 = reactModule.useMemo(function()
		-- upvalues: value (ref)
		return { username = value }
	end, { value })
	local var33 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var6 (ref), var4 (ref), usernameSuggestor (copy), var2 (ref), usernameValidationContext (copy), var22 (ref), var18 (ref)
		var6(p3)
		
		if var4 == nil or p2 == "" then
			return
		end
		usernameSuggestor.suggestUsernames(var2, p2, var4:FormatForEndpoint(), usernameValidationContext.Signup):andThen(function(p4)
			-- upvalues: var22 (copy), p2 (ref), var18 (copy)
			if var22.valueRef.current == p2 and p4.shouldUpdateState then
				var18(p4.suggestions or {})
			end
		end)
	end, { var2, var4, var22.valueRef })
	local var34 = reactModule.useCallback(function(_, p2)
		-- upvalues: var8 (ref)
		var8(p2)
	end, {})
	local var35 = reactModule.useCallback(function()
		-- upvalues: var12 (ref)
		var12(true)
	end, {})
	local var36 = reactModule.useCallback(function()
		-- upvalues: var12 (ref)
		var12(false)
	end, {})
	local var37 = reactModule.useCallback(function(p2)
		-- upvalues: var5 (ref), var12 (ref)
		var5(p2)
		var12(false)
	end, {})
	local var38 = computeIsAccountUpgradeButtonEnabledModule({
		birthday = var4,
		username = value,
		password = value_1,
		usernameValid = useState,
		passwordValid = var7,
		email = value_2,
		emailValid = var26,
		isBirthdayOldEnough = not var27,
		isSubmitting = var13,
		requiredFields = var1.requiredFields
	})
	local var39 = reactModule.useCallback(function()
		-- upvalues: var16 (ref)
		var16(function(p2)
			return not p2
		end)
	end, {})
	local var40 = reactModule.useCallback(function(p2)
		-- upvalues: var22 (ref), var18 (ref), authButtonClick (copy), eventStreamConstants (copy)
		var22.onChanged(p2)
		var18({})
		authButtonClick(eventStreamConstants.Context.SinglePageSignUpScreen, eventStreamConstants.Button.UsernameSuggestion, p2)
	end, { var22.onChanged })
	local var41 = reactModule.useCallback(function()
		-- upvalues: var20 (ref)
		var20(true)
	end, {})
	local var42 = reactModule.useCallback(function()
		-- upvalues: var20 (ref)
		var20(false)
	end, {})
	local var43 = if useState == inputValidity.Invalid and #var17 > 0 then var17 else {}
	local var44 = reactModule.useCallback(function()
		-- upvalues: var13 (ref), var14 (ref), p1 (ref), var3 (ref), value (ref)
		if var13 then return end
		var14(true)
		p1.onSignUpComplete({
			isSuccess = true,
			username = if var3 ~= nil then nil else value,
			displayName = if var3 == nil or value == var3 then nil else value
		})
	end, { var3, var13, p1.onSignUpComplete, value })
	local t_1 = {
		titleText = var28.titleText,
		subtitleText = var28.subtitleText,
		birthdayLabel = var28.birthdayLabel,
		birthday = var4,
		birthdayText = var29,
		birthdayPlaceholder = var28.birthdayPlaceholder,
		birthdayError = var28.birthdayError,
		usernameTitleTextKey = "Authentication.Login.Label.Username"
	}
	local blockingField = username.blockingField
	t_1.usernameSummaryErrorTextKey = if blockingField == nil then "Authentication.SignUp.Label.ErrorsWithUsername" else assert(t[blockingField], `Account upgrade field has no blocker error key: {blockingField}`)
	t_1.isUsernamePrerequisiteMet = username.isUnlocked
	t_1.fieldStates = var30
	t_1.usernameValidatorAdditionalProps = var31
	t_1.usernamePlaceholder = var28.usernamePlaceholder
	t_1.username = value
	t_1.prefilledUsername = var23.current
	t_1.usernameSuggestions = var43
	t_1.usernameSuggestionPrompt = `{var28.usernameSuggestionPrompt}:`
	t_1.onUsernameSuggestionSelected = var40
	t_1.pillClicked = var19
	t_1.updatePillClicked = var41
	t_1.resetPillClicked = var42
	t_1.onUsernameValidated = var33
	t_1.passwordTitleTextKey = "CommonUI.Messages.Label.Password"
	local blockingField_1 = password.blockingField
	t_1.passwordSummaryErrorTextKey = if blockingField_1 == nil then "Authentication.SignUp.Label.ErrorsWithPassword" else assert(t[blockingField_1], `Account upgrade field has no blocker error key: {blockingField_1}`)
	t_1.isPasswordPrerequisiteMet = password.isUnlocked
	t_1.passwordValidatorAdditionalProps = var32
	t_1.passwordPlaceholder = var28.passwordPlaceholder
	t_1.onPasswordValidated = var34
	t_1.hidePassword = var15
	t_1.emailLabel = var28.emailLabel
	t_1.emailPlaceholder = var28.emailPlaceholder
	t_1.email = value_2
	t_1.emailError = var28.emailError
	t_1.genderLabel = var28.genderLabel
	t_1.femaleText = var28.femaleText
	t_1.maleText = var28.maleText
	t_1.gender = var9
	t_1.saveText = var28.saveText
	t_1.isSaveEnabled = var38
	t_1.isSubmitting = var13
	t_1.isBirthdayPickerOpen = var11
	t_1.hasBackdrop = p1.hasBackdrop
	t_1.onClose = if var1.canDismiss then p1.onClose else nil
	t_1.onBirthdayActivated = var35
	t_1.onBirthdayConfirmed = var37
	t_1.onBirthdayPickerClosed = var36
	t_1.onUsernameChanged = var22.onChanged
	t_1.onPasswordChanged = var24.onChanged
	t_1.onEmailChanged = var25.onChanged
	t_1.onGenderChanged = var10
	t_1.onPasswordVisibilityToggle = var39
	t_1.onSaveActivated = var44
	
	return t_1
end