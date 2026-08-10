local phoneUpsell = script:FindFirstAncestor("PhoneUpsell")
local parent = phoneUpsell.Parent
local userInputService = game:GetService("UserInputService")
local reactModule = require(parent.React)
local roactModule = require(parent.Roact)
local roactRoduxModule = require(parent.RoactRodux)
local cryoModule = require(parent.Cryo)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useSignalState = require(parent.SignalsReact).useSignalState
local fFlagUseSignalsForCountryCodeList = require(parent.SharedFlags).FFlagUseSignalsForCountryCodeList
local getCountryCodeListStore = require(parent.AuthCommon).Stores.GetCountryCodeListStore
local _ = require(parent.LuauPolyfill)
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local roactServices = require(parent.RoactServices).RoactServices
local eventStreamConstantsModule = require(phoneUpsell.DuplicateAnalytics.EventStreamConstants)
local roactAnalyticsAuthEventsModule = require(phoneUpsell.DuplicateAnalytics.RoactAnalyticsAuthEvents)
local debounceModule = require(phoneUpsell.Utils.debounce)
local mergePropsModule = require(phoneUpsell.Utils.mergeProps)
local phoneVerificationUpsellStateModule = require(phoneUpsell.Components.PhoneVerificationUpsellState)
local entryViewModule = require(phoneUpsell.Components.EntryView)
local addPhoneViewModule = require(phoneUpsell.Components.AddPhoneView)
local verifyPhoneViewModule = require(phoneUpsell.Components.VerifyPhoneView)
local phoneVerificationStatusOverlayModule = require(phoneUpsell.Components.PhoneVerificationStatusOverlay)
local foundationModule = require(parent.Foundation)
local iconSize = foundationModule.Enums.IconSize
local loading = foundationModule.Loading
local useLocalization = require(parent.Localization).Hooks.useLocalization
local setPhoneNumberModule = require(phoneUpsell.Thunks.SetPhoneNumber)
local verifyPhoneCodeModule = require(phoneUpsell.Thunks.VerifyPhoneCode)
local resendPhoneCodeModule = require(phoneUpsell.Thunks.ResendPhoneCode)
local setIsPhoneVerified = require(parent.ContactImporter).Actions.SetIsPhoneVerified
local getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule = require(phoneUpsell.Utils.GetPrefixAndNationalNumberFromRawPhoneAndDefaultPrefix)
local roactAppExperimentModule = require(parent.RoactAppExperiment)
local getFStringAndroidPhoneVerificationLayer = require(parent.SharedFlags).GetFStringAndroidPhoneVerificationLayer
local getFStringIOSPhoneVerificationLayer = require(parent.SharedFlags).GetFStringIOSPhoneVerificationLayer
local getFFlagLuaUsePhoneNumberTextTypeForPhoneUpsellModule = require(phoneUpsell.Flags.GetFFlagLuaUsePhoneNumberTextTypeForPhoneUpsell)
local getFFlagPhoneUseParentSizeForScreenSizeModule = require(phoneUpsell.Flags.GetFFlagPhoneUseParentSizeForScreenSize)
local identityProtocol = require(parent.IdentityProtocol).IdentityProtocol
local t = {
	name = "United States",
	code = "US",
	prefix = "1",
	localizedName = "United States"
}

local var24 = function() --[[ line: 146 ]] end

