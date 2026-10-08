local accountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local parent = accountUpgrade.Parent
local localizationService = game:GetService("LocalizationService")
local promiseModule = require(parent.Promise)
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
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagAllowCurrentUsernameOnSignup = sharedFlagsModule.FFlagAllowCurrentUsernameOnSignup
local getFFlagEnableAuditForSinglePageSignUp = sharedFlagsModule.GetFFlagEnableAuditForSinglePageSignUp
local dateHelper = require(parent.Time).DateHelper
local fFlagEnableDesktopSsoSignupDialogModule = require(accountUpgrade.Flags.FFlagEnableDesktopSsoSignupDialog)
local accountUpgradeFieldModule = require(accountUpgrade.AccountUpgradeField)
local accountUpgradeFlowModule = require(accountUpgrade.AccountUpgradeFlow)
local accountUpgradeSurfaceModule = require(accountUpgrade.AccountUpgradeSurface)
local accountUpgradeAnalyticsModule = require(accountUpgrade.Analytics.AccountUpgradeAnalytics)
local getFlowSpec = require(accountUpgrade.FlowSpec).getFlowSpec
local computeIsAccountUpgradeButtonEnabledModule = require(accountUpgrade.Utils.computeIsAccountUpgradeButtonEnabled)
local getAccountUpgradeErrorCodeModule = require(accountUpgrade.Utils.getAccountUpgradeErrorCode)
local getAccountUpgradeErrorTextKeyModule = require(accountUpgrade.Utils.getAccountUpgradeErrorTextKey)
local resolveFieldStatesModule = require(accountUpgrade.Utils.resolveFieldStates)
local useTextFieldValueModule = require(accountUpgrade.Hooks.useTextFieldValue)
local fFlagAccountUpgradeOAuthTelemetryModule = require(accountUpgrade.Flags.FFlagAccountUpgradeOAuthTelemetry)
local _ = require(script.Parent.AccountUpgradeView)
local _ = require(script.Parent.AccountUpgradeFields)
local inputValidity = authCommonModule.Enums.InputValidity
local userGender = authCommonModule.Enums.UserGender
local usernameValidationContext = authCommonModule.Enums.UsernameValidationContext
local isStringEmail = authCommonModule.Utils.isStringEmail
local accountUpgradeRequest = authCommonModule.Http.Requests.AccountUpgradeRequest
local t = {
	startTermsTag = "<a href=\"terms\">",
	endTermsTag = "</a>",
	startPrivacyTag = "<a href=\"privacy\">",
	endPrivacyTag = "</a>"
}

local function _(p1, p2)
	return if table.find(p1.requiredFields, p2) == nil then table.find(p1.optionalFields, p2) ~= nil else true
end

local t_1 = {
	[accountUpgradeFieldModule.Birthday] = "Authentication.SignUp.Response.BirthdayMustBeSetFirst",
	[accountUpgradeFieldModule.Username] = "Authentication.SignUp.Response.UsernameMustBeSetFirst"
}

local _ = function(p1, p2)
	-- upvalues: t_1 (ref)
	local blockingField = p1.blockingField
	
	return if blockingField == nil then p2 else assert(t_1[blockingField], `Account upgrade field has no blocker error key: {blockingField}`)
end

local function resolveLegalText(p1, p2)
	-- upvalues: fFlagEnableDesktopSsoSignupDialogModule (ref), t (ref)
	if not fFlagEnableDesktopSsoSignupDialogModule or p2.hidesLegalText == true then
		return {}
	end
	local var1 = if p1.linkedAccountLegalTextKey then p2.linkedPlatformAccountName else nil
	
	if var1 then
		return {
			activeKey = p1.linkedAccountLegalTextKey,
			linkedPlatformAccountName = var1
		}
	end
	local var2 = nil
	
	if p1.legalTextKey then
		local cloned = table.clone(t)
		cloned[1] = p1.legalTextKey
		var2 = cloned
	end
	return { activeKey = p1.legalTextKey, standardKey = var2 }
end

local function reportEmail() end

