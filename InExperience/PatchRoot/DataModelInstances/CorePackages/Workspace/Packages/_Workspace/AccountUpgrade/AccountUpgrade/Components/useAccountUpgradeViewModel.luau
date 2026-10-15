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
local fFlagAccountUpgradeOAuthDialogFitsContentModule = require(accountUpgrade.Flags.FFlagAccountUpgradeOAuthDialogFitsContent)
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
	-- upvalues: accountUpgradeFlowModule (ref), fFlagAccountUpgradeOAuthDialogFitsContentModule (ref), fFlagEnableDesktopSsoSignupDialogModule (ref), t (ref)
	if not (if p2.flow == accountUpgradeFlowModule.OAuth then fFlagAccountUpgradeOAuthDialogFitsContentModule else fFlagEnableDesktopSsoSignupDialogModule) or p2.hidesLegalText == true then
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
	-- upvalues: accountUpgradeFlowModule (ref), getFlowSpec (ref), accountUpgradeSurfaceModule (ref), fFlagAccountUpgradeOAuthTelemetryModule (ref), accountUpgradeAnalyticsModule (ref), useRoactService (ref), roactNetworking (ref), fFlagEnableDesktopSsoSignupDialogModule (ref), fFlagAllowCurrentUsernameOnSignup (ref), reactModule (ref), inputValidity (ref), userGender (ref), useTextFieldValueModule (ref), reportEmail (ref), isStringEmail (ref), dateHelper (ref), getAccountUpgradeErrorTextKeyModule (ref), fFlagAccountUpgradeOAuthDialogFitsContentModule (ref), getFFlagEnableAuditForSinglePageSignUp (ref), resolveLegalText (ref), useLocalization (ref), accountUpgradeFieldModule (ref), t (ref), localizationService (ref), resolveFieldStatesModule (ref), usernameValidationContext (ref), usernameSuggestor (ref), computeIsAccountUpgradeButtonEnabledModule (ref), authButtonClick (ref), eventStreamConstants (ref), promiseModule (ref), accountUpgradeRequest (ref), getAccountUpgradeErrorCodeModule (ref), authClientError (ref), t_1 (ref)
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
	useState, var36 = useState(var9)
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
	local var38 = nil
	
	if var26 ~= nil and not var26.isHandled then
		var38 = var26.errorTextKey or getAccountUpgradeErrorTextKeyModule(if var4 then nil else var26.errorCode)
	end
	local onLegalLinkSelected = p1.onLegalLinkSelected
	local var39 = if fFlagEnableDesktopSsoSignupDialogModule or fFlagAccountUpgradeOAuthTelemetryModule or fFlagAccountUpgradeOAuthDialogFitsContentModule then reactModule.useCallback(function(p2)
		-- upvalues: fFlagAccountUpgradeOAuthTelemetryModule (copy), accountUpgradeAnalyticsModule (copy), flow (ref), surface (ref), onLegalLinkSelected (ref)
		if p2 == "terms" then
			if fFlagAccountUpgradeOAuthTelemetryModule then
				accountUpgradeAnalyticsModule.reportLegalLinkActivated(flow, surface, "terms")
			end
			if onLegalLinkSelected then
				onLegalLinkSelected("terms")
				
				return
			end
		elseif p2 == "privacy" then
			if fFlagAccountUpgradeOAuthTelemetryModule then
				accountUpgradeAnalyticsModule.reportLegalLinkActivated(flow, surface, "privacy")
			end
			if onLegalLinkSelected then
				onLegalLinkSelected("privacy")
			end
		end
	end, { flow, surface, onLegalLinkSelected }) else nil
	local var40 = fFlagEnableDesktopSsoSignupDialogModule and (var1.capturesAuditContent == true and getFFlagEnableAuditForSinglePageSignUp())
	local var41 = resolveLegalText(var1, p1)
	local activeKey = var41.activeKey
	local linkedPlatformAccountName = var41.linkedPlatformAccountName
	local var42 = useLocalization({
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
		legalText = var41.standardKey,
		legalTextTemplate = if var40 then activeKey else nil,
		usernameTitle = if var40 then "Authentication.Login.Label.Username" else nil,
		passwordTitle = if var40 then "CommonUI.Messages.Label.Password" else nil,
		saveText = var1.submitTextKey,
		emailError = var36,
		submitError = var38,
		monthText = var37,
		dayAffix = dateHelper.DayAffixLocalizationKey,
		yearAffix = dateHelper.YearAffixLocalizationKey
	})
	local var43 = if fFlagEnableDesktopSsoSignupDialogModule then useLocalization({
		legalText = if linkedPlatformAccountName then {
			var1.linkedAccountLegalTextKey,
			platform = linkedPlatformAccountName,
			ctaButton = var42.saveText
		} else nil
	}).legalText else nil
	local var44 = if fFlagEnableDesktopSsoSignupDialogModule then reactModule.useMemo(function()
		-- upvalues: var40 (ref), var1 (ref), accountUpgradeFieldModule (copy), var42 (ref), activeKey (ref), linkedPlatformAccountName (ref), t (copy)
		if not var40 then
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
		
		local var45 = var1
		local birthday = accountUpgradeFieldModule.Birthday
		
		if if table.find(var45.requiredFields, birthday) == nil then table.find(var45.optionalFields, birthday) ~= nil else true then
			local birthdayLabel = var42.birthdayLabel
			
			if birthdayLabel ~= nil then
				table.insert(t_1, {
					translationKey = "Authentication.SignUp.Label.Birthday",
					parameters = nil,
					translatedSourceString = birthdayLabel
				})
			end
		end
		local usernameTitle = var42.usernameTitle
		
		if usernameTitle ~= nil then
			table.insert(t_1, {
				translationKey = "Authentication.Login.Label.Username",
				parameters = nil,
				translatedSourceString = usernameTitle
			})
		end
		local var46 = var1
		local password = accountUpgradeFieldModule.Password
		
		if if table.find(var46.requiredFields, password) == nil then table.find(var46.optionalFields, password) ~= nil else true then
			local passwordTitle = var42.passwordTitle
			
			if passwordTitle ~= nil then
				table.insert(t_1, {
					translationKey = "CommonUI.Messages.Label.Password",
					parameters = nil,
					translatedSourceString = passwordTitle
				})
			end
		end
		local var47 = var1
		local email = accountUpgradeFieldModule.Email
		
		if if table.find(var47.requiredFields, email) == nil then table.find(var47.optionalFields, email) ~= nil else true then
			local emailLabel = var42.emailLabel
			
			if emailLabel ~= nil then
				table.insert(t_1, {
					translationKey = "Authentication.Login.Label.Email",
					parameters = nil,
					translatedSourceString = emailLabel
				})
			end
		end
		local var48 = var1
		local gender = accountUpgradeFieldModule.Gender
		
		if if table.find(var48.requiredFields, gender) == nil then table.find(var48.optionalFields, gender) ~= nil else true then
			local genderLabel = var42.genderLabel
			
			if genderLabel ~= nil then
				table.insert(t_1, {
					translationKey = "Authentication.SignUp.Label.Gender",
					parameters = nil,
					translatedSourceString = genderLabel
				})
			end
		end
		if activeKey then
			local var49 = activeKey
			local legalTextTemplate = var42.legalTextTemplate
			local var50 = if linkedPlatformAccountName then {
				platform = linkedPlatformAccountName,
				ctaButton = var42.saveText
			} else t
			
			if legalTextTemplate ~= nil then
				table.insert(t_1, {
					translationKey = var49,
					translatedSourceString = legalTextTemplate,
					parameters = var50
				})
			end
		end
		return t_1
	end, {
		var40, var1, activeKey, linkedPlatformAccountName, var42.saveText,
		var42.birthdayLabel, var42.usernameTitle, var42.passwordTitle,
		var42.emailLabel, var42.genderLabel, var42.legalTextTemplate
	}) else nil
	local var45 = if not (var7 == nil or var42.monthText == nil) then dateHelper:GetFormattedFullString(var42.monthText, var7.Day, var42.dayAffix, var7.Year, var42.yearAffix, " ", localizationService.RobloxLocaleId) else ""
	local var46 = resolveFieldStatesModule({
		spec = var1,
		isSatisfied = {
			[accountUpgradeFieldModule.Birthday] = var7 ~= nil,
			[accountUpgradeFieldModule.Username] = value ~= "" and useState ~= inputValidity.Invalid,
			[accountUpgradeFieldModule.Password] = value_1 ~= "" and var10 == inputValidity.Valid
		}
	})
	local username = var46[accountUpgradeFieldModule.Username]
	local password = var46[accountUpgradeFieldModule.Password]
	assert(username ~= nil, "Account upgrade flow must include a username state")
	local var47 = reactModule.useMemo(function()
		-- upvalues: var7 (ref), usernameValidationContext (copy), var6 (ref)
		return {
			birthday = if var7 then var7:FormatForEndpoint() else "",
			context = usernameValidationContext.Signup,
			currentUsername = var6
		}
	end, { var7, var6 })
	local var48 = reactModule.useMemo(function()
		-- upvalues: value (ref)
		return { username = value }
	end, { value })
	local var49 = reactModule.useCallback(function(p2, p3)
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
	local var50 = reactModule.useCallback(function(_, p2)
		-- upvalues: var11 (ref)
		var11(p2)
	end, {})
	local var51 = if fFlagEnableDesktopSsoSignupDialogModule then p1.onFieldInteraction else nil
	local var52 = reactModule.useCallback(function()
		-- upvalues: fFlagAccountUpgradeOAuthTelemetryModule (copy), accountUpgradeAnalyticsModule (copy), flow (ref), surface (ref), var51 (ref), var15 (ref)
		if fFlagAccountUpgradeOAuthTelemetryModule then
			accountUpgradeAnalyticsModule.reportBirthdayActivated(flow, surface)
		end
		if var51 then
			var51("BirthdayFocused")
		end
		var15(true)
	end, { flow, surface, var51 })
	local var53 = reactModule.useCallback(function()
		-- upvalues: fFlagAccountUpgradeOAuthTelemetryModule (copy), accountUpgradeAnalyticsModule (copy), flow (ref), surface (ref), var15 (ref)
		if fFlagAccountUpgradeOAuthTelemetryModule then
			accountUpgradeAnalyticsModule.reportBirthdayPickerClosed(flow, surface)
		end
		var15(false)
	end, { flow, surface })
	local var54 = if fFlagAccountUpgradeOAuthTelemetryModule then reactModule.useCallback(function()
		-- upvalues: accountUpgradeAnalyticsModule (copy), flow (ref), surface (ref)
		accountUpgradeAnalyticsModule.reportBirthdayPickerAllPicked(flow, surface)
	end, { flow, surface }) else nil
	local var55 = reactModule.useCallback(function(p2)
		-- upvalues: fFlagAccountUpgradeOAuthTelemetryModule (copy), accountUpgradeAnalyticsModule (copy), flow (ref), surface (ref), var51 (ref), var8 (ref), var15 (ref)
		if fFlagAccountUpgradeOAuthTelemetryModule then
			accountUpgradeAnalyticsModule.reportBirthdayConfirmed(flow, surface)
		end
		if var51 then
			var51("BirthdayConfirmed")
		end
		var8(p2)
		var15(false)
	end, { flow, surface, var51 })
	local var56 = if fFlagEnableDesktopSsoSignupDialogModule or fFlagAccountUpgradeOAuthTelemetryModule then reactModule.useCallback(function()
		-- upvalues: fFlagAccountUpgradeOAuthTelemetryModule (copy), accountUpgradeAnalyticsModule (copy), flow (ref), surface (ref), var51 (ref)
		if fFlagAccountUpgradeOAuthTelemetryModule then
			accountUpgradeAnalyticsModule.reportUsernameFocused(flow, surface)
		end
		if var51 then
			var51("UsernameFocused")
		end
	end, { flow, surface, var51 }) else nil
	local var57 = if fFlagEnableDesktopSsoSignupDialogModule then reactModule.useCallback(function()
		-- upvalues: var51 (ref)
		if var51 then
			var51("PasswordFocused")
		end
	end, { var51 }) else nil
	local var58 = if fFlagEnableDesktopSsoSignupDialogModule or fFlagAccountUpgradeOAuthTelemetryModule then reactModule.useCallback(function(p2)
		-- upvalues: userGender (copy), var12 (ref), fFlagAccountUpgradeOAuthTelemetryModule (copy), accountUpgradeAnalyticsModule (copy), flow (ref), surface (ref), var51 (ref), var13 (ref)
		local var59 = if p2 == userGender.Unknown then var12 else p2
		
		if fFlagAccountUpgradeOAuthTelemetryModule then
			accountUpgradeAnalyticsModule.reportGenderActivated(flow, surface, var59)
		end
		if var51 then
			var51(if var59 == userGender.Male then "GenderMaleActivated" else "GenderFemaleActivated")
		end
		var13(p2)
	end, { flow, surface, var12, var51 }) else nil
	local var59 = reactModule.useCallback(function()
		-- upvalues: fFlagAccountUpgradeOAuthTelemetryModule (copy), accountUpgradeAnalyticsModule (copy), flow (ref), surface (ref), var17 (ref)
		if fFlagAccountUpgradeOAuthTelemetryModule then
			accountUpgradeAnalyticsModule.reportCloseButtonClicked(flow, surface)
		end
		var17(true)
	end, { flow, surface })
	local var60 = reactModule.useCallback(function()
		-- upvalues: fFlagAccountUpgradeOAuthTelemetryModule (copy), accountUpgradeAnalyticsModule (copy), flow (ref), surface (ref), var17 (ref)
		if fFlagAccountUpgradeOAuthTelemetryModule then
			accountUpgradeAnalyticsModule.reportCloseWarningBack(flow, surface)
		end
		var17(false)
	end, { flow, surface })
	local onSignOut = p1.onSignOut
	local var61 = reactModule.useMemo(function()
		-- upvalues: onSignOut (ref), fFlagAccountUpgradeOAuthTelemetryModule (copy), accountUpgradeAnalyticsModule (copy), flow (ref), surface (ref)
		return if onSignOut == nil then nil else function()
			-- upvalues: fFlagAccountUpgradeOAuthTelemetryModule (copy), accountUpgradeAnalyticsModule (copy), flow (copy), surface (copy), onSignOut (copy)
			if fFlagAccountUpgradeOAuthTelemetryModule then
				accountUpgradeAnalyticsModule.reportCloseWarningClose(flow, surface)
			end
			onSignOut()
		end
	end, { flow, surface, onSignOut })
	local var62 = nil
	
	if var1.canDismiss then
		var62 = if not var1.signsOutOnDismiss then if p1.onSignOut == nil or var18 then nil else var59 else p1.onClose
	end
	local var63
	local var64 = computeIsAccountUpgradeButtonEnabledModule({
		birthday = var7,
		username = value,
		password = value_1,
		usernameValid = useState,
		passwordValid = var10,
		email = value_2,
		emailValid = var35,
		isSubmitting = var18,
		requiredFields = var1.requiredFields
	})
	local var65 = reactModule.useCallback(function()
		-- upvalues: var51 (ref), var20 (ref), var21 (ref)
		if var51 then
			var51(if var20 then "PasswordShown" else "PasswordHidden")
		end
		var21(function(p2)
			return not p2
		end)
	end, { var20, var51 })
	local var66 = reactModule.useCallback(function(p2)
		-- upvalues: var30 (ref), var23 (ref), fFlagAccountUpgradeOAuthTelemetryModule (copy), flow (ref), accountUpgradeFlowModule (copy), accountUpgradeAnalyticsModule (copy), surface (ref), authButtonClick (copy), eventStreamConstants (copy)
		var30.onChanged(p2)
		var23({})
		
		if fFlagAccountUpgradeOAuthTelemetryModule and flow == accountUpgradeFlowModule.OAuth then
			accountUpgradeAnalyticsModule.reportUsernameSuggestionSelected(flow, surface, p2)
			
			return
		end
		authButtonClick(eventStreamConstants.Context.SinglePageSignUpScreen, eventStreamConstants.Button.UsernameSuggestion, p2)
	end, { flow, surface, var30.onChanged })
	local var67 = reactModule.useCallback(function()
		-- upvalues: var25 (ref)
		var25(true)
	end, {})
	local var68 = reactModule.useCallback(function()
		-- upvalues: var25 (ref)
		var25(false)
	end, {})
	local var69 = if useState == inputValidity.Invalid and #var22 > 0 then var22 else {}
	local var70 = reactModule.useCallback(function()
		-- upvalues: var18 (ref), var5 (ref), authButtonClick (copy), eventStreamConstants (copy), fFlagAccountUpgradeOAuthTelemetryModule (copy), flow (ref), var2 (ref), var19 (ref), var27 (ref), value (ref), value_1 (ref), var7 (ref), value_2 (ref), var12 (ref), var4 (ref), promiseModule (copy), accountUpgradeRequest (copy), var3 (ref), var1 (ref), accountUpgradeAnalyticsModule (copy), surface (ref), p1 (ref), var6 (ref), getAccountUpgradeErrorCodeModule (copy), authClientError (copy), var28 (ref)
		if var18 then return end
		if not var5 then
			authButtonClick(eventStreamConstants.Context.AccountUpgrade, eventStreamConstants.Button.Save, if fFlagAccountUpgradeOAuthTelemetryModule then flow else nil, nil, nil, var2)
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
			local var71 = var4(t)
			
			return if promiseModule.is(var71) then var71 else promiseModule.reject({})
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
			local var71 = if var4 == nil then { errorCode = getAccountUpgradeErrorCodeModule(p2) } elseif type(p2) == "table" then p2 else {}
			local errorCode = var71.errorCode
			var19(false)
			var27(var71)
			
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
		titleText = var42.titleText,
		subtitleText = var42.subtitleText,
		birthdayLabel = var42.birthdayLabel,
		birthday = var7,
		birthdayText = var45,
		birthdayPlaceholder = var42.birthdayPlaceholder,
		usernameTitleTextKey = "Authentication.Login.Label.Username"
	}
	local blockingField = username.blockingField
	t_2.usernameSummaryErrorTextKey = if blockingField == nil then "Authentication.SignUp.Label.ErrorsWithUsername" else assert(t_1[blockingField], `Account upgrade field has no blocker error key: {blockingField}`)
	t_2.isUsernamePrerequisiteMet = username.isUnlocked
	t_2.fieldStates = var46
	t_2.usernameValidatorAdditionalProps = var47
	t_2.usernamePlaceholder = var42.usernamePlaceholder
	t_2.username = value
	t_2.prefilledUsername = var31.current
	t_2.usernameSuggestions = var69
	t_2.usernameSuggestionPrompt = `{var42.usernameSuggestionPrompt}:`
	t_2.usernameSuggestionEventContext = if fFlagAccountUpgradeOAuthTelemetryModule and flow == accountUpgradeFlowModule.OAuth then eventStreamConstants.Context.AccountUpgrade else nil
	t_2.onUsernameSuggestionSelected = var66
	t_2.pillClicked = var24
	t_2.updatePillClicked = var67
	t_2.resetPillClicked = var68
	t_2.onUsernameValidated = var49
	t_2.passwordTitleTextKey = "CommonUI.Messages.Label.Password"
	
	if password then
		local blockingField_1 = password.blockingField
		var63 = if blockingField_1 == nil then "Authentication.SignUp.Label.ErrorsWithPassword" else assert(t_1[blockingField_1], `Account upgrade field has no blocker error key: {blockingField_1}`)
	else
		var63 = "Authentication.SignUp.Label.ErrorsWithPassword"
	end
	t_2.passwordSummaryErrorTextKey = var63
	t_2.isPasswordPrerequisiteMet = if password then password.isUnlocked else false
	t_2.passwordValidatorAdditionalProps = var48
	t_2.passwordPlaceholder = var42.passwordPlaceholder
	t_2.onPasswordValidated = var50
	t_2.hidePassword = var20
	t_2.emailLabel = var42.emailLabel
	t_2.emailPlaceholder = var42.emailPlaceholder
	t_2.email = value_2
	t_2.emailError = var42.emailError
	t_2.genderLabel = var42.genderLabel
	t_2.femaleText = var42.femaleText
	t_2.maleText = var42.maleText
	t_2.gender = var12
	t_2.saveText = var42.saveText
	t_2.isSaveEnabled = var64
	t_2.isSubmitting = var18
	t_2.submitError = var42.submitError
	t_2.legalText = var43 or var42.legalText
	t_2.onLegalLinkActivated = var39
	t_2.boldFieldLabels = fFlagEnableDesktopSsoSignupDialogModule and var1.boldFieldLabels == true
	t_2.fitsDialogToContent = fFlagAccountUpgradeOAuthDialogFitsContentModule and var1.fitsDialogToContent == true
	t_2.auditContent = var44
	t_2.isBirthdayPickerOpen = var14
	t_2.hasBackdrop = p1.hasBackdrop
	t_2.onClose = var62
	t_2.confirmsClose = var62 ~= nil and var1.signsOutOnDismiss
	t_2.isCloseConfirmationOpen = var16
	t_2.onCloseConfirmationBack = var60
	t_2.onSignOut = var61
	t_2.onBirthdayActivated = var52
	t_2.onBirthdayConfirmed = var55
	t_2.onBirthdayPickerClosed = var53
	t_2.onBirthdayPickerAllPicked = var54
	t_2.onUsernameChanged = var30.onChanged
	t_2.onPasswordChanged = var32.onChanged
	t_2.onEmailChanged = var33.onChanged
	t_2.onGenderChanged = var58 or var13
	t_2.onUsernameFocused = var56
	t_2.onPasswordFocused = var57
	t_2.onPasswordVisibilityToggle = var65
	t_2.onSaveActivated = var70
	
	return t_2
end