local t_1 = {
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
	onSuccess = var24,
	onFailure = var24,
	onCancelled = var24,
	onExtraButtonClick = var24,
	closeUpsell = var24,
	showWebpage = function(_) --[[ line: 164 ]] end
}
local var26 = roactRoduxModule.connect(if fFlagUseSignalsForCountryCodeList then nil else function(p20, _) --[[ line: 712 ]]
	return { countryCodeList = p20.CountryCodeList }
end, function(p21) --[[ line: 717 ]]
	-- upvalues: setPhoneNumberModule (ref), verifyPhoneCodeModule (ref), resendPhoneCodeModule (ref), setIsPhoneVerified (ref)
	return {
		setPhoneNumber = function(value, p22, p23, p24) --[[ line: 719 ]]
			-- upvalues: p21 (ref), setPhoneNumberModule (copy)
			return p21(setPhoneNumberModule(value, p22, p23, p24, nil))
		end,
		verifyPhoneCode = function(p25, p26) --[[ line: 722 ]]
			-- upvalues: p21 (ref), verifyPhoneCodeModule (copy)
			return p21(verifyPhoneCodeModule(p25, p26))
		end,
		resendPhoneCode = function(p27) --[[ line: 725 ]]
			-- upvalues: p21 (ref), resendPhoneCodeModule (copy)
			return p21(resendPhoneCodeModule(p27))
		end,
		setIsPhoneVerified = function(value) --[[ line: 728 ]]
			-- upvalues: p21 (ref), setIsPhoneVerified (copy)
			return p21(setIsPhoneVerified(value))
		end
	}
end)(function(p0) --[[ line: 167 | named "PhoneVerificationUpsellOverlay" ]]
	-- upvalues: mergePropsModule (ref), t_1 (ref), reactModule (ref), phoneVerificationUpsellStateModule (ref), t (ref), useLocalization (ref), identityProtocol (ref), getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (ref), userInputService (ref), useSelector (ref), eventStreamConstantsModule (ref), debounceModule (ref), loading (ref), iconSize (ref), getFFlagPhoneUseParentSizeForScreenSizeModule (ref), roactModule (ref), entryViewModule (ref), addPhoneViewModule (ref), getFFlagLuaUsePhoneNumberTextTypeForPhoneUpsellModule (ref), verifyPhoneViewModule (ref), phoneVerificationStatusOverlayModule (ref)
	local var28 = mergePropsModule(t_1, p0)
	local var29, var30 = reactModule.useState(if var28.entryConfig then phoneVerificationUpsellStateModule.Entry else phoneVerificationUpsellStateModule.AddPhone)
	local var31, var32 = reactModule.useState("")
	local var33, var34 = reactModule.useState(t)
	local var35, var36 = reactModule.useState(false)
	local var37, var38 = reactModule.useState("")
	local var39, var40 = reactModule.useState("")
	local var41, var42 = reactModule.useState("")
	local var43, var44 = reactModule.useState("")
	local var45, _ = reactModule.useState(false)
	local var46, var47 = reactModule.useState(false)
	local var48, var49 = reactModule.useState(false)
	local var50, var51 = reactModule.useState(false)
	local var52, var53 = reactModule.useState(0)
	local var54, var55 = reactModule.useState(Vector2.new(400, 400))
	local var56 = reactModule.useRef(false)
	local var57 = useLocalization({
		verifyingKey = "Feature.VerificationUpsell.Label.Verifying",
		invalidPhoneFormatKey = "Feature.VerificationUpsell.Response.ErrorPhoneFormatInvalid",
		invalidPhoneNumberKey = "Feature.VerificationUpsell.Response.InvalidPhoneNumberError",
		invalidVerificationCodeKey = "Feature.VerificationUpsell.Message.InvalidSmsCode",
		tooManyAccountsKey = "Feature.VerificationUpsell.Response.PhoneHasTooManyAssociatedAccounts",
		tooManyAttemptsKey = "Feature.VerificationUpsell.Response.TooManyAttemptsTryAgainLater",
		genericErrorKey = "Feature.VerificationUpsell.Response.ErrorTryAgain"
	})
	local var58 = nil
	reactModule.useEffect(function() --[[ line: 200 ]]
		-- upvalues: var35 (ref), var28 (ref), var34 (ref), var36 (ref)
		if not var35 and var28.countryCodeList and #var28.countryCodeList > 0 then
			for i, v in var28.countryCodeList do
				if v.isDefault then
					var34(v)
				end
			end
			var36(true)
		end
	end, { var28.countryCodeList, var35 })
	
	local _ = function() --[[ line: 212 ]]
		-- upvalues: identityProtocol (copy), var28 (ref), var29 (ref), getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (copy), var33 (ref), t (copy), var32 (ref)
		local default = identityProtocol.default
		default:supportsGetPhoneNumber():andThen(function(p1) --[[ line: 214 ]]
			-- upvalues: var28 (copy), var29 (copy), default (ref), getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (copy), var33 (copy), t (copy), var32 (copy)
			print("PhoneVerification: Autofill phone number supported: {}!", p1)
			
			if not p1 then return end
			var28.authEventAnalytics.reportModalActionWithSection(var28.eventContext, "phoneAutofillEligible", "autofill", var28.origin, var29)
			local phoneNumber = default:getPhoneNumber()
			
			if phoneNumber then
				phoneNumber:andThen(function(p2) --[[ line: 230 ]]
					-- upvalues: getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (copy), var33 (copy), t (copy), var28 (copy), var29 (copy), var32 (copy)
					if not p2 or p2 == "" then
						var28.authEventAnalytics.reportModalActionWithSection(var28.eventContext, "phoneAutofillNull", "autofill", var28.origin, var29)
						
						return
					end
					local var75, var76 = getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule(p2, var33.prefix)
					
					if var75 == t.prefix then
						var28.authEventAnalytics.reportModalActionWithSection(var28.eventContext, "phoneAutofillUSFound", "autofill", var28.origin, var29)
					end
					var32(var76)
					var28.authEventAnalytics.reportModalActionWithSection(var28.eventContext, "phoneAutofillSuccess", "autofill", var28.origin, var29)
				end)
				
				return
			end
		end)
	end
	
	local _ = function() --[[ line: 266 ]]
		-- upvalues: identityProtocol (copy), var28 (ref), var29 (ref), var38 (ref), var40 (ref)
		local default = identityProtocol.default
		default:supportsGetSMSOTP():andThen(function(p3) --[[ line: 268 ]]
			-- upvalues: var28 (copy), var29 (copy), default (ref), var38 (copy), var40 (copy)
			print("PhoneVerification: Autofill OTP supported: {}!", p3)
			
			if p3 then
				var28.authEventAnalytics.reportModalActionWithSection(var28.eventContext, "codeAutofillEligible", "autofill", var28.origin, var29)
				local SMSOTP = default:getSMSOTP()
				
				if SMSOTP then
					SMSOTP:andThen(function(p4) --[[ line: 280 ]]
						-- upvalues: var38 (copy), var40 (copy), var28 (copy), var29 (copy)
						if p4 and p4 ~= "" then
							var38(p4)
							var40(p4)
							var28.authEventAnalytics.reportModalActionWithSection(var28.eventContext, "codeAutofillSuccess", "autofill", var28.origin, var29)
						end
					end)
				end
			end
		end)
	end
	
	reactModule.useEffect(function() --[[ line: 298 ]]
		-- upvalues: var56 (ref), var46 (ref)
		return function() --[[ line: 299 ]]
			-- upvalues: var56 (copy), var46 (copy)
			var56.current = var46
		end
	end, { var46 })
	reactModule.useEffect(function() --[[ line: 304 ]]
		-- upvalues: var58 (write), userInputService (copy), var51 (ref), var53 (ref), var28 (ref), phoneVerificationUpsellStateModule (copy), identityProtocol (copy), var29 (ref), getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (copy), var33 (ref), t (copy), var32 (ref), var56 (ref)
		var58 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function() --[[ line: 306 ]]
			-- upvalues: var51 (copy), userInputService (copy), var53 (copy)
			var51(userInputService.OnScreenKeyboardVisible)
			var53(if userInputService.OnScreenKeyboardVisible then userInputService.OnScreenKeyboardSize.Y else 0)
		end)
		var28.authEventAnalytics.reportModalShownWithSection(var28.eventContext, var28.origin, phoneVerificationUpsellStateModule.AddPhone)
		
		if var28.isAutofillPhoneNumberEnabled then
			local default = identityProtocol.default
			default:supportsGetPhoneNumber():andThen(function(p5) --[[ line: 214 ]]
				-- upvalues: var28 (copy), var29 (copy), default (ref), getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (copy), var33 (copy), t (copy), var32 (copy)
				print("PhoneVerification: Autofill phone number supported: {}!", p5)
				
				if not p5 then return end
				var28.authEventAnalytics.reportModalActionWithSection(var28.eventContext, "phoneAutofillEligible", "autofill", var28.origin, var29)
				local phoneNumber = default:getPhoneNumber()
				
				if phoneNumber then
					phoneNumber:andThen(function(p6) --[[ line: 230 ]]
						-- upvalues: getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (copy), var33 (copy), t (copy), var28 (copy), var29 (copy), var32 (copy)
						if not p6 or p6 == "" then
							var28.authEventAnalytics.reportModalActionWithSection(var28.eventContext, "phoneAutofillNull", "autofill", var28.origin, var29)
							
							return
						end
						local var75, var76 = getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule(p6, var33.prefix)
						
						if var75 == t.prefix then
							var28.authEventAnalytics.reportModalActionWithSection(var28.eventContext, "phoneAutofillUSFound", "autofill", var28.origin, var29)
						end
						var32(var76)
						var28.authEventAnalytics.reportModalActionWithSection(var28.eventContext, "phoneAutofillSuccess", "autofill", var28.origin, var29)
					end)
					
					return
				end
			end)
		end
		return function() --[[ line: 321 ]]
			-- upvalues: var58 (copy), var56 (copy), var28 (copy)
			if var58 then
				var58:Disconnect()
			end
			var58 = nil
			
			if not var56.current then
				var28.onCancelled()
			end
		end
	end, {})
	local var59 = useSelector(function(p7) --[[ line: 332 ]]
		return p7.ScreenSize
	end)
	
	local function handleCloseClick() --[[ line: 336 ]]
		-- upvalues: var28 (ref), var29 (ref)
		var28.authEventAnalytics.reportModalDismissedWithSection(var28.eventContext, var28.origin, var29)
		var28.closeUpsell()
	end
	
	local function _(p8) --[[ line: 345 | named "handlePhoneErrors" ]]
		-- upvalues: var57 (ref)
		return if p8 == 2 then var57.invalidPhoneFormatKey elseif p8 == 6 then var57.tooManyAttemptsKey elseif p8 == 7 then var57.invalidVerificationCodeKey elseif p8 == 8 then var57.invalidPhoneNumberKey elseif p8 == 9 then var57.tooManyAccountsKey else var57.genericErrorKey
	end
	
	local function handleSetPhone() --[[ line: 361 ]]
		-- upvalues: var49 (ref), var28 (ref), var33 (ref), var31 (ref), var30 (ref), phoneVerificationUpsellStateModule (copy), identityProtocol (copy), var29 (ref), var38 (ref), var40 (ref), eventStreamConstantsModule (copy), var42 (ref), var57 (ref)
		var49(true)
		local var78 = var28.setPhoneNumber(var28.networking, var33.code, var33.prefix, var31)
		
		if var78 then
			var78:andThen(function() --[[ line: 366 ]]
				-- upvalues: var30 (copy), phoneVerificationUpsellStateModule (copy), var49 (copy), var28 (copy), identityProtocol (copy), var29 (copy), var38 (copy), var40 (copy)
				var30(phoneVerificationUpsellStateModule.VerifyPhone)
				var49(false)
				var28.authEventAnalytics.reportModalShownWithSection(var28.eventContext, var28.origin, phoneVerificationUpsellStateModule.VerifyPhone)
				
				if var28.isAutofillSMSOtpEnabled then
					local default = identityProtocol.default
					default:supportsGetSMSOTP():andThen(function(p10) --[[ line: 268 ]]
						-- upvalues: var28 (copy), var29 (copy), default (ref), var38 (copy), var40 (copy)
						print("PhoneVerification: Autofill OTP supported: {}!", p10)
						
						if p10 then
							var28.authEventAnalytics.reportModalActionWithSection(var28.eventContext, "codeAutofillEligible", "autofill", var28.origin, var29)
							local SMSOTP = default:getSMSOTP()
							
							if SMSOTP then
								SMSOTP:andThen(function(p11) --[[ line: 280 ]]
									-- upvalues: var38 (copy), var40 (copy), var28 (copy), var29 (copy)
									if p11 and p11 ~= "" then
										var38(p11)
										var40(p11)
										var28.authEventAnalytics.reportModalActionWithSection(var28.eventContext, "codeAutofillSuccess", "autofill", var28.origin, var29)
									end
								end)
							end
						end
					end)
				end
			end):catch(function(p9) --[[ line: 380 ]]
				-- upvalues: var28 (copy), eventStreamConstantsModule (copy), phoneVerificationUpsellStateModule (copy), var42 (copy), var57 (copy), var49 (copy)
				if not p9 then
					var28.authEventAnalytics.reportModalShownWithSectionAndError(var28.eventContext, eventStreamConstantsModule.Field.ErrorMessage, var28.origin, phoneVerificationUpsellStateModule.AddPhone, "")
					var42(var57.genericErrorKey)
				elseif p9.PhoneRegexFailed then
					var28.authEventAnalytics.reportModalShownWithSectionAndError(var28.eventContext, eventStreamConstantsModule.Field.ErrorMessage, var28.origin, phoneVerificationUpsellStateModule.AddPhone, "")
					var42(var57.invalidPhoneFormatKey)
				else
					var28.authEventAnalytics.reportModalShownWithSectionAndError(var28.eventContext, eventStreamConstantsModule.Field.ErrorMessage, var28.origin, phoneVerificationUpsellStateModule.AddPhone, p9.ErrorCode)
					local errorCode = p9.ErrorCode
					var42(if errorCode == 2 then var57.invalidPhoneFormatKey elseif errorCode == 6 then var57.tooManyAttemptsKey elseif errorCode == 7 then var57.invalidVerificationCodeKey elseif errorCode == 8 then var57.invalidPhoneNumberKey elseif errorCode == 9 then var57.tooManyAccountsKey else var57.genericErrorKey)
				end
				var49(false)
			end)
		end
		var28.authEventAnalytics.reportInteractWithActionAndSection(var28.eventContext, "", "", var28.origin, eventStreamConstantsModule.Button.Continue, phoneVerificationUpsellStateModule.AddPhone)
	end
	
	local function handleVerifyPhone() --[[ line: 422 ]]
		-- upvalues: var49 (ref), var28 (ref), var39 (ref), var47 (ref), eventStreamConstantsModule (copy), phoneVerificationUpsellStateModule (copy), var44 (ref), var57 (ref)
		var49(true)
		local var79 = var28.verifyPhoneCode(var28.networking, var39)
		
		if var79 then
			var79:andThen(function() --[[ line: 427 ]]
				-- upvalues: var47 (copy)
				var47(true)
			end):catch(function(p12) --[[ line: 430 ]]
				-- upvalues: var28 (copy), eventStreamConstantsModule (copy), phoneVerificationUpsellStateModule (copy), var44 (copy), var57 (copy), var49 (copy)
				if p12 then
					var28.authEventAnalytics.reportModalShownWithSectionAndError(var28.eventContext, eventStreamConstantsModule.Field.ErrorMessage, var28.origin, phoneVerificationUpsellStateModule.VerifyPhone, p12.ErrorCode)
					local errorCode = p12.ErrorCode
					var44(if errorCode == 2 then var57.invalidPhoneFormatKey elseif errorCode == 6 then var57.tooManyAttemptsKey elseif errorCode == 7 then var57.invalidVerificationCodeKey elseif errorCode == 8 then var57.invalidPhoneNumberKey elseif errorCode == 9 then var57.tooManyAccountsKey else var57.genericErrorKey)
				else
					var28.authEventAnalytics.reportModalShownWithSectionAndError(var28.eventContext, eventStreamConstantsModule.Field.ErrorMessage, var28.origin, phoneVerificationUpsellStateModule.VerifyPhone, "")
					var44(var57.genericErrorKey)
				end
				var49(false)
			end)
		end
		var28.authEventAnalytics.reportInteractWithActionAndSection(var28.eventContext, "", "", var28.origin, eventStreamConstantsModule.Button.AutoSubmit, phoneVerificationUpsellStateModule.VerifyPhone)
	end
	
	local function handleResendCode() --[[ line: 463 ]]
		-- upvalues: var28 (ref), eventStreamConstantsModule (copy), phoneVerificationUpsellStateModule (copy), var44 (ref), var57 (ref)
		local var80 = var28.resendPhoneCode(var28.networking)
		
		if var80 then
			var80:andThen(function() --[[ line: 466 ]] end):catch(function(p13) --[[ line: 466 ]]
				-- upvalues: var28 (copy), eventStreamConstantsModule (copy), phoneVerificationUpsellStateModule (copy), var44 (copy), var57 (copy)
				if p13 then
					var28.authEventAnalytics.reportModalShownWithSectionAndError(var28.eventContext, eventStreamConstantsModule.Field.ErrorMessage, var28.origin, phoneVerificationUpsellStateModule.VerifyPhone, p13.ErrorCode)
					local errorCode = p13.ErrorCode
					var44(if errorCode == 2 then var57.invalidPhoneFormatKey elseif errorCode == 6 then var57.tooManyAttemptsKey elseif errorCode == 7 then var57.invalidVerificationCodeKey elseif errorCode == 8 then var57.invalidPhoneNumberKey elseif errorCode == 9 then var57.tooManyAccountsKey else var57.genericErrorKey)
					
					return
				end
				var28.authEventAnalytics.reportModalShownWithSectionAndError(var28.eventContext, eventStreamConstantsModule.Field.ErrorMessage, var28.origin, phoneVerificationUpsellStateModule.VerifyPhone, "")
				var44(var57.genericErrorKey)
			end)
		end
		var28.authEventAnalytics.reportInteractWithActionAndSection(var28.eventContext, "", "", var28.origin, eventStreamConstantsModule.Button.ResendCode, phoneVerificationUpsellStateModule.VerifyPhone)
	end
	
	local function returnToAddPhone() --[[ line: 498 ]]
		-- upvalues: var30 (ref), phoneVerificationUpsellStateModule (copy), var28 (ref), eventStreamConstantsModule (copy)
		var30(phoneVerificationUpsellStateModule.AddPhone)
		var28.authEventAnalytics.reportInteractWithActionAndSection(var28.eventContext, "", "", var28.origin, eventStreamConstantsModule.Button.ChangePhoneNumber, phoneVerificationUpsellStateModule.VerifyPhone)
	end
	
	local function proceedToAddPhone() --[[ line: 510 ]]
		-- upvalues: var30 (ref), phoneVerificationUpsellStateModule (copy), var28 (ref), eventStreamConstantsModule (copy)
		var30(phoneVerificationUpsellStateModule.AddPhone)
		var28.authEventAnalytics.reportInteractWithActionAndSection(var28.eventContext, "", "", var28.origin, eventStreamConstantsModule.Button.Continue, phoneVerificationUpsellStateModule.Entry)
	end
	
	local function navigateToSMSTerms() --[[ line: 522 ]]
		-- upvalues: var48 (ref), var28 (ref), eventStreamConstantsModule (copy), var29 (ref)
		if not var48 then
			var28.authEventAnalytics.reportModalActionWithSection(var28.eventContext, eventStreamConstantsModule.Field.TermsOfService, "", var28.origin, var29)
			var28.showWebpage("https://en.help.roblox.com/hc/articles/9483830673556-Roblox-SMS-Terms-of-Service")
		end
	end
	
	local function navigateToPrivacy() --[[ line: 535 ]]
		-- upvalues: var48 (ref), var28 (ref), eventStreamConstantsModule (copy), var29 (ref)
		if not var48 then
			var28.authEventAnalytics.reportModalActionWithSection(var28.eventContext, eventStreamConstantsModule.Field.PrivacyPolicy, "", var28.origin, var29)
			var28.showWebpage("https://en.help.roblox.com/hc/articles/115004630823")
		end
	end
	
	local var68 = function(p14) --[[ line: 549 ]]
		-- upvalues: var48 (ref), var42 (ref), var32 (ref)
		if not var48 then
			var42("")
			var32(p14.Text)
		end
	end
	
	local var69 = function() --[[ line: 556 ]]
		-- upvalues: var28 (ref), eventStreamConstantsModule (copy), phoneVerificationUpsellStateModule (copy)
		var28.authEventAnalytics.reportInteractWithActionAndSection(var28.eventContext, eventStreamConstantsModule.Field.CountryPrefix, eventStreamConstantsModule.ActionType.Focus, var28.origin, "", phoneVerificationUpsellStateModule.AddPhone)
	end
	
	local var70 = function() --[[ line: 567 ]]
		-- upvalues: var28 (ref), eventStreamConstantsModule (copy), phoneVerificationUpsellStateModule (copy), identityProtocol (copy), var29 (ref), getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (copy), var33 (ref), t (copy), var32 (ref)
		var28.authEventAnalytics.reportInteractWithActionAndSection(var28.eventContext, eventStreamConstantsModule.Field.PhoneNumber, eventStreamConstantsModule.ActionType.Focus, var28.origin, "", phoneVerificationUpsellStateModule.AddPhone)
		
		if not var28.shouldAutofillAndroidPhoneNumberAtLaunch then
			local default = identityProtocol.default
			default:supportsGetPhoneNumber():andThen(function(p15) --[[ line: 214 ]]
				-- upvalues: var28 (copy), var29 (copy), default (ref), getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (copy), var33 (copy), t (copy), var32 (copy)
				print("PhoneVerification: Autofill phone number supported: {}!", p15)
				
				if not p15 then return end
				var28.authEventAnalytics.reportModalActionWithSection(var28.eventContext, "phoneAutofillEligible", "autofill", var28.origin, var29)
				local phoneNumber = default:getPhoneNumber()
				
				if phoneNumber then
					phoneNumber:andThen(function(p16) --[[ line: 230 ]]
						-- upvalues: getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (copy), var33 (copy), t (copy), var28 (copy), var29 (copy), var32 (copy)
						if not p16 or p16 == "" then
							var28.authEventAnalytics.reportModalActionWithSection(var28.eventContext, "phoneAutofillNull", "autofill", var28.origin, var29)
							
							return
						end
						local var75, var76 = getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule(p16, var33.prefix)
						
						if var75 == t.prefix then
							var28.authEventAnalytics.reportModalActionWithSection(var28.eventContext, "phoneAutofillUSFound", "autofill", var28.origin, var29)
						end
						var32(var76)
						var28.authEventAnalytics.reportModalActionWithSection(var28.eventContext, "phoneAutofillSuccess", "autofill", var28.origin, var29)
					end)
					
					return
				end
			end)
		end
	end
	
	local var71 = debounceModule(function(p17) --[[ line: 581 ]]
		-- upvalues: var40 (ref)
		var40(p17)
	end, 0.5)
	
	local var72 = function(p18) --[[ line: 585 ]]
		-- upvalues: var37 (ref), var44 (ref), var38 (ref), var71 (ref)
		local substring = string.sub(p18.Text, 1, 6)
		
		if substring ~= var37 then
			var44("")
		end
		var38(substring)
		var71(substring)
	end
	
	local var73 = function() --[[ line: 594 ]]
		-- upvalues: var28 (ref), eventStreamConstantsModule (copy), phoneVerificationUpsellStateModule (copy)
		var28.authEventAnalytics.reportInteractWithActionAndSection(var28.eventContext, eventStreamConstantsModule.Field.VerificationCode, eventStreamConstantsModule.ActionType.Focus, var28.origin, "", phoneVerificationUpsellStateModule.VerifyPhone)
	end
	
	reactModule.useEffect(function() --[[ line: 606 ]]
		-- upvalues: var39 (ref), handleVerifyPhone (ref)
		if string.len(var39) == 6 then
			handleVerifyPhone()
		end
	end, { var39 })
	reactModule.useEffect(function() --[[ line: 613 ]]
		-- upvalues: var46 (ref), var28 (ref), phoneVerificationUpsellStateModule (copy)
		if var46 then
			var28.setIsPhoneVerified({ isPhoneVerified = true })
			var28.authEventAnalytics.reportModalShownWithSection(var28.eventContext, var28.origin, phoneVerificationUpsellStateModule.Success)
			var28.onSuccess()
		end
	end, { var46 })
	
	return reactModule.createElement(if getFFlagPhoneUseParentSizeForScreenSizeModule() then "Frame" else reactModule.Fragment, if getFFlagPhoneUseParentSizeForScreenSizeModule() then {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		[roactModule.Change.AbsoluteSize] = function(p19) --[[ line: 637 ]]
			-- upvalues: var55 (ref)
			var55(p19.AbsoluteSize)
		end
	} else nil, {
		Entry = var29 == phoneVerificationUpsellStateModule.Entry and (var28.entryConfig and reactModule.createElement(entryViewModule, {
			screenSize = if getFFlagPhoneUseParentSizeForScreenSizeModule() then var54 else var59,
			onClose = handleCloseClick,
			titleKey = var28.entryConfig.titleKey,
			descriptionKey = var28.entryConfig.descriptionKey,
			buttonKey = var28.entryConfig.buttonKey,
			onButtonClick = proceedToAddPhone,
			extraButtonKey = var28.entryConfig.extraButtonConfig.extraButtonKey,
			onExtraButtonClick = var28.entryConfig.extraButtonConfig.onExtraButtonClick
		})),
		AddPhone = var29 == phoneVerificationUpsellStateModule.AddPhone and reactModule.createElement(addPhoneViewModule, {
			screenSize = if getFFlagPhoneUseParentSizeForScreenSizeModule() then var54 else var59,
			countryCode = var33,
			setCountryCode = var34,
			phoneNumber = var31,
			errorMessage = var41,
			isDisabled = var48,
			onPhoneNumberTextChange = var68,
			onSetPhoneNumber = handleSetPhone,
			onClose = handleCloseClick,
			onTermsOfUseClick = navigateToSMSTerms,
			onPrivacyPolicyClick = navigateToPrivacy,
			onPhoneInputFocus = var70,
			onCountryCodeSelectorClick = var69,
			isKeyboardShowing = var50,
			keyboardHeight = var52,
			usePhoneNumberTextType = getFFlagLuaUsePhoneNumberTextTypeForPhoneUpsellModule() and var28.isPhoneNumberTextTypeEnabled,
			titleKey = var28.addPhoneTitleKey,
			descriptionKey = var28.addPhoneDescriptionKey,
			buttonKey = var28.addPhoneButtonKey,
			legalTextKey = var28.addPhoneLegalTextKey,
			extraButtonKey = var28.extraButtonTextKey,
			onExtraButtonClick = var28.onExtraButtonClick,
			alwaysShowLegalText = var28.alwaysShowAddPhoneLegalText,
			requireLegalTextCheckbox = var28.requireAddPhoneLegalTextCheckbox
		}),
		VerifyPhone = var29 == phoneVerificationUpsellStateModule.VerifyPhone and reactModule.createElement(verifyPhoneViewModule, {
			screenSize = if getFFlagPhoneUseParentSizeForScreenSizeModule() then var54 else var59,
			phoneNumber = var31,
			prefix = var33.prefix,
			code = var37,
			errorMessage = var43,
			onCodeTextChange = var72,
			onResendPhoneCode = handleResendCode,
			onClose = handleCloseClick,
			returnToAddPhone = returnToAddPhone,
			onCodeInputFocus = var73,
			isKeyboardShowing = var50,
			keyboardHeight = var52,
			useOTPInputType = var28.isOTPInputTypeEnabled,
			extraButtonKey = var28.verifyPhoneExtraButtonKey,
			onExtraButtonClick = var28.onVerifyPhoneExtraButtonClick
		}),
		LoadingOverlay = var45 and reactModule.createElement(phoneVerificationStatusOverlayModule, {
			image = reactModule.createElement(loading, {
				size = iconSize.Large,
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5)
			}),
			text = var57.verifyingKey
		})
	})
