local PhoneUpsell = script:FindFirstAncestor("PhoneUpsell")
local Parent = PhoneUpsell.Parent
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(Parent.React)
local RoactModule = require(Parent.Roact)
local CryoModule = require(Parent.Cryo)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseSignalState = require(Parent.SignalsReact).useSignalState
local FFlagUseSignalsForCountryCodeList = require(Parent.SharedFlags).FFlagUseSignalsForCountryCodeList
local GetCountryCodeListStore = require(Parent.AuthCommon).Stores.GetCountryCodeListStore
local _ = require(Parent.LuauPolyfill)
local EventStreamConstantsModule = require(PhoneUpsell.DuplicateAnalytics.EventStreamConstants)
local DebounceModule = require(PhoneUpsell.Utils.debounce)
local MergePropsModule = require(PhoneUpsell.Utils.mergeProps)
local PhoneVerificationUpsellStateModule = require(PhoneUpsell.Components.PhoneVerificationUpsellState)
local EntryViewModule = require(PhoneUpsell.Components.EntryView)
local AddPhoneViewModule = require(PhoneUpsell.Components.AddPhoneView)
local VerifyPhoneViewModule = require(PhoneUpsell.Components.VerifyPhoneView)
local PhoneVerificationStatusOverlayModule = require(PhoneUpsell.Components.PhoneVerificationStatusOverlay)
local FoundationModule = require(Parent.Foundation)
local IconSize = FoundationModule.Enums.IconSize
local Loading = FoundationModule.Loading
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local SetPhoneNumberModule = require(PhoneUpsell.Thunks.SetPhoneNumber)
local VerifyPhoneCodeModule = require(PhoneUpsell.Thunks.VerifyPhoneCode)
local ResendPhoneCodeModule = require(PhoneUpsell.Thunks.ResendPhoneCode)
local SetIsPhoneVerifiedFunction = require(Parent.ContactImporter).Actions.SetIsPhoneVerified
local GetPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule = require(PhoneUpsell.Utils.GetPrefixAndNationalNumberFromRawPhoneAndDefaultPrefix)
local GetFStringAndroidPhoneVerificationLayerFunction = require(Parent.SharedFlags).GetFStringAndroidPhoneVerificationLayer
local GetFStringIOSPhoneVerificationLayerFunction = require(Parent.SharedFlags).GetFStringIOSPhoneVerificationLayer
local GetFFlagLuaUsePhoneNumberTextTypeForPhoneUpsellModule = require(PhoneUpsell.Flags.GetFFlagLuaUsePhoneNumberTextTypeForPhoneUpsell)
local GetFFlagPhoneUseParentSizeForScreenSizeModule = require(PhoneUpsell.Flags.GetFFlagPhoneUseParentSizeForScreenSize)
local IdentityProtocol = require(Parent.IdentityProtocol).IdentityProtocol
local config = {
	name = "United States",
	code = "US",
	prefix = "1",
	localizedName = "United States"
}

local function CloseUpsell() --[[ Line: 146 ]] end

