local PhoneUpsell = script:FindFirstAncestor("PhoneUpsell")
local Parent = PhoneUpsell.Parent
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(Parent.React)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local _ = require(Parent.LuauPolyfill)
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local EventStreamConstantsModule = require(PhoneUpsell.DuplicateAnalytics.EventStreamConstants)
local RoactAnalyticsAuthEventsModule = require(PhoneUpsell.DuplicateAnalytics.RoactAnalyticsAuthEvents)
local DebounceModule = require(PhoneUpsell.Utils.debounce)
local MergePropsModule = require(PhoneUpsell.Utils.mergeProps)
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local PhoneVerificationUpsellStateModule = require(PhoneUpsell.Components.PhoneVerificationUpsellState)
local ConstantsModule = require(PhoneUpsell.Constants)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local SetPhoneNumberModule = require(PhoneUpsell.Thunks.SetPhoneNumber)
local VerifyPhoneCodeModule = require(PhoneUpsell.Thunks.VerifyPhoneCode)
local ResendPhoneCodeModule = require(PhoneUpsell.Thunks.ResendPhoneCode)
local SetIsPhoneVerifiedFunction = require(Parent.ContactImporter).Actions.SetIsPhoneVerified
local GetPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule = require(PhoneUpsell.Utils.GetPrefixAndNationalNumberFromRawPhoneAndDefaultPrefix)
local UseUserExperimentFunction = require(Parent.RoactAppExperiment).useUserExperiment
local GetFStringAndroidPhoneVerificationLayerFunction = require(Parent.SharedFlags).GetFStringAndroidPhoneVerificationLayer
local GetFStringIOSPhoneVerificationLayerFunction = require(Parent.SharedFlags).GetFStringIOSPhoneVerificationLayer
local GetFFlagPhoneUseParentSizeForScreenSizeModule = require(PhoneUpsell.Flags.GetFFlagPhoneUseParentSizeForScreenSize)
local GetFFlagAddMorePhoneUpsellEventsFunction = require(Parent.SharedFlags).GetFFlagAddMorePhoneUpsellEvents
local FFlagPhoneUpsellEnforceCodeInputLimit = require(Parent.SharedFlags).FFlagPhoneUpsellEnforceCodeInputLimit
local IdentityProtocol = require(Parent.IdentityProtocol).IdentityProtocol
local config = {
	name = "United States",
	code = "US",
	prefix = "1",
	localizedName = "United States"
}

local function CloseUpsell() end

local config1 = {
	origin = "",
	eventContext = "",
	addPhoneTitleKey = "Feature.VerificationUpsell.Action.AddPhone",
	addPhoneDescriptionKey = "Feature.VerificationUpsell.Description.VerificationCodeSmsFeesMayApply",
	extraButtonTextKey = "",
	shouldAutofillAndroidPhoneNumberAtLaunch = false,
	alwaysShowAddPhoneLegalText = false,
	requireAddPhoneLegalTextCheckbox = false,
	onSuccess = CloseUpsell,
	onFailure = CloseUpsell,
	onCancelled = CloseUpsell,
	onExtraButtonClick = CloseUpsell,
	closeUpsell = CloseUpsell,
	showWebpage = function(_) end
}