end)

if fFlagUseSignalsForCountryCodeList then
	local var27 = var26
	var26 = reactModule.memo(function(p28) --[[ line: 739 ]]
		-- upvalues: useSignalState (ref), getCountryCodeListStore (ref), reactModule (ref), var27 (ref), cryoModule (ref)
		return reactModule.createElement(var27, cryoModule.Dictionary.union(p28, {
			countryCodeList = useSignalState(getCountryCodeListStore(false).getCountryCodeList)
		}))
	end)
end
return roactAppExperimentModule.connectUserLayer({
	getFStringAndroidPhoneVerificationLayer(),
	getFStringIOSPhoneVerificationLayer()
}, function(p29, _) --[[ line: 759 ]]
	-- upvalues: getFStringAndroidPhoneVerificationLayer (ref), getFStringIOSPhoneVerificationLayer (ref)
	local var82 = p29[getFStringAndroidPhoneVerificationLayer()] or {}
	local var83 = p29[getFStringIOSPhoneVerificationLayer()] or {}
	
	return {
		isAutofillPhoneNumberEnabled = var82.IsAutofillPhoneNumberEnabled,
		isAutofillSMSOtpEnabled = var82.IsAutofillSMSOtpEnabled,
		isOTPInputTypeEnabled = var83.IsAutofillSMSOtpEnabled,
		isPhoneNumberTextTypeEnabled = var83.IsAutofillPhoneNumberEnabled
	}
end)(roactServices.connect({
	networking = roactNetworking,
	authEventAnalytics = roactAnalyticsAuthEventsModule
})(var26))