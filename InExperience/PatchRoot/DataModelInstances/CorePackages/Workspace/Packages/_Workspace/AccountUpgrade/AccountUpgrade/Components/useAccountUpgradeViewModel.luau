local AccountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local Parent = AccountUpgrade.Parent
local LocalizationService = game:GetService("LocalizationService")
local PromiseModule = require(Parent.Promise)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local AuthCommonModule = require(Parent.AuthCommon)
local AuthAnalyticsModule = require(Parent.AuthAnalytics)
local EventStreamConstants = AuthAnalyticsModule.EventStreamConstants
local AuthButtonClickFunction = AuthAnalyticsModule.Events.authButtonClick
local AuthClientErrorFunction = AuthAnalyticsModule.Events.authClientError
local UsernameSuggestor = require(Parent.AuthSignup).Thunks.UsernameSuggestor
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagAllowCurrentUsernameOnSignup = SharedFlagsModule.FFlagAllowCurrentUsernameOnSignup
local GetFFlagEnableAuditForSinglePageSignUpFunction = SharedFlagsModule.GetFFlagEnableAuditForSinglePageSignUp
local DateHelper = require(Parent.Time).DateHelper
local FFlagEnableDesktopSsoSignupDialogModule = require(AccountUpgrade.Flags.FFlagEnableDesktopSsoSignupDialog)
local AccountUpgradeFieldModule = require(AccountUpgrade.AccountUpgradeField)
local AccountUpgradeFlowModule = require(AccountUpgrade.AccountUpgradeFlow)
local AccountUpgradeSurfaceModule = require(AccountUpgrade.AccountUpgradeSurface)
local AccountUpgradeAnalyticsModule = require(AccountUpgrade.Analytics.AccountUpgradeAnalytics)
local GetFlowSpecFunction = require(AccountUpgrade.FlowSpec).getFlowSpec
local ComputeIsAccountUpgradeButtonEnabledModule = require(AccountUpgrade.Utils.computeIsAccountUpgradeButtonEnabled)
local GetAccountUpgradeErrorCodeModule = require(AccountUpgrade.Utils.getAccountUpgradeErrorCode)
local GetAccountUpgradeErrorTextKeyModule = require(AccountUpgrade.Utils.getAccountUpgradeErrorTextKey)
local ResolveFieldStatesModule = require(AccountUpgrade.Utils.resolveFieldStates)
local UseTextFieldValueModule = require(AccountUpgrade.Hooks.useTextFieldValue)
local FFlagAccountUpgradeOAuthTelemetryModule = require(AccountUpgrade.Flags.FFlagAccountUpgradeOAuthTelemetry)
local FFlagAccountUpgradeOAuthDialogFitsContentModule = require(AccountUpgrade.Flags.FFlagAccountUpgradeOAuthDialogFitsContent)
local _ = require(script.Parent.AccountUpgradeView)
local _ = require(script.Parent.AccountUpgradeFields)
local InputValidity = AuthCommonModule.Enums.InputValidity
local UserGender = AuthCommonModule.Enums.UserGender
local UsernameValidationContext = AuthCommonModule.Enums.UsernameValidationContext
local IsStringEmailFunction = AuthCommonModule.Utils.isStringEmail
local AccountUpgradeRequestFunction = AuthCommonModule.Http.Requests.AccountUpgradeRequest
local config = {
	startTermsTag = "<a href=\"terms\">",
	endTermsTag = "</a>",
	startPrivacyTag = "<a href=\"privacy\">",
	endPrivacyTag = "</a>"
}

local function _(p1, Value): boolean --[[ Line: 123 | Named "hasField" ]]
	return table.find(p1.requiredFields, Value) ~= nil or table.find(p1.optionalFields, Value) ~= nil
end

local config1 = {
	[AccountUpgradeFieldModule.Birthday] = "Authentication.SignUp.Response.BirthdayMustBeSetFirst",
	[AccountUpgradeFieldModule.Username] = "Authentication.SignUp.Response.UsernameMustBeSetFirst"
}

local _ = function(p1, p2) --[[ Line: 132 | Named "getSummaryErrorTextKey" ]]
	-- upvalues: config1 (copy)
	local BlockingField = p1.blockingField
	
	return if BlockingField == nil then p2 else assert(config1[BlockingField], `Account upgrade field has no blocker error key: {BlockingField}`)
end

local function resolveLegalText(Spec, p1) --[[ Line: 185 ]]
	-- upvalues: AccountUpgradeFlowModule (copy), FFlagAccountUpgradeOAuthDialogFitsContentModule (copy), FFlagEnableDesktopSsoSignupDialogModule (copy), config (copy)
	if not (if p1.flow == AccountUpgradeFlowModule.OAuth then FFlagAccountUpgradeOAuthDialogFitsContentModule else FFlagEnableDesktopSsoSignupDialogModule) or p1.hidesLegalText == true then
		return {}
	end
	local LinkedPlatformAccountName = if Spec.linkedAccountLegalTextKey then p1.linkedPlatformAccountName else nil
	
	if LinkedPlatformAccountName then
		return {
			activeKey = Spec.linkedAccountLegalTextKey,
			linkedPlatformAccountName = LinkedPlatformAccountName
		}
	end
	local StandardKey = nil
	
	if Spec.legalTextKey then
		local Copy = table.clone(config)
		Copy[1] = Spec.legalTextKey
		StandardKey = Copy
	end
	return { activeKey = Spec.legalTextKey, standardKey = StandardKey }