local config1 = {
	origin = "",
	eventContext = "",
	addPhoneTitleKey = "Feature.VerificationUpsell.Action.AddPhone",
	addPhoneDescriptionKey = "Feature.VerificationUpsell.Description.VerificationCodeSmsFeesMayApply",
	extraButtonTextKey = "",
	shouldAutofillAndroidPhoneNumberAtLaunch = false,
	isOTPInputTypeEnabled = false,
	isPhoneNumberTextTypeEnabled = false,
	alwaysShowAddPhoneLegalText = false,
	requireAddPhoneLegalTextCheckbox = false,
	onSuccess = CloseUpsell,
	onFailure = CloseUpsell,
	onCancelled = CloseUpsell,
	onExtraButtonClick = CloseUpsell,
	closeUpsell = CloseUpsell,
	showWebpage = function(_) --[[ Line: 164 ]] end
}
local MemoResult = if FFlagUseSignalsForCountryCodeList then ReactModule.memo(function(p1) --[[ Line: 739 ]]
	-- upvalues: UseSignalState (copy), GetCountryCodeListStore (copy), ReactModule (copy), MemoResult (copy), CryoModule (copy)
	return ReactModule.createElement(MemoResult, CryoModule.Dictionary.union(p1, {
		countryCodeList = UseSignalState(GetCountryCodeListStore(false).getCountryCodeList)
	}))
end) else require(Parent.RoactRodux).connect(if FFlagUseSignalsForCountryCodeList then nil else function(p1, _) --[[ Line: 712 ]]
	return { countryCodeList = p1.CountryCodeList }
end, function(Callback) --[[ Line: 717 ]]
	-- upvalues: SetPhoneNumberModule (copy), VerifyPhoneCodeModule (copy), ResendPhoneCodeModule (copy), SetIsPhoneVerifiedFunction (copy)
	return {
		setPhoneNumber = function(Networking, Code, Prefix, PhoneNumber) --[[ Line: 719 ]]
			-- upvalues: Callback (copy), SetPhoneNumberModule (upval)
			return Callback(SetPhoneNumberModule(Networking, Code, Prefix, PhoneNumber, nil))
		end,
		verifyPhoneCode = function(Networking, p1) --[[ Line: 722 ]]
			-- upvalues: Callback (copy), VerifyPhoneCodeModule (upval)
			return Callback(VerifyPhoneCodeModule(Networking, p1))
		end,
		resendPhoneCode = function(Networking) --[[ Line: 725 ]]
			-- upvalues: Callback (copy), ResendPhoneCodeModule (upval)
			return Callback(ResendPhoneCodeModule(Networking))
		end,
		setIsPhoneVerified = function(p1) --[[ Line: 728 ]]
			-- upvalues: Callback (copy), SetIsPhoneVerifiedFunction (upval)
			return Callback(SetIsPhoneVerifiedFunction(p1))
		end
	}
end)(function(p1) --[[ Line: 167 | Named "PhoneVerificationUpsellOverlay" ]]
	-- upvalues: MergePropsModule (copy), config1 (copy), ReactModule (copy), PhoneVerificationUpsellStateModule (copy), config (copy), UseLocalizationFunction (copy), IdentityProtocol (copy), GetPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (copy), UserInputService (copy), UseSelectorFunction (copy), EventStreamConstantsModule (copy), DebounceModule (copy), Loading (copy), IconSize (copy), GetFFlagPhoneUseParentSizeForScreenSizeModule (copy), RoactModule (copy), EntryViewModule (copy), AddPhoneViewModule (copy), GetFFlagLuaUsePhoneNumberTextTypeForPhoneUpsellModule (copy), VerifyPhoneViewModule (copy), PhoneVerificationStatusOverlayModule (copy)
	local MergePropsModuleResult = MergePropsModule(config1, p1)
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
	ReactModule.useEffect(function() --[[ Line: 200 ]]
		-- upvalues: UseStateResult4 (copy), MergePropsModuleResult (copy), UseStateResult2_2 (copy), UseStateResult2_3 (copy)
		if not UseStateResult4 and MergePropsModuleResult.countryCodeList and #MergePropsModuleResult.countryCodeList > 0 then
			for _, value in MergePropsModuleResult.countryCodeList do
				if value.isDefault then
					UseStateResult2_2(value)
				end
			end
			UseStateResult2_3(true)
		end
	end, { MergePropsModuleResult.countryCodeList, UseStateResult4 })
	
	local function _() --[[ Line: 212 ]]
		-- upvalues: IdentityProtocol (upval), MergePropsModuleResult (copy), UseStateResult (copy), GetPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (upval), UseStateResult3 (copy), config (upval), UseStateResult2_1 (copy)
		local Default = IdentityProtocol.default
		Default:supportsGetPhoneNumber():andThen(function(Result) --[[ Line: 214 ]]
			-- upvalues: MergePropsModuleResult (upval), UseStateResult (upval), Default (copy), GetPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (upval), UseStateResult3 (upval), config (upval), UseStateResult2_1 (upval)
			print("PhoneVerification: Autofill phone number supported: {}!", Result)
			
			if not Result then return end
			MergePropsModuleResult.authEventAnalytics.reportModalActionWithSection(MergePropsModuleResult.eventContext, "phoneAutofillEligible", "autofill", MergePropsModuleResult.origin, UseStateResult)
			local PhoneNumber = Default:getPhoneNumber()
			
			if PhoneNumber then
				PhoneNumber:andThen(function(Result) --[[ Line: 230 ]]
					-- upvalues: GetPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (upval), UseStateResult3 (upval), config (upval), MergePropsModuleResult (upval), UseStateResult (upval), UseStateResult2_1 (upval)
					if not Result or Result == "" then
						MergePropsModuleResult.authEventAnalytics.reportModalActionWithSection(MergePropsModuleResult.eventContext, "phoneAutofillNull", "autofill", MergePropsModuleResult.origin, UseStateResult)
						
						return
					end
					local Prefix, v1 = GetPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule(Result, UseStateResult3.prefix)
					
					if Prefix == config.prefix then
						MergePropsModuleResult.authEventAnalytics.reportModalActionWithSection(MergePropsModuleResult.eventContext, "phoneAutofillUSFound", "autofill", MergePropsModuleResult.origin, UseStateResult)
					end
					UseStateResult2_1(v1)
					MergePropsModuleResult.authEventAnalytics.reportModalActionWithSection(MergePropsModuleResult.eventContext, "phoneAutofillSuccess", "autofill", MergePropsModuleResult.origin, UseStateResult)
				end)
				
				return
			end
		end)
	end
	
	local _ = function() --[[ Line: 266 ]]
		-- upvalues: IdentityProtocol (upval), MergePropsModuleResult (copy), UseStateResult (copy), UseStateResult2_4 (copy), UseStateResult2_5 (copy)
		local Default = IdentityProtocol.default
		Default:supportsGetSMSOTP():andThen(function(Result) --[[ Line: 268 ]]
			-- upvalues: MergePropsModuleResult (upval), UseStateResult (upval), Default (copy), UseStateResult2_4 (upval), UseStateResult2_5 (upval)
			print("PhoneVerification: Autofill OTP supported: {}!", Result)
			
			if Result then
				MergePropsModuleResult.authEventAnalytics.reportModalActionWithSection(MergePropsModuleResult.eventContext, "codeAutofillEligible", "autofill", MergePropsModuleResult.origin, UseStateResult)
				local SMSOTP = Default:getSMSOTP()
				
				if SMSOTP then
					SMSOTP:andThen(function(Result) --[[ Line: 280 ]]
						-- upvalues: UseStateResult2_4 (upval), UseStateResult2_5 (upval), MergePropsModuleResult (upval), UseStateResult (upval)
						if Result and Result ~= "" then
							UseStateResult2_4(Result)
							UseStateResult2_5(Result)
							MergePropsModuleResult.authEventAnalytics.reportModalActionWithSection(MergePropsModuleResult.eventContext, "codeAutofillSuccess", "autofill", MergePropsModuleResult.origin, UseStateResult)
						end
					end)
				end
			end
		end)
	end
	
	ReactModule.useEffect(function() --[[ Line: 298 ]]
		-- upvalues: UseRefResult (copy), UseStateResult10 (copy)
		return function() --[[ Line: 299 ]]
			-- upvalues: UseRefResult (upval), UseStateResult10 (upval)
			UseRefResult.current = UseStateResult10
		end
	end, { UseStateResult10 })
	ReactModule.useEffect(function() --[[ Line: 304 ]]
		-- upvalues: Connection (ref), UserInputService (upval), UseStateResult2_10 (copy), UseStateResult2_11 (copy), MergePropsModuleResult (copy), PhoneVerificationUpsellStateModule (upval), IdentityProtocol (upval), UseStateResult (copy), GetPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (upval), UseStateResult3 (copy), config (upval), UseStateResult2_1 (copy), UseRefResult (copy)
		Connection = UserInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function() --[[ Line: 306 ]]
			-- upvalues: UseStateResult2_10 (upval), UserInputService (upval), UseStateResult2_11 (upval)
			UseStateResult2_10(UserInputService.OnScreenKeyboardVisible)
			UseStateResult2_11(UserInputService.OnScreenKeyboardVisible and UserInputService.OnScreenKeyboardSize.Y or 0)
		end)
		MergePropsModuleResult.authEventAnalytics.reportModalShownWithSection(MergePropsModuleResult.eventContext, MergePropsModuleResult.origin, PhoneVerificationUpsellStateModule.AddPhone)
		
		if MergePropsModuleResult.isAutofillPhoneNumberEnabled then
			local Default = IdentityProtocol.default
			Default:supportsGetPhoneNumber():andThen(function(Result) --[[ Line: 214 ]]
				-- upvalues: MergePropsModuleResult (upval), UseStateResult (upval), Default (copy), GetPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (upval), UseStateResult3 (upval), config (upval), UseStateResult2_1 (upval)
				print("PhoneVerification: Autofill phone number supported: {}!", Result)
				
				if not Result then return end
				MergePropsModuleResult.authEventAnalytics.reportModalActionWithSection(MergePropsModuleResult.eventContext, "phoneAutofillEligible", "autofill", MergePropsModuleResult.origin, UseStateResult)
				local PhoneNumber = Default:getPhoneNumber()
				
				if PhoneNumber then
					PhoneNumber:andThen(function(Result) --[[ Line: 230 ]]
						-- upvalues: GetPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (upval), UseStateResult3 (upval), config (upval), MergePropsModuleResult (upval), UseStateResult (upval), UseStateResult2_1 (upval)
						if not Result or Result == "" then
							MergePropsModuleResult.authEventAnalytics.reportModalActionWithSection(MergePropsModuleResult.eventContext, "phoneAutofillNull", "autofill", MergePropsModuleResult.origin, UseStateResult)
							
							return
						end
						local Prefix, v1 = GetPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule(Result, UseStateResult3.prefix)
						
						if Prefix == config.prefix then
							MergePropsModuleResult.authEventAnalytics.reportModalActionWithSection(MergePropsModuleResult.eventContext, "phoneAutofillUSFound", "autofill", MergePropsModuleResult.origin, UseStateResult)
						end
						UseStateResult2_1(v1)
						MergePropsModuleResult.authEventAnalytics.reportModalActionWithSection(MergePropsModuleResult.eventContext, "phoneAutofillSuccess", "autofill", MergePropsModuleResult.origin, UseStateResult)
					end)
					
					return
				end
			end)
		end
		return function() --[[ Line: 321 ]]
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
	local UseSelectorResult = UseSelectorFunction(function(p2) --[[ Line: 332 ]]
		return p2.ScreenSize
	end)
	
	local function handleCloseClick() --[[ Line: 336 ]]
		-- upvalues: MergePropsModuleResult (copy), UseStateResult (copy)
		MergePropsModuleResult.authEventAnalytics.reportModalDismissedWithSection(MergePropsModuleResult.eventContext, MergePropsModuleResult.origin, UseStateResult)
		MergePropsModuleResult.closeUpsell()
	end
	
	local _ = function(p2) --[[ Line: 345 | Named "handlePhoneErrors" ]]
		-- upvalues: UseLocalizationResult (copy)
		return if p2 == 2 then UseLocalizationResult.invalidPhoneFormatKey elseif p2 == 6 then UseLocalizationResult.tooManyAttemptsKey elseif p2 == 7 then UseLocalizationResult.invalidVerificationCodeKey elseif p2 == 8 then UseLocalizationResult.invalidPhoneNumberKey elseif p2 == 9 then UseLocalizationResult.tooManyAccountsKey else UseLocalizationResult.genericErrorKey
	end
	
	local function handleSetPhone() --[[ Line: 361 ]]
		-- upvalues: UseStateResult2_9 (copy), MergePropsModuleResult (copy), UseStateResult3 (copy), UseStateResult1 (copy), UseStateResult2 (copy), PhoneVerificationUpsellStateModule (upval), IdentityProtocol (upval), UseStateResult (copy), UseStateResult2_4 (copy), UseStateResult2_5 (copy), EventStreamConstantsModule (upval), UseStateResult2_6 (copy), UseLocalizationResult (copy)
		UseStateResult2_9(true)
		local SetPhoneNumberResult = MergePropsModuleResult.setPhoneNumber(MergePropsModuleResult.networking, UseStateResult3.code, UseStateResult3.prefix, UseStateResult1)
		
		if SetPhoneNumberResult then
			SetPhoneNumberResult:andThen(function() --[[ Line: 366 ]]
				-- upvalues: UseStateResult2 (upval), PhoneVerificationUpsellStateModule (upval), UseStateResult2_9 (upval), MergePropsModuleResult (upval), IdentityProtocol (upval), UseStateResult (upval), UseStateResult2_4 (upval), UseStateResult2_5 (upval)
				UseStateResult2(PhoneVerificationUpsellStateModule.VerifyPhone)
				UseStateResult2_9(false)
				MergePropsModuleResult.authEventAnalytics.reportModalShownWithSection(MergePropsModuleResult.eventContext, MergePropsModuleResult.origin, PhoneVerificationUpsellStateModule.VerifyPhone)
				
				if MergePropsModuleResult.isAutofillSMSOtpEnabled then
					local Default = IdentityProtocol.default
					Default:supportsGetSMSOTP():andThen(function(Result) --[[ Line: 268 ]]
						-- upvalues: MergePropsModuleResult (upval), UseStateResult (upval), Default (copy), UseStateResult2_4 (upval), UseStateResult2_5 (upval)
						print("PhoneVerification: Autofill OTP supported: {}!", Result)
						
						if Result then
							MergePropsModuleResult.authEventAnalytics.reportModalActionWithSection(MergePropsModuleResult.eventContext, "codeAutofillEligible", "autofill", MergePropsModuleResult.origin, UseStateResult)
							local SMSOTP = Default:getSMSOTP()
							
							if SMSOTP then
								SMSOTP:andThen(function(Result) --[[ Line: 280 ]]
									-- upvalues: UseStateResult2_4 (upval), UseStateResult2_5 (upval), MergePropsModuleResult (upval), UseStateResult (upval)
									if Result and Result ~= "" then
										UseStateResult2_4(Result)
										UseStateResult2_5(Result)
										MergePropsModuleResult.authEventAnalytics.reportModalActionWithSection(MergePropsModuleResult.eventContext, "codeAutofillSuccess", "autofill", MergePropsModuleResult.origin, UseStateResult)
									end
								end)
							end
						end
					end)
				end
			end):catch(function(Err) --[[ Line: 380 ]]
				-- upvalues: MergePropsModuleResult (upval), EventStreamConstantsModule (upval), PhoneVerificationUpsellStateModule (upval), UseStateResult2_6 (upval), UseLocalizationResult (upval), UseStateResult2_9 (upval)
				if Err then
					if Err.PhoneRegexFailed then
						MergePropsModuleResult.authEventAnalytics.reportModalShownWithSectionAndError(MergePropsModuleResult.eventContext, EventStreamConstantsModule.Field.ErrorMessage, MergePropsModuleResult.origin, PhoneVerificationUpsellStateModule.AddPhone, "")
						UseStateResult2_6(UseLocalizationResult.invalidPhoneFormatKey)
					else
						MergePropsModuleResult.authEventAnalytics.reportModalShownWithSectionAndError(MergePropsModuleResult.eventContext, EventStreamConstantsModule.Field.ErrorMessage, MergePropsModuleResult.origin, PhoneVerificationUpsellStateModule.AddPhone, Err.ErrorCode)
						local ErrorCode = Err.ErrorCode
						UseStateResult2_6(if ErrorCode == 2 then UseLocalizationResult.invalidPhoneFormatKey elseif ErrorCode == 6 then UseLocalizationResult.tooManyAttemptsKey elseif ErrorCode == 7 then UseLocalizationResult.invalidVerificationCodeKey elseif ErrorCode == 8 then UseLocalizationResult.invalidPhoneNumberKey elseif ErrorCode == 9 then UseLocalizationResult.tooManyAccountsKey else UseLocalizationResult.genericErrorKey)
					end
				else
					MergePropsModuleResult.authEventAnalytics.reportModalShownWithSectionAndError(MergePropsModuleResult.eventContext, EventStreamConstantsModule.Field.ErrorMessage, MergePropsModuleResult.origin, PhoneVerificationUpsellStateModule.AddPhone, "")
					UseStateResult2_6(UseLocalizationResult.genericErrorKey)
				end
				UseStateResult2_9(false)
			end)
		end
		MergePropsModuleResult.authEventAnalytics.reportInteractWithActionAndSection(MergePropsModuleResult.eventContext, "", "", MergePropsModuleResult.origin, EventStreamConstantsModule.Button.Continue, PhoneVerificationUpsellStateModule.AddPhone)
	end
	
	local function handleVerifyPhone() --[[ Line: 422 ]]
		-- upvalues: UseStateResult2_9 (copy), MergePropsModuleResult (copy), UseStateResult6 (copy), UseStateResult2_8 (copy), EventStreamConstantsModule (upval), PhoneVerificationUpsellStateModule (upval), UseStateResult2_7 (copy), UseLocalizationResult (copy)
		UseStateResult2_9(true)
		local VerifyPhoneCodeResult = MergePropsModuleResult.verifyPhoneCode(MergePropsModuleResult.networking, UseStateResult6)
		
		if VerifyPhoneCodeResult then
			VerifyPhoneCodeResult:andThen(function() --[[ Line: 427 ]]
				-- upvalues: UseStateResult2_8 (upval)
				UseStateResult2_8(true)
			end):catch(function(Err) --[[ Line: 430 ]]
				-- upvalues: MergePropsModuleResult (upval), EventStreamConstantsModule (upval), PhoneVerificationUpsellStateModule (upval), UseStateResult2_7 (upval), UseLocalizationResult (upval), UseStateResult2_9 (upval)
				if Err then
					MergePropsModuleResult.authEventAnalytics.reportModalShownWithSectionAndError(MergePropsModuleResult.eventContext, EventStreamConstantsModule.Field.ErrorMessage, MergePropsModuleResult.origin, PhoneVerificationUpsellStateModule.VerifyPhone, Err.ErrorCode)
					local ErrorCode = Err.ErrorCode
					UseStateResult2_7(if ErrorCode == 2 then UseLocalizationResult.invalidPhoneFormatKey elseif ErrorCode == 6 then UseLocalizationResult.tooManyAttemptsKey elseif ErrorCode == 7 then UseLocalizationResult.invalidVerificationCodeKey elseif ErrorCode == 8 then UseLocalizationResult.invalidPhoneNumberKey elseif ErrorCode == 9 then UseLocalizationResult.tooManyAccountsKey else UseLocalizationResult.genericErrorKey)
				else
					MergePropsModuleResult.authEventAnalytics.reportModalShownWithSectionAndError(MergePropsModuleResult.eventContext, EventStreamConstantsModule.Field.ErrorMessage, MergePropsModuleResult.origin, PhoneVerificationUpsellStateModule.VerifyPhone, "")
					UseStateResult2_7(UseLocalizationResult.genericErrorKey)
				end
				UseStateResult2_9(false)
			end)
		end
		MergePropsModuleResult.authEventAnalytics.reportInteractWithActionAndSection(MergePropsModuleResult.eventContext, "", "", MergePropsModuleResult.origin, EventStreamConstantsModule.Button.AutoSubmit, PhoneVerificationUpsellStateModule.VerifyPhone)
	end
	
	local function handleResendCode() --[[ Line: 463 ]]
		-- upvalues: MergePropsModuleResult (copy), EventStreamConstantsModule (upval), PhoneVerificationUpsellStateModule (upval), UseStateResult2_7 (copy), UseLocalizationResult (copy)
		local ResendPhoneCodeResult = MergePropsModuleResult.resendPhoneCode(MergePropsModuleResult.networking)
		
		if ResendPhoneCodeResult then
			ResendPhoneCodeResult:andThen(function() --[[ Line: 466 ]] end):catch(function(Err) --[[ Line: 466 ]]
				-- upvalues: MergePropsModuleResult (upval), EventStreamConstantsModule (upval), PhoneVerificationUpsellStateModule (upval), UseStateResult2_7 (upval), UseLocalizationResult (upval)
				if Err then
					MergePropsModuleResult.authEventAnalytics.reportModalShownWithSectionAndError(MergePropsModuleResult.eventContext, EventStreamConstantsModule.Field.ErrorMessage, MergePropsModuleResult.origin, PhoneVerificationUpsellStateModule.VerifyPhone, Err.ErrorCode)
					local ErrorCode = Err.ErrorCode
					UseStateResult2_7(if ErrorCode == 2 then UseLocalizationResult.invalidPhoneFormatKey elseif ErrorCode == 6 then UseLocalizationResult.tooManyAttemptsKey elseif ErrorCode == 7 then UseLocalizationResult.invalidVerificationCodeKey elseif ErrorCode == 8 then UseLocalizationResult.invalidPhoneNumberKey elseif ErrorCode == 9 then UseLocalizationResult.tooManyAccountsKey else UseLocalizationResult.genericErrorKey)
					
					return
				else
					MergePropsModuleResult.authEventAnalytics.reportModalShownWithSectionAndError(MergePropsModuleResult.eventContext, EventStreamConstantsModule.Field.ErrorMessage, MergePropsModuleResult.origin, PhoneVerificationUpsellStateModule.VerifyPhone, "")
					UseStateResult2_7(UseLocalizationResult.genericErrorKey)
				end
			end)
		end
		MergePropsModuleResult.authEventAnalytics.reportInteractWithActionAndSection(MergePropsModuleResult.eventContext, "", "", MergePropsModuleResult.origin, EventStreamConstantsModule.Button.ResendCode, PhoneVerificationUpsellStateModule.VerifyPhone)
	end
	
	local function returnToAddPhone() --[[ Line: 498 ]]
		-- upvalues: UseStateResult2 (copy), PhoneVerificationUpsellStateModule (upval), MergePropsModuleResult (copy), EventStreamConstantsModule (upval)
		UseStateResult2(PhoneVerificationUpsellStateModule.AddPhone)
		MergePropsModuleResult.authEventAnalytics.reportInteractWithActionAndSection(MergePropsModuleResult.eventContext, "", "", MergePropsModuleResult.origin, EventStreamConstantsModule.Button.ChangePhoneNumber, PhoneVerificationUpsellStateModule.VerifyPhone)
	end
	
	local function proceedToAddPhone() --[[ Line: 510 ]]
		-- upvalues: UseStateResult2 (copy), PhoneVerificationUpsellStateModule (upval), MergePropsModuleResult (copy), EventStreamConstantsModule (upval)
		UseStateResult2(PhoneVerificationUpsellStateModule.AddPhone)
		MergePropsModuleResult.authEventAnalytics.reportInteractWithActionAndSection(MergePropsModuleResult.eventContext, "", "", MergePropsModuleResult.origin, EventStreamConstantsModule.Button.Continue, PhoneVerificationUpsellStateModule.Entry)
	end
	
	local function navigateToSMSTerms() --[[ Line: 522 ]]
		-- upvalues: UseStateResult11 (copy), MergePropsModuleResult (copy), EventStreamConstantsModule (upval), UseStateResult (copy)
		if not UseStateResult11 then
			MergePropsModuleResult.authEventAnalytics.reportModalActionWithSection(MergePropsModuleResult.eventContext, EventStreamConstantsModule.Field.TermsOfService, "", MergePropsModuleResult.origin, UseStateResult)
			MergePropsModuleResult.showWebpage("https://en.help.roblox.com/hc/articles/9483830673556-Roblox-SMS-Terms-of-Service")
		end
	end
	
	local function navigateToPrivacy() --[[ Line: 535 ]]
		-- upvalues: UseStateResult11 (copy), MergePropsModuleResult (copy), EventStreamConstantsModule (upval), UseStateResult (copy)
		if not UseStateResult11 then
			MergePropsModuleResult.authEventAnalytics.reportModalActionWithSection(MergePropsModuleResult.eventContext, EventStreamConstantsModule.Field.PrivacyPolicy, "", MergePropsModuleResult.origin, UseStateResult)
			MergePropsModuleResult.showWebpage("https://en.help.roblox.com/hc/articles/115004630823")
		end
	end
	
	local function OnPhoneNumberTextChange(p2) --[[ Line: 549 ]]
		-- upvalues: UseStateResult11 (copy), UseStateResult2_6 (copy), UseStateResult2_1 (copy)
		if not UseStateResult11 then
			UseStateResult2_6("")
			UseStateResult2_1(p2.Text)
		end
	end
	
	local function OnCountryCodeSelectorClick() --[[ Line: 556 ]]
		-- upvalues: MergePropsModuleResult (copy), EventStreamConstantsModule (upval), PhoneVerificationUpsellStateModule (upval)
		MergePropsModuleResult.authEventAnalytics.reportInteractWithActionAndSection(MergePropsModuleResult.eventContext, EventStreamConstantsModule.Field.CountryPrefix, EventStreamConstantsModule.ActionType.Focus, MergePropsModuleResult.origin, "", PhoneVerificationUpsellStateModule.AddPhone)
	end
	
	local function OnPhoneInputFocus() --[[ Line: 567 ]]
		-- upvalues: MergePropsModuleResult (copy), EventStreamConstantsModule (upval), PhoneVerificationUpsellStateModule (upval), IdentityProtocol (upval), UseStateResult (copy), GetPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (upval), UseStateResult3 (copy), config (upval), UseStateResult2_1 (copy)
		MergePropsModuleResult.authEventAnalytics.reportInteractWithActionAndSection(MergePropsModuleResult.eventContext, EventStreamConstantsModule.Field.PhoneNumber, EventStreamConstantsModule.ActionType.Focus, MergePropsModuleResult.origin, "", PhoneVerificationUpsellStateModule.AddPhone)
		
		if not MergePropsModuleResult.shouldAutofillAndroidPhoneNumberAtLaunch then
			local Default = IdentityProtocol.default
			Default:supportsGetPhoneNumber():andThen(function(Result) --[[ Line: 214 ]]
				-- upvalues: MergePropsModuleResult (upval), UseStateResult (upval), Default (copy), GetPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (upval), UseStateResult3 (upval), config (upval), UseStateResult2_1 (upval)
				print("PhoneVerification: Autofill phone number supported: {}!", Result)
				
				if not Result then return end
				MergePropsModuleResult.authEventAnalytics.reportModalActionWithSection(MergePropsModuleResult.eventContext, "phoneAutofillEligible", "autofill", MergePropsModuleResult.origin, UseStateResult)
				local PhoneNumber = Default:getPhoneNumber()
				
				if PhoneNumber then
					PhoneNumber:andThen(function(Result) --[[ Line: 230 ]]
						-- upvalues: GetPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (upval), UseStateResult3 (upval), config (upval), MergePropsModuleResult (upval), UseStateResult (upval), UseStateResult2_1 (upval)
						if not Result or Result == "" then
							MergePropsModuleResult.authEventAnalytics.reportModalActionWithSection(MergePropsModuleResult.eventContext, "phoneAutofillNull", "autofill", MergePropsModuleResult.origin, UseStateResult)
							
							return
						end
						local Prefix, v1 = GetPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule(Result, UseStateResult3.prefix)
						
						if Prefix == config.prefix then
							MergePropsModuleResult.authEventAnalytics.reportModalActionWithSection(MergePropsModuleResult.eventContext, "phoneAutofillUSFound", "autofill", MergePropsModuleResult.origin, UseStateResult)
						end
						UseStateResult2_1(v1)
						MergePropsModuleResult.authEventAnalytics.reportModalActionWithSection(MergePropsModuleResult.eventContext, "phoneAutofillSuccess", "autofill", MergePropsModuleResult.origin, UseStateResult)
					end)
					
					return
				end
			end)
		end
	end
	
	local DebounceModuleResult = DebounceModule(function(p2) --[[ Line: 581 ]]
		-- upvalues: UseStateResult2_5 (copy)
		UseStateResult2_5(p2)
	end, 0.5)
	
	local function OnCodeTextChange(p2) --[[ Line: 585 ]]
		-- upvalues: UseStateResult5 (copy), UseStateResult2_7 (copy), UseStateResult2_4 (copy), DebounceModuleResult (copy)
		local Segment = string.sub(p2.Text, 1, 6)
		
		if Segment ~= UseStateResult5 then
			UseStateResult2_7("")
		end
		UseStateResult2_4(Segment)
		DebounceModuleResult(Segment)
	end
	
	local function OnCodeInputFocus() --[[ Line: 594 ]]
		-- upvalues: MergePropsModuleResult (copy), EventStreamConstantsModule (upval), PhoneVerificationUpsellStateModule (upval)
		MergePropsModuleResult.authEventAnalytics.reportInteractWithActionAndSection(MergePropsModuleResult.eventContext, EventStreamConstantsModule.Field.VerificationCode, EventStreamConstantsModule.ActionType.Focus, MergePropsModuleResult.origin, "", PhoneVerificationUpsellStateModule.VerifyPhone)
	end
	
	ReactModule.useEffect(function() --[[ Line: 606 ]]
		-- upvalues: UseStateResult6 (copy), handleVerifyPhone (copy)
		if string.len(UseStateResult6) == 6 then
			handleVerifyPhone()
		end
	end, { UseStateResult6 })
	ReactModule.useEffect(function() --[[ Line: 613 ]]
		-- upvalues: UseStateResult10 (copy), MergePropsModuleResult (copy), PhoneVerificationUpsellStateModule (upval)
		if UseStateResult10 then
			MergePropsModuleResult.setIsPhoneVerified({ isPhoneVerified = true })
			MergePropsModuleResult.authEventAnalytics.reportModalShownWithSection(MergePropsModuleResult.eventContext, MergePropsModuleResult.origin, PhoneVerificationUpsellStateModule.Success)
			MergePropsModuleResult.onSuccess()
		end
	end, { UseStateResult10 })
	local Element = ReactModule.createElement(Loading, {
		size = IconSize.Large,
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5)
	})
	
	return ReactModule.createElement(if GetFFlagPhoneUseParentSizeForScreenSizeModule() then "Frame" else ReactModule.Fragment, if GetFFlagPhoneUseParentSizeForScreenSizeModule() then {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		[RoactModule.Change.AbsoluteSize] = function(Frame) --[[ Line: 637 ]]
			-- upvalues: UseStateResult2_12 (copy)
			UseStateResult2_12(Frame.AbsoluteSize)
		end
	} else nil, {
		Entry = UseStateResult == PhoneVerificationUpsellStateModule.Entry and (MergePropsModuleResult.entryConfig and ReactModule.createElement(EntryViewModule, {
			screenSize = if GetFFlagPhoneUseParentSizeForScreenSizeModule() then UseStateResult14 else UseSelectorResult,
			onClose = handleCloseClick,
			titleKey = MergePropsModuleResult.entryConfig.titleKey,
			descriptionKey = MergePropsModuleResult.entryConfig.descriptionKey,
			buttonKey = MergePropsModuleResult.entryConfig.buttonKey,
			onButtonClick = proceedToAddPhone,
			extraButtonKey = MergePropsModuleResult.entryConfig.extraButtonConfig.extraButtonKey,
			onExtraButtonClick = MergePropsModuleResult.entryConfig.extraButtonConfig.onExtraButtonClick
		})),
		AddPhone = UseStateResult == PhoneVerificationUpsellStateModule.AddPhone and ReactModule.createElement(AddPhoneViewModule, {
			screenSize = if GetFFlagPhoneUseParentSizeForScreenSizeModule() then UseStateResult14 else UseSelectorResult,
			countryCode = UseStateResult3,
			setCountryCode = UseStateResult2_2,
			phoneNumber = UseStateResult1,
			errorMessage = UseStateResult7,
			isDisabled = UseStateResult11,
			onPhoneNumberTextChange = OnPhoneNumberTextChange,
			onSetPhoneNumber = handleSetPhone,
			onClose = handleCloseClick,
			onTermsOfUseClick = navigateToSMSTerms,
			onPrivacyPolicyClick = navigateToPrivacy,
			onPhoneInputFocus = OnPhoneInputFocus,
			onCountryCodeSelectorClick = OnCountryCodeSelectorClick,
			isKeyboardShowing = UseStateResult12,
			keyboardHeight = UseStateResult13,
			usePhoneNumberTextType = GetFFlagLuaUsePhoneNumberTextTypeForPhoneUpsellModule() and MergePropsModuleResult.isPhoneNumberTextTypeEnabled,
			titleKey = MergePropsModuleResult.addPhoneTitleKey,
			descriptionKey = MergePropsModuleResult.addPhoneDescriptionKey,
			buttonKey = MergePropsModuleResult.addPhoneButtonKey,
			legalTextKey = MergePropsModuleResult.addPhoneLegalTextKey,
			extraButtonKey = MergePropsModuleResult.extraButtonTextKey,
			onExtraButtonClick = MergePropsModuleResult.onExtraButtonClick,
			alwaysShowLegalText = MergePropsModuleResult.alwaysShowAddPhoneLegalText,
			requireLegalTextCheckbox = MergePropsModuleResult.requireAddPhoneLegalTextCheckbox
		}),
		VerifyPhone = UseStateResult == PhoneVerificationUpsellStateModule.VerifyPhone and ReactModule.createElement(VerifyPhoneViewModule, {
			screenSize = if GetFFlagPhoneUseParentSizeForScreenSizeModule() then UseStateResult14 else UseSelectorResult,
			phoneNumber = UseStateResult1,
			prefix = UseStateResult3.prefix,
			code = UseStateResult5,
			errorMessage = UseStateResult8,
			onCodeTextChange = OnCodeTextChange,
			onResendPhoneCode = handleResendCode,
			onClose = handleCloseClick,
			returnToAddPhone = returnToAddPhone,
			onCodeInputFocus = OnCodeInputFocus,
			isKeyboardShowing = UseStateResult12,
			keyboardHeight = UseStateResult13,
			useOTPInputType = MergePropsModuleResult.isOTPInputTypeEnabled,
			extraButtonKey = MergePropsModuleResult.verifyPhoneExtraButtonKey,
			onExtraButtonClick = MergePropsModuleResult.onVerifyPhoneExtraButtonClick
		}),
		LoadingOverlay = UseStateResult9 and ReactModule.createElement(PhoneVerificationStatusOverlayModule, {
			image = Element,
			text = UseLocalizationResult.verifyingKey
		})
	})