return function(p1)
	-- upvalues: MergePropsModule (copy), config1 (copy), UseSelectorFunction (copy), UseDispatchFunction (copy), SetPhoneNumberModule (copy), VerifyPhoneCodeModule (copy), ResendPhoneCodeModule (copy), SetIsPhoneVerifiedFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), RoactAnalyticsAuthEventsModule (copy), UseUserExperimentFunction (copy), GetFStringAndroidPhoneVerificationLayerFunction (copy), GetFStringIOSPhoneVerificationLayerFunction (copy), ReactModule (copy), PhoneVerificationUpsellStateModule (copy), config (copy), UseLocalizationFunction (copy), IdentityProtocol (copy), GetPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (copy), UserInputService (copy), GetFFlagAddMorePhoneUpsellEventsFunction (copy), EventStreamConstantsModule (copy), ConstantsModule (copy), DebounceModule (copy), FFlagPhoneUpsellEnforceCodeInputLimit (copy), GetFFlagPhoneUseParentSizeForScreenSizeModule (copy)
	local MergePropsModuleResult = MergePropsModule(config1, p1)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.CountryCodeList
	end)
	local UseDispatchResult = UseDispatchFunction()
	
	local function _(p2, p3, p4, p5)
		-- upvalues: UseDispatchResult (copy), SetPhoneNumberModule (upval)
		return UseDispatchResult(SetPhoneNumberModule(p2, p3, p4, p5, nil))
	end
	
	local _ = function(p2, p3)
		-- upvalues: UseDispatchResult (copy), VerifyPhoneCodeModule (upval)
		return UseDispatchResult(VerifyPhoneCodeModule(p2, p3))
	end
	
	local _ = function(p2)
		-- upvalues: UseDispatchResult (copy), ResendPhoneCodeModule (upval)
		return UseDispatchResult(ResendPhoneCodeModule(p2))
	end
	
	local _ = function(p2)
		-- upvalues: UseDispatchResult (copy), SetIsPhoneVerifiedFunction (upval)
		return UseDispatchResult(SetIsPhoneVerifiedFunction(p2))
	end
	
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseRoactServiceResult1 = UseRoactServiceFunction(RoactAnalyticsAuthEventsModule)
	local UseUserExperimentResult, UseUserExperimentResult2, UseUserExperimentResult3, UseUserExperimentResult4 = UseUserExperimentFunction({
		GetFStringAndroidPhoneVerificationLayerFunction(),
		GetFStringIOSPhoneVerificationLayerFunction()
	}, function(p2)
		-- upvalues: GetFStringAndroidPhoneVerificationLayerFunction (upval), GetFStringIOSPhoneVerificationLayerFunction (upval)
		local v1 = p2[GetFStringAndroidPhoneVerificationLayerFunction()] or {}
		local v2 = p2[GetFStringIOSPhoneVerificationLayerFunction()] or {}
		
		return v1.IsAutofillPhoneNumberEnabled, v1.IsAutofillSMSOtpEnabled, v2.IsAutofillSMSOtpEnabled, v2.IsAutofillPhoneNumberEnabled
	end)
	local UseStateResult, UseStateResult2 = ReactModule.useState(if MergePropsModuleResult.entryConfig then PhoneVerificationUpsellStateModule.Entry else PhoneVerificationUpsellStateModule.AddPhone)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState("")
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(config)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(false)
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState("")
	local UseStateResult6, UseStateResult2_5 = ReactModule.useState("")
	local UseStateResult7, UseStateResult2_6 = ReactModule.useState("")
	local UseStateResult8, UseStateResult2_7 = ReactModule.useState("")
	local UseStateResult9, _ = ReactModule.useState(false)
	local UseStateResult10, UseStateResult2_8 = ReactModule.useState(false)
	local UseStateResult11, UseStateResult2_9 = ReactModule.useState(false)
	local UseStateResult12, UseStateResult2_10 = ReactModule.useState(false)
	local UseStateResult13, UseStateResult2_11 = ReactModule.useState(0)
	local UseStateResult14, UseStateResult2_12 = ReactModule.useState(Vector2.new(400, 400))
	local UseRefResult = ReactModule.useRef(false)
	local UseLocalizationResult = UseLocalizationFunction({
		verifyingKey = "Feature.VerificationUpsell.Label.Verifying",
		invalidPhoneFormatKey = "Feature.VerificationUpsell.Response.ErrorPhoneFormatInvalid",
		invalidPhoneNumberKey = "Feature.VerificationUpsell.Response.InvalidPhoneNumberError",
		invalidVerificationCodeKey = "Feature.VerificationUpsell.Message.InvalidSmsCode",
		tooManyAccountsKey = "Feature.VerificationUpsell.Response.PhoneHasTooManyAssociatedAccounts",
		tooManyAttemptsKey = "Feature.VerificationUpsell.Response.TooManyAttemptsTryAgainLater",
		genericErrorKey = "Feature.VerificationUpsell.Response.ErrorTryAgain"
	})
	local Connection = nil
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult4 (copy), UseSelectorResult (copy), UseStateResult2_2 (copy), UseStateResult2_3 (copy)
		if not UseStateResult4 and UseSelectorResult and #UseSelectorResult > 0 then
			for _, value in UseSelectorResult do
				if value.isDefault then
					UseStateResult2_2(value)
				end
			end
			UseStateResult2_3(true)
		end
	end, { UseSelectorResult, UseStateResult4 })
	
	local _ = function()
		-- upvalues: IdentityProtocol (upval), UseRoactServiceResult1 (copy), MergePropsModuleResult (copy), UseStateResult (copy), GetPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (upval), UseStateResult3 (copy), config (upval), UseStateResult2_1 (copy)
		local Default = IdentityProtocol.default
		Default:supportsGetPhoneNumber():andThen(function(Result)
			-- upvalues: UseRoactServiceResult1 (upval), MergePropsModuleResult (upval), UseStateResult (upval), Default (copy), GetPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (upval), UseStateResult3 (upval), config (upval), UseStateResult2_1 (upval)
			print("PhoneVerification: Autofill phone number supported: {}!", Result)
			
			if not Result then return end
			UseRoactServiceResult1.reportModalActionWithSection(MergePropsModuleResult.eventContext, "phoneAutofillEligible", "autofill", MergePropsModuleResult.origin, UseStateResult)
			local PhoneNumber = Default:getPhoneNumber()
			
			if PhoneNumber then
				PhoneNumber:andThen(function(Result)
					-- upvalues: GetPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (upval), UseStateResult3 (upval), config (upval), UseRoactServiceResult1 (upval), MergePropsModuleResult (upval), UseStateResult (upval), UseStateResult2_1 (upval)
					if not Result or Result == "" then
						UseRoactServiceResult1.reportModalActionWithSection(MergePropsModuleResult.eventContext, "phoneAutofillNull", "autofill", MergePropsModuleResult.origin, UseStateResult)
						
						return
					end
					local Prefix, v1 = GetPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule(Result, UseStateResult3.prefix)
					
					if Prefix == config.prefix then
						UseRoactServiceResult1.reportModalActionWithSection(MergePropsModuleResult.eventContext, "phoneAutofillUSFound", "autofill", MergePropsModuleResult.origin, UseStateResult)
					end
					UseStateResult2_1(v1)
					UseRoactServiceResult1.reportModalActionWithSection(MergePropsModuleResult.eventContext, "phoneAutofillSuccess", "autofill", MergePropsModuleResult.origin, UseStateResult)
				end)
				
				return
			end
		end)
	end
	
	local _ = function()
		-- upvalues: IdentityProtocol (upval), UseRoactServiceResult1 (copy), MergePropsModuleResult (copy), UseStateResult (copy), UseStateResult2_4 (copy), UseStateResult2_5 (copy)
		local Default = IdentityProtocol.default
		Default:supportsGetSMSOTP():andThen(function(Result)
			-- upvalues: UseRoactServiceResult1 (upval), MergePropsModuleResult (upval), UseStateResult (upval), Default (copy), UseStateResult2_4 (upval), UseStateResult2_5 (upval)
			print("PhoneVerification: Autofill OTP supported: {}!", Result)
			
			if Result then
				UseRoactServiceResult1.reportModalActionWithSection(MergePropsModuleResult.eventContext, "codeAutofillEligible", "autofill", MergePropsModuleResult.origin, UseStateResult)
				local SMSOTP = Default:getSMSOTP()
				
				if SMSOTP then
					SMSOTP:andThen(function(Result)
						-- upvalues: UseStateResult2_4 (upval), UseStateResult2_5 (upval), UseRoactServiceResult1 (upval), MergePropsModuleResult (upval), UseStateResult (upval)
						if Result and Result ~= "" then
							UseStateResult2_4(Result)
							UseStateResult2_5(Result)
							UseRoactServiceResult1.reportModalActionWithSection(MergePropsModuleResult.eventContext, "codeAutofillSuccess", "autofill", MergePropsModuleResult.origin, UseStateResult)
						end
					end)
				end
			end
		end)
	end
	
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseStateResult10 (copy)
		return function()
			-- upvalues: UseRefResult (upval), UseStateResult10 (upval)
			UseRefResult.current = UseStateResult10
		end
	end, { UseStateResult10 })
	ReactModule.useEffect(function()
		-- upvalues: Connection (ref), UserInputService (upval), UseStateResult2_10 (copy), UseStateResult2_11 (copy), UseRoactServiceResult1 (copy), MergePropsModuleResult (copy), GetFFlagAddMorePhoneUpsellEventsFunction (upval), UseStateResult (copy), PhoneVerificationUpsellStateModule (upval), UseUserExperimentResult (copy), IdentityProtocol (upval), GetPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (upval), UseStateResult3 (copy), config (upval), UseStateResult2_1 (copy), UseRefResult (copy)
		Connection = UserInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function()
			-- upvalues: UseStateResult2_10 (upval), UserInputService (upval), UseStateResult2_11 (upval)
			UseStateResult2_10(UserInputService.OnScreenKeyboardVisible)
			UseStateResult2_11(UserInputService.OnScreenKeyboardVisible and UserInputService.OnScreenKeyboardSize.Y or 0)
		end)
		UseRoactServiceResult1.reportModalShownWithSection(MergePropsModuleResult.eventContext, MergePropsModuleResult.origin, if GetFFlagAddMorePhoneUpsellEventsFunction() then UseStateResult else PhoneVerificationUpsellStateModule.AddPhone)
		
		if UseUserExperimentResult then
			local Default = IdentityProtocol.default
			Default:supportsGetPhoneNumber():andThen(function(Result)
				-- upvalues: UseRoactServiceResult1 (upval), MergePropsModuleResult (upval), UseStateResult (upval), Default (copy), GetPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (upval), UseStateResult3 (upval), config (upval), UseStateResult2_1 (upval)
				print("PhoneVerification: Autofill phone number supported: {}!", Result)
				
				if not Result then return end
				UseRoactServiceResult1.reportModalActionWithSection(MergePropsModuleResult.eventContext, "phoneAutofillEligible", "autofill", MergePropsModuleResult.origin, UseStateResult)
				local PhoneNumber = Default:getPhoneNumber()
				
				if PhoneNumber then
					PhoneNumber:andThen(function(Result)
						-- upvalues: GetPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (upval), UseStateResult3 (upval), config (upval), UseRoactServiceResult1 (upval), MergePropsModuleResult (upval), UseStateResult (upval), UseStateResult2_1 (upval)
						if not Result or Result == "" then
							UseRoactServiceResult1.reportModalActionWithSection(MergePropsModuleResult.eventContext, "phoneAutofillNull", "autofill", MergePropsModuleResult.origin, UseStateResult)
							
							return
						end
						local Prefix, v1 = GetPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule(Result, UseStateResult3.prefix)
						
						if Prefix == config.prefix then
							UseRoactServiceResult1.reportModalActionWithSection(MergePropsModuleResult.eventContext, "phoneAutofillUSFound", "autofill", MergePropsModuleResult.origin, UseStateResult)
						end
						UseStateResult2_1(v1)
						UseRoactServiceResult1.reportModalActionWithSection(MergePropsModuleResult.eventContext, "phoneAutofillSuccess", "autofill", MergePropsModuleResult.origin, UseStateResult)
					end)
					
					return
				end
			end)
		end
		return function()
			-- upvalues: Connection (upval), UseRefResult (upval), MergePropsModuleResult (upval)
			if Connection then
				Connection:Disconnect()
			end
			Connection = nil
			
			if not UseRefResult.current then
				MergePropsModuleResult.onCancelled()
			end
		end
	end, {})
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		return p2.ScreenSize
	end)
	
	local function handleCloseClick()
		-- upvalues: UseRoactServiceResult1 (copy), MergePropsModuleResult (copy), UseStateResult (copy)
		UseRoactServiceResult1.reportModalDismissedWithSection(MergePropsModuleResult.eventContext, MergePropsModuleResult.origin, UseStateResult)
		MergePropsModuleResult.closeUpsell()
	end
	
	local _ = function(p2)
		-- upvalues: UseLocalizationResult (copy)
		return if p2 == 2 then UseLocalizationResult.invalidPhoneFormatKey elseif p2 == 6 then UseLocalizationResult.tooManyAttemptsKey elseif p2 == 7 then UseLocalizationResult.invalidVerificationCodeKey elseif p2 == 8 then UseLocalizationResult.invalidPhoneNumberKey elseif p2 == 9 then UseLocalizationResult.tooManyAccountsKey else UseLocalizationResult.genericErrorKey
	end
	
	local function handleSetPhone()
		-- upvalues: UseStateResult2_9 (copy), UseRoactServiceResult (copy), UseStateResult3 (copy), UseStateResult1 (copy), UseDispatchResult (copy), SetPhoneNumberModule (upval), UseStateResult2 (copy), PhoneVerificationUpsellStateModule (upval), UseRoactServiceResult1 (copy), MergePropsModuleResult (copy), UseUserExperimentResult2 (copy), IdentityProtocol (upval), UseStateResult (copy), UseStateResult2_4 (copy), UseStateResult2_5 (copy), EventStreamConstantsModule (upval), UseStateResult2_6 (copy), UseLocalizationResult (copy)
		UseStateResult2_9(true)
		local UseDispatchResultResult = UseDispatchResult(SetPhoneNumberModule(UseRoactServiceResult, UseStateResult3.code, UseStateResult3.prefix, UseStateResult1, nil))
		
		if UseDispatchResultResult then
			UseDispatchResultResult:andThen(function()
				-- upvalues: UseStateResult2 (upval), PhoneVerificationUpsellStateModule (upval), UseStateResult2_9 (upval), UseRoactServiceResult1 (upval), MergePropsModuleResult (upval), UseUserExperimentResult2 (upval), IdentityProtocol (upval), UseStateResult (upval), UseStateResult2_4 (upval), UseStateResult2_5 (upval)
				UseStateResult2(PhoneVerificationUpsellStateModule.VerifyPhone)
				UseStateResult2_9(false)
				UseRoactServiceResult1.reportModalShownWithSection(MergePropsModuleResult.eventContext, MergePropsModuleResult.origin, PhoneVerificationUpsellStateModule.VerifyPhone)
				
				if UseUserExperimentResult2 then
					local Default = IdentityProtocol.default
					Default:supportsGetSMSOTP():andThen(function(Result)
						-- upvalues: UseRoactServiceResult1 (upval), MergePropsModuleResult (upval), UseStateResult (upval), Default (copy), UseStateResult2_4 (upval), UseStateResult2_5 (upval)
						print("PhoneVerification: Autofill OTP supported: {}!", Result)
						
						if Result then
							UseRoactServiceResult1.reportModalActionWithSection(MergePropsModuleResult.eventContext, "codeAutofillEligible", "autofill", MergePropsModuleResult.origin, UseStateResult)
							local SMSOTP = Default:getSMSOTP()
							
							if SMSOTP then
								SMSOTP:andThen(function(Result)
									-- upvalues: UseStateResult2_4 (upval), UseStateResult2_5 (upval), UseRoactServiceResult1 (upval), MergePropsModuleResult (upval), UseStateResult (upval)
									if Result and Result ~= "" then
										UseStateResult2_4(Result)
										UseStateResult2_5(Result)
										UseRoactServiceResult1.reportModalActionWithSection(MergePropsModuleResult.eventContext, "codeAutofillSuccess", "autofill", MergePropsModuleResult.origin, UseStateResult)
									end
								end)
							end
						end
					end)
				end
			end):catch(function(Err)
				-- upvalues: UseRoactServiceResult1 (upval), MergePropsModuleResult (upval), EventStreamConstantsModule (upval), PhoneVerificationUpsellStateModule (upval), UseStateResult2_6 (upval), UseLocalizationResult (upval), UseStateResult2_9 (upval)
				if Err then
					if Err.PhoneRegexFailed then
						UseRoactServiceResult1.reportModalShownWithSectionAndError(MergePropsModuleResult.eventContext, EventStreamConstantsModule.Field.ErrorMessage, MergePropsModuleResult.origin, PhoneVerificationUpsellStateModule.AddPhone, "")
						UseStateResult2_6(UseLocalizationResult.invalidPhoneFormatKey)
					else
						UseRoactServiceResult1.reportModalShownWithSectionAndError(MergePropsModuleResult.eventContext, EventStreamConstantsModule.Field.ErrorMessage, MergePropsModuleResult.origin, PhoneVerificationUpsellStateModule.AddPhone, Err.ErrorCode)
						local ErrorCode = Err.ErrorCode
						UseStateResult2_6(if ErrorCode == 2 then UseLocalizationResult.invalidPhoneFormatKey elseif ErrorCode == 6 then UseLocalizationResult.tooManyAttemptsKey elseif ErrorCode == 7 then UseLocalizationResult.invalidVerificationCodeKey elseif ErrorCode == 8 then UseLocalizationResult.invalidPhoneNumberKey elseif ErrorCode == 9 then UseLocalizationResult.tooManyAccountsKey else UseLocalizationResult.genericErrorKey)
					end
				else
					UseRoactServiceResult1.reportModalShownWithSectionAndError(MergePropsModuleResult.eventContext, EventStreamConstantsModule.Field.ErrorMessage, MergePropsModuleResult.origin, PhoneVerificationUpsellStateModule.AddPhone, "")
					UseStateResult2_6(UseLocalizationResult.genericErrorKey)
				end
				UseStateResult2_9(false)
			end)
		end
		UseRoactServiceResult1.reportInteractWithActionAndSection(MergePropsModuleResult.eventContext, "", "", MergePropsModuleResult.origin, EventStreamConstantsModule.Button.Continue, PhoneVerificationUpsellStateModule.AddPhone)
	end
	
	local function handleVerifyPhone()
		-- upvalues: UseStateResult2_9 (copy), UseRoactServiceResult (copy), UseStateResult6 (copy), UseDispatchResult (copy), VerifyPhoneCodeModule (upval), UseStateResult2_8 (copy), UseRoactServiceResult1 (copy), MergePropsModuleResult (copy), EventStreamConstantsModule (upval), PhoneVerificationUpsellStateModule (upval), UseStateResult2_7 (copy), UseLocalizationResult (copy)
		UseStateResult2_9(true)
		local UseDispatchResultResult = UseDispatchResult(VerifyPhoneCodeModule(UseRoactServiceResult, UseStateResult6))
		
		if UseDispatchResultResult then
			UseDispatchResultResult:andThen(function()
				-- upvalues: UseStateResult2_8 (upval)
				UseStateResult2_8(true)
			end):catch(function(Err)
				-- upvalues: UseRoactServiceResult1 (upval), MergePropsModuleResult (upval), EventStreamConstantsModule (upval), PhoneVerificationUpsellStateModule (upval), UseStateResult2_7 (upval), UseLocalizationResult (upval), UseStateResult2_9 (upval)
				if Err then
					UseRoactServiceResult1.reportModalShownWithSectionAndError(MergePropsModuleResult.eventContext, EventStreamConstantsModule.Field.ErrorMessage, MergePropsModuleResult.origin, PhoneVerificationUpsellStateModule.VerifyPhone, Err.ErrorCode)
					local ErrorCode = Err.ErrorCode
					UseStateResult2_7(if ErrorCode == 2 then UseLocalizationResult.invalidPhoneFormatKey elseif ErrorCode == 6 then UseLocalizationResult.tooManyAttemptsKey elseif ErrorCode == 7 then UseLocalizationResult.invalidVerificationCodeKey elseif ErrorCode == 8 then UseLocalizationResult.invalidPhoneNumberKey elseif ErrorCode == 9 then UseLocalizationResult.tooManyAccountsKey else UseLocalizationResult.genericErrorKey)
				else
					UseRoactServiceResult1.reportModalShownWithSectionAndError(MergePropsModuleResult.eventContext, EventStreamConstantsModule.Field.ErrorMessage, MergePropsModuleResult.origin, PhoneVerificationUpsellStateModule.VerifyPhone, "")
					UseStateResult2_7(UseLocalizationResult.genericErrorKey)
				end
				UseStateResult2_9(false)
			end)
		end
		UseRoactServiceResult1.reportInteractWithActionAndSection(MergePropsModuleResult.eventContext, "", "", MergePropsModuleResult.origin, EventStreamConstantsModule.Button.AutoSubmit, PhoneVerificationUpsellStateModule.VerifyPhone)
	end
	
	local function handleResendCode()
		-- upvalues: UseStateResult2_7 (copy), UseRoactServiceResult (copy), UseDispatchResult (copy), ResendPhoneCodeModule (upval), UseRoactServiceResult1 (copy), MergePropsModuleResult (copy), EventStreamConstantsModule (upval), PhoneVerificationUpsellStateModule (upval), UseLocalizationResult (copy)
		UseStateResult2_7("")
		local UseDispatchResultResult = UseDispatchResult(ResendPhoneCodeModule(UseRoactServiceResult))
		
		if UseDispatchResultResult then
			UseDispatchResultResult:andThen(function() end):catch(function(Err)
				-- upvalues: UseRoactServiceResult1 (upval), MergePropsModuleResult (upval), EventStreamConstantsModule (upval), PhoneVerificationUpsellStateModule (upval), UseStateResult2_7 (upval), UseLocalizationResult (upval)
				if Err then
					UseRoactServiceResult1.reportModalShownWithSectionAndError(MergePropsModuleResult.eventContext, EventStreamConstantsModule.Field.ErrorMessage, MergePropsModuleResult.origin, PhoneVerificationUpsellStateModule.VerifyPhone, Err.ErrorCode)
					local ErrorCode = Err.ErrorCode
					UseStateResult2_7(if ErrorCode == 2 then UseLocalizationResult.invalidPhoneFormatKey elseif ErrorCode == 6 then UseLocalizationResult.tooManyAttemptsKey elseif ErrorCode == 7 then UseLocalizationResult.invalidVerificationCodeKey elseif ErrorCode == 8 then UseLocalizationResult.invalidPhoneNumberKey elseif ErrorCode == 9 then UseLocalizationResult.tooManyAccountsKey else UseLocalizationResult.genericErrorKey)
					
					return
				else
					UseRoactServiceResult1.reportModalShownWithSectionAndError(MergePropsModuleResult.eventContext, EventStreamConstantsModule.Field.ErrorMessage, MergePropsModuleResult.origin, PhoneVerificationUpsellStateModule.VerifyPhone, "")
					UseStateResult2_7(UseLocalizationResult.genericErrorKey)
				end
			end)
		end
		UseRoactServiceResult1.reportInteractWithActionAndSection(MergePropsModuleResult.eventContext, "", "", MergePropsModuleResult.origin, EventStreamConstantsModule.Button.ResendCode, PhoneVerificationUpsellStateModule.VerifyPhone)
	end
	
	local function returnToAddPhone()
		-- upvalues: UseStateResult2 (copy), PhoneVerificationUpsellStateModule (upval), UseRoactServiceResult1 (copy), MergePropsModuleResult (copy), EventStreamConstantsModule (upval)
		UseStateResult2(PhoneVerificationUpsellStateModule.AddPhone)
		UseRoactServiceResult1.reportInteractWithActionAndSection(MergePropsModuleResult.eventContext, "", "", MergePropsModuleResult.origin, EventStreamConstantsModule.Button.ChangePhoneNumber, PhoneVerificationUpsellStateModule.VerifyPhone)
	end
	
	local function proceedToAddPhone()
		-- upvalues: UseStateResult2 (copy), PhoneVerificationUpsellStateModule (upval), UseRoactServiceResult1 (copy), MergePropsModuleResult (copy), EventStreamConstantsModule (upval)
		UseStateResult2(PhoneVerificationUpsellStateModule.AddPhone)
		UseRoactServiceResult1.reportInteractWithActionAndSection(MergePropsModuleResult.eventContext, "", "", MergePropsModuleResult.origin, EventStreamConstantsModule.Button.Continue, PhoneVerificationUpsellStateModule.Entry)
	end
	
	local function navigateToSMSTerms()
		-- upvalues: UseStateResult11 (copy), UseRoactServiceResult1 (copy), MergePropsModuleResult (copy), EventStreamConstantsModule (upval), UseStateResult (copy), ConstantsModule (upval)
		if not UseStateResult11 then
			UseRoactServiceResult1.reportModalActionWithSection(MergePropsModuleResult.eventContext, EventStreamConstantsModule.Field.TermsOfService, "", MergePropsModuleResult.origin, UseStateResult)
			MergePropsModuleResult.showWebpage(ConstantsModule.TERMS_OF_SERVICE_URL)
		end
	end
	
	local function navigateToPrivacy()
		-- upvalues: UseStateResult11 (copy), UseRoactServiceResult1 (copy), MergePropsModuleResult (copy), EventStreamConstantsModule (upval), UseStateResult (copy), ConstantsModule (upval)
		if not UseStateResult11 then
			UseRoactServiceResult1.reportModalActionWithSection(MergePropsModuleResult.eventContext, EventStreamConstantsModule.Field.PrivacyPolicy, "", MergePropsModuleResult.origin, UseStateResult)
			MergePropsModuleResult.showWebpage(ConstantsModule.PRIVACY_POLICY_URL)
		end
	end
	
	local function OnPhoneNumberTextChange(p2)
		-- upvalues: UseStateResult11 (copy), UseStateResult2_6 (copy), UseStateResult2_1 (copy)
		if not UseStateResult11 then
			UseStateResult2_6("")
			UseStateResult2_1(p2.Text)
		end
	end
	
	local function OnCountryCodeSelectorClick()
		-- upvalues: UseRoactServiceResult1 (copy), MergePropsModuleResult (copy), EventStreamConstantsModule (upval), PhoneVerificationUpsellStateModule (upval)
		UseRoactServiceResult1.reportInteractWithActionAndSection(MergePropsModuleResult.eventContext, EventStreamConstantsModule.Field.CountryPrefix, EventStreamConstantsModule.ActionType.Focus, MergePropsModuleResult.origin, "", PhoneVerificationUpsellStateModule.AddPhone)
	end
	
	local function OnPhoneInputFocus()
		-- upvalues: UseRoactServiceResult1 (copy), MergePropsModuleResult (copy), EventStreamConstantsModule (upval), PhoneVerificationUpsellStateModule (upval), IdentityProtocol (upval), UseStateResult (copy), GetPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (upval), UseStateResult3 (copy), config (upval), UseStateResult2_1 (copy)
		UseRoactServiceResult1.reportInteractWithActionAndSection(MergePropsModuleResult.eventContext, EventStreamConstantsModule.Field.PhoneNumber, EventStreamConstantsModule.ActionType.Focus, MergePropsModuleResult.origin, "", PhoneVerificationUpsellStateModule.AddPhone)
		
		if not MergePropsModuleResult.shouldAutofillAndroidPhoneNumberAtLaunch then
			local Default = IdentityProtocol.default
			Default:supportsGetPhoneNumber():andThen(function(Result)
				-- upvalues: UseRoactServiceResult1 (upval), MergePropsModuleResult (upval), UseStateResult (upval), Default (copy), GetPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (upval), UseStateResult3 (upval), config (upval), UseStateResult2_1 (upval)
				print("PhoneVerification: Autofill phone number supported: {}!", Result)
				
				if not Result then return end
				UseRoactServiceResult1.reportModalActionWithSection(MergePropsModuleResult.eventContext, "phoneAutofillEligible", "autofill", MergePropsModuleResult.origin, UseStateResult)
				local PhoneNumber = Default:getPhoneNumber()
				
				if PhoneNumber then
					PhoneNumber:andThen(function(Result)
						-- upvalues: GetPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (upval), UseStateResult3 (upval), config (upval), UseRoactServiceResult1 (upval), MergePropsModuleResult (upval), UseStateResult (upval), UseStateResult2_1 (upval)
						if not Result or Result == "" then
							UseRoactServiceResult1.reportModalActionWithSection(MergePropsModuleResult.eventContext, "phoneAutofillNull", "autofill", MergePropsModuleResult.origin, UseStateResult)
							
							return
						end
						local Prefix, v1 = GetPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule(Result, UseStateResult3.prefix)
						
						if Prefix == config.prefix then
							UseRoactServiceResult1.reportModalActionWithSection(MergePropsModuleResult.eventContext, "phoneAutofillUSFound", "autofill", MergePropsModuleResult.origin, UseStateResult)
						end
						UseStateResult2_1(v1)
						UseRoactServiceResult1.reportModalActionWithSection(MergePropsModuleResult.eventContext, "phoneAutofillSuccess", "autofill", MergePropsModuleResult.origin, UseStateResult)
					end)
					
					return
				end
			end)
		end
	end
	
	local DebounceModuleResult = DebounceModule(function(p2)
		-- upvalues: UseStateResult2_5 (copy)
		UseStateResult2_5(p2)
	end, 0.5)
	
	local function OnCodeTextChange(p2)
		-- upvalues: FFlagPhoneUpsellEnforceCodeInputLimit (upval), UseStateResult5 (copy), UseStateResult2_7 (copy), UseStateResult2_4 (copy), DebounceModuleResult (copy)
		local Segment = string.sub(p2.Text, 1, 6)
		
		if FFlagPhoneUpsellEnforceCodeInputLimit then
			if Segment ~= UseStateResult5 then
				UseStateResult2_7("")
			end
		elseif string.len(p2.Text) <= 6 then
			UseStateResult2_7("")
		end
		UseStateResult2_4(Segment)
		DebounceModuleResult(Segment)
	end
	
	local function OnCodeInputFocus()
		-- upvalues: UseRoactServiceResult1 (copy), MergePropsModuleResult (copy), EventStreamConstantsModule (upval), PhoneVerificationUpsellStateModule (upval)
		UseRoactServiceResult1.reportInteractWithActionAndSection(MergePropsModuleResult.eventContext, EventStreamConstantsModule.Field.VerificationCode, EventStreamConstantsModule.ActionType.Focus, MergePropsModuleResult.origin, "", PhoneVerificationUpsellStateModule.VerifyPhone)
	end
	
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult6 (copy), handleVerifyPhone (copy)
		if string.len(UseStateResult6) == 6 then
			handleVerifyPhone()
		end
	end, { UseStateResult6 })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult10 (copy), UseDispatchResult (copy), SetIsPhoneVerifiedFunction (upval), UseRoactServiceResult1 (copy), MergePropsModuleResult (copy), PhoneVerificationUpsellStateModule (upval)
		if UseStateResult10 then
			local _ = UseDispatchResult(SetIsPhoneVerifiedFunction({ isPhoneVerified = true }))
			UseRoactServiceResult1.reportModalShownWithSection(MergePropsModuleResult.eventContext, MergePropsModuleResult.origin, PhoneVerificationUpsellStateModule.Success)
			MergePropsModuleResult.onSuccess()
		end
	end, { UseStateResult10 })
	
	return {
		phoneUpsellState = UseStateResult,
		screenSize = if GetFFlagPhoneUseParentSizeForScreenSizeModule() then UseStateResult14 else UseSelectorResult1,
		setParentSize = UseStateResult2_12,
		handleCloseClick = handleCloseClick,
		proceedToAddPhone = proceedToAddPhone,
		countryCode = UseStateResult3,
		setCountryCode = UseStateResult2_2,
		phoneNumber = UseStateResult1,
		addPhoneErrorMessage = UseStateResult7,
		isDisabled = UseStateResult11,
		onPhoneNumberTextChange = OnPhoneNumberTextChange,
		handleSetPhone = handleSetPhone,
		navigateToSMSTerms = navigateToSMSTerms,
		navigateToPrivacy = navigateToPrivacy,
		onPhoneInputFocus = OnPhoneInputFocus,
		onCountryCodeSelectorClick = OnCountryCodeSelectorClick,
		isKeyboardShowing = UseStateResult12,
		onScreenKeyboardHeight = UseStateResult13,
		code = UseStateResult5,
		verifyPhoneErrorMessage = UseStateResult8,
		onCodeTextChange = OnCodeTextChange,
		handleResendCode = handleResendCode,
		returnToAddPhone = returnToAddPhone,
		onCodeInputFocus = OnCodeInputFocus,
		isLoading = UseStateResult9,
		verifyingKey = UseLocalizationResult.verifyingKey,
		isOTPInputTypeEnabled = UseUserExperimentResult3,
		isPhoneNumberTextTypeEnabled = UseUserExperimentResult4
	}
end