end

local function reportEmail() --[[ Line: 212 ]] end

return function(p1) --[[ Line: 214 | Named "useAccountUpgradeViewModel" ]]
	-- upvalues: AccountUpgradeFlowModule (copy), GetFlowSpecFunction (copy), AccountUpgradeSurfaceModule (copy), FFlagAccountUpgradeOAuthTelemetryModule (copy), AccountUpgradeAnalyticsModule (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), FFlagEnableDesktopSsoSignupDialogModule (copy), FFlagAllowCurrentUsernameOnSignup (copy), ReactModule (copy), InputValidity (copy), UserGender (copy), UseTextFieldValueModule (copy), reportEmail (copy), IsStringEmailFunction (copy), DateHelper (copy), GetAccountUpgradeErrorTextKeyModule (copy), FFlagAccountUpgradeOAuthDialogFitsContentModule (copy), GetFFlagEnableAuditForSinglePageSignUpFunction (copy), resolveLegalText (copy), UseLocalizationFunction (copy), AccountUpgradeFieldModule (copy), config (copy), LocalizationService (copy), ResolveFieldStatesModule (copy), UsernameValidationContext (copy), UsernameSuggestor (copy), ComputeIsAccountUpgradeButtonEnabledModule (copy), AuthButtonClickFunction (copy), EventStreamConstants (copy), PromiseModule (copy), AccountUpgradeRequestFunction (copy), GetAccountUpgradeErrorCodeModule (copy), AuthClientErrorFunction (copy), config1 (copy)
	local Flow = p1.flow or AccountUpgradeFlowModule.Pioneer
	local FlowSpec = GetFlowSpecFunction(Flow)
	assert(FlowSpec ~= nil, `Unsupported account upgrade flow: {Flow}`)
	local Surface = p1.surface or AccountUpgradeSurfaceModule.Dialog
	local EventOrigin = if FFlagAccountUpgradeOAuthTelemetryModule then AccountUpgradeAnalyticsModule.getEventOrigin(Flow, Surface) else Flow
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local Submit = if FFlagEnableDesktopSsoSignupDialogModule then p1.submit else nil
	local IsHostReportsSubmit: boolean = FFlagEnableDesktopSsoSignupDialogModule and FlowSpec.hostReportsSubmit == true
	local CurrentUsername = if FFlagAllowCurrentUsernameOnSignup then p1.currentUsername else nil
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(if CurrentUsername == nil or CurrentUsername == "" then InputValidity.Unvalidated else InputValidity.Valid)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(InputValidity.Unvalidated)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(UserGender.Unknown)
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(false)
	local UseStateResult6, UseStateResult2_5 = ReactModule.useState(false)
	local UseStateResult7, UseStateResult2_6 = ReactModule.useState(false)
	local UseStateResult8, UseStateResult2_7 = ReactModule.useState(true)
	local UseStateResult9, UseStateResult2_8 = ReactModule.useState({})
	local UseStateResult10, UseStateResult2_9 = ReactModule.useState(false)
	local UseStateResult11, UseStateResult2_10 = ReactModule.useState(nil)
	local UseRefResult = ReactModule.useRef(false)
	ReactModule.useEffect(function() --[[ Line: 250 ]]
		-- upvalues: FFlagAccountUpgradeOAuthTelemetryModule (upval), AccountUpgradeAnalyticsModule (upval), Flow (copy), Surface (copy)
		if FFlagAccountUpgradeOAuthTelemetryModule then
			AccountUpgradeAnalyticsModule.reportOpened(Flow, Surface)
		end
	end, { Flow, Surface })
	local UseResult = ReactModule.useCallback(function() --[[ Line: 263 ]]
		-- upvalues: UseStateResult2_2 (copy), InputValidity (upval)
		UseStateResult2_2(InputValidity.Unvalidated)
	end, {})
	local UseTextFieldValueModuleResult = UseTextFieldValueModule(CurrentUsername, (ReactModule.useCallback(function() --[[ Line: 258 ]]
		-- upvalues: UseStateResult2_1 (copy), InputValidity (upval), UseStateResult2_8 (copy)
		UseStateResult2_1(InputValidity.Unvalidated)
		UseStateResult2_8({})
	end, {})))
	local UseRefResult1 = ReactModule.useRef(CurrentUsername)
	local UseTextFieldValueModuleResult1 = UseTextFieldValueModule(nil, UseResult)
	local UseTextFieldValueModuleResult2 = UseTextFieldValueModule(nil, reportEmail)
	local IsIsHidden: boolean = FFlagEnableDesktopSsoSignupDialogModule and p1.isHidden == true
	local OnChangedFunction = UseTextFieldValueModuleResult1.onChanged
	local ValueRef = UseTextFieldValueModuleResult.valueRef
	
	if FFlagEnableDesktopSsoSignupDialogModule then
		ReactModule.useEffect(function() --[[ Line: 280 ]]
			-- upvalues: IsIsHidden (copy), UseRefResult1 (copy), ValueRef (copy), OnChangedFunction (copy)
			if IsIsHidden then
				UseRefResult1.current = ValueRef.current
				OnChangedFunction("")
			end
		end, { IsIsHidden, OnChangedFunction, ValueRef })
	end
	local Value = UseTextFieldValueModuleResult.value
	local Value1 = UseTextFieldValueModuleResult1.value
	local Value2 = UseTextFieldValueModuleResult2.value
	local IsValueMatch = Value2 == "" or IsStringEmailFunction(Value2)
	local AuthenticationSignUpResponseInvalidEmail = if Value2 == "" or IsValueMatch then nil else "Authentication.SignUp.Response.InvalidEmail"
	local MonthsLocalizationKeys = DateHelper.MonthsLocalizationKeys
	local MonthsLocalizationKey = if UseStateResult then MonthsLocalizationKeys[UseStateResult.Month] else nil
	local ErrorTextKey = nil
	
	if UseStateResult11 ~= nil and not UseStateResult11.isHandled then
		local ErrorCode = if Submit then nil else UseStateResult11.errorCode
		ErrorTextKey = UseStateResult11.errorTextKey or GetAccountUpgradeErrorTextKeyModule(ErrorCode)
	end
	local OnLegalLinkSelectedFunction = p1.onLegalLinkSelected
	local UseResult1 = if FFlagEnableDesktopSsoSignupDialogModule or FFlagAccountUpgradeOAuthTelemetryModule or FFlagAccountUpgradeOAuthDialogFitsContentModule then ReactModule.useCallback(function(p2) --[[ Line: 308 ]]
		-- upvalues: FFlagAccountUpgradeOAuthTelemetryModule (upval), AccountUpgradeAnalyticsModule (upval), Flow (copy), Surface (copy), OnLegalLinkSelectedFunction (copy)
		if p2 == "terms" then
			if FFlagAccountUpgradeOAuthTelemetryModule then
				AccountUpgradeAnalyticsModule.reportLegalLinkActivated(Flow, Surface, "terms")
			end
			if OnLegalLinkSelectedFunction then
				OnLegalLinkSelectedFunction("terms")
				
				return
			end
		elseif p2 == "privacy" then
			if FFlagAccountUpgradeOAuthTelemetryModule then
				AccountUpgradeAnalyticsModule.reportLegalLinkActivated(Flow, Surface, "privacy")
			end
			if OnLegalLinkSelectedFunction then
				OnLegalLinkSelectedFunction("privacy")
			end
		end
	end, { Flow, Surface, OnLegalLinkSelectedFunction }) else nil
	local FFlagEnableAuditForSinglePageSignUp = FFlagEnableDesktopSsoSignupDialogModule and (FlowSpec.capturesAuditContent == true and GetFFlagEnableAuditForSinglePageSignUpFunction())
	local ResolveLegalTextResult = resolveLegalText(FlowSpec, p1)
	local ActiveKey = ResolveLegalTextResult.activeKey
	local LinkedPlatformAccountName = ResolveLegalTextResult.linkedPlatformAccountName
	local UseLocalizationResult = UseLocalizationFunction({
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
		titleText = FlowSpec.titleTextKey,
		subtitleText = FlowSpec.subtitleTextKey,
		legalText = ResolveLegalTextResult.standardKey,
		legalTextTemplate = if FFlagEnableAuditForSinglePageSignUp then ActiveKey else nil,
		usernameTitle = if FFlagEnableAuditForSinglePageSignUp then "Authentication.Login.Label.Username" else nil,
		passwordTitle = if FFlagEnableAuditForSinglePageSignUp then "CommonUI.Messages.Label.Password" else nil,
		saveText = FlowSpec.submitTextKey,
		emailError = AuthenticationSignUpResponseInvalidEmail,
		submitError = ErrorTextKey,
		monthText = MonthsLocalizationKey,
		dayAffix = DateHelper.DayAffixLocalizationKey,
		yearAffix = DateHelper.YearAffixLocalizationKey
	})
	local LegalText = if FFlagEnableDesktopSsoSignupDialogModule then UseLocalizationFunction({
		legalText = if LinkedPlatformAccountName then {
			FlowSpec.linkedAccountLegalTextKey,
			platform = LinkedPlatformAccountName,
			ctaButton = UseLocalizationResult.saveText
		} else nil
	}).legalText else nil
	local UseMemoResult = if FFlagEnableDesktopSsoSignupDialogModule then ReactModule.useMemo(function() --[[ Line: 377 ]]
		-- upvalues: FFlagEnableAuditForSinglePageSignUp (copy), FlowSpec (copy), AccountUpgradeFieldModule (upval), UseLocalizationResult (copy), ActiveKey (copy), LinkedPlatformAccountName (copy), config (upval)
		if not FFlagEnableAuditForSinglePageSignUp then
			return nil
		end
		local List = {}
		
		local function _(TranslationKey, TranslatedSourceString, Parameters) --[[ Line: 383 | Named "add" ]]
			-- upvalues: List (copy)
			if TranslatedSourceString ~= nil then
				table.insert(List, {
					translationKey = TranslationKey,
					translatedSourceString = TranslatedSourceString,
					parameters = Parameters
				})
			end
		end
		
		local Birthday = AccountUpgradeFieldModule.Birthday
		
		if table.find(FlowSpec.requiredFields, Birthday) ~= nil or table.find(FlowSpec.optionalFields, Birthday) ~= nil then
			local BirthdayLabel = UseLocalizationResult.birthdayLabel
			
			if BirthdayLabel ~= nil then
				table.insert(List, {
					translationKey = "Authentication.SignUp.Label.Birthday",
					parameters = nil,
					translatedSourceString = BirthdayLabel
				})
			end
		end
		local UsernameTitle = UseLocalizationResult.usernameTitle
		
		if UsernameTitle ~= nil then
			table.insert(List, {
				translationKey = "Authentication.Login.Label.Username",
				parameters = nil,
				translatedSourceString = UsernameTitle
			})
		end
		local Password = AccountUpgradeFieldModule.Password
		
		if table.find(FlowSpec.requiredFields, Password) ~= nil or table.find(FlowSpec.optionalFields, Password) ~= nil then
			local PasswordTitle = UseLocalizationResult.passwordTitle
			
			if PasswordTitle ~= nil then
				table.insert(List, {
					translationKey = "CommonUI.Messages.Label.Password",
					parameters = nil,
					translatedSourceString = PasswordTitle
				})
			end
		end
		local Email = AccountUpgradeFieldModule.Email
		
		if table.find(FlowSpec.requiredFields, Email) ~= nil or table.find(FlowSpec.optionalFields, Email) ~= nil then
			local EmailLabel = UseLocalizationResult.emailLabel
			
			if EmailLabel ~= nil then
				table.insert(List, {
					translationKey = "Authentication.Login.Label.Email",
					parameters = nil,
					translatedSourceString = EmailLabel
				})
			end
		end
		local Gender = AccountUpgradeFieldModule.Gender
		
		if table.find(FlowSpec.requiredFields, Gender) ~= nil or table.find(FlowSpec.optionalFields, Gender) ~= nil then
			local GenderLabel = UseLocalizationResult.genderLabel
			
			if GenderLabel ~= nil then
				table.insert(List, {
					translationKey = "Authentication.SignUp.Label.Gender",
					parameters = nil,
					translatedSourceString = GenderLabel
				})
			end
		end
		if ActiveKey then
			local LegalTextTemplate = UseLocalizationResult.legalTextTemplate
			local Config = if LinkedPlatformAccountName then {
				platform = LinkedPlatformAccountName,
				ctaButton = UseLocalizationResult.saveText
			} else config
			
			if LegalTextTemplate ~= nil then
				table.insert(List, {
					translationKey = ActiveKey,
					translatedSourceString = LegalTextTemplate,
					parameters = Config
				})
			end
		end
		return List
	end, {
		FFlagEnableAuditForSinglePageSignUp, FlowSpec, ActiveKey,
		LinkedPlatformAccountName, UseLocalizationResult.saveText,
		UseLocalizationResult.birthdayLabel, UseLocalizationResult.usernameTitle,
		UseLocalizationResult.passwordTitle, UseLocalizationResult.emailLabel,
		UseLocalizationResult.genderLabel, UseLocalizationResult.legalTextTemplate
	}) else nil
	local BirthdayText = if UseStateResult == nil or UseLocalizationResult.monthText == nil then "" else DateHelper:GetFormattedFullString(UseLocalizationResult.monthText, UseStateResult.Day, UseLocalizationResult.dayAffix, UseStateResult.Year, UseLocalizationResult.yearAffix, " ", LocalizationService.RobloxLocaleId)
	local ResolveFieldStatesModuleResult = ResolveFieldStatesModule({
		spec = FlowSpec,
		isSatisfied = {
			[AccountUpgradeFieldModule.Birthday] = UseStateResult ~= nil,
			[AccountUpgradeFieldModule.Username] = Value ~= "" and UseStateResult1 ~= InputValidity.Invalid,
			[AccountUpgradeFieldModule.Password] = Value1 ~= "" and UseStateResult3 == InputValidity.Valid
		}
	})
	local ResolveFieldStatesModuleResultEntry = ResolveFieldStatesModuleResult[AccountUpgradeFieldModule.Username]
	local ResolveFieldStatesModuleResultEntry1 = ResolveFieldStatesModuleResult[AccountUpgradeFieldModule.Password]
	assert(ResolveFieldStatesModuleResultEntry ~= nil, "Account upgrade flow must include a username state")
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 464 ]]
		-- upvalues: UseStateResult (copy), UsernameValidationContext (upval), CurrentUsername (copy)
		return {
			birthday = if UseStateResult then UseStateResult:FormatForEndpoint() else "",
			context = UsernameValidationContext.Signup,
			currentUsername = CurrentUsername
		}
	end, { UseStateResult, CurrentUsername })
	local UseMemoResult2 = ReactModule.useMemo(function() --[[ Line: 473 ]]
		-- upvalues: Value (copy)
		return { username = Value }
	end, { Value })
	local UseResult11 = ReactModule.useCallback(function(Current, p2) --[[ Line: 483 ]]
		-- upvalues: UseStateResult2_1 (copy), UseStateResult (copy), UsernameSuggestor (upval), UseRoactServiceResult (copy), UsernameValidationContext (upval), UseTextFieldValueModuleResult (copy), UseStateResult2_8 (copy)
		UseStateResult2_1(p2)
		
		if UseStateResult ~= nil and Current ~= "" then
			UsernameSuggestor.suggestUsernames(UseRoactServiceResult, Current, UseStateResult:FormatForEndpoint(), UsernameValidationContext.Signup):andThen(function(Result) --[[ Line: 496 ]]
				-- upvalues: UseTextFieldValueModuleResult (upval), Current (copy), UseStateResult2_8 (upval)
				if UseTextFieldValueModuleResult.valueRef.current == Current and Result.shouldUpdateState then
					UseStateResult2_8(Result.suggestions or {})
				end
			end)
			
			return
		end
	end, {
		UseRoactServiceResult,
		UseStateResult,
		UseTextFieldValueModuleResult.valueRef
	})
	local UseResult2 = ReactModule.useCallback(function(_, p2) --[[ Line: 507 ]]
		-- upvalues: UseStateResult2_2 (copy)
		UseStateResult2_2(p2)
	end, {})
	local OnFieldInteraction = if FFlagEnableDesktopSsoSignupDialogModule then p1.onFieldInteraction else nil
	local UseResult3 = ReactModule.useCallback(function() --[[ Line: 513 ]]
		-- upvalues: FFlagAccountUpgradeOAuthTelemetryModule (upval), AccountUpgradeAnalyticsModule (upval), Flow (copy), Surface (copy), OnFieldInteraction (copy), UseStateResult2_4 (copy)
		if FFlagAccountUpgradeOAuthTelemetryModule then
			AccountUpgradeAnalyticsModule.reportBirthdayActivated(Flow, Surface)
		end
		if OnFieldInteraction then
			OnFieldInteraction("BirthdayFocused")
		end
		UseStateResult2_4(true)
	end, { Flow, Surface, OnFieldInteraction })
	local UseResult4 = ReactModule.useCallback(function() --[[ Line: 523 ]]
		-- upvalues: FFlagAccountUpgradeOAuthTelemetryModule (upval), AccountUpgradeAnalyticsModule (upval), Flow (copy), Surface (copy), UseStateResult2_4 (copy)
		if FFlagAccountUpgradeOAuthTelemetryModule then
			AccountUpgradeAnalyticsModule.reportBirthdayPickerClosed(Flow, Surface)
		end
		UseStateResult2_4(false)
	end, { Flow, Surface })
	local UseResult5 = if FFlagAccountUpgradeOAuthTelemetryModule then ReactModule.useCallback(function() --[[ Line: 531 ]]
		-- upvalues: AccountUpgradeAnalyticsModule (upval), Flow (copy), Surface (copy)
		AccountUpgradeAnalyticsModule.reportBirthdayPickerAllPicked(Flow, Surface)
	end, { Flow, Surface }) else nil
	local UseResult6 = ReactModule.useCallback(function(p2) --[[ Line: 536 ]]
		-- upvalues: FFlagAccountUpgradeOAuthTelemetryModule (upval), AccountUpgradeAnalyticsModule (upval), Flow (copy), Surface (copy), OnFieldInteraction (copy), UseStateResult2 (copy), UseStateResult2_4 (copy)
		if FFlagAccountUpgradeOAuthTelemetryModule then
			AccountUpgradeAnalyticsModule.reportBirthdayConfirmed(Flow, Surface)
		end
		if OnFieldInteraction then
			OnFieldInteraction("BirthdayConfirmed")
		end
		UseStateResult2(p2)
		UseStateResult2_4(false)
	end, { Flow, Surface, OnFieldInteraction })
	local UseResult7 = if FFlagEnableDesktopSsoSignupDialogModule or FFlagAccountUpgradeOAuthTelemetryModule then ReactModule.useCallback(function() --[[ Line: 548 ]]
		-- upvalues: FFlagAccountUpgradeOAuthTelemetryModule (upval), AccountUpgradeAnalyticsModule (upval), Flow (copy), Surface (copy), OnFieldInteraction (copy)
		if FFlagAccountUpgradeOAuthTelemetryModule then
			AccountUpgradeAnalyticsModule.reportUsernameFocused(Flow, Surface)
		end
		if OnFieldInteraction then
			OnFieldInteraction("UsernameFocused")
		end
	end, { Flow, Surface, OnFieldInteraction }) else nil
	local UseResult8 = if FFlagEnableDesktopSsoSignupDialogModule then ReactModule.useCallback(function() --[[ Line: 559 ]]
		-- upvalues: OnFieldInteraction (copy)
		if OnFieldInteraction then
			OnFieldInteraction("PasswordFocused")
		end
	end, { OnFieldInteraction }) else nil
	local UseResult9 = if FFlagEnableDesktopSsoSignupDialogModule or FFlagAccountUpgradeOAuthTelemetryModule then ReactModule.useCallback(function(Unknown) --[[ Line: 568 ]]
		-- upvalues: UserGender (upval), UseStateResult4 (copy), FFlagAccountUpgradeOAuthTelemetryModule (upval), AccountUpgradeAnalyticsModule (upval), Flow (copy), Surface (copy), OnFieldInteraction (copy), UseStateResult2_3 (copy)
		local UseStateResult = if Unknown == UserGender.Unknown then UseStateResult4 else Unknown
		
		if FFlagAccountUpgradeOAuthTelemetryModule then
			AccountUpgradeAnalyticsModule.reportGenderActivated(Flow, Surface, UseStateResult)
		end
		if OnFieldInteraction then
			OnFieldInteraction(if UseStateResult == UserGender.Male then "GenderMaleActivated" else "GenderFemaleActivated")
		end
		UseStateResult2_3(Unknown)
	end, { Flow, Surface, UseStateResult4, OnFieldInteraction }) else nil
	local UseResult10 = ReactModule.useCallback(function() --[[ Line: 582 ]]
		-- upvalues: FFlagAccountUpgradeOAuthTelemetryModule (upval), AccountUpgradeAnalyticsModule (upval), Flow (copy), Surface (copy), UseStateResult2_5 (copy)
		if FFlagAccountUpgradeOAuthTelemetryModule then
			AccountUpgradeAnalyticsModule.reportCloseButtonClicked(Flow, Surface)
		end
		UseStateResult2_5(true)
	end, { Flow, Surface })
	local UseResult111 = ReactModule.useCallback(function() --[[ Line: 589 ]]
		-- upvalues: FFlagAccountUpgradeOAuthTelemetryModule (upval), AccountUpgradeAnalyticsModule (upval), Flow (copy), Surface (copy), UseStateResult2_5 (copy)
		if FFlagAccountUpgradeOAuthTelemetryModule then
			AccountUpgradeAnalyticsModule.reportCloseWarningBack(Flow, Surface)
		end
		UseStateResult2_5(false)
	end, { Flow, Surface })
	local OnSignOutFunction = p1.onSignOut
	local UseMemoResult3 = ReactModule.useMemo(function() --[[ Line: 597 ]]
		-- upvalues: OnSignOutFunction (copy), FFlagAccountUpgradeOAuthTelemetryModule (upval), AccountUpgradeAnalyticsModule (upval), Flow (copy), Surface (copy)
		return if OnSignOutFunction == nil then nil else function() --[[ Line: 601 ]]
			-- upvalues: FFlagAccountUpgradeOAuthTelemetryModule (upval), AccountUpgradeAnalyticsModule (upval), Flow (upval), Surface (upval), OnSignOutFunction (upval)
			if FFlagAccountUpgradeOAuthTelemetryModule then
				AccountUpgradeAnalyticsModule.reportCloseWarningClose(Flow, Surface)
			end
			OnSignOutFunction()
		end
	end, { Flow, Surface, OnSignOutFunction })
	local UseResult12 = if FlowSpec.canDismiss then if FlowSpec.signsOutOnDismiss then if p1.onSignOut == nil or UseStateResult7 then nil else UseResult10 else p1.onClose else nil
	local IsAccountUpgradeButtonEnabledModule = ComputeIsAccountUpgradeButtonEnabledModule({
		birthday = UseStateResult,
		username = Value,
		password = Value1,
		usernameValid = UseStateResult1,
		passwordValid = UseStateResult3,
		email = Value2,
		emailValid = IsValueMatch,
		isSubmitting = UseStateResult7,
		requiredFields = FlowSpec.requiredFields
	})
	local UseResult13 = ReactModule.useCallback(function() --[[ Line: 632 ]]
		-- upvalues: OnFieldInteraction (copy), UseStateResult8 (copy), UseStateResult2_7 (copy)
		if OnFieldInteraction then
			OnFieldInteraction(if UseStateResult8 then "PasswordShown" else "PasswordHidden")
		end
		UseStateResult2_7(function(p2): boolean --[[ Line: 636 ]]
			return not p2
		end)
	end, { UseStateResult8, OnFieldInteraction })
	local UseResult14 = ReactModule.useCallback(function() --[[ Line: 672 ]]
		-- upvalues: UseStateResult7 (copy), IsHostReportsSubmit (copy), AuthButtonClickFunction (upval), EventStreamConstants (upval), FFlagAccountUpgradeOAuthTelemetryModule (upval), Flow (copy), EventOrigin (copy), UseStateResult2_6 (copy), UseStateResult2_10 (copy), Value (copy), Value1 (copy), UseStateResult (copy), Value2 (copy), UseStateResult4 (copy), Submit (copy), PromiseModule (upval), AccountUpgradeRequestFunction (upval), UseRoactServiceResult (copy), FlowSpec (copy), AccountUpgradeAnalyticsModule (upval), Surface (copy), p1 (copy), CurrentUsername (copy), GetAccountUpgradeErrorCodeModule (upval), AuthClientErrorFunction (upval), UseRefResult (copy)
		if UseStateResult7 then return end
		if not IsHostReportsSubmit then
			AuthButtonClickFunction(EventStreamConstants.Context.AccountUpgrade, EventStreamConstants.Button.Save, if FFlagAccountUpgradeOAuthTelemetryModule then Flow else nil, nil, nil, EventOrigin)
		end
		UseStateResult2_6(true)
		UseStateResult2_10(nil)
		local config = {
			username = Value,
			password = Value1,
			birthday = if UseStateResult then UseStateResult:FormatForEndpoint() else "",
			age = if UseStateResult then UseStateResult:GetAgeInYears() else nil,
			email = Value2,
			gender = UseStateResult4
		};
		(if Submit then PromiseModule.try(function() --[[ Line: 700 ]]
			-- upvalues: Submit (upval), config (copy), PromiseModule (upval)
			local SubmitResult = Submit(config)
			
			return if PromiseModule.is(SubmitResult) then SubmitResult else PromiseModule.reject({})
		end) else AccountUpgradeRequestFunction(UseRoactServiceResult, {
			upgradeType = FlowSpec.upgradeType,
			username = config.username,
			password = config.password,
			birthday = config.birthday,
			email = config.email,
			gender = config.gender
		})):andThen(function() --[[ Line: 716 ]]
			-- upvalues: FFlagAccountUpgradeOAuthTelemetryModule (upval), IsHostReportsSubmit (upval), AccountUpgradeAnalyticsModule (upval), Flow (upval), Surface (upval), p1 (upval), CurrentUsername (upval), Value (upval)
			if FFlagAccountUpgradeOAuthTelemetryModule and not IsHostReportsSubmit then
				AccountUpgradeAnalyticsModule.reportSucceeded(Flow, Surface)
			end
			p1.onSignUpComplete({
				isSuccess = true,
				username = if CurrentUsername == nil then nil else Value,
				displayName = if CurrentUsername == nil or Value == CurrentUsername then nil else Value
			})
		end, function(p2) --[[ Line: 727 ]]
			-- upvalues: Submit (upval), GetAccountUpgradeErrorCodeModule (upval), UseStateResult2_6 (upval), UseStateResult2_10 (upval), p1 (upval), IsHostReportsSubmit (upval), AuthClientErrorFunction (upval), EventStreamConstants (upval), EventOrigin (upval), FFlagAccountUpgradeOAuthTelemetryModule (upval), UseRefResult (upval), AccountUpgradeAnalyticsModule (upval), Flow (upval), Surface (upval)
			local Config = if Submit == nil then { errorCode = GetAccountUpgradeErrorCodeModule(p2) } elseif type(p2) == "table" then p2 else {}
			local ErrorCode = Config.errorCode
			UseStateResult2_6(false)
			UseStateResult2_10(Config)
			
			if p1.onSignUpFailed then
				p1.onSignUpFailed(ErrorCode)
			end
			if not IsHostReportsSubmit then
				AuthClientErrorFunction(EventStreamConstants.Context.AccountUpgrade, if ErrorCode == nil then EventStreamConstants.State.Unknown else tostring(ErrorCode), nil, EventOrigin)
				
				if FFlagAccountUpgradeOAuthTelemetryModule and not UseRefResult.current then
					UseRefResult.current = true
					AccountUpgradeAnalyticsModule.reportFirstFailure(Flow, Surface, ErrorCode)
				end
			end
		end)
	end, {
		UseStateResult, CurrentUsername, Value2, EventOrigin, Flow, UseStateResult4,
		UseStateResult7, UseRoactServiceResult, Value1, p1.onSignUpComplete,
		p1.onSignUpFailed, Submit, IsHostReportsSubmit, FlowSpec, Surface, Value
	})
	local BlockingField = ResolveFieldStatesModuleResultEntry.blockingField
	local config2 = {
		titleText = UseLocalizationResult.titleText,
		subtitleText = UseLocalizationResult.subtitleText,
		birthdayLabel = UseLocalizationResult.birthdayLabel,
		birthday = UseStateResult,
		birthdayText = BirthdayText,
		birthdayPlaceholder = UseLocalizationResult.birthdayPlaceholder,
		usernameTitleTextKey = "Authentication.Login.Label.Username",
		usernameSummaryErrorTextKey = if BlockingField == nil then "Authentication.SignUp.Label.ErrorsWithUsername" else assert(config1[BlockingField], `Account upgrade field has no blocker error key: {BlockingField}`),
		isUsernamePrerequisiteMet = ResolveFieldStatesModuleResultEntry.isUnlocked,
		fieldStates = ResolveFieldStatesModuleResult,
		usernameValidatorAdditionalProps = UseMemoResult1,
		usernamePlaceholder = UseLocalizationResult.usernamePlaceholder,
		username = Value,
		prefilledUsername = UseRefResult1.current,
		usernameSuggestions = if UseStateResult1 == InputValidity.Invalid and #UseStateResult9 > 0 then UseStateResult9 else {},
		usernameSuggestionPrompt = `{UseLocalizationResult.usernameSuggestionPrompt}:`,
		usernameSuggestionEventContext = if FFlagAccountUpgradeOAuthTelemetryModule and Flow == AccountUpgradeFlowModule.OAuth then EventStreamConstants.Context.AccountUpgrade else nil,
		onUsernameSuggestionSelected = ReactModule.useCallback(function(p2) --[[ Line: 641 ]]
			-- upvalues: UseTextFieldValueModuleResult (copy), UseStateResult2_8 (copy), FFlagAccountUpgradeOAuthTelemetryModule (upval), Flow (copy), AccountUpgradeFlowModule (upval), AccountUpgradeAnalyticsModule (upval), Surface (copy), AuthButtonClickFunction (upval), EventStreamConstants (upval)
			UseTextFieldValueModuleResult.onChanged(p2)
			UseStateResult2_8({})
			
			if FFlagAccountUpgradeOAuthTelemetryModule and Flow == AccountUpgradeFlowModule.OAuth then
				AccountUpgradeAnalyticsModule.reportUsernameSuggestionSelected(Flow, Surface, p2)
				
				return
			else
				AuthButtonClickFunction(EventStreamConstants.Context.SinglePageSignUpScreen, EventStreamConstants.Button.UsernameSuggestion, p2)
			end
		end, { Flow, Surface, UseTextFieldValueModuleResult.onChanged }),
		pillClicked = UseStateResult10,
		updatePillClicked = ReactModule.useCallback(function() --[[ Line: 655 ]]
			-- upvalues: UseStateResult2_9 (copy)
			UseStateResult2_9(true)
		end, {}),
		resetPillClicked = ReactModule.useCallback(function() --[[ Line: 659 ]]
			-- upvalues: UseStateResult2_9 (copy)
			UseStateResult2_9(false)
		end, {}),
		onUsernameValidated = UseResult11,
		passwordTitleTextKey = "CommonUI.Messages.Label.Password"
	}
	local AuthenticationSignUpLabelErrorsWithPassword = nil
	
	if ResolveFieldStatesModuleResultEntry1 then
		local BlockingField1 = ResolveFieldStatesModuleResultEntry1.blockingField
		AuthenticationSignUpLabelErrorsWithPassword = if BlockingField1 == nil then "Authentication.SignUp.Label.ErrorsWithPassword" else assert(config1[BlockingField1], `Account upgrade field has no blocker error key: {BlockingField1}`)
	else
		AuthenticationSignUpLabelErrorsWithPassword = "Authentication.SignUp.Label.ErrorsWithPassword"
	end
	config2.passwordSummaryErrorTextKey = AuthenticationSignUpLabelErrorsWithPassword
	config2.isPasswordPrerequisiteMet = if ResolveFieldStatesModuleResultEntry1 then ResolveFieldStatesModuleResultEntry1.isUnlocked else false
	config2.passwordValidatorAdditionalProps = UseMemoResult2
	config2.passwordPlaceholder = UseLocalizationResult.passwordPlaceholder
	config2.onPasswordValidated = UseResult2
	config2.hidePassword = UseStateResult8
	config2.emailLabel = UseLocalizationResult.emailLabel
	config2.emailPlaceholder = UseLocalizationResult.emailPlaceholder
	config2.email = Value2
	config2.emailError = UseLocalizationResult.emailError
	config2.genderLabel = UseLocalizationResult.genderLabel
	config2.femaleText = UseLocalizationResult.femaleText
	config2.maleText = UseLocalizationResult.maleText
	config2.gender = UseStateResult4
	config2.saveText = UseLocalizationResult.saveText
	config2.isSaveEnabled = IsAccountUpgradeButtonEnabledModule
	config2.isSubmitting = UseStateResult7
	config2.submitError = UseLocalizationResult.submitError
	config2.legalText = LegalText or UseLocalizationResult.legalText
	config2.onLegalLinkActivated = UseResult1
	config2.boldFieldLabels = FFlagEnableDesktopSsoSignupDialogModule and FlowSpec.boldFieldLabels == true
	config2.fitsDialogToContent = FFlagAccountUpgradeOAuthDialogFitsContentModule and FlowSpec.fitsDialogToContent == true
	config2.auditContent = UseMemoResult
	config2.isBirthdayPickerOpen = UseStateResult5
	config2.hasBackdrop = p1.hasBackdrop
	config2.onClose = UseResult12
	config2.confirmsClose = UseResult12 ~= nil and FlowSpec.signsOutOnDismiss
	config2.isCloseConfirmationOpen = UseStateResult6
	config2.onCloseConfirmationBack = UseResult111
	config2.onSignOut = UseMemoResult3
	config2.onBirthdayActivated = UseResult3
	config2.onBirthdayConfirmed = UseResult6
	config2.onBirthdayPickerClosed = UseResult4
	config2.onBirthdayPickerAllPicked = UseResult5
	config2.onUsernameChanged = UseTextFieldValueModuleResult.onChanged
	config2.onPasswordChanged = UseTextFieldValueModuleResult1.onChanged
	config2.onEmailChanged = UseTextFieldValueModuleResult2.onChanged
	config2.onGenderChanged = UseResult9 or UseStateResult2_3
	config2.onUsernameFocused = UseResult7
	config2.onPasswordFocused = UseResult8
	config2.onPasswordVisibilityToggle = UseResult13
	config2.onSaveActivated = UseResult14
	
	return config2
end