end)

return (require(Parent.RoactAppExperiment).connectUserLayer({
	GetFStringAndroidPhoneVerificationLayerFunction(),
	GetFStringIOSPhoneVerificationLayerFunction()
}, function(p2, _) --[[ Line: 759 ]]
	-- upvalues: GetFStringAndroidPhoneVerificationLayerFunction (copy), GetFStringIOSPhoneVerificationLayerFunction (copy)
	local v1 = p2[GetFStringAndroidPhoneVerificationLayerFunction()] or {}
	local v2 = p2[GetFStringIOSPhoneVerificationLayerFunction()] or {}
	
	return {
		isAutofillPhoneNumberEnabled = v1.IsAutofillPhoneNumberEnabled,
		isAutofillSMSOtpEnabled = v1.IsAutofillSMSOtpEnabled,
		isOTPInputTypeEnabled = v2.IsAutofillSMSOtpEnabled,
		isPhoneNumberTextTypeEnabled = v2.IsAutofillPhoneNumberEnabled
	}
end)((require(Parent.RoactServices).RoactServices.connect({
	networking = require(Parent.RoactServiceTags).RoactNetworking,
	authEventAnalytics = require(PhoneUpsell.DuplicateAnalytics.RoactAnalyticsAuthEvents)
})(MemoResult))))