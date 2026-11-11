local AccountRecovery = script:FindFirstAncestor("AccountRecovery")
local Parent = AccountRecovery.Parent
local HttpService = game:GetService("HttpService")
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local FullscreenPageWithSafeArea = require(Parent.AppBlox).FullscreenPageWithSafeArea
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local FoundationModule = require(Parent.Foundation)
local Text = FoundationModule.Text
local TextInput = FoundationModule.TextInput
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local Divider = FoundationModule.Divider
local DividerVariant = FoundationModule.Enums.DividerVariant
local Orientation = FoundationModule.Enums.Orientation
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ScrollView = FoundationModule.ScrollView
local Visibility = FoundationModule.Enums.Visibility
local SystemBanner = FoundationModule.SystemBanner
local AlertVariant = FoundationModule.Enums.AlertVariant
local AlertSeverity = FoundationModule.Enums.AlertSeverity
local Logger = require(Parent.Loggers).Logger
local UseClearFocusOnUnmountFunction = require(AccountRecovery.Hooks).useClearFocusOnUnmount
local GetUserByIdFunction = require(Parent.AuthCommon).Thunks.GetUserById
local AccountRecoveryContextModule = require(AccountRecovery.Store.AccountRecoveryContext)
local SendCodeModule = require(AccountRecovery.Thunks.SendCode)
local VerifyBackupCodeModule = require(AccountRecovery.Thunks.VerifyBackupCode)
local _ = require(AccountRecovery.Common.AccountRecoveryRequestTypes)
local ConstantsModule = require(AccountRecovery.Components.Constants)
local PhoneDropdownModule = require(AccountRecovery.Components.PhoneDropdown)
local RecoveryHeaderModule = require(AccountRecovery.Components.RecoveryHeader)
local ContactMethodTypeModule = require(AccountRecovery.Enums.ContactMethodType)
local UserHeaderModule = require(AccountRecovery.Components.UserHeader)
local GetModalModule = require(AccountRecovery.Components.getModal)
local IdentifierUtilsModule = require(AccountRecovery.Utils.IdentifierUtils)
local IdentifierTypeModule = require(AccountRecovery.Enums.IdentifierType)
local RecoveryMethodTypeModule = require(AccountRecovery.Enums.RecoveryMethodType)
local RecoveryMethodInputTypeModule = require(AccountRecovery.Enums.RecoveryMethodInputType)
local AccountRecoveryPageStateModule = require(AccountRecovery.Enums.AccountRecoveryPageState)
local RecoveryStateModule = require(AccountRecovery.Enums.RecoveryState)
local _ = require(AccountRecovery.Components.Types)
local EventServiceModule = require(AccountRecovery.Analytics.EventService)
local GetFFlagEnableBackupCodeInputModule = require(AccountRecovery.Flags.GetFFlagEnableBackupCodeInput)
local GetFFlagEnableSkipPasswordResetModule = require(AccountRecovery.Flags.GetFFlagEnableSkipPasswordReset)

local function derivePreviousContactMethodType(IsSecondContactMethodVerificationParam, PreviousRecoveryMethodTypesParam)
	-- upvalues: RecoveryMethodTypeModule (copy), ContactMethodTypeModule (copy)
	if not IsSecondContactMethodVerificationParam then
		return nil
	end
	if not PreviousRecoveryMethodTypesParam or #PreviousRecoveryMethodTypesParam == 0 then
		return nil
	end
	for _, value in ipairs(PreviousRecoveryMethodTypesParam) do
		if value == RecoveryMethodTypeModule.Phone then
			return ContactMethodTypeModule.Phone
		end
	end
	return ContactMethodTypeModule.Email
end

local function recoveryMethodTypesToInputTypes(NextRecoveryMethodTypesParam)
	-- upvalues: RecoveryMethodTypeModule (copy), RecoveryMethodInputTypeModule (copy)
	if not NextRecoveryMethodTypesParam then
		return nil
	end
	local List = {}
	local Flag = false
	local Flag1 = false
	local Flag2 = false
	
	for _, value in ipairs(NextRecoveryMethodTypesParam) do
		if value == RecoveryMethodTypeModule.CurrentEmail or value == RecoveryMethodTypeModule.BillingEmail or value == RecoveryMethodTypeModule.HistoricalEmail then
			Flag = true
		elseif value == RecoveryMethodTypeModule.Phone then
			Flag1 = true
		elseif value == RecoveryMethodTypeModule.BackupCode then
			Flag2 = true
		end
	end
	if Flag then
		table.insert(List, RecoveryMethodInputTypeModule.Email)
	end
	if Flag1 then
		table.insert(List, RecoveryMethodInputTypeModule.Phone)
	end
	if Flag2 then
		table.insert(List, RecoveryMethodInputTypeModule.BackupCode)
	end
	return List
end

local function deriveInitialRecoveryMethodInputType(IsSecondContactMethodVerificationParam, Entry)
	-- upvalues: GetFFlagEnableBackupCodeInputModule (copy), RecoveryMethodInputTypeModule (copy)
	return if IsSecondContactMethodVerificationParam and GetFFlagEnableBackupCodeInputModule() then if Entry and #Entry == 1 and Entry[1] == RecoveryMethodInputTypeModule.BackupCode then RecoveryMethodInputTypeModule.BackupCode elseif Entry and table.find(Entry, RecoveryMethodInputTypeModule.Phone) ~= nil then RecoveryMethodInputTypeModule.Phone else RecoveryMethodInputTypeModule.Email else RecoveryMethodInputTypeModule.Email
