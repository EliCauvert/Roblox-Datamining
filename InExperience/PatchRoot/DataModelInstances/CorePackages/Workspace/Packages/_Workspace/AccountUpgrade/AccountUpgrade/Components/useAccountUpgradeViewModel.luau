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
local authClientError = authAnalyticsModule.Events.authClientError
local usernameSuggestor = require(parent.AuthSignup).Thunks.UsernameSuggestor
local fFlagAllowCurrentUsernameOnSignup = require(parent.SharedFlags).FFlagAllowCurrentUsernameOnSignup
local dateHelper = require(parent.Time).DateHelper
local accountUpgradeFieldModule = require(accountUpgrade.AccountUpgradeField)
local accountUpgradeFlowModule = require(accountUpgrade.AccountUpgradeFlow)
local getFlowSpec = require(accountUpgrade.FlowSpec).getFlowSpec
local computeIsAccountUpgradeButtonEnabledModule = require(accountUpgrade.Utils.computeIsAccountUpgradeButtonEnabled)
local getAccountUpgradeErrorCodeModule = require(accountUpgrade.Utils.getAccountUpgradeErrorCode)
local getAccountUpgradeErrorTextKeyModule = require(accountUpgrade.Utils.getAccountUpgradeErrorTextKey)
local resolveFieldStatesModule = require(accountUpgrade.Utils.resolveFieldStates)
local useTextFieldValueModule = require(accountUpgrade.Hooks.useTextFieldValue)
local fIntAccountUpgradeMinimumAgeModule = require(accountUpgrade.Flags.FIntAccountUpgradeMinimumAge)
local _ = require(script.Parent.AccountUpgradeView)
local inputValidity = authCommonModule.Enums.InputValidity
local userGender = authCommonModule.Enums.UserGender
local usernameValidationContext = authCommonModule.Enums.UsernameValidationContext
local isStringEmail = authCommonModule.Utils.isStringEmail
local accountUpgradeRequest = authCommonModule.Http.Requests.AccountUpgradeRequest
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
	-- upvalues: accountUpgradeFlowModule (ref), getFlowSpec (ref), useRoactService (ref), roactNetworking (ref), fFlagAllowCurrentUsernameOnSignup (ref), reactModule (ref), inputValidity (ref), userGender (ref), useTextFieldValueModule (ref), reportEmail (ref), isStringEmail (ref), dateHelper (ref), fIntAccountUpgradeMinimumAgeModule (ref), getAccountUpgradeErrorTextKeyModule (ref), useLocalization (ref), localizationService (ref), resolveFieldStatesModule (ref), accountUpgradeFieldModule (ref), usernameValidationContext (ref), usernameSuggestor (ref), computeIsAccountUpgradeButtonEnabledModule (ref), authButtonClick (ref), eventStreamConstants (ref), accountUpgradeRequest (ref), getAccountUpgradeErrorCodeModule (ref), authClientError (ref), t (ref)
	local var1
	local flow = p1.flow or accountUpgradeFlowModule.Pioneer
	local var2 = getFlowSpec(flow)
	assert(var2 ~= nil, `Unsupported account upgrade flow: {flow}`)
	local var3 = useRoactService(roactNetworking)
	local var4 = if fFlagAllowCurrentUsernameOnSignup then p1.currentUsername else nil
	local var5, var6 = reactModule.useState(nil)
	local useState = reactModule.useState
	local var7 = if var4 == nil or var4 == "" then inputValidity.Unvalidated else inputValidity.Valid
	useState, var21 = useState(var7)
	local var8, var9 = reactModule.useState(inputValidity.Unvalidated)
	local var10, var11 = reactModule.useState(userGender.Unknown)
	local var12, var13 = reactModule.useState(false)
	local var14, var15 = reactModule.useState(false)
	local var16, var17 = reactModule.useState(true)
	local var18, var19 = reactModule.useState({})
	local var20, var21 = reactModule.useState(false)
	local var22, var23 = reactModule.useState(nil)
	local var24 = reactModule.useCallback(function()
		-- upvalues: var9 (ref), inputValidity (copy)
		var9(inputValidity.Unvalidated)
	end, {})
	local var25 = useTextFieldValueModule(var4, reactModule.useCallback(function()
		-- upvalues: var7 (ref), inputValidity (copy), var19 (ref)
		var7(inputValidity.Unvalidated)
		var19({})
	end, {}))
	local var26 = reactModule.useRef(var4)
	local var27 = useTextFieldValueModule(nil, var24)
	local var28 = useTextFieldValueModule(nil, reportEmail)
	local value = var25.value
	local value_1 = var27.value
	local value_2 = var28.value
	local var29 = if value_2 ~= "" then isStringEmail(value_2) else true
	local var30 = var5 ~= nil and var5:GetAgeInYears() < fIntAccountUpgradeMinimumAgeModule
	local var31 = useLocalization({
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
		titleText = var2.titleTextKey,
		subtitleText = var2.subtitleTextKey,
		saveText = var2.submitTextKey,
		emailError = if value_2 == "" or var29 then nil else "Authentication.SignUp.Response.InvalidEmail",
		birthdayError = if var30 then "Authentication.SignUp.Label.Error.MinimumAgeNotMet" else nil,
		submitError = if var22 ~= nil then nil else getAccountUpgradeErrorTextKeyModule(var22.errorCode),
		monthText = if var5 then dateHelper.MonthsLocalizationKeys[var5.Month] else nil,
		dayAffix = dateHelper.DayAffixLocalizationKey,
		yearAffix = dateHelper.YearAffixLocalizationKey
	})
	local var32 = if not (var5 == nil or var31.monthText == nil) then dateHelper:GetFormattedFullString(var31.monthText, var5.Day, var31.dayAffix, var5.Year, var31.yearAffix, " ", localizationService.RobloxLocaleId) else ""
	local var33 = resolveFieldStatesModule({
		spec = var2,
		isSatisfied = {
			[accountUpgradeFieldModule.Birthday] = var5 ~= nil,
			[accountUpgradeFieldModule.Username] = value ~= "" and useState ~= inputValidity.Invalid,
			[accountUpgradeFieldModule.Password] = value_1 ~= "" and var8 == inputValidity.Valid
		}
	})
	local username = var33[accountUpgradeFieldModule.Username]
	local password = var33[accountUpgradeFieldModule.Password]
	assert(username ~= nil, "Account upgrade flow must include a username state")
	local var34 = reactModule.useMemo(function()
		-- upvalues: var5 (ref), usernameValidationContext (copy), var4 (ref)
		return {
			birthday = if var5 then var5:FormatForEndpoint() else "",
			context = usernameValidationContext.Signup,
			currentUsername = var4
		}
	end, { var5, var4 })
	local var35 = reactModule.useMemo(function()
		-- upvalues: value (ref)
		return { username = value }
	end, { value })
	local var36 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var7 (ref), var5 (ref), usernameSuggestor (copy), var3 (ref), usernameValidationContext (copy), var25 (ref), var19 (ref)
		var7(p3)
		
		if var5 == nil or p2 == "" then
			return
		end
		usernameSuggestor.suggestUsernames(var3, p2, var5:FormatForEndpoint(), usernameValidationContext.Signup):andThen(function(p4)
			-- upvalues: var25 (copy), p2 (ref), var19 (copy)
			if var25.valueRef.current == p2 and p4.shouldUpdateState then
				var19(p4.suggestions or {})
			end
		end)
	end, { var3, var5, var25.valueRef })
	local var37 = reactModule.useCallback(function(_, p2)
		-- upvalues: var9 (ref)
		var9(p2)
	end, {})
	local var38 = reactModule.useCallback(function()
		-- upvalues: var13 (ref)
		var13(true)
	end, {})
	local var39 = reactModule.useCallback(function()
		-- upvalues: var13 (ref)
		var13(false)
	end, {})
	local var40 = reactModule.useCallback(function(p2)
		-- upvalues: var6 (ref), var13 (ref)
		var6(p2)
		var13(false)
	end, {})
	local var41 = computeIsAccountUpgradeButtonEnabledModule({
		birthday = var5,
		username = value,
		password = value_1,
		usernameValid = useState,
		passwordValid = var8,
		email = value_2,
		emailValid = var29,
		isBirthdayOldEnough = not var30,
		isSubmitting = var14,
		requiredFields = var2.requiredFields
	})
	local var42 = reactModule.useCallback(function()
		-- upvalues: var17 (ref)
		var17(function(p2)
			return not p2
		end)
	end, {})
	local var43 = reactModule.useCallback(function(p2)
		-- upvalues: var25 (ref), var19 (ref), authButtonClick (copy), eventStreamConstants (copy)
		var25.onChanged(p2)
		var19({})
		authButtonClick(eventStreamConstants.Context.SinglePageSignUpScreen, eventStreamConstants.Button.UsernameSuggestion, p2)
	end, { var25.onChanged })
	local var44 = reactModule.useCallback(function()
		-- upvalues: var21 (ref)
		var21(true)
	end, {})
	local var45 = reactModule.useCallback(function()
		-- upvalues: var21 (ref)
		var21(false)
	end, {})
	local var46 = if useState == inputValidity.Invalid and #var18 > 0 then var18 else {}
	local var47 = reactModule.useCallback(function()
		-- upvalues: var14 (ref), authButtonClick (copy), eventStreamConstants (copy), flow (ref), var15 (ref), var23 (ref), accountUpgradeRequest (copy), var3 (ref), var2 (ref), value (ref), value_1 (ref), var5 (ref), value_2 (ref), var10 (ref), p1 (ref), var4 (ref), getAccountUpgradeErrorCodeModule (copy), authClientError (copy)
		if var14 then
			return
		end
		authButtonClick(eventStreamConstants.Context.AccountUpgrade, eventStreamConstants.Button.Save, nil, nil, nil, flow)
		var15(true)
		var23(nil)
		accountUpgradeRequest(var3, {
			upgradeType = var2.upgradeType,
			username = value,
			password = value_1,
			birthday = if var5 then var5:FormatForEndpoint() else "",
			email = value_2,
			gender = var10
		}):andThen(function()
			-- upvalues: p1 (copy), var4 (copy), value (copy)
			p1.onSignUpComplete({
				isSuccess = true,
				username = if var4 ~= nil then nil else value,
				displayName = if var4 == nil or value == var4 then nil else value
			})
		end, function(p2)
			-- upvalues: getAccountUpgradeErrorCodeModule (copy), var15 (copy), var23 (copy), p1 (copy), authClientError (copy), eventStreamConstants (copy), flow (copy)
			local var48 = getAccountUpgradeErrorCodeModule(p2)
			var15(false)
			var23({ errorCode = var48 })
			
			if p1.onSignUpFailed then
				p1.onSignUpFailed(var48)
			end
			authClientError(eventStreamConstants.Context.AccountUpgrade, if var48 ~= nil then eventStreamConstants.State.Unknown else tostring(var48), nil, flow)
		end)
	end, {
		var5, var4, value_2, flow, var10, var14, var3, value_1, p1.onSignUpComplete,
		p1.onSignUpFailed, var2.upgradeType, value
	})
	local t_1 = {
		titleText = var31.titleText,
		subtitleText = var31.subtitleText,
		birthdayLabel = var31.birthdayLabel,
		birthday = var5,
		birthdayText = var32,
		birthdayPlaceholder = var31.birthdayPlaceholder,
		birthdayError = var31.birthdayError,
		usernameTitleTextKey = "Authentication.Login.Label.Username"
	}
	local blockingField = username.blockingField
	t_1.usernameSummaryErrorTextKey = if blockingField == nil then "Authentication.SignUp.Label.ErrorsWithUsername" else assert(t[blockingField], `Account upgrade field has no blocker error key: {blockingField}`)
	t_1.isUsernamePrerequisiteMet = username.isUnlocked
	t_1.fieldStates = var33
	t_1.usernameValidatorAdditionalProps = var34
	t_1.usernamePlaceholder = var31.usernamePlaceholder
	t_1.username = value
	t_1.prefilledUsername = var26.current
	t_1.usernameSuggestions = var46
	t_1.usernameSuggestionPrompt = `{var31.usernameSuggestionPrompt}:`
	t_1.onUsernameSuggestionSelected = var43
	t_1.pillClicked = var20
	t_1.updatePillClicked = var44
	t_1.resetPillClicked = var45
	t_1.onUsernameValidated = var36
	t_1.passwordTitleTextKey = "CommonUI.Messages.Label.Password"
	
	if password then
		local blockingField_1 = password.blockingField
		var1 = if blockingField_1 == nil then "Authentication.SignUp.Label.ErrorsWithPassword" else assert(t[blockingField_1], `Account upgrade field has no blocker error key: {blockingField_1}`)
	else
		var1 = "Authentication.SignUp.Label.ErrorsWithPassword"
	end
	t_1.passwordSummaryErrorTextKey = var1
	t_1.isPasswordPrerequisiteMet = if password then password.isUnlocked else false
	t_1.passwordValidatorAdditionalProps = var35
	t_1.passwordPlaceholder = var31.passwordPlaceholder
	t_1.onPasswordValidated = var37
	t_1.hidePassword = var16
	t_1.emailLabel = var31.emailLabel
	t_1.emailPlaceholder = var31.emailPlaceholder
	t_1.email = value_2
	t_1.emailError = var31.emailError
	t_1.genderLabel = var31.genderLabel
	t_1.femaleText = var31.femaleText
	t_1.maleText = var31.maleText
	t_1.gender = var10
	t_1.saveText = var31.saveText
	t_1.isSaveEnabled = var41
	t_1.isSubmitting = var14
	t_1.submitError = var31.submitError
	t_1.isBirthdayPickerOpen = var12
	t_1.hasBackdrop = p1.hasBackdrop
	t_1.onClose = if var2.canDismiss then p1.onClose else nil
	t_1.onBirthdayActivated = var38
	t_1.onBirthdayConfirmed = var40
	t_1.onBirthdayPickerClosed = var39
	t_1.onUsernameChanged = var25.onChanged
	t_1.onPasswordChanged = var27.onChanged
	t_1.onEmailChanged = var28.onChanged
	t_1.onGenderChanged = var11
	t_1.onPasswordVisibilityToggle = var42
	t_1.onSaveActivated = var47
	
	return t_1
end