return function(p1)
	-- upvalues: accountUpgradeFlowModule (ref), getFlowSpec (ref), accountUpgradeSurfaceModule (ref), fFlagAccountUpgradeOAuthTelemetryModule (ref), accountUpgradeAnalyticsModule (ref), useRoactService (ref), roactNetworking (ref), fFlagEnableDesktopSsoSignupDialogModule (ref), fFlagAllowCurrentUsernameOnSignup (ref), reactModule (ref), inputValidity (ref), userGender (ref), useTextFieldValueModule (ref), reportEmail (ref), isStringEmail (ref), dateHelper (ref), getAccountUpgradeErrorTextKeyModule (ref), getFFlagEnableAuditForSinglePageSignUp (ref), resolveLegalText (ref), useLocalization (ref), accountUpgradeFieldModule (ref), t (ref), localizationService (ref), resolveFieldStatesModule (ref), usernameValidationContext (ref), usernameSuggestor (ref), computeIsAccountUpgradeButtonEnabledModule (ref), authButtonClick (ref), eventStreamConstants (ref), promiseModule (ref), accountUpgradeRequest (ref), getAccountUpgradeErrorCodeModule (ref), authClientError (ref), t_1 (ref)
	local flow = p1.flow or accountUpgradeFlowModule.Pioneer
	local var1 = getFlowSpec(flow)
	assert(var1 ~= nil, `Unsupported account upgrade flow: {flow}`)
	local surface = p1.surface or accountUpgradeSurfaceModule.Dialog
	local var2 = if fFlagAccountUpgradeOAuthTelemetryModule then accountUpgradeAnalyticsModule.getEventOrigin(flow, surface) else flow
	local var3 = useRoactService(roactNetworking)
	local var4 = if fFlagEnableDesktopSsoSignupDialogModule then p1.submit else nil
	local var5 = fFlagEnableDesktopSsoSignupDialogModule and var1.hostReportsSubmit == true
	local var6 = if fFlagAllowCurrentUsernameOnSignup then p1.currentUsername else nil
	local var7, var8 = reactModule.useState(nil)
	local useState = reactModule.useState
	local var9 = if var6 == nil or var6 == "" then inputValidity.Unvalidated else inputValidity.Valid
	useState, var35 = useState(var9)
	local var10, var11 = reactModule.useState(inputValidity.Unvalidated)
	local var12, var13 = reactModule.useState(userGender.Unknown)
	local var14, var15 = reactModule.useState(false)
	local var16, var17 = reactModule.useState(false)
	local var18, var19 = reactModule.useState(false)
	local var20, var21 = reactModule.useState(true)
	local var22, var23 = reactModule.useState({})
	local var24, var25 = reactModule.useState(false)
	local var26, var27 = reactModule.useState(nil)
	local var28 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: fFlagAccountUpgradeOAuthTelemetryModule (copy), accountUpgradeAnalyticsModule (copy), flow (ref), surface (ref)
		if fFlagAccountUpgradeOAuthTelemetryModule then
			accountUpgradeAnalyticsModule.reportOpened(flow, surface)
		end
	end, { flow, surface })
	local var29 = reactModule.useCallback(function()
		-- upvalues: var11 (ref), inputValidity (copy)
		var11(inputValidity.Unvalidated)
	end, {})
	local var30 = useTextFieldValueModule(var6, reactModule.useCallback(function()
		-- upvalues: var9 (ref), inputValidity (copy), var23 (ref)
		var9(inputValidity.Unvalidated)
		var23({})
	end, {}))
	local var31 = reactModule.useRef(var6)
	local var32 = useTextFieldValueModule(nil, var29)
	local var33 = useTextFieldValueModule(nil, reportEmail)
	local var34 = fFlagEnableDesktopSsoSignupDialogModule and p1.isHidden == true
	local onChanged = var32.onChanged
	local valueRef = var30.valueRef
	
	if fFlagEnableDesktopSsoSignupDialogModule then
		reactModule.useEffect(function()
			-- upvalues: var34 (ref), var31 (ref), valueRef (ref), onChanged (ref)
			if var34 then
				var31.current = valueRef.current
				onChanged("")
			end
		end, { var34, onChanged, valueRef })
	end
	local value = var30.value
	local value_1 = var32.value
	local value_2 = var33.value
	local var35 = if value_2 ~= "" then isStringEmail(value_2) else true
	local var36 = if value_2 == "" or var35 then nil else "Authentication.SignUp.Response.InvalidEmail"
	local var37 = if var7 then dateHelper.MonthsLocalizationKeys[var7.Month] else nil
	local minimumAge = var1.minimumAge
	local var38 = var7 ~= nil and (minimumAge ~= nil and var7:GetAgeInYears() < minimumAge)
	local var39 = if var38 then "Authentication.SignUp.Label.Error.MinimumAgeNotMet" else nil
	local var40 = nil
	
	if var26 ~= nil and not var26.isHandled then
		var40 = var26.errorTextKey or getAccountUpgradeErrorTextKeyModule(if var4 then nil else var26.errorCode)
	end
	local onLegalLinkSelected = p1.onLegalLinkSelected
	local var41 = if fFlagEnableDesktopSsoSignupDialogModule then reactModule.useCallback(function(p2)
		-- upvalues: onLegalLinkSelected (ref)
		if onLegalLinkSelected == nil then return end
		if p2 == "terms" then
			onLegalLinkSelected("terms")
			
			return
		elseif p2 == "privacy" then
			onLegalLinkSelected("privacy")
		end
	end, { onLegalLinkSelected }) else nil
	local var42 = fFlagEnableDesktopSsoSignupDialogModule and (var1.capturesAuditContent == true and getFFlagEnableAuditForSinglePageSignUp())
	local var43 = resolveLegalText(var1, p1)
	local activeKey = var43.activeKey
	local linkedPlatformAccountName = var43.linkedPlatformAccountName
	local var44 = useLocalization({
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
		legalText = var43.standardKey,
		legalTextTemplate = if var42 then activeKey else nil,
		usernameTitle = if var42 then "Authentication.Login.Label.Username" else nil,
		passwordTitle = if var42 then "CommonUI.Messages.Label.Password" else nil,
		saveText = var1.submitTextKey,
		emailError = var36,
		birthdayError = var39,
		submitError = var40,
		monthText = var37,
		dayAffix = dateHelper.DayAffixLocalizationKey,
		yearAffix = dateHelper.YearAffixLocalizationKey
	})
	local var45 = if fFlagEnableDesktopSsoSignupDialogModule then useLocalization({
		legalText = if linkedPlatformAccountName then {
			var1.linkedAccountLegalTextKey,
			platform = linkedPlatformAccountName,
			ctaButton = var44.saveText
		} else nil
	}).legalText else nil
	local var46 = if fFlagEnableDesktopSsoSignupDialogModule then reactModule.useMemo(function()
		-- upvalues: var42 (ref), var1 (ref), accountUpgradeFieldModule (copy), var44 (ref), activeKey (ref), linkedPlatformAccountName (ref), t (copy)
		if not var42 then
			return nil
		end
		local t_1 = {}
		
		local function _(p2, p3, p4)
			-- upvalues: t_1 (ref)
			if p3 ~= nil then
				table.insert(t_1, {
					translationKey = p2,
					translatedSourceString = p3,
					parameters = p4
				})
			end
		end
		
		local var47 = var1
		local birthday = accountUpgradeFieldModule.Birthday
		
		if if table.find(var47.requiredFields, birthday) == nil then table.find(var47.optionalFields, birthday) ~= nil else true then
			local birthdayLabel = var44.birthdayLabel
			
			if birthdayLabel ~= nil then
				table.insert(t_1, {
					translationKey = "Authentication.SignUp.Label.Birthday",
					parameters = nil,
					translatedSourceString = birthdayLabel
				})
			end
		end
		local usernameTitle = var44.usernameTitle
		
		if usernameTitle ~= nil then
			table.insert(t_1, {
				translationKey = "Authentication.Login.Label.Username",
				parameters = nil,
				translatedSourceString = usernameTitle
			})
		end
		local var48 = var1
		local password = accountUpgradeFieldModule.Password
		
		if if table.find(var48.requiredFields, password) == nil then table.find(var48.optionalFields, password) ~= nil else true then
			local passwordTitle = var44.passwordTitle
			
			if passwordTitle ~= nil then
				table.insert(t_1, {
					translationKey = "CommonUI.Messages.Label.Password",
					parameters = nil,
					translatedSourceString = passwordTitle
				})
			end
		end
		local var49 = var1
		local email = accountUpgradeFieldModule.Email
		
		if if table.find(var49.requiredFields, email) == nil then table.find(var49.optionalFields, email) ~= nil else true then
			local emailLabel = var44.emailLabel
			
			if emailLabel ~= nil then
				table.insert(t_1, {
					translationKey = "Authentication.Login.Label.Email",
					parameters = nil,
					translatedSourceString = emailLabel
				})
			end
		end
		local var50 = var1
		local gender = accountUpgradeFieldModule.Gender
		
		if if table.find(var50.requiredFields, gender) == nil then table.find(var50.optionalFields, gender) ~= nil else true then
			local genderLabel = var44.genderLabel
			
			if genderLabel ~= nil then
				table.insert(t_1, {
					translationKey = "Authentication.SignUp.Label.Gender",
					parameters = nil,
					translatedSourceString = genderLabel
				})
			end
		end
		if activeKey then
			local var51 = activeKey
			local legalTextTemplate = var44.legalTextTemplate
			local var52 = if linkedPlatformAccountName then {
				platform = linkedPlatformAccountName,
				ctaButton = var44.saveText
			} else t
			
			if legalTextTemplate ~= nil then
				table.insert(t_1, {
					translationKey = var51,
					translatedSourceString = legalTextTemplate,
					parameters = var52
				})
			end
		end
		return t_1
	end, {
		var42, var1, activeKey, linkedPlatformAccountName, var44.saveText,
		var44.birthdayLabel, var44.usernameTitle, var44.passwordTitle,
		var44.emailLabel, var44.genderLabel, var44.legalTextTemplate
	}) else nil
	local var47 = if not (var7 == nil or var44.monthText == nil) then dateHelper:GetFormattedFullString(var44.monthText, var7.Day, var44.dayAffix, var7.Year, var44.yearAffix, " ", localizationService.RobloxLocaleId) else ""
	local var48 = resolveFieldStatesModule({
		spec = var1,
		isSatisfied = {
			[accountUpgradeFieldModule.Birthday] = var7 ~= nil,
			[accountUpgradeFieldModule.Username] = value ~= "" and useState ~= inputValidity.Invalid,
			[accountUpgradeFieldModule.Password] = value_1 ~= "" and var10 == inputValidity.Valid
		}
	})
	local username = var48[accountUpgradeFieldModule.Username]
	local password = var48[accountUpgradeFieldModule.Password]
	assert(username ~= nil, "Account upgrade flow must include a username state")
	local var49 = reactModule.useMemo(function()
		-- upvalues: var7 (ref), usernameValidationContext (copy), var6 (ref)
		return {
			birthday = if var7 then var7:FormatForEndpoint() else "",
			context = usernameValidationContext.Signup,
			currentUsername = var6
		}
	end, { var7, var6 })
	local var50 = reactModule.useMemo(function()
		-- upvalues: value (ref)
		return { username = value }
	end, { value })
	local var51 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var9 (ref), var7 (ref), usernameSuggestor (copy), var3 (ref), usernameValidationContext (copy), var30 (ref), var23 (ref)
		var9(p3)
		
		if var7 == nil or p2 == "" then
			return
		end
		usernameSuggestor.suggestUsernames(var3, p2, var7:FormatForEndpoint(), usernameValidationContext.Signup):andThen(function(p4)
			-- upvalues: var30 (copy), p2 (ref), var23 (copy)
			if var30.valueRef.current == p2 and p4.shouldUpdateState then
				var23(p4.suggestions or {})
			end
		end)
	end, { var3, var7, var30.valueRef })
	local var52 = reactModule.useCallback(function(_, p2)
		-- upvalues: var11 (ref)
		var11(p2)
	end, {})
	local var53 = if fFlagEnableDesktopSsoSignupDialogModule then p1.onFieldInteraction else nil
	local var54 = reactModule.useCallback(function()
		-- upvalues: var53 (ref), var15 (ref)
		if var53 then
			var53("BirthdayFocused")
		end
		var15(true)
	end, { var53 })
	local var55 = reactModule.useCallback(function()
		-- upvalues: var15 (ref)
		var15(false)
	end, {})
	local var56 = reactModule.useCallback(function(p2)
		-- upvalues: var53 (ref), var8 (ref), var15 (ref)
		if var53 then
			var53("BirthdayConfirmed")
		end
		var8(p2)
		var15(false)
	end, { var53 })
	local var57 = if fFlagEnableDesktopSsoSignupDialogModule then reactModule.useCallback(function()
		-- upvalues: var53 (ref)
		if var53 then
			var53("UsernameFocused")
		end
	end, { var53 }) else nil
	local var58 = if fFlagEnableDesktopSsoSignupDialogModule then reactModule.useCallback(function()
		-- upvalues: var53 (ref)
		if var53 then
			var53("PasswordFocused")
		end
	end, { var53 }) else nil
	local var59 = if fFlagEnableDesktopSsoSignupDialogModule then reactModule.useCallback(function(p2)
		-- upvalues: var53 (ref), userGender (copy), var12 (ref), var13 (ref)
		if var53 then
			var53(if (if p2 == userGender.Unknown then var12 else p2) == userGender.Male then "GenderMaleActivated" else "GenderFemaleActivated")
		end
		var13(p2)
	end, { var12, var53 }) else nil
	local var60 = reactModule.useCallback(function()
		-- upvalues: fFlagAccountUpgradeOAuthTelemetryModule (copy), accountUpgradeAnalyticsModule (copy), flow (ref), surface (ref), var17 (ref)
		if fFlagAccountUpgradeOAuthTelemetryModule then
			accountUpgradeAnalyticsModule.reportCloseButtonClicked(flow, surface)
		end
		var17(true)
	end, { flow, surface })
	local var61 = reactModule.useCallback(function()
		-- upvalues: fFlagAccountUpgradeOAuthTelemetryModule (copy), accountUpgradeAnalyticsModule (copy), flow (ref), surface (ref), var17 (ref)
		if fFlagAccountUpgradeOAuthTelemetryModule then
			accountUpgradeAnalyticsModule.reportCloseWarningBack(flow, surface)
		end
		var17(false)
	end, { flow, surface })
	local onSignOut = p1.onSignOut
	local var62 = reactModule.useMemo(function()
		-- upvalues: onSignOut (ref), fFlagAccountUpgradeOAuthTelemetryModule (copy), accountUpgradeAnalyticsModule (copy), flow (ref), surface (ref)
		return if onSignOut == nil then nil else function()
			-- upvalues: fFlagAccountUpgradeOAuthTelemetryModule (copy), accountUpgradeAnalyticsModule (copy), flow (copy), surface (copy), onSignOut (copy)
			if fFlagAccountUpgradeOAuthTelemetryModule then
				accountUpgradeAnalyticsModule.reportCloseWarningClose(flow, surface)
			end
			onSignOut()
		end
	end, { flow, surface, onSignOut })
	local var63 = nil
	
	if var1.canDismiss then
		var63 = if not var1.signsOutOnDismiss then if p1.onSignOut == nil or var18 then nil else var60 else p1.onClose
	end
	local var64
	local var65 = computeIsAccountUpgradeButtonEnabledModule({
		birthday = var7,
		username = value,
		password = value_1,
		usernameValid = useState,
		passwordValid = var10,
		email = value_2,
		emailValid = var35,
		isBirthdayOldEnough = not var38,
		isSubmitting = var18,
		requiredFields = var1.requiredFields
	})
	local var66 = reactModule.useCallback(function()
		-- upvalues: var53 (ref), var20 (ref), var21 (ref)
		if var53 then
			var53(if var20 then "PasswordShown" else "PasswordHidden")
		end
		var21(function(p2)
			return not p2
		end)
	end, { var20, var53 })
	local var67 = reactModule.useCallback(function(p2)
		-- upvalues: var30 (ref), var23 (ref), authButtonClick (copy), eventStreamConstants (copy)
		var30.onChanged(p2)
		var23({})
		authButtonClick(eventStreamConstants.Context.SinglePageSignUpScreen, eventStreamConstants.Button.UsernameSuggestion, p2)
	end, { var30.onChanged })
	local var68 = reactModule.useCallback(function()
		-- upvalues: var25 (ref)
		var25(true)
	end, {})
	local var69 = reactModule.useCallback(function()
		-- upvalues: var25 (ref)
		var25(false)
	end, {})
	local var70 = if useState == inputValidity.Invalid and #var22 > 0 then var22 else {}
	local var71 = reactModule.useCallback(function()
		-- upvalues: var18 (ref), var5 (ref), authButtonClick (copy), eventStreamConstants (copy), var2 (ref), var19 (ref), var27 (ref), value (ref), value_1 (ref), var7 (ref), value_2 (ref), var12 (ref), var4 (ref), promiseModule (copy), accountUpgradeRequest (copy), var3 (ref), var1 (ref), fFlagAccountUpgradeOAuthTelemetryModule (copy), accountUpgradeAnalyticsModule (copy), flow (ref), surface (ref), p1 (ref), var6 (ref), getAccountUpgradeErrorCodeModule (copy), authClientError (copy), var28 (ref)
		if var18 then return end
		if not var5 then
			authButtonClick(eventStreamConstants.Context.AccountUpgrade, eventStreamConstants.Button.Save, nil, nil, nil, var2)
		end
		var19(true)
		var27(nil)
		local t = {
			username = value,
			password = value_1,
			birthday = if var7 then var7:FormatForEndpoint() else "",
			age = if var7 then var7:GetAgeInYears() else nil,
			email = value_2,
			gender = var12
		};
		(if var4 then promiseModule.try(function()
			-- upvalues: var4 (copy), t (ref), promiseModule (copy)
			local var72 = var4(t)
			
			return if promiseModule.is(var72) then var72 else promiseModule.reject({})
		end) else accountUpgradeRequest(var3, {
			upgradeType = var1.upgradeType,
			username = t.username,
			password = t.password,
			birthday = t.birthday,
			email = t.email,
			gender = t.gender
		})):andThen(function()
			-- upvalues: fFlagAccountUpgradeOAuthTelemetryModule (copy), var5 (copy), accountUpgradeAnalyticsModule (copy), flow (copy), surface (copy), p1 (copy), var6 (copy), value (copy)
			if fFlagAccountUpgradeOAuthTelemetryModule and not var5 then
				accountUpgradeAnalyticsModule.reportSucceeded(flow, surface)
			end
			p1.onSignUpComplete({
				isSuccess = true,
				username = if var6 ~= nil then nil else value,
				displayName = if var6 == nil or value == var6 then nil else value
			})
		end, function(p2)
			-- upvalues: var4 (copy), getAccountUpgradeErrorCodeModule (copy), var19 (copy), var27 (copy), p1 (copy), var5 (copy), authClientError (copy), eventStreamConstants (copy), var2 (copy), fFlagAccountUpgradeOAuthTelemetryModule (copy), var28 (copy), accountUpgradeAnalyticsModule (copy), flow (copy), surface (copy)
			local var72 = if var4 == nil then { errorCode = getAccountUpgradeErrorCodeModule(p2) } elseif type(p2) == "table" then p2 else {}
			local errorCode = var72.errorCode
			var19(false)
			var27(var72)
			
			if p1.onSignUpFailed then
				p1.onSignUpFailed(errorCode)
			end
			if not var5 then
				authClientError(eventStreamConstants.Context.AccountUpgrade, if errorCode ~= nil then eventStreamConstants.State.Unknown else tostring(errorCode), nil, var2)
				
				if fFlagAccountUpgradeOAuthTelemetryModule and not var28.current then
					var28.current = true
					accountUpgradeAnalyticsModule.reportFirstFailure(flow, surface, errorCode)
				end
			end
		end)
	end, {
		var7, var6, value_2, var2, flow, var12, var18, var3, value_1,
		p1.onSignUpComplete, p1.onSignUpFailed, var4, var5, var1, surface, value
	})
	local t_2 = {
		titleText = var44.titleText,
		subtitleText = var44.subtitleText,
		birthdayLabel = var44.birthdayLabel,
		birthday = var7,
		birthdayText = var47,
		birthdayPlaceholder = var44.birthdayPlaceholder,
		birthdayError = var44.birthdayError,
		usernameTitleTextKey = "Authentication.Login.Label.Username"
	}
	local blockingField = username.blockingField
	t_2.usernameSummaryErrorTextKey = if blockingField == nil then "Authentication.SignUp.Label.ErrorsWithUsername" else assert(t_1[blockingField], `Account upgrade field has no blocker error key: {blockingField}`)
	t_2.isUsernamePrerequisiteMet = username.isUnlocked
	t_2.fieldStates = var48
	t_2.usernameValidatorAdditionalProps = var49
	t_2.usernamePlaceholder = var44.usernamePlaceholder
	t_2.username = value
	t_2.prefilledUsername = var31.current
	t_2.usernameSuggestions = var70
	t_2.usernameSuggestionPrompt = `{var44.usernameSuggestionPrompt}:`
	t_2.onUsernameSuggestionSelected = var67
	t_2.pillClicked = var24
	t_2.updatePillClicked = var68
	t_2.resetPillClicked = var69
	t_2.onUsernameValidated = var51
	t_2.passwordTitleTextKey = "CommonUI.Messages.Label.Password"
	
	if password then
		local blockingField_1 = password.blockingField
		var64 = if blockingField_1 == nil then "Authentication.SignUp.Label.ErrorsWithPassword" else assert(t_1[blockingField_1], `Account upgrade field has no blocker error key: {blockingField_1}`)
	else
		var64 = "Authentication.SignUp.Label.ErrorsWithPassword"
	end
	t_2.passwordSummaryErrorTextKey = var64
	t_2.isPasswordPrerequisiteMet = if password then password.isUnlocked else false
	t_2.passwordValidatorAdditionalProps = var50
	t_2.passwordPlaceholder = var44.passwordPlaceholder
	t_2.onPasswordValidated = var52
	t_2.hidePassword = var20
	t_2.emailLabel = var44.emailLabel
	t_2.emailPlaceholder = var44.emailPlaceholder
	t_2.email = value_2
	t_2.emailError = var44.emailError
	t_2.genderLabel = var44.genderLabel
	t_2.femaleText = var44.femaleText
	t_2.maleText = var44.maleText
	t_2.gender = var12
	t_2.saveText = var44.saveText
	t_2.isSaveEnabled = var65
	t_2.isSubmitting = var18
	t_2.submitError = var44.submitError
	t_2.legalText = var45 or var44.legalText
	t_2.onLegalLinkActivated = var41
	t_2.boldFieldLabels = fFlagEnableDesktopSsoSignupDialogModule and var1.boldFieldLabels == true
	t_2.auditContent = var46
	t_2.isBirthdayPickerOpen = var14
	t_2.hasBackdrop = p1.hasBackdrop
	t_2.onClose = var63
	t_2.confirmsClose = var63 ~= nil and var1.signsOutOnDismiss
	t_2.isCloseConfirmationOpen = var16
	t_2.onCloseConfirmationBack = var61
	t_2.onSignOut = var62
	t_2.onBirthdayActivated = var54
	t_2.onBirthdayConfirmed = var56
	t_2.onBirthdayPickerClosed = var55
	t_2.onUsernameChanged = var30.onChanged
	t_2.onPasswordChanged = var32.onChanged
	t_2.onEmailChanged = var33.onChanged
	t_2.onGenderChanged = var59 or var13
	t_2.onUsernameFocused = var57
	t_2.onPasswordFocused = var58
	t_2.onPasswordVisibilityToggle = var66
	t_2.onSaveActivated = var71
	
	return t_2
end