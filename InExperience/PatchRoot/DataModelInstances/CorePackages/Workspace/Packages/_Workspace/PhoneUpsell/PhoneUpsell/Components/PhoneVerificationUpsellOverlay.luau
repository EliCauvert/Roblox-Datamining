local phoneUpsell = script:FindFirstAncestor("PhoneUpsell")
local parent = phoneUpsell.Parent
local userInputService = game:GetService("UserInputService")
local reactModule = require(parent.React)
local roactModule = require(parent.Roact)
local roactRoduxModule = require(parent.RoactRodux)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
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
local fFlagPhoneUpsellEnforceCodeInputLimit = require(parent.SharedFlags).FFlagPhoneUpsellEnforceCodeInputLimit
local identityProtocol = require(parent.IdentityProtocol).IdentityProtocol
local t = {
	name = "United States",
	code = "US",
	prefix = "1",
	localizedName = "United States"
}

local var23 = function() --[[ line: 143 ]] end

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
	onSuccess = var23,
	onFailure = var23,
	onCancelled = var23,
	onExtraButtonClick = var23,
	closeUpsell = var23,
	showWebpage = function(_) --[[ line: 161 ]] end
}

return roactAppExperimentModule.connectUserLayer({
	getFStringAndroidPhoneVerificationLayer(),
	getFStringIOSPhoneVerificationLayer()
}, function(p28, _) --[[ line: 741 ]]
	-- upvalues: getFStringAndroidPhoneVerificationLayer (ref), getFStringIOSPhoneVerificationLayer (ref)
	local var79 = p28[getFStringAndroidPhoneVerificationLayer()] or {}
	local var80 = p28[getFStringIOSPhoneVerificationLayer()] or {}
	
	return {
		isAutofillPhoneNumberEnabled = var79.IsAutofillPhoneNumberEnabled,
		isAutofillSMSOtpEnabled = var79.IsAutofillSMSOtpEnabled,
		isOTPInputTypeEnabled = var80.IsAutofillSMSOtpEnabled,
		isPhoneNumberTextTypeEnabled = var80.IsAutofillPhoneNumberEnabled
	}
end)(roactServices.connect({
	networking = roactNetworking,
	authEventAnalytics = roactAnalyticsAuthEventsModule
})(roactRoduxModule.connect(function(p20, _) --[[ line: 712 ]]
	return { countryCodeList = p20.CountryCodeList }
end, function(p21) --[[ line: 716 ]]
	-- upvalues: setPhoneNumberModule (ref), verifyPhoneCodeModule (ref), resendPhoneCodeModule (ref), setIsPhoneVerified (ref)
	return {
		setPhoneNumber = function(value, p22, p23, p24) --[[ line: 718 ]]
			-- upvalues: p21 (ref), setPhoneNumberModule (copy)
			return p21(setPhoneNumberModule(value, p22, p23, p24, nil))
		end,
		verifyPhoneCode = function(p25, p26) --[[ line: 721 ]]
			-- upvalues: p21 (ref), verifyPhoneCodeModule (copy)
			return p21(verifyPhoneCodeModule(p25, p26))
		end,
		resendPhoneCode = function(p27) --[[ line: 724 ]]
			-- upvalues: p21 (ref), resendPhoneCodeModule (copy)
			return p21(resendPhoneCodeModule(p27))
		end,
		setIsPhoneVerified = function(value) --[[ line: 727 ]]
			-- upvalues: p21 (ref), setIsPhoneVerified (copy)
			return p21(setIsPhoneVerified(value))
		end
	}
end)(function(p0) --[[ line: 164 | named "PhoneVerificationUpsellOverlay" ]]
	-- upvalues: mergePropsModule (ref), t_1 (ref), reactModule (ref), phoneVerificationUpsellStateModule (ref), t (ref), useLocalization (ref), identityProtocol (ref), getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (ref), userInputService (ref), useSelector (ref), eventStreamConstantsModule (ref), debounceModule (ref), fFlagPhoneUpsellEnforceCodeInputLimit (ref), loading (ref), iconSize (ref), getFFlagPhoneUseParentSizeForScreenSizeModule (ref), roactModule (ref), entryViewModule (ref), addPhoneViewModule (ref), getFFlagLuaUsePhoneNumberTextTypeForPhoneUpsellModule (ref), verifyPhoneViewModule (ref), phoneVerificationStatusOverlayModule (ref)
	local var25 = mergePropsModule(t_1, p0)
	local var26, var27 = reactModule.useState(if var25.entryConfig then phoneVerificationUpsellStateModule.Entry else phoneVerificationUpsellStateModule.AddPhone)
	local var28, var29 = reactModule.useState("")
	local var30, var31 = reactModule.useState(t)
	local var32, var33 = reactModule.useState(false)
	local var34, var35 = reactModule.useState("")
	local var36, var37 = reactModule.useState("")
	local var38, var39 = reactModule.useState("")
	local var40, var41 = reactModule.useState("")
	local var42, _ = reactModule.useState(false)
	local var43, var44 = reactModule.useState(false)
	local var45, var46 = reactModule.useState(false)
	local var47, var48 = reactModule.useState(false)
	local var49, var50 = reactModule.useState(0)
	local var51, var52 = reactModule.useState(Vector2.new(400, 400))
	local var53 = reactModule.useRef(false)
	local var54 = useLocalization({
		verifyingKey = "Feature.VerificationUpsell.Label.Verifying",
		invalidPhoneFormatKey = "Feature.VerificationUpsell.Response.ErrorPhoneFormatInvalid",
		invalidPhoneNumberKey = "Feature.VerificationUpsell.Response.InvalidPhoneNumberError",
		invalidVerificationCodeKey = "Feature.VerificationUpsell.Message.InvalidSmsCode",
		tooManyAccountsKey = "Feature.VerificationUpsell.Response.PhoneHasTooManyAssociatedAccounts",
		tooManyAttemptsKey = "Feature.VerificationUpsell.Response.TooManyAttemptsTryAgainLater",
		genericErrorKey = "Feature.VerificationUpsell.Response.ErrorTryAgain"
	})
	local var55 = nil
	reactModule.useEffect(function() --[[ line: 197 ]]
		-- upvalues: var32 (ref), var25 (ref), var31 (ref), var33 (ref)
		if not var32 and var25.countryCodeList and #var25.countryCodeList > 0 then
			for i, v in var25.countryCodeList do
				if v.isDefault then
					var31(v)
				end
			end
			var33(true)
		end
	end, { var25.countryCodeList, var32 })
	
	local _ = function() --[[ line: 209 ]]
		-- upvalues: identityProtocol (copy), var25 (ref), var26 (ref), getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (copy), var30 (ref), t (copy), var29 (ref)
		local default = identityProtocol.default
		default:supportsGetPhoneNumber():andThen(function(p1) --[[ line: 211 ]]
			-- upvalues: var25 (copy), var26 (copy), default (ref), getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (copy), var30 (copy), t (copy), var29 (copy)
			print("PhoneVerification: Autofill phone number supported: {}!", p1)
			
			if not p1 then return end
			var25.authEventAnalytics.reportModalActionWithSection(var25.eventContext, "phoneAutofillEligible", "autofill", var25.origin, var26)
			local phoneNumber = default:getPhoneNumber()
			
			if phoneNumber then
				phoneNumber:andThen(function(p2) --[[ line: 227 ]]
					-- upvalues: getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (copy), var30 (copy), t (copy), var25 (copy), var26 (copy), var29 (copy)
					if not p2 or p2 == "" then
						var25.authEventAnalytics.reportModalActionWithSection(var25.eventContext, "phoneAutofillNull", "autofill", var25.origin, var26)
						
						return
					end
					local var72, var73 = getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule(p2, var30.prefix)
					
					if var72 == t.prefix then
						var25.authEventAnalytics.reportModalActionWithSection(var25.eventContext, "phoneAutofillUSFound", "autofill", var25.origin, var26)
					end
					var29(var73)
					var25.authEventAnalytics.reportModalActionWithSection(var25.eventContext, "phoneAutofillSuccess", "autofill", var25.origin, var26)
				end)
				
				return
			end
		end)
	end
	
	local _ = function() --[[ line: 263 ]]
		-- upvalues: identityProtocol (copy), var25 (ref), var26 (ref), var35 (ref), var37 (ref)
		local default = identityProtocol.default
		default:supportsGetSMSOTP():andThen(function(p3) --[[ line: 265 ]]
			-- upvalues: var25 (copy), var26 (copy), default (ref), var35 (copy), var37 (copy)
			print("PhoneVerification: Autofill OTP supported: {}!", p3)
			
			if p3 then
				var25.authEventAnalytics.reportModalActionWithSection(var25.eventContext, "codeAutofillEligible", "autofill", var25.origin, var26)
				local SMSOTP = default:getSMSOTP()
				
				if SMSOTP then
					SMSOTP:andThen(function(p4) --[[ line: 277 ]]
						-- upvalues: var35 (copy), var37 (copy), var25 (copy), var26 (copy)
						if p4 and p4 ~= "" then
							var35(p4)
							var37(p4)
							var25.authEventAnalytics.reportModalActionWithSection(var25.eventContext, "codeAutofillSuccess", "autofill", var25.origin, var26)
						end
					end)
				end
			end
		end)
	end
	
	reactModule.useEffect(function() --[[ line: 295 ]]
		-- upvalues: var53 (ref), var43 (ref)
		return function() --[[ line: 296 ]]
			-- upvalues: var53 (copy), var43 (copy)
			var53.current = var43
		end
	end, { var43 })
	reactModule.useEffect(function() --[[ line: 301 ]]
		-- upvalues: var55 (write), userInputService (copy), var48 (ref), var50 (ref), var25 (ref), phoneVerificationUpsellStateModule (copy), identityProtocol (copy), var26 (ref), getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (copy), var30 (ref), t (copy), var29 (ref), var53 (ref)
		var55 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function() --[[ line: 303 ]]
			-- upvalues: var48 (copy), userInputService (copy), var50 (copy)
			var48(userInputService.OnScreenKeyboardVisible)
			var50(if userInputService.OnScreenKeyboardVisible then userInputService.OnScreenKeyboardSize.Y else 0)
		end)
		var25.authEventAnalytics.reportModalShownWithSection(var25.eventContext, var25.origin, phoneVerificationUpsellStateModule.AddPhone)
		
		if var25.isAutofillPhoneNumberEnabled then
			local default = identityProtocol.default
			default:supportsGetPhoneNumber():andThen(function(p5) --[[ line: 211 ]]
				-- upvalues: var25 (copy), var26 (copy), default (ref), getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (copy), var30 (copy), t (copy), var29 (copy)
				print("PhoneVerification: Autofill phone number supported: {}!", p5)
				
				if not p5 then return end
				var25.authEventAnalytics.reportModalActionWithSection(var25.eventContext, "phoneAutofillEligible", "autofill", var25.origin, var26)
				local phoneNumber = default:getPhoneNumber()
				
				if phoneNumber then
					phoneNumber:andThen(function(p6) --[[ line: 227 ]]
						-- upvalues: getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (copy), var30 (copy), t (copy), var25 (copy), var26 (copy), var29 (copy)
						if not p6 or p6 == "" then
							var25.authEventAnalytics.reportModalActionWithSection(var25.eventContext, "phoneAutofillNull", "autofill", var25.origin, var26)
							
							return
						end
						local var72, var73 = getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule(p6, var30.prefix)
						
						if var72 == t.prefix then
							var25.authEventAnalytics.reportModalActionWithSection(var25.eventContext, "phoneAutofillUSFound", "autofill", var25.origin, var26)
						end
						var29(var73)
						var25.authEventAnalytics.reportModalActionWithSection(var25.eventContext, "phoneAutofillSuccess", "autofill", var25.origin, var26)
					end)
					
					return
				end
			end)
		end
		return function() --[[ line: 318 ]]
			-- upvalues: var55 (copy), var53 (copy), var25 (copy)
			if var55 then
				var55:Disconnect()
			end
			var55 = nil
			
			if not var53.current then
				var25.onCancelled()
			end
		end
	end, {})
	local var56 = useSelector(function(p7) --[[ line: 329 ]]
		return p7.ScreenSize
	end)
	
	local function handleCloseClick() --[[ line: 333 ]]
		-- upvalues: var25 (ref), var26 (ref)
		var25.authEventAnalytics.reportModalDismissedWithSection(var25.eventContext, var25.origin, var26)
		var25.closeUpsell()
	end
	
	local function _(p8) --[[ line: 342 | named "handlePhoneErrors" ]]
		-- upvalues: var54 (ref)
		return if p8 == 2 then var54.invalidPhoneFormatKey elseif p8 == 6 then var54.tooManyAttemptsKey elseif p8 == 7 then var54.invalidVerificationCodeKey elseif p8 == 8 then var54.invalidPhoneNumberKey elseif p8 == 9 then var54.tooManyAccountsKey else var54.genericErrorKey
	end
	
	local function handleSetPhone() --[[ line: 358 ]]
		-- upvalues: var46 (ref), var25 (ref), var30 (ref), var28 (ref), var27 (ref), phoneVerificationUpsellStateModule (copy), identityProtocol (copy), var26 (ref), var35 (ref), var37 (ref), eventStreamConstantsModule (copy), var39 (ref), var54 (ref)
		var46(true)
		local var75 = var25.setPhoneNumber(var25.networking, var30.code, var30.prefix, var28)
		
		if var75 then
			var75:andThen(function() --[[ line: 363 ]]
				-- upvalues: var27 (copy), phoneVerificationUpsellStateModule (copy), var46 (copy), var25 (copy), identityProtocol (copy), var26 (copy), var35 (copy), var37 (copy)
				var27(phoneVerificationUpsellStateModule.VerifyPhone)
				var46(false)
				var25.authEventAnalytics.reportModalShownWithSection(var25.eventContext, var25.origin, phoneVerificationUpsellStateModule.VerifyPhone)
				
				if var25.isAutofillSMSOtpEnabled then
					local default = identityProtocol.default
					default:supportsGetSMSOTP():andThen(function(p10) --[[ line: 265 ]]
						-- upvalues: var25 (copy), var26 (copy), default (ref), var35 (copy), var37 (copy)
						print("PhoneVerification: Autofill OTP supported: {}!", p10)
						
						if p10 then
							var25.authEventAnalytics.reportModalActionWithSection(var25.eventContext, "codeAutofillEligible", "autofill", var25.origin, var26)
							local SMSOTP = default:getSMSOTP()
							
							if SMSOTP then
								SMSOTP:andThen(function(p11) --[[ line: 277 ]]
									-- upvalues: var35 (copy), var37 (copy), var25 (copy), var26 (copy)
									if p11 and p11 ~= "" then
										var35(p11)
										var37(p11)
										var25.authEventAnalytics.reportModalActionWithSection(var25.eventContext, "codeAutofillSuccess", "autofill", var25.origin, var26)
									end
								end)
							end
						end
					end)
				end
			end):catch(function(p9) --[[ line: 377 ]]
				-- upvalues: var25 (copy), eventStreamConstantsModule (copy), phoneVerificationUpsellStateModule (copy), var39 (copy), var54 (copy), var46 (copy)
				if not p9 then
					var25.authEventAnalytics.reportModalShownWithSectionAndError(var25.eventContext, eventStreamConstantsModule.Field.ErrorMessage, var25.origin, phoneVerificationUpsellStateModule.AddPhone, "")
					var39(var54.genericErrorKey)
				elseif p9.PhoneRegexFailed then
					var25.authEventAnalytics.reportModalShownWithSectionAndError(var25.eventContext, eventStreamConstantsModule.Field.ErrorMessage, var25.origin, phoneVerificationUpsellStateModule.AddPhone, "")
					var39(var54.invalidPhoneFormatKey)
				else
					var25.authEventAnalytics.reportModalShownWithSectionAndError(var25.eventContext, eventStreamConstantsModule.Field.ErrorMessage, var25.origin, phoneVerificationUpsellStateModule.AddPhone, p9.ErrorCode)
					local errorCode = p9.ErrorCode
					var39(if errorCode == 2 then var54.invalidPhoneFormatKey elseif errorCode == 6 then var54.tooManyAttemptsKey elseif errorCode == 7 then var54.invalidVerificationCodeKey elseif errorCode == 8 then var54.invalidPhoneNumberKey elseif errorCode == 9 then var54.tooManyAccountsKey else var54.genericErrorKey)
				end
				var46(false)
			end)
		end
		var25.authEventAnalytics.reportInteractWithActionAndSection(var25.eventContext, "", "", var25.origin, eventStreamConstantsModule.Button.Continue, phoneVerificationUpsellStateModule.AddPhone)
	end
	
	local function handleVerifyPhone() --[[ line: 419 ]]
		-- upvalues: var46 (ref), var25 (ref), var36 (ref), var44 (ref), eventStreamConstantsModule (copy), phoneVerificationUpsellStateModule (copy), var41 (ref), var54 (ref)
		var46(true)
		local var76 = var25.verifyPhoneCode(var25.networking, var36)
		
		if var76 then
			var76:andThen(function() --[[ line: 424 ]]
				-- upvalues: var44 (copy)
				var44(true)
			end):catch(function(p12) --[[ line: 427 ]]
				-- upvalues: var25 (copy), eventStreamConstantsModule (copy), phoneVerificationUpsellStateModule (copy), var41 (copy), var54 (copy), var46 (copy)
				if p12 then
					var25.authEventAnalytics.reportModalShownWithSectionAndError(var25.eventContext, eventStreamConstantsModule.Field.ErrorMessage, var25.origin, phoneVerificationUpsellStateModule.VerifyPhone, p12.ErrorCode)
					local errorCode = p12.ErrorCode
					var41(if errorCode == 2 then var54.invalidPhoneFormatKey elseif errorCode == 6 then var54.tooManyAttemptsKey elseif errorCode == 7 then var54.invalidVerificationCodeKey elseif errorCode == 8 then var54.invalidPhoneNumberKey elseif errorCode == 9 then var54.tooManyAccountsKey else var54.genericErrorKey)
				else
					var25.authEventAnalytics.reportModalShownWithSectionAndError(var25.eventContext, eventStreamConstantsModule.Field.ErrorMessage, var25.origin, phoneVerificationUpsellStateModule.VerifyPhone, "")
					var41(var54.genericErrorKey)
				end
				var46(false)
			end)
		end
		var25.authEventAnalytics.reportInteractWithActionAndSection(var25.eventContext, "", "", var25.origin, eventStreamConstantsModule.Button.AutoSubmit, phoneVerificationUpsellStateModule.VerifyPhone)
	end
	
	local function handleResendCode() --[[ line: 460 ]]
		-- upvalues: var25 (ref), eventStreamConstantsModule (copy), phoneVerificationUpsellStateModule (copy), var41 (ref), var54 (ref)
		local var77 = var25.resendPhoneCode(var25.networking)
		
		if var77 then
			var77:andThen(function() --[[ line: 463 ]] end):catch(function(p13) --[[ line: 463 ]]
				-- upvalues: var25 (copy), eventStreamConstantsModule (copy), phoneVerificationUpsellStateModule (copy), var41 (copy), var54 (copy)
				if p13 then
					var25.authEventAnalytics.reportModalShownWithSectionAndError(var25.eventContext, eventStreamConstantsModule.Field.ErrorMessage, var25.origin, phoneVerificationUpsellStateModule.VerifyPhone, p13.ErrorCode)
					local errorCode = p13.ErrorCode
					var41(if errorCode == 2 then var54.invalidPhoneFormatKey elseif errorCode == 6 then var54.tooManyAttemptsKey elseif errorCode == 7 then var54.invalidVerificationCodeKey elseif errorCode == 8 then var54.invalidPhoneNumberKey elseif errorCode == 9 then var54.tooManyAccountsKey else var54.genericErrorKey)
					
					return
				end
				var25.authEventAnalytics.reportModalShownWithSectionAndError(var25.eventContext, eventStreamConstantsModule.Field.ErrorMessage, var25.origin, phoneVerificationUpsellStateModule.VerifyPhone, "")
				var41(var54.genericErrorKey)
			end)
		end
		var25.authEventAnalytics.reportInteractWithActionAndSection(var25.eventContext, "", "", var25.origin, eventStreamConstantsModule.Button.ResendCode, phoneVerificationUpsellStateModule.VerifyPhone)
	end
	
	local function returnToAddPhone() --[[ line: 495 ]]
		-- upvalues: var27 (ref), phoneVerificationUpsellStateModule (copy), var25 (ref), eventStreamConstantsModule (copy)
		var27(phoneVerificationUpsellStateModule.AddPhone)
		var25.authEventAnalytics.reportInteractWithActionAndSection(var25.eventContext, "", "", var25.origin, eventStreamConstantsModule.Button.ChangePhoneNumber, phoneVerificationUpsellStateModule.VerifyPhone)
	end
	
	local function proceedToAddPhone() --[[ line: 507 ]]
		-- upvalues: var27 (ref), phoneVerificationUpsellStateModule (copy), var25 (ref), eventStreamConstantsModule (copy)
		var27(phoneVerificationUpsellStateModule.AddPhone)
		var25.authEventAnalytics.reportInteractWithActionAndSection(var25.eventContext, "", "", var25.origin, eventStreamConstantsModule.Button.Continue, phoneVerificationUpsellStateModule.Entry)
	end
	
	local function navigateToSMSTerms() --[[ line: 519 ]]
		-- upvalues: var45 (ref), var25 (ref), eventStreamConstantsModule (copy), var26 (ref)
		if not var45 then
			var25.authEventAnalytics.reportModalActionWithSection(var25.eventContext, eventStreamConstantsModule.Field.TermsOfService, "", var25.origin, var26)
			var25.showWebpage("https://en.help.roblox.com/hc/articles/9483830673556-Roblox-SMS-Terms-of-Service")
		end
	end
	
	local function navigateToPrivacy() --[[ line: 532 ]]
		-- upvalues: var45 (ref), var25 (ref), eventStreamConstantsModule (copy), var26 (ref)
		if not var45 then
			var25.authEventAnalytics.reportModalActionWithSection(var25.eventContext, eventStreamConstantsModule.Field.PrivacyPolicy, "", var25.origin, var26)
			var25.showWebpage("https://en.help.roblox.com/hc/articles/115004630823")
		end
	end
	
	local var65 = function(p14) --[[ line: 546 ]]
		-- upvalues: var45 (ref), var39 (ref), var29 (ref)
		if not var45 then
			var39("")
			var29(p14.Text)
		end
	end
	
	local var66 = function() --[[ line: 553 ]]
		-- upvalues: var25 (ref), eventStreamConstantsModule (copy), phoneVerificationUpsellStateModule (copy)
		var25.authEventAnalytics.reportInteractWithActionAndSection(var25.eventContext, eventStreamConstantsModule.Field.CountryPrefix, eventStreamConstantsModule.ActionType.Focus, var25.origin, "", phoneVerificationUpsellStateModule.AddPhone)
	end
	
	local var67 = function() --[[ line: 564 ]]
		-- upvalues: var25 (ref), eventStreamConstantsModule (copy), phoneVerificationUpsellStateModule (copy), identityProtocol (copy), var26 (ref), getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (copy), var30 (ref), t (copy), var29 (ref)
		var25.authEventAnalytics.reportInteractWithActionAndSection(var25.eventContext, eventStreamConstantsModule.Field.PhoneNumber, eventStreamConstantsModule.ActionType.Focus, var25.origin, "", phoneVerificationUpsellStateModule.AddPhone)
		
		if not var25.shouldAutofillAndroidPhoneNumberAtLaunch then
			local default = identityProtocol.default
			default:supportsGetPhoneNumber():andThen(function(p15) --[[ line: 211 ]]
				-- upvalues: var25 (copy), var26 (copy), default (ref), getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (copy), var30 (copy), t (copy), var29 (copy)
				print("PhoneVerification: Autofill phone number supported: {}!", p15)
				
				if not p15 then return end
				var25.authEventAnalytics.reportModalActionWithSection(var25.eventContext, "phoneAutofillEligible", "autofill", var25.origin, var26)
				local phoneNumber = default:getPhoneNumber()
				
				if phoneNumber then
					phoneNumber:andThen(function(p16) --[[ line: 227 ]]
						-- upvalues: getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (copy), var30 (copy), t (copy), var25 (copy), var26 (copy), var29 (copy)
						if not p16 or p16 == "" then
							var25.authEventAnalytics.reportModalActionWithSection(var25.eventContext, "phoneAutofillNull", "autofill", var25.origin, var26)
							
							return
						end
						local var72, var73 = getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule(p16, var30.prefix)
						
						if var72 == t.prefix then
							var25.authEventAnalytics.reportModalActionWithSection(var25.eventContext, "phoneAutofillUSFound", "autofill", var25.origin, var26)
						end
						var29(var73)
						var25.authEventAnalytics.reportModalActionWithSection(var25.eventContext, "phoneAutofillSuccess", "autofill", var25.origin, var26)
					end)
					
					return
				end
			end)
		end
	end
	
	local var68 = debounceModule(function(p17) --[[ line: 578 ]]
		-- upvalues: var37 (ref)
		var37(p17)
	end, 0.5)
	
	local var69 = function(p18) --[[ line: 582 ]]
		-- upvalues: fFlagPhoneUpsellEnforceCodeInputLimit (copy), var34 (ref), var41 (ref), var35 (ref), var68 (ref)
		local substring = string.sub(p18.Text, 1, 6)
		
		if fFlagPhoneUpsellEnforceCodeInputLimit then
			if substring ~= var34 then
				var41("")
			end
		elseif string.len(p18.Text) <= 6 then
			var41("")
		end
		var35(substring)
		var68(substring)
	end
	
	local var70 = function() --[[ line: 597 ]]
		-- upvalues: var25 (ref), eventStreamConstantsModule (copy), phoneVerificationUpsellStateModule (copy)
		var25.authEventAnalytics.reportInteractWithActionAndSection(var25.eventContext, eventStreamConstantsModule.Field.VerificationCode, eventStreamConstantsModule.ActionType.Focus, var25.origin, "", phoneVerificationUpsellStateModule.VerifyPhone)
	end
	
	reactModule.useEffect(function() --[[ line: 609 ]]
		-- upvalues: var36 (ref), handleVerifyPhone (ref)
		if string.len(var36) == 6 then
			handleVerifyPhone()
		end
	end, { var36 })
	reactModule.useEffect(function() --[[ line: 616 ]]
		-- upvalues: var43 (ref), var25 (ref), phoneVerificationUpsellStateModule (copy)
		if var43 then
			var25.setIsPhoneVerified({ isPhoneVerified = true })
			var25.authEventAnalytics.reportModalShownWithSection(var25.eventContext, var25.origin, phoneVerificationUpsellStateModule.Success)
			var25.onSuccess()
		end
	end, { var43 })
	
	return reactModule.createElement(if getFFlagPhoneUseParentSizeForScreenSizeModule() then "Frame" else reactModule.Fragment, if getFFlagPhoneUseParentSizeForScreenSizeModule() then {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		[roactModule.Change.AbsoluteSize] = function(p19) --[[ line: 640 ]]
			-- upvalues: var52 (ref)
			var52(p19.AbsoluteSize)
		end
	} else nil, {
		Entry = var26 == phoneVerificationUpsellStateModule.Entry and (var25.entryConfig and reactModule.createElement(entryViewModule, {
			screenSize = if getFFlagPhoneUseParentSizeForScreenSizeModule() then var51 else var56,
			onClose = handleCloseClick,
			titleKey = var25.entryConfig.titleKey,
			descriptionKey = var25.entryConfig.descriptionKey,
			buttonKey = var25.entryConfig.buttonKey,
			onButtonClick = proceedToAddPhone,
			extraButtonKey = var25.entryConfig.extraButtonConfig.extraButtonKey,
			onExtraButtonClick = var25.entryConfig.extraButtonConfig.onExtraButtonClick
		})),
		AddPhone = var26 == phoneVerificationUpsellStateModule.AddPhone and reactModule.createElement(addPhoneViewModule, {
			screenSize = if getFFlagPhoneUseParentSizeForScreenSizeModule() then var51 else var56,
			countryCode = var30,
			setCountryCode = var31,
			phoneNumber = var28,
			errorMessage = var38,
			isDisabled = var45,
			onPhoneNumberTextChange = var65,
			onSetPhoneNumber = handleSetPhone,
			onClose = handleCloseClick,
			onTermsOfUseClick = navigateToSMSTerms,
			onPrivacyPolicyClick = navigateToPrivacy,
			onPhoneInputFocus = var67,
			onCountryCodeSelectorClick = var66,
			isKeyboardShowing = var47,
			keyboardHeight = var49,
			usePhoneNumberTextType = getFFlagLuaUsePhoneNumberTextTypeForPhoneUpsellModule() and var25.isPhoneNumberTextTypeEnabled,
			titleKey = var25.addPhoneTitleKey,
			descriptionKey = var25.addPhoneDescriptionKey,
			buttonKey = var25.addPhoneButtonKey,
			legalTextKey = var25.addPhoneLegalTextKey,
			extraButtonKey = var25.extraButtonTextKey,
			onExtraButtonClick = var25.onExtraButtonClick,
			alwaysShowLegalText = var25.alwaysShowAddPhoneLegalText,
			requireLegalTextCheckbox = var25.requireAddPhoneLegalTextCheckbox
		}),
		VerifyPhone = var26 == phoneVerificationUpsellStateModule.VerifyPhone and reactModule.createElement(verifyPhoneViewModule, {
			screenSize = if getFFlagPhoneUseParentSizeForScreenSizeModule() then var51 else var56,
			phoneNumber = var28,
			prefix = var30.prefix,
			code = var34,
			errorMessage = var40,
			onCodeTextChange = var69,
			onResendPhoneCode = handleResendCode,
			onClose = handleCloseClick,
			returnToAddPhone = returnToAddPhone,
			onCodeInputFocus = var70,
			isKeyboardShowing = var47,
			keyboardHeight = var49,
			useOTPInputType = var25.isOTPInputTypeEnabled,
			extraButtonKey = var25.verifyPhoneExtraButtonKey,
			onExtraButtonClick = var25.onVerifyPhoneExtraButtonClick
		}),
		LoadingOverlay = var42 and reactModule.createElement(phoneVerificationStatusOverlayModule, {
			image = reactModule.createElement(loading, {
				size = iconSize.Large,
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5)
			}),
			text = var54.verifyingKey
		})
	})
end)))