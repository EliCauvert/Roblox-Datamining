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
	local flow = p1.flow or accountUpgradeFlowModule.Pioneer
	local var1 = getFlowSpec(flow)
	assert(var1 ~= nil, `Unsupported account upgrade flow: {flow}`)
	local var2 = useRoactService(roactNetworking)
	local var3 = if fFlagAllowCurrentUsernameOnSignup then p1.currentUsername else nil
	local var4, var5 = reactModule.useState(nil)
	local useState = reactModule.useState
	local var6 = if var3 == nil or var3 == "" then inputValidity.Unvalidated else inputValidity.Valid
	useState, var21 = useState(var6)
	local var7, var8 = reactModule.useState(inputValidity.Unvalidated)
	local var9, var10 = reactModule.useState(userGender.Unknown)
	local var11, var12 = reactModule.useState(false)
	local var13, var14 = reactModule.useState(false)
	local var15, var16 = reactModule.useState(false)
	local var17, var18 = reactModule.useState(true)
	local var19, var20 = reactModule.useState({})
	local var21, var22 = reactModule.useState(false)
	local var23, var24 = reactModule.useState(nil)
	local var25 = reactModule.useCallback(function()
		-- upvalues: var8 (ref), inputValidity (copy)
		var8(inputValidity.Unvalidated)
	end, {})
	local var26 = useTextFieldValueModule(var3, reactModule.useCallback(function()
		-- upvalues: var6 (ref), inputValidity (copy), var20 (ref)
		var6(inputValidity.Unvalidated)
		var20({})
	end, {}))
	local var27 = reactModule.useRef(var3)
	local var28 = useTextFieldValueModule(nil, var25)
	local var29 = useTextFieldValueModule(nil, reportEmail)
	local value = var26.value
	local value_1 = var28.value
	local value_2 = var29.value
	local var30 = if value_2 ~= "" then isStringEmail(value_2) else true
	local var31 = var4 ~= nil and var4:GetAgeInYears() < fIntAccountUpgradeMinimumAgeModule
	local var32 = useLocalization({
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
		titleText = var1.titleTextKey,
		subtitleText = var1.subtitleTextKey,
		saveText = var1.submitTextKey,
		emailError = if value_2 == "" or var30 then nil else "Authentication.SignUp.Response.InvalidEmail",
		birthdayError = if var31 then "Authentication.SignUp.Label.Error.MinimumAgeNotMet" else nil,
		submitError = if var23 ~= nil then nil else getAccountUpgradeErrorTextKeyModule(var23.errorCode),
		monthText = if var4 then dateHelper.MonthsLocalizationKeys[var4.Month] else nil,
		dayAffix = dateHelper.DayAffixLocalizationKey,
		yearAffix = dateHelper.YearAffixLocalizationKey
	})
	local var33 = if not (var4 == nil or var32.monthText == nil) then dateHelper:GetFormattedFullString(var32.monthText, var4.Day, var32.dayAffix, var4.Year, var32.yearAffix, " ", localizationService.RobloxLocaleId) else ""
	local var34 = resolveFieldStatesModule({
		spec = var1,
		isSatisfied = {
			[accountUpgradeFieldModule.Birthday] = var4 ~= nil,
			[accountUpgradeFieldModule.Username] = value ~= "" and useState ~= inputValidity.Invalid,
			[accountUpgradeFieldModule.Password] = value_1 ~= "" and var7 == inputValidity.Valid
		}
	})
	local username = var34[accountUpgradeFieldModule.Username]
	local password = var34[accountUpgradeFieldModule.Password]
	assert(username ~= nil, "Account upgrade flow must include a username state")
	local var35 = reactModule.useMemo(function()
		-- upvalues: var4 (ref), usernameValidationContext (copy), var3 (ref)
		return {
			birthday = if var4 then var4:FormatForEndpoint() else "",
			context = usernameValidationContext.Signup,
			currentUsername = var3
		}
	end, { var4, var3 })
	local var36 = reactModule.useMemo(function()
		-- upvalues: value (ref)
		return { username = value }
	end, { value })
	local var37 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var6 (ref), var4 (ref), usernameSuggestor (copy), var2 (ref), usernameValidationContext (copy), var26 (ref), var20 (ref)
		var6(p3)
		
		if var4 == nil or p2 == "" then
			return
		end
		usernameSuggestor.suggestUsernames(var2, p2, var4:FormatForEndpoint(), usernameValidationContext.Signup):andThen(function(p4)
			-- upvalues: var26 (copy), p2 (ref), var20 (copy)
			if var26.valueRef.current == p2 and p4.shouldUpdateState then
				var20(p4.suggestions or {})
			end
		end)
	end, { var2, var4, var26.valueRef })
	local var38 = reactModule.useCallback(function(_, p2)
		-- upvalues: var8 (ref)
		var8(p2)
	end, {})
	local var39 = reactModule.useCallback(function()
		-- upvalues: var12 (ref)
		var12(true)
	end, {})
	local var40 = reactModule.useCallback(function()
		-- upvalues: var12 (ref)
		var12(false)
	end, {})
	local var41 = reactModule.useCallback(function(p2)
		-- upvalues: var5 (ref), var12 (ref)
		var5(p2)
		var12(false)
	end, {})
	local var42 = reactModule.useCallback(function()
		-- upvalues: var14 (ref)
		var14(true)
	end, {})
	local var43 = reactModule.useCallback(function()
		-- upvalues: var14 (ref)
		var14(false)
	end, {})
	local var44 = nil
	
	if var1.canDismiss then
		var44 = if not var1.signsOutOnDismiss then if p1.onSignOut == nil or var15 then nil else var42 else p1.onClose
	end
	local var45
	local var46 = computeIsAccountUpgradeButtonEnabledModule({
		birthday = var4,
		username = value,
		password = value_1,
		usernameValid = useState,
		passwordValid = var7,
		email = value_2,
		emailValid = var30,
		isBirthdayOldEnough = not var31,
		isSubmitting = var15,
		requiredFields = var1.requiredFields
	})
	local var47 = reactModule.useCallback(function()
		-- upvalues: var18 (ref)
		var18(function(p2)
			return not p2
		end)
	end, {})
	local var48 = reactModule.useCallback(function(p2)
		-- upvalues: var26 (ref), var20 (ref), authButtonClick (copy), eventStreamConstants (copy)
		var26.onChanged(p2)
		var20({})
		authButtonClick(eventStreamConstants.Context.SinglePageSignUpScreen, eventStreamConstants.Button.UsernameSuggestion, p2)
	end, { var26.onChanged })
	local var49 = reactModule.useCallback(function()
		-- upvalues: var22 (ref)
		var22(true)
	end, {})
	local var50 = reactModule.useCallback(function()
		-- upvalues: var22 (ref)
		var22(false)
	end, {})
	local var51 = if useState == inputValidity.Invalid and #var19 > 0 then var19 else {}
	local var52 = reactModule.useCallback(function()
		-- upvalues: var15 (ref), authButtonClick (copy), eventStreamConstants (copy), flow (ref), var16 (ref), var24 (ref), accountUpgradeRequest (copy), var2 (ref), var1 (ref), value (ref), value_1 (ref), var4 (ref), value_2 (ref), var9 (ref), p1 (ref), var3 (ref), getAccountUpgradeErrorCodeModule (copy), authClientError (copy)
		if var15 then
			return
		end
		authButtonClick(eventStreamConstants.Context.AccountUpgrade, eventStreamConstants.Button.Save, nil, nil, nil, flow)
		var16(true)
		var24(nil)
		accountUpgradeRequest(var2, {
			upgradeType = var1.upgradeType,
			username = value,
			password = value_1,
			birthday = if var4 then var4:FormatForEndpoint() else "",
			email = value_2,
			gender = var9
		}):andThen(function()
			-- upvalues: p1 (copy), var3 (copy), value (copy)
			p1.onSignUpComplete({
				isSuccess = true,
				username = if var3 ~= nil then nil else value,
				displayName = if var3 == nil or value == var3 then nil else value
			})
		end, function(p2)
			-- upvalues: getAccountUpgradeErrorCodeModule (copy), var16 (copy), var24 (copy), p1 (copy), authClientError (copy), eventStreamConstants (copy), flow (copy)
			local var53 = getAccountUpgradeErrorCodeModule(p2)
			var16(false)
			var24({ errorCode = var53 })
			
			if p1.onSignUpFailed then
				p1.onSignUpFailed(var53)
			end
			authClientError(eventStreamConstants.Context.AccountUpgrade, if var53 ~= nil then eventStreamConstants.State.Unknown else tostring(var53), nil, flow)
		end)
	end, {
		var4, var3, value_2, flow, var9, var15, var2, value_1, p1.onSignUpComplete,
		p1.onSignUpFailed, var1.upgradeType, value
	})
	local t_1 = {
		titleText = var32.titleText,
		subtitleText = var32.subtitleText,
		birthdayLabel = var32.birthdayLabel,
		birthday = var4,
		birthdayText = var33,
		birthdayPlaceholder = var32.birthdayPlaceholder,
		birthdayError = var32.birthdayError,
		usernameTitleTextKey = "Authentication.Login.Label.Username"
	}
	local blockingField = username.blockingField
	t_1.usernameSummaryErrorTextKey = if blockingField == nil then "Authentication.SignUp.Label.ErrorsWithUsername" else assert(t[blockingField], `Account upgrade field has no blocker error key: {blockingField}`)
	t_1.isUsernamePrerequisiteMet = username.isUnlocked
	t_1.fieldStates = var34
	t_1.usernameValidatorAdditionalProps = var35
	t_1.usernamePlaceholder = var32.usernamePlaceholder
	t_1.username = value
	t_1.prefilledUsername = var27.current
	t_1.usernameSuggestions = var51
	t_1.usernameSuggestionPrompt = `{var32.usernameSuggestionPrompt}:`
	t_1.onUsernameSuggestionSelected = var48
	t_1.pillClicked = var21
	t_1.updatePillClicked = var49
	t_1.resetPillClicked = var50
	t_1.onUsernameValidated = var37
	t_1.passwordTitleTextKey = "CommonUI.Messages.Label.Password"
	
	if password then
		local blockingField_1 = password.blockingField
		var45 = if blockingField_1 == nil then "Authentication.SignUp.Label.ErrorsWithPassword" else assert(t[blockingField_1], `Account upgrade field has no blocker error key: {blockingField_1}`)
	else
		var45 = "Authentication.SignUp.Label.ErrorsWithPassword"
	end
	t_1.passwordSummaryErrorTextKey = var45
	t_1.isPasswordPrerequisiteMet = if password then password.isUnlocked else false
	t_1.passwordValidatorAdditionalProps = var36
	t_1.passwordPlaceholder = var32.passwordPlaceholder
	t_1.onPasswordValidated = var38
	t_1.hidePassword = var17
	t_1.emailLabel = var32.emailLabel
	t_1.emailPlaceholder = var32.emailPlaceholder
	t_1.email = value_2
	t_1.emailError = var32.emailError
	t_1.genderLabel = var32.genderLabel
	t_1.femaleText = var32.femaleText
	t_1.maleText = var32.maleText
	t_1.gender = var9
	t_1.saveText = var32.saveText
	t_1.isSaveEnabled = var46
	t_1.isSubmitting = var15
	t_1.submitError = var32.submitError
	t_1.isBirthdayPickerOpen = var11
	t_1.hasBackdrop = p1.hasBackdrop
	t_1.onClose = var44
	t_1.confirmsClose = var44 ~= nil and var1.signsOutOnDismiss
	t_1.isCloseConfirmationOpen = var13
	t_1.onCloseConfirmationBack = var43
	t_1.onSignOut = p1.onSignOut
	t_1.onBirthdayActivated = var39
	t_1.onBirthdayConfirmed = var41
	t_1.onBirthdayPickerClosed = var40
	t_1.onUsernameChanged = var26.onChanged
	t_1.onPasswordChanged = var28.onChanged
	t_1.onEmailChanged = var29.onChanged
	t_1.onGenderChanged = var10
	t_1.onPasswordVisibilityToggle = var47
	t_1.onSaveActivated = var52
	
	return t_1
end