end

local function _(p1, BackupCode, Phone, p2)
	-- upvalues: RecoveryMethodInputTypeModule (copy), ContactMethodTypeModule (copy)
	return if p1 then if BackupCode == RecoveryMethodInputTypeModule.BackupCode then p2.enterBackupCodeText elseif BackupCode == RecoveryMethodInputTypeModule.Phone then p2.enterPhoneNumberText else p2.enterEmailAddressText elseif Phone == ContactMethodTypeModule.Phone then p2.enterEmailAddressText else p2.enterPhoneOrAnotherEmailText
end

local _ = function(Value, p1, List)
	-- upvalues: GetFFlagEnableBackupCodeInputModule (copy), deriveInitialRecoveryMethodInputType (copy)
	return if p1 and GetFFlagEnableBackupCodeInputModule() and Value ~= nil and List and table.find(List, Value) ~= nil then Value else deriveInitialRecoveryMethodInputType(p1, List)
end

local _ = function(p1, Callback)
	return if p1 then Callback() else nil
end

return function(p1)
	-- upvalues: ReactModule (copy), AccountRecoveryContextModule (copy), UseStyleFunction (copy), UseTokensFunction (copy), UseDesignTokensFunction (copy), UseDispatchFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), derivePreviousContactMethodType (copy), ContactMethodTypeModule (copy), RecoveryMethodInputTypeModule (copy), GetFFlagEnableBackupCodeInputModule (copy), recoveryMethodTypesToInputTypes (copy), deriveInitialRecoveryMethodInputType (copy), UseClearFocusOnUnmountFunction (copy), GetUserByIdFunction (copy), Logger (copy), SendCodeModule (copy), IdentifierUtilsModule (copy), EventServiceModule (copy), HttpService (copy), ConstantsModule (copy), AccountRecoveryPageStateModule (copy), IdentifierTypeModule (copy), RecoveryStateModule (copy), GetFFlagEnableSkipPasswordResetModule (copy), VerifyBackupCodeModule (copy), UseLocalizationFunction (copy), FullscreenPageWithSafeArea (copy), RecoveryHeaderModule (copy), ScrollView (copy), Visibility (copy), UserHeaderModule (copy), Text (copy), SystemBanner (copy), AlertSeverity (copy), AlertVariant (copy), PhoneDropdownModule (copy), StyledTextLabel (copy), TextInput (copy), InputSize (copy), Button (copy), ButtonVariant (copy), Divider (copy), DividerVariant (copy), Orientation (copy), GetModalModule (copy)
	local UseContextResult = ReactModule.useContext(AccountRecoveryContextModule)
	local UseStyleResult = UseStyleFunction()
	local UseTokensResult = UseTokensFunction()
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseStateResult, UseStateResult2 = ReactModule.useState("")
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState("")
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState("")
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(1)
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(false)
	local UseStateResult6, UseStateResult2_5 = ReactModule.useState("")
	local UseStateResult7, UseStateResult2_6 = ReactModule.useState(Vector2.new(0, 0))
	local UserIDParam = p1.navigation.getParam("userID")
	local IsSecondContactMethodVerificationParam = p1.navigation.getParam("isSecondContactMethodVerification") or false
	local PreviousRecoveryMethodParam = p1.navigation.getParam("previousRecoveryMethod") or ""
	local PreviousRecoveryMethodTypesParam = p1.navigation.getParam("previousRecoveryMethodTypes")
	local NextRecoveryMethodTypesParam = p1.navigation.getParam("nextRecoveryMethodTypes")
	local CloseRecoveryOnBackParam = p1.navigation.getParam("closeRecoveryOnBack") or false
	local RecoveryMethodInputTypeOverrideParam = p1.navigation.getParam("recoveryMethodInputTypeOverride")
	local DerivePreviousContactMethodTypeResult = derivePreviousContactMethodType(IsSecondContactMethodVerificationParam, PreviousRecoveryMethodTypesParam)
	local RecoveryMethodTypesToInputTypesResult = if IsSecondContactMethodVerificationParam and DerivePreviousContactMethodTypeResult == ContactMethodTypeModule.Phone then if GetFFlagEnableBackupCodeInputModule() then recoveryMethodTypesToInputTypes(NextRecoveryMethodTypesParam) else { RecoveryMethodInputTypeModule.Email } elseif GetFFlagEnableBackupCodeInputModule() then recoveryMethodTypesToInputTypes(NextRecoveryMethodTypesParam) else {
		RecoveryMethodInputTypeModule.Email,
		RecoveryMethodInputTypeModule.Phone
	}
	local NoIsSecondContactMethodVerificationParam: boolean = not IsSecondContactMethodVerificationParam or RecoveryMethodTypesToInputTypesResult and table.find(RecoveryMethodTypesToInputTypesResult, RecoveryMethodInputTypeModule.Phone) ~= nil
	local NoIsSecondContactMethodVerificationParam1: boolean = not IsSecondContactMethodVerificationParam or RecoveryMethodTypesToInputTypesResult and table.find(RecoveryMethodTypesToInputTypesResult, RecoveryMethodInputTypeModule.Email) ~= nil
	local List = RecoveryMethodTypesToInputTypesResult
	local RecoveryMethodInputTypeOverrideParam1 = if IsSecondContactMethodVerificationParam and GetFFlagEnableBackupCodeInputModule() and RecoveryMethodInputTypeOverrideParam ~= nil and List and table.find(List, RecoveryMethodInputTypeOverrideParam) ~= nil then RecoveryMethodInputTypeOverrideParam else deriveInitialRecoveryMethodInputType(IsSecondContactMethodVerificationParam, List)
	local UseStateResult8, UseStateResult2_7 = ReactModule.useState(RecoveryMethodInputTypeOverrideParam1)
	
	local function _()
		-- upvalues: UseStateResult2_7 (copy), RecoveryMethodInputTypeOverrideParam1 (copy), UseStateResult2_2 (copy), UseStateResult2_4 (copy), UseStateResult2_5 (copy)
		UseStateResult2_7(RecoveryMethodInputTypeOverrideParam1)
		UseStateResult2_2("")
		UseStateResult2_4(false)
		UseStateResult2_5("")
	end
	
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), RecoveryMethodTypesToInputTypesResult (ref), UseStateResult2_7 (copy), UseStateResult2_2 (copy)
		local RecoveryMethodInputTypeOverrideParam = p1.navigation.getParam("recoveryMethodInputTypeOverride")
		
		if RecoveryMethodInputTypeOverrideParam ~= nil and RecoveryMethodTypesToInputTypesResult and table.find(RecoveryMethodTypesToInputTypesResult, RecoveryMethodInputTypeOverrideParam) ~= nil then
			UseStateResult2_7(RecoveryMethodInputTypeOverrideParam)
			UseStateResult2_2("")
		end
	end, { RecoveryMethodInputTypeOverrideParam })
	local IsNotUserIDParamMatch: boolean = UserIDParam ~= nil and UserIDParam ~= 0
	local NoIsSecondContactMethodVerificationParam2: boolean = IsNotUserIDParamMatch and not IsSecondContactMethodVerificationParam
	local IsSecondContactMethodVerificationParam1 = GetFFlagEnableBackupCodeInputModule() and IsSecondContactMethodVerificationParam
	UseClearFocusOnUnmountFunction()
	ReactModule.useEffect(function()
		-- upvalues: IsNotUserIDParamMatch (copy), GetUserByIdFunction (upval), UseRoactServiceResult (copy), UserIDParam (copy), UseStateResult2_1 (copy), UseStateResult2 (copy), Logger (upval)
		if IsNotUserIDParamMatch then
			GetUserByIdFunction(UseRoactServiceResult, UserIDParam):andThen(function(Result)
				-- upvalues: UseStateResult2_1 (upval), UseStateResult2 (upval)
				UseStateResult2_1(Result.name)
				UseStateResult2(Result.displayName)
			end):catch(function(Err)
				-- upvalues: Logger (upval)
				Logger:warning("Error getting user info: {}", Err)
			end)
		end
	end, {})
	
	local _ = function(RecoverySessionId, ContactMethod, ContactMethodType)
		-- upvalues: UseDispatchResult (copy), SendCodeModule (upval), UseRoactServiceResult (copy), IsSecondContactMethodVerificationParam (copy)
		return UseDispatchResult(SendCodeModule(UseRoactServiceResult, {
			recoverySessionId = RecoverySessionId,
			contactMethod = ContactMethod,
			contactMethodType = ContactMethodType,
			contactMethodNumber = if IsSecondContactMethodVerificationParam then 1 else 0
		}))
	end
	
	local function v92(Callback)
		-- upvalues: UseStateResult2_4 (copy), UseStateResult2_5 (copy), IdentifierUtilsModule (upval), UseStateResult3 (copy), UseStateResult8 (copy), RecoveryMethodInputTypeModule (upval), UseContextResult (copy), UseStateResult4 (copy), EventServiceModule (upval), UseDispatchResult (copy), SendCodeModule (upval), UseRoactServiceResult (copy), IsSecondContactMethodVerificationParam (copy), Logger (upval), HttpService (upval), ConstantsModule (upval)
		UseStateResult2_4(true)
		UseStateResult2_5("")
		local IdentifierType = IdentifierUtilsModule.getIdentifierType(UseStateResult3, UseStateResult8 == RecoveryMethodInputTypeModule.Phone)
		local IdentifierTypeToContactMethodTypeResult = IdentifierUtilsModule.identifierTypeToContactMethodType(IdentifierType)
		local FormatIdentifierResult = IdentifierUtilsModule.formatIdentifier(UseStateResult3, IdentifierType, UseContextResult.state.phonePrefixList[UseStateResult4])
		EventServiceModule.sendContactMethodSentEvent(UseContextResult.state.recoverySessionId, IdentifierType)
		UseDispatchResult(SendCodeModule(UseRoactServiceResult, {
			recoverySessionId = UseContextResult.state.recoverySessionId,
			contactMethod = FormatIdentifierResult,
			contactMethodType = IdentifierTypeToContactMethodTypeResult,
			contactMethodNumber = if IsSecondContactMethodVerificationParam then 1 else 0
		})):andThen(function(Result)
			-- upvalues: Logger (upval), HttpService (upval), UseStateResult2_5 (upval), ConstantsModule (upval), UseStateResult2_4 (upval), Callback (copy), IdentifierType (copy), IdentifierTypeToContactMethodTypeResult (copy), UseStateResult3 (upval)
			if Result.isError then
				Logger:warning("Error sending code: {}", HttpService:JSONEncode(Result))
				UseStateResult2_5(Result.errorKey or ConstantsModule.UnknownErrorKey)
				UseStateResult2_4(false)
				
				return
			else
				Callback(IdentifierType, IdentifierTypeToContactMethodTypeResult, UseStateResult3)
			end
		end)
	end
	
	local function v93(IdentifierType, ContactMethodType, ContactMethod)
		-- upvalues: IsNotUserIDParamMatch (copy), p1 (copy), AccountRecoveryPageStateModule (upval), IdentifierTypeModule (upval), UserIDParam (copy), UseStateResult1 (copy), UseStateResult (copy), IsSecondContactMethodVerificationParam (copy), UseStateResult2_7 (copy), RecoveryMethodInputTypeOverrideParam1 (copy), UseStateResult2_2 (copy), UseStateResult2_4 (copy), UseStateResult2_5 (copy)
		if IsNotUserIDParamMatch then
			p1.navigation.navigate(AccountRecoveryPageStateModule.VerifyCodeScreen, {
				identifierInfo = {
					identifierType = IdentifierTypeModule.Username,
					contactMethodType = ContactMethodType,
					userId = UserIDParam,
					username = UseStateResult1,
					displayName = UseStateResult
				},
				contactMethodNumber = if IsSecondContactMethodVerificationParam then 1 else 0
			})
		else
			p1.navigation.navigate(AccountRecoveryPageStateModule.VerifyCodeScreen, {
				identifierInfo = {
					identifierType = IdentifierType,
					contactMethodType = ContactMethodType,
					contactMethod = ContactMethod
				},
				contactMethodNumber = if IsSecondContactMethodVerificationParam then 1 else 0
			})
		end
		UseStateResult2_7(RecoveryMethodInputTypeOverrideParam1)
		UseStateResult2_2("")
		UseStateResult2_4(false)
		UseStateResult2_5("")
	end
	
	local function handleContinueRecoveryAfterBackupVerify(p2)
		-- upvalues: UseStateResult2_5 (copy), ConstantsModule (upval), UseStateResult2_4 (copy), RecoveryStateModule (upval), UserIDParam (copy), GetFFlagEnableSkipPasswordResetModule (upval), UseContextResult (copy), UseStateResult1 (copy), p1 (copy), AccountRecoveryPageStateModule (upval), UseStateResult2_7 (copy), RecoveryMethodInputTypeOverrideParam1 (copy), UseStateResult2_2 (copy)
		local function _()
			-- upvalues: UseStateResult2_5 (upval), ConstantsModule (upval), UseStateResult2_4 (upval)
			UseStateResult2_5(ConstantsModule.UnknownErrorKey)
			UseStateResult2_4(false)
		end
		
		if p2 == nil then
			UseStateResult2_5(ConstantsModule.UnknownErrorKey)
			UseStateResult2_4(false)
			
			return
		end
		if p2.recoveryState ~= RecoveryStateModule.RECOVERY_STATE_ACCOUNT_VERIFIED then
			UseStateResult2_5(ConstantsModule.UnknownErrorKey)
			UseStateResult2_4(false)
			
			return
		end
		if GetFFlagEnableSkipPasswordResetModule() and UseContextResult.state.recover2sv and not UseContextResult.state.recoverPassword then
			UseContextResult.utils.handleUpdatePassword(UseContextResult.state.recoverySessionId, UserIDParam, UseStateResult1, "", "", function(p3)
				-- upvalues: UseStateResult2_5 (upval), ConstantsModule (upval), UseStateResult2_4 (upval)
				UseStateResult2_5(p3 or ConstantsModule.UnknownErrorKey)
				UseStateResult2_4(false)
			end, UseContextResult.utils.launchAppOrGoBack)
			
			return
		else
			p1.navigation.navigate(AccountRecoveryPageStateModule.ChooseAccountScreen, { userID = UserIDParam })
			UseStateResult2_7(RecoveryMethodInputTypeOverrideParam1)
			UseStateResult2_2("")
			UseStateResult2_4(false)
			UseStateResult2_5("")
		end
	end
	
	local function attemptVerifyBackupCode()
		-- upvalues: IsNotUserIDParamMatch (copy), UseStateResult2_5 (copy), ConstantsModule (upval), UseStateResult2_4 (copy), UseDispatchResult (copy), VerifyBackupCodeModule (upval), UseRoactServiceResult (copy), UseContextResult (copy), UseStateResult3 (copy), Logger (upval), HttpService (upval), UserIDParam (copy), handleContinueRecoveryAfterBackupVerify (copy)
		if IsNotUserIDParamMatch then
			UseStateResult2_4(true)
			UseStateResult2_5("")
			UseDispatchResult(VerifyBackupCodeModule(UseRoactServiceResult, {
				recoverySessionId = UseContextResult.state.recoverySessionId,
				backupCode = UseStateResult3
			})):andThen(function(Result)
				-- upvalues: Logger (upval), HttpService (upval), UseStateResult2_5 (upval), ConstantsModule (upval), UseStateResult2_4 (upval), UseContextResult (upval), UserIDParam (upval), handleContinueRecoveryAfterBackupVerify (upval)
				if Result.isError then
					Logger:warning("Error verifying backup code: {}", HttpService:JSONEncode(Result))
					UseStateResult2_5(Result.errorKey or ConstantsModule.UnknownErrorKey)
					UseStateResult2_4(false)
					
					return
				else
					UseContextResult.utils.handleContinueRecovery(UseContextResult.state.recoverySessionId, UserIDParam, handleContinueRecoveryAfterBackupVerify, function(_)
						-- upvalues: UseStateResult2_5 (upval), ConstantsModule (upval), UseStateResult2_4 (upval)
						UseStateResult2_5(ConstantsModule.UnknownErrorKey)
						UseStateResult2_4(false)
					end, function()
						-- upvalues: UseStateResult2_5 (upval), ConstantsModule (upval), UseStateResult2_4 (upval)
						UseStateResult2_5(ConstantsModule.UnknownErrorKey)
						UseStateResult2_4(false)
					end)
				end
			end)
			
			return
		else
			UseStateResult2_5(ConstantsModule.UnknownErrorKey)
		end
	end
	
	local function v96(Frame: Frame)
		-- upvalues: UseStateResult7 (copy), UseStateResult2_6 (copy)
		if UseStateResult7 ~= Frame.AbsoluteSize then
			UseStateResult2_6(Frame.AbsoluteSize)
		end
	end
	
	local UseLocalizationResult = UseLocalizationFunction({
		recoveryHeadingText = "Authentication.AccountRecovery.Heading.RobloxAccountRecovery",
		secondMethodHeadingText = "Authentication.AccountRecovery.Heading.EnterSecondMethod",
		enterPhoneOrAnotherEmailText = "Authentication.AccountRecovery.Description.EnterPhoneOrAnotherEmail",
		enterEmailAddressText = "Authentication.AccountRecovery.Description.EnterEmailAddress",
		enterBackupCodeText = "Authentication.AccountRecovery.Description.EnterABackupCode",
		enterPhoneNumberText = "Authentication.AccountRecovery.Description.EnterPhoneNumberSecondMethod",
		phoneText = "Authentication.AccountRecovery.LabelPhone",
		emailText = "Authentication.AccountRecovery.LabelEmail",
		backupCodeText = "Authentication.AccountRecovery.Label.BackupCode",
		nextButtonText = "Authentication.AccountRecovery.Action.Next",
		sendCodeButtonText = "Authentication.AccountRecovery.Action.SendCode",
		orText = "Authentication.AccountRecovery.Label.Or",
		usePhoneInsteadText = "Authentication.AccountRecovery.Action.UsePhoneInstead",
		useEmailInsteadText = "Authentication.AccountRecovery.Action.UseEmailInstead",
		useEmailActionText = "Authentication.AccountRecovery.Action.UseEmail",
		useBackupCodeActionText = "Authentication.AccountRecovery.Action.UseBackupCode",
		usePhoneActionText = "Authentication.AccountRecovery.Action.UsePhone",
		useAnotherMethodText = "Authentication.AccountRecovery.Action.UseAnotherMethod",
		enterContactMethodAssociatedWithYourAccountText = "Authentication.AccountRecovery.Description.EnterContactMethodAssociatedWithYourAccount",
		sendCodeContactMethodConfirmation = "Authentication.AccountRecovery.Description.SendCodeContactMethodConfirmation",
		previousMethodVerifiedText = {
			"Authentication.AccountRecovery.Label.PreviousContactMethodVerification",
			contactMethod = PreviousRecoveryMethodParam
		},
		errorText = if UseStateResult6 == "" then nil else UseStateResult6
	})
	
	local _ = function()
		-- upvalues: UseStateResult8 (copy), RecoveryMethodInputTypeModule (upval), UseLocalizationResult (copy)
		return if UseStateResult8 == RecoveryMethodInputTypeModule.Phone then UseLocalizationResult.phoneText elseif UseStateResult8 == RecoveryMethodInputTypeModule.BackupCode then UseLocalizationResult.backupCodeText else UseLocalizationResult.emailText
	end
	
	local _ = function()
		-- upvalues: UseStateResult8 (copy), RecoveryMethodInputTypeModule (upval)
		return if UseStateResult8 == RecoveryMethodInputTypeModule.Phone then Enum.TextInputType.Phone elseif UseStateResult8 == RecoveryMethodInputTypeModule.BackupCode then Enum.TextInputType.NoSuggestions else Enum.TextInputType.Email
	end
	
	local config = {
		enterBackupCodeText = UseLocalizationResult.enterBackupCodeText,
		enterPhoneNumberText = UseLocalizationResult.enterPhoneNumberText,
		enterEmailAddressText = UseLocalizationResult.enterEmailAddressText,
		enterPhoneOrAnotherEmailText = UseLocalizationResult.enterPhoneOrAnotherEmailText
	}
	local EnterBackupCodeText = if IsSecondContactMethodVerificationParam1 then if UseStateResult8 == RecoveryMethodInputTypeModule.BackupCode then config.enterBackupCodeText elseif UseStateResult8 == RecoveryMethodInputTypeModule.Phone then config.enterPhoneNumberText else config.enterEmailAddressText elseif DerivePreviousContactMethodTypeResult == ContactMethodTypeModule.Phone then config.enterEmailAddressText else config.enterPhoneOrAnotherEmailText
	
	local function v102()
		-- upvalues: RecoveryMethodTypesToInputTypesResult (ref), UseLocalizationResult (copy), UseStateResult8 (copy), RecoveryMethodInputTypeModule (upval), NoIsSecondContactMethodVerificationParam (copy), NoIsSecondContactMethodVerificationParam1 (copy)
		return if RecoveryMethodTypesToInputTypesResult and #RecoveryMethodTypesToInputTypesResult > 2 then UseLocalizationResult.useAnotherMethodText elseif RecoveryMethodTypesToInputTypesResult and #RecoveryMethodTypesToInputTypesResult == 2 then if UseStateResult8 == RecoveryMethodInputTypeModule.Email then NoIsSecondContactMethodVerificationParam and UseLocalizationResult.usePhoneActionText or UseLocalizationResult.useBackupCodeActionText elseif UseStateResult8 == RecoveryMethodInputTypeModule.BackupCode then NoIsSecondContactMethodVerificationParam and UseLocalizationResult.usePhoneActionText or UseLocalizationResult.useEmailActionText else NoIsSecondContactMethodVerificationParam1 and UseLocalizationResult.useEmailActionText or UseLocalizationResult.useBackupCodeActionText else ""
	end
	
	local function OnActivated()
		-- upvalues: RecoveryMethodTypesToInputTypesResult (ref), p1 (copy), AccountRecoveryPageStateModule (upval), UserIDParam (copy), IsSecondContactMethodVerificationParam (copy), PreviousRecoveryMethodParam (copy), PreviousRecoveryMethodTypesParam (copy), NextRecoveryMethodTypesParam (copy), CloseRecoveryOnBackParam (copy), UseStateResult2_2 (copy), UseStateResult8 (copy), RecoveryMethodInputTypeModule (upval), NoIsSecondContactMethodVerificationParam (copy), NoIsSecondContactMethodVerificationParam1 (copy), EventServiceModule (upval), UseContextResult (copy), UseStateResult2_7 (copy)
		if RecoveryMethodTypesToInputTypesResult and #RecoveryMethodTypesToInputTypesResult > 2 then
			p1.navigation.navigate(AccountRecoveryPageStateModule.ChooseVerificationMethodScreen, {
				sendCodeRouteParams = {
					userID = UserIDParam,
					isSecondContactMethodVerification = IsSecondContactMethodVerificationParam,
					previousRecoveryMethod = PreviousRecoveryMethodParam,
					previousRecoveryMethodTypes = PreviousRecoveryMethodTypesParam,
					nextRecoveryMethodTypes = NextRecoveryMethodTypesParam,
					closeRecoveryOnBack = CloseRecoveryOnBackParam
				}
			})
			UseStateResult2_2("")
			
			return
		end
		if RecoveryMethodTypesToInputTypesResult and #RecoveryMethodTypesToInputTypesResult == 2 then
			local Phone = if UseStateResult8 == RecoveryMethodInputTypeModule.Email then NoIsSecondContactMethodVerificationParam and RecoveryMethodInputTypeModule.Phone or RecoveryMethodInputTypeModule.BackupCode elseif UseStateResult8 == RecoveryMethodInputTypeModule.BackupCode then NoIsSecondContactMethodVerificationParam and RecoveryMethodInputTypeModule.Phone or RecoveryMethodInputTypeModule.Email else NoIsSecondContactMethodVerificationParam1 and RecoveryMethodInputTypeModule.Email or RecoveryMethodInputTypeModule.BackupCode
			EventServiceModule.sendRecoveryMethodInputSwitchEvent(UseContextResult.state.recoverySessionId, Phone, "sendCode")
			UseStateResult2_7(Phone)
			UseStateResult2_2("")
		end
	end
	
	local _ = function()
		-- upvalues: ReactModule (upval), UserHeaderModule (upval), UserIDParam (copy), UseStateResult (copy), UseStateResult1 (copy)
		return ReactModule.createElement(UserHeaderModule, {
			LayoutOrder = 2,
			userId = UserIDParam,
			displayName = UseStateResult,
			username = UseStateResult1
		})
	end
	
	local function v105()
		-- upvalues: ReactModule (upval), UseTokensResult (copy)
		return ReactModule.createElement("Frame", {
			LayoutOrder = 3,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_300)
		})
	end
	
	return ReactModule.createElement(FullscreenPageWithSafeArea, {
		includeStatusBar = true,
		BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color
	}, {
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, UseDesignTokensResult.Size.Size_200),
			PaddingLeft = UDim.new(0, UseDesignTokensResult.Size.Size_300),
			PaddingRight = UDim.new(0, UseDesignTokensResult.Size.Size_300),
			PaddingBottom = UDim.new(0, UseDesignTokensResult.Size.Size_200)
		}),
		Wrapper = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0)
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical
			}),
			Header = ReactModule.createElement(RecoveryHeaderModule, {
				LayoutOrder = 1,
				currentComponent = "sendCode",
				onBackActivated = function()
					-- upvalues: CloseRecoveryOnBackParam (copy), UseContextResult (copy), p1 (copy)
					if CloseRecoveryOnBackParam then
						UseContextResult.parentNavigation.goBack()
						
						return
					else
						p1.navigation.goBack()
					end
				end,
				backButtonDisabled = UseStateResult5,
				recoveryHeadingText = IsSecondContactMethodVerificationParam and UseLocalizationResult.secondMethodHeadingText or UseLocalizationResult.recoveryHeadingText,
				recoverySessionId = UseContextResult.state.recoverySessionId
			}),
			Content = ReactModule.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0)
			}, {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical
				}),
				PreScrollContent = ReactModule.createElement("Frame", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, 0, 0, 0),
					[ReactModule.Change.AbsoluteSize] = v96
				}, {
					UIPadding = ReactModule.createElement("UIPadding", {
						PaddingLeft = UDim.new(0, UseDesignTokensResult.Size.Size_200),
						PaddingRight = UDim.new(0, UseDesignTokensResult.Size.Size_200)
					}),
					UIListLayout = ReactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Vertical,
						Padding = UDim.new(0, UseDesignTokensResult.Size.Size_50)
					}),
					RecoveryHeadingSpacing = ReactModule.createElement("Frame", {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, UseDesignTokensResult.Size.Size_500)
					})
				}),
				InputsOverflowScrollView = ReactModule.createElement(ScrollView, {
					LayoutOrder = 2,
					scroll = {
						AutomaticCanvasSize = Enum.AutomaticSize.Y,
						CanvasSize = UDim2.new(1, 0, 0, 0),
						ScrollingDirection = Enum.ScrollingDirection.Y,
						scrollBarVisibility = Visibility.Always
					},
					Size = UDim2.new(1, 0, 1, -UseStateResult7.Y)
				}, {
					UIPadding = ReactModule.createElement("UIPadding", {
						PaddingLeft = UDim.new(0, UseDesignTokensResult.Size.Size_200),
						PaddingRight = UDim.new(0, UseDesignTokensResult.Size.Size_200)
					}),
					UIListLayout = ReactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Vertical,
						Padding = UDim.new(0, UseDesignTokensResult.Size.Size_50)
					}),
					UserHeader = if NoIsSecondContactMethodVerificationParam2 then ReactModule.createElement(UserHeaderModule, {
						LayoutOrder = 2,
						userId = UserIDParam,
						displayName = UseStateResult,
						username = UseStateResult1
					}) else nil,
					UserHeaderSpacing = if NoIsSecondContactMethodVerificationParam2 then v105() else nil,
					BodyText = not IsSecondContactMethodVerificationParam and ReactModule.createElement(Text, {
						LayoutOrder = 4,
						TextWrapped = true,
						Text = NoIsSecondContactMethodVerificationParam2 and UseLocalizationResult.enterContactMethodAssociatedWithYourAccountText or UseLocalizationResult.sendCodeContactMethodConfirmation,
						fontStyle = UseTokensResult.Typography.BodyMedium,
						textStyle = UseTokensResult.Color.Content.Default,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Center,
						padding = { bottom = UDim.new(0, UseTokensResult.Size.Size_300) }
					}),
					SecondContactMethodText = IsSecondContactMethodVerificationParam and ReactModule.createElement(SystemBanner, {
						LayoutOrder = 5,
						severity = AlertSeverity.Info,
						variant = AlertVariant.Standard,
						title = UseLocalizationResult.previousMethodVerifiedText,
						description = EnterBackupCodeText
					}),
					SecondContactMethodTextSpacing = IsSecondContactMethodVerificationParam and ReactModule.createElement("Frame", {
						LayoutOrder = 6,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_400)
					}),
					PhoneDropdown = UseStateResult8 == RecoveryMethodInputTypeModule.Phone and (NoIsSecondContactMethodVerificationParam and ReactModule.createElement(PhoneDropdownModule, {
						LayoutOrder = 7,
						value = UseStateResult4,
						onChange = function(p2)
							-- upvalues: UseStateResult2_3 (copy)
							UseStateResult2_3(p2)
						end,
						phonePrefixList = UseContextResult.state.phonePrefixList,
						topOffset = UseDesignTokensResult.Size.Size_1600 * 3
					})),
					PhoneDropdownSpacing = UseStateResult8 == RecoveryMethodInputTypeModule.Phone and (NoIsSecondContactMethodVerificationParam and ReactModule.createElement("Frame", {
						LayoutOrder = 8,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, UseDesignTokensResult.Size.Size_500)
					})),
					ContactMethodLabel = ReactModule.createElement(StyledTextLabel, {
						layoutOrder = 9,
						text = if UseStateResult8 == RecoveryMethodInputTypeModule.Phone then UseLocalizationResult.phoneText elseif UseStateResult8 == RecoveryMethodInputTypeModule.BackupCode then UseLocalizationResult.backupCodeText else UseLocalizationResult.emailText,
						fontStyle = UseTokensResult.Typography.TitleMedium,
						colorStyle = UseStyleResult.Theme.TextEmphasis,
						automaticSize = Enum.AutomaticSize.XY
					}),
					ContactMethodLabelSpacing = ReactModule.createElement("Frame", {
						LayoutOrder = 10,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, UseDesignTokensResult.Size.Size_100)
					}),
					ContactMethodField = ReactModule.createElement(TextInput, {
						LayoutOrder = 11,
						label = "",
						text = UseStateResult3,
						width = UDim.new(1, 0),
						textInputType = if UseStateResult8 == RecoveryMethodInputTypeModule.Phone then Enum.TextInputType.Phone elseif UseStateResult8 == RecoveryMethodInputTypeModule.BackupCode then Enum.TextInputType.NoSuggestions else Enum.TextInputType.Email,
						onChanged = function(p2)
							-- upvalues: UseStateResult6 (copy), UseStateResult2_5 (copy), UseStateResult2_2 (copy)
							if UseStateResult6 ~= "" then
								UseStateResult2_5("")
							end
							UseStateResult2_2(p2)
						end,
						isDisabled = UseStateResult5,
						size = InputSize.Medium
					}),
					ErrorTextSpacing = ReactModule.createElement("Frame", {
						LayoutOrder = 12,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_200)
					}),
					ErrorTextLabel = ReactModule.createElement(Text, {
						LayoutOrder = 13,
						Text = UseLocalizationResult.errorText or "",
						fontStyle = UseTokensResult.Typography.CaptionSmall,
						textStyle = UseTokensResult.Color.System.Alert,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Center
					}),
					NextButtonSpacing = ReactModule.createElement("Frame", {
						LayoutOrder = 14,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_300)
					}),
					NextButton = ReactModule.createElement(Button, {
						LayoutOrder = 15,
						variant = ButtonVariant.Emphasis,
						size = InputSize.Medium,
						text = IsNotUserIDParamMatch and UseLocalizationResult.nextButtonText or UseLocalizationResult.sendCodeButtonText,
						width = UDim.new(1, 0),
						onActivated = function()
							-- upvalues: IsSecondContactMethodVerificationParam1 (copy), UseStateResult8 (copy), RecoveryMethodInputTypeModule (upval), attemptVerifyBackupCode (copy), v92 (copy), v93 (copy)
							if IsSecondContactMethodVerificationParam1 and UseStateResult8 == RecoveryMethodInputTypeModule.BackupCode then
								attemptVerifyBackupCode()
								
								return
							else
								v92(v93)
							end
						end,
						isDisabled = if IsSecondContactMethodVerificationParam1 and UseStateResult8 == RecoveryMethodInputTypeModule.BackupCode then #UseStateResult3 ~= ConstantsModule.BackupCodeLength else #UseStateResult3 < 3,
						isLoading = UseStateResult5
					}),
					SwitchSecondMethodSpacing = IsSecondContactMethodVerificationParam1 and (#(RecoveryMethodTypesToInputTypesResult or {}) > 1 and ReactModule.createElement("Frame", {
						LayoutOrder = 16,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_700)
					})),
					SwitchSecondMethodButton = IsSecondContactMethodVerificationParam1 and (#(RecoveryMethodTypesToInputTypesResult or {}) > 1 and ReactModule.createElement(Button, {
						LayoutOrder = 17,
						variant = ButtonVariant.Standard,
						size = InputSize.Medium,
						text = v102(),
						width = UDim.new(1, 0),
						onActivated = OnActivated,
						isDisabled = UseStateResult5
					})),
					DividerSpacing = NoIsSecondContactMethodVerificationParam and (not IsSecondContactMethodVerificationParam1 and ReactModule.createElement("Frame", {
						LayoutOrder = 18,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_900)
					})),
					SwitchInputDivider = NoIsSecondContactMethodVerificationParam and (not IsSecondContactMethodVerificationParam1 and ReactModule.createElement("Frame", {
						LayoutOrder = 19,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}, {
						LabelContainer = ReactModule.createElement("Frame", {
							BackgroundTransparency = 0,
							BorderSizePixel = 0,
							ZIndex = 2,
							BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color,
							Position = UDim2.new(0.5, 0, 0, 0),
							AnchorPoint = Vector2.new(0.5, 0.5),
							AutomaticSize = Enum.AutomaticSize.XY
						}, {
							UIPadding = ReactModule.createElement("UIPadding", {
								PaddingLeft = UDim.new(0, UseDesignTokensResult.Size.Size_200),
								PaddingRight = UDim.new(0, UseDesignTokensResult.Size.Size_200),
								PaddingTop = UDim.new(0, UseDesignTokensResult.Size.Size_50),
								PaddingBottom = UDim.new(0, UseDesignTokensResult.Size.Size_50)
							}),
							Label = ReactModule.createElement(Text, {
								Text = UseLocalizationResult.orText,
								fontStyle = UseTokensResult.Typography.LabelMedium,
								textStyle = UseTokensResult.Color.ActionStandard.Foreground,
								Size = UDim2.new(1, 0, 0, 0),
								AutomaticSize = Enum.AutomaticSize.Y,
								TextXAlignment = Enum.TextXAlignment.Center,
								TextYAlignment = Enum.TextYAlignment.Center
							})
						}),
						Divider = ReactModule.createElement(Divider, {
							ZIndex = 1,
							variant = DividerVariant.Default,
							orientation = Orientation.Horizontal
						})
					})),
					SwitchInputButtonSpacing = NoIsSecondContactMethodVerificationParam and (not IsSecondContactMethodVerificationParam1 and ReactModule.createElement("Frame", {
						LayoutOrder = 20,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_700)
					})),
					SwitchInputButton = NoIsSecondContactMethodVerificationParam and (not IsSecondContactMethodVerificationParam1 and ReactModule.createElement(Button, {
						LayoutOrder = 21,
						variant = ButtonVariant.Standard,
						size = InputSize.Medium,
						text = UseStateResult8 == RecoveryMethodInputTypeModule.Phone and UseLocalizationResult.useEmailInsteadText or UseLocalizationResult.usePhoneInsteadText,
						width = UDim.new(1, 0),
						onActivated = function()
							-- upvalues: UseStateResult8 (copy), RecoveryMethodInputTypeModule (upval), EventServiceModule (upval), UseContextResult (copy), UseStateResult2_7 (copy), UseStateResult2_2 (copy)
							local Email = if UseStateResult8 == RecoveryMethodInputTypeModule.Phone then RecoveryMethodInputTypeModule.Email else RecoveryMethodInputTypeModule.Phone
							EventServiceModule.sendSwitchedInputEvent(UseContextResult.state.recoverySessionId, Email == RecoveryMethodInputTypeModule.Phone, "sendCode")
							UseStateResult2_7(Email)
							UseStateResult2_2("")
						end,
						isDisabled = UseStateResult5
					})),
					Modal = GetFFlagEnableSkipPasswordResetModule() and GetModalModule(UseContextResult.state.modalStateAndProps)
				})
			})
		})
	})
end