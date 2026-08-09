local phoneUpsell = script:FindFirstAncestor("PhoneUpsell")
local parent = phoneUpsell.Parent
local userInputService = game:GetService("UserInputService")
local reactModule = require(parent.React)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local _ = require(parent.LuauPolyfill)
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local eventStreamConstantsModule = require(phoneUpsell.DuplicateAnalytics.EventStreamConstants)
local roactAnalyticsAuthEventsModule = require(phoneUpsell.DuplicateAnalytics.RoactAnalyticsAuthEvents)
local debounceModule = require(phoneUpsell.Utils.debounce)
local mergePropsModule = require(phoneUpsell.Utils.mergeProps)
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local phoneVerificationUpsellStateModule = require(phoneUpsell.Components.PhoneVerificationUpsellState)
local constantsModule = require(phoneUpsell.Constants)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local setPhoneNumberModule = require(phoneUpsell.Thunks.SetPhoneNumber)
local verifyPhoneCodeModule = require(phoneUpsell.Thunks.VerifyPhoneCode)
local resendPhoneCodeModule = require(phoneUpsell.Thunks.ResendPhoneCode)
local setIsPhoneVerified = require(parent.ContactImporter).Actions.SetIsPhoneVerified
local getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule = require(phoneUpsell.Utils.GetPrefixAndNationalNumberFromRawPhoneAndDefaultPrefix)
local useUserExperiment = require(parent.RoactAppExperiment).useUserExperiment
local getFStringAndroidPhoneVerificationLayer = require(parent.SharedFlags).GetFStringAndroidPhoneVerificationLayer
local getFStringIOSPhoneVerificationLayer = require(parent.SharedFlags).GetFStringIOSPhoneVerificationLayer
local getFFlagPhoneUseParentSizeForScreenSizeModule = require(phoneUpsell.Flags.GetFFlagPhoneUseParentSizeForScreenSize)
local getFFlagAddMorePhoneUpsellEvents = require(parent.SharedFlags).GetFFlagAddMorePhoneUpsellEvents
local fFlagPhoneUpsellEnforceCodeInputLimit = require(parent.SharedFlags).FFlagPhoneUpsellEnforceCodeInputLimit
local identityProtocol = require(parent.IdentityProtocol).IdentityProtocol
local t = {
	name = "United States",
	code = "US",
	prefix = "1",
	localizedName = "United States"
}

local var15 = function() --[[ line: 115 ]] end

local t_1 = {
	origin = "",
	eventContext = "",
	addPhoneTitleKey = "Feature.VerificationUpsell.Action.AddPhone",
	addPhoneDescriptionKey = "Feature.VerificationUpsell.Description.VerificationCodeSmsFeesMayApply",
	extraButtonTextKey = "",
	shouldAutofillAndroidPhoneNumberAtLaunch = false,
	alwaysShowAddPhoneLegalText = false,
	requireAddPhoneLegalTextCheckbox = false,
	onSuccess = var15,
	onFailure = var15,
	onCancelled = var15,
	onExtraButtonClick = var15,
	closeUpsell = var15,
	showWebpage = function(_) --[[ line: 131 ]] end
}

return function(p0) --[[ line: 134 | named "usePhoneVerificationUpsellProps" ]]
	-- upvalues: mergePropsModule (ref), t_1 (ref), useSelector (ref), useDispatch (ref), setPhoneNumberModule (ref), verifyPhoneCodeModule (ref), resendPhoneCodeModule (ref), setIsPhoneVerified (ref), useRoactService (ref), roactNetworking (ref), roactAnalyticsAuthEventsModule (ref), useUserExperiment (ref), getFStringAndroidPhoneVerificationLayer (ref), getFStringIOSPhoneVerificationLayer (ref), reactModule (ref), phoneVerificationUpsellStateModule (ref), t (ref), useLocalization (ref), identityProtocol (ref), getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (ref), userInputService (ref), getFFlagAddMorePhoneUpsellEvents (ref), eventStreamConstantsModule (ref), constantsModule (ref), debounceModule (ref), fFlagPhoneUpsellEnforceCodeInputLimit (ref), getFFlagPhoneUseParentSizeForScreenSizeModule (ref)
	local var17 = mergePropsModule(t_1, p0)
	local var18 = useSelector(function(p1) --[[ line: 137 ]]
		return p1.CountryCodeList
	end)
	local var19 = useDispatch()
	
	local _ = function(p2, p3, p4, p5) --[[ line: 142 ]]
		-- upvalues: var19 (ref), setPhoneNumberModule (copy)
		return var19(setPhoneNumberModule(p2, p3, p4, p5, nil))
	end
	
	local _ = function(p6, p7) --[[ line: 145 ]]
		-- upvalues: var19 (ref), verifyPhoneCodeModule (copy)
		return var19(verifyPhoneCodeModule(p6, p7))
	end
	
	local _ = function(p8) --[[ line: 148 ]]
		-- upvalues: var19 (ref), resendPhoneCodeModule (copy)
		return var19(resendPhoneCodeModule(p8))
	end
	
	local _ = function(p9) --[[ line: 151 ]]
		-- upvalues: var19 (ref), setIsPhoneVerified (copy)
		return var19(setIsPhoneVerified(p9))
	end
	
	local var20 = useRoactService(roactNetworking)
	local var21 = useRoactService(roactAnalyticsAuthEventsModule)
	local var22, var23, var24, var25 = useUserExperiment({
		getFStringAndroidPhoneVerificationLayer(),
		getFStringIOSPhoneVerificationLayer()
	}, function(p10) --[[ line: 160 ]]
		-- upvalues: getFStringAndroidPhoneVerificationLayer (copy), getFStringIOSPhoneVerificationLayer (copy)
		local var71 = p10[getFStringAndroidPhoneVerificationLayer()] or {}
		local var72 = p10[getFStringIOSPhoneVerificationLayer()] or {}
		
		return var71.IsAutofillPhoneNumberEnabled, var71.IsAutofillSMSOtpEnabled, var72.IsAutofillSMSOtpEnabled, var72.IsAutofillPhoneNumberEnabled
	end)
	local var26, var27 = reactModule.useState(if var17.entryConfig then phoneVerificationUpsellStateModule.Entry else phoneVerificationUpsellStateModule.AddPhone)
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
	reactModule.useEffect(function() --[[ line: 201 ]]
		-- upvalues: var32 (ref), var18 (ref), var31 (ref), var33 (ref)
		if not var32 and var18 and #var18 > 0 then
			for i, v in var18 do
				if v.isDefault then
					var31(v)
				end
			end
			var33(true)
		end
	end, { var18, var32 })
	
	local _ = function() --[[ line: 213 ]]
		-- upvalues: identityProtocol (copy), var21 (ref), var17 (ref), var26 (ref), getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (copy), var30 (ref), t (copy), var29 (ref)
		local default = identityProtocol.default
		default:supportsGetPhoneNumber():andThen(function(p11) --[[ line: 215 ]]
			-- upvalues: var21 (copy), var17 (copy), var26 (copy), default (ref), getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (copy), var30 (copy), t (copy), var29 (copy)
			print("PhoneVerification: Autofill phone number supported: {}!", p11)
			
			if not p11 then return end
			var21.reportModalActionWithSection(var17.eventContext, "phoneAutofillEligible", "autofill", var17.origin, var26)
			local phoneNumber = default:getPhoneNumber()
			
			if phoneNumber then
				phoneNumber:andThen(function(p12) --[[ line: 231 ]]
					-- upvalues: getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (copy), var30 (copy), t (copy), var21 (copy), var17 (copy), var26 (copy), var29 (copy)
					if not p12 or p12 == "" then
						var21.reportModalActionWithSection(var17.eventContext, "phoneAutofillNull", "autofill", var17.origin, var26)
						
						return
					end
					local var74, var75 = getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule(p12, var30.prefix)
					
					if var74 == t.prefix then
						var21.reportModalActionWithSection(var17.eventContext, "phoneAutofillUSFound", "autofill", var17.origin, var26)
					end
					var29(var75)
					var21.reportModalActionWithSection(var17.eventContext, "phoneAutofillSuccess", "autofill", var17.origin, var26)
				end)
				
				return
			end
		end)
	end
	
	local _ = function() --[[ line: 267 ]]
		-- upvalues: identityProtocol (copy), var21 (ref), var17 (ref), var26 (ref), var35 (ref), var37 (ref)
		local default = identityProtocol.default
		default:supportsGetSMSOTP():andThen(function(p13) --[[ line: 269 ]]
			-- upvalues: var21 (copy), var17 (copy), var26 (copy), default (ref), var35 (copy), var37 (copy)
			print("PhoneVerification: Autofill OTP supported: {}!", p13)
			
			if p13 then
				var21.reportModalActionWithSection(var17.eventContext, "codeAutofillEligible", "autofill", var17.origin, var26)
				local SMSOTP = default:getSMSOTP()
				
				if SMSOTP then
					SMSOTP:andThen(function(p14) --[[ line: 281 ]]
						-- upvalues: var35 (copy), var37 (copy), var21 (copy), var17 (copy), var26 (copy)
						if p14 and p14 ~= "" then
							var35(p14)
							var37(p14)
							var21.reportModalActionWithSection(var17.eventContext, "codeAutofillSuccess", "autofill", var17.origin, var26)
						end
					end)
				end
			end
		end)
	end
	
	reactModule.useEffect(function() --[[ line: 299 ]]
		-- upvalues: var53 (ref), var43 (ref)
		return function() --[[ line: 300 ]]
			-- upvalues: var53 (copy), var43 (copy)
			var53.current = var43
		end
	end, { var43 })
	reactModule.useEffect(function() --[[ line: 305 ]]
		-- upvalues: var55 (write), userInputService (copy), var48 (ref), var50 (ref), var21 (ref), var17 (ref), getFFlagAddMorePhoneUpsellEvents (copy), var26 (ref), phoneVerificationUpsellStateModule (copy), var22 (ref), identityProtocol (copy), getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (copy), var30 (ref), t (copy), var29 (ref), var53 (ref)
		var55 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function() --[[ line: 307 ]]
			-- upvalues: var48 (copy), userInputService (copy), var50 (copy)
			var48(userInputService.OnScreenKeyboardVisible)
			var50(if userInputService.OnScreenKeyboardVisible then userInputService.OnScreenKeyboardSize.Y else 0)
		end)
		var21.reportModalShownWithSection(var17.eventContext, var17.origin, if getFFlagAddMorePhoneUpsellEvents() then var26 else phoneVerificationUpsellStateModule.AddPhone)
		
		if var22 then
			local default = identityProtocol.default
			default:supportsGetPhoneNumber():andThen(function(p15) --[[ line: 215 ]]
				-- upvalues: var21 (copy), var17 (copy), var26 (copy), default (ref), getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (copy), var30 (copy), t (copy), var29 (copy)
				print("PhoneVerification: Autofill phone number supported: {}!", p15)
				
				if not p15 then return end
				var21.reportModalActionWithSection(var17.eventContext, "phoneAutofillEligible", "autofill", var17.origin, var26)
				local phoneNumber = default:getPhoneNumber()
				
				if phoneNumber then
					phoneNumber:andThen(function(p16) --[[ line: 231 ]]
						-- upvalues: getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (copy), var30 (copy), t (copy), var21 (copy), var17 (copy), var26 (copy), var29 (copy)
						if not p16 or p16 == "" then
							var21.reportModalActionWithSection(var17.eventContext, "phoneAutofillNull", "autofill", var17.origin, var26)
							
							return
						end
						local var74, var75 = getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule(p16, var30.prefix)
						
						if var74 == t.prefix then
							var21.reportModalActionWithSection(var17.eventContext, "phoneAutofillUSFound", "autofill", var17.origin, var26)
						end
						var29(var75)
						var21.reportModalActionWithSection(var17.eventContext, "phoneAutofillSuccess", "autofill", var17.origin, var26)
					end)
					
					return
				end
			end)
		end
		return function() --[[ line: 322 ]]
			-- upvalues: var55 (copy), var53 (copy), var17 (copy)
			if var55 then
				var55:Disconnect()
			end
			var55 = nil
			
			if not var53.current then
				var17.onCancelled()
			end
		end
	end, {})
	local var56 = useSelector(function(p17) --[[ line: 333 ]]
		return p17.ScreenSize
	end)
	
	local function handleCloseClick() --[[ line: 337 ]]
		-- upvalues: var21 (ref), var17 (ref), var26 (ref)
		var21.reportModalDismissedWithSection(var17.eventContext, var17.origin, var26)
		var17.closeUpsell()
	end
	
	local function _(p18) --[[ line: 342 | named "handlePhoneErrors" ]]
		-- upvalues: var54 (ref)
		return if p18 == 2 then var54.invalidPhoneFormatKey elseif p18 == 6 then var54.tooManyAttemptsKey elseif p18 == 7 then var54.invalidVerificationCodeKey elseif p18 == 8 then var54.invalidPhoneNumberKey elseif p18 == 9 then var54.tooManyAccountsKey else var54.genericErrorKey
	end
	
	local function handleSetPhone() --[[ line: 358 ]]
		-- upvalues: var46 (ref), var20 (ref), var30 (ref), var28 (ref), var19 (ref), setPhoneNumberModule (copy), var27 (ref), phoneVerificationUpsellStateModule (copy), var21 (ref), var17 (ref), var23 (ref), identityProtocol (copy), var26 (ref), var35 (ref), var37 (ref), eventStreamConstantsModule (copy), var39 (ref), var54 (ref)
		var46(true)
		local var77 = var19(setPhoneNumberModule(var20, var30.code, var30.prefix, var28, nil))
		
		if var77 then
			var77:andThen(function() --[[ line: 363 ]]
				-- upvalues: var27 (copy), phoneVerificationUpsellStateModule (copy), var46 (copy), var21 (copy), var17 (copy), var23 (copy), identityProtocol (copy), var26 (copy), var35 (copy), var37 (copy)
				var27(phoneVerificationUpsellStateModule.VerifyPhone)
				var46(false)
				var21.reportModalShownWithSection(var17.eventContext, var17.origin, phoneVerificationUpsellStateModule.VerifyPhone)
				
				if var23 then
					local default = identityProtocol.default
					default:supportsGetSMSOTP():andThen(function(p20) --[[ line: 269 ]]
						-- upvalues: var21 (copy), var17 (copy), var26 (copy), default (ref), var35 (copy), var37 (copy)
						print("PhoneVerification: Autofill OTP supported: {}!", p20)
						
						if p20 then
							var21.reportModalActionWithSection(var17.eventContext, "codeAutofillEligible", "autofill", var17.origin, var26)
							local SMSOTP = default:getSMSOTP()
							
							if SMSOTP then
								SMSOTP:andThen(function(p21) --[[ line: 281 ]]
									-- upvalues: var35 (copy), var37 (copy), var21 (copy), var17 (copy), var26 (copy)
									if p21 and p21 ~= "" then
										var35(p21)
										var37(p21)
										var21.reportModalActionWithSection(var17.eventContext, "codeAutofillSuccess", "autofill", var17.origin, var26)
									end
								end)
							end
						end
					end)
				end
			end):catch(function(p19) --[[ line: 377 ]]
				-- upvalues: var21 (copy), var17 (copy), eventStreamConstantsModule (copy), phoneVerificationUpsellStateModule (copy), var39 (copy), var54 (copy), var46 (copy)
				if not p19 then
					var21.reportModalShownWithSectionAndError(var17.eventContext, eventStreamConstantsModule.Field.ErrorMessage, var17.origin, phoneVerificationUpsellStateModule.AddPhone, "")
					var39(var54.genericErrorKey)
				elseif p19.PhoneRegexFailed then
					var21.reportModalShownWithSectionAndError(var17.eventContext, eventStreamConstantsModule.Field.ErrorMessage, var17.origin, phoneVerificationUpsellStateModule.AddPhone, "")
					var39(var54.invalidPhoneFormatKey)
				else
					var21.reportModalShownWithSectionAndError(var17.eventContext, eventStreamConstantsModule.Field.ErrorMessage, var17.origin, phoneVerificationUpsellStateModule.AddPhone, p19.ErrorCode)
					local errorCode = p19.ErrorCode
					var39(if errorCode == 2 then var54.invalidPhoneFormatKey elseif errorCode == 6 then var54.tooManyAttemptsKey elseif errorCode == 7 then var54.invalidVerificationCodeKey elseif errorCode == 8 then var54.invalidPhoneNumberKey elseif errorCode == 9 then var54.tooManyAccountsKey else var54.genericErrorKey)
				end
				var46(false)
			end)
		end
		var21.reportInteractWithActionAndSection(var17.eventContext, "", "", var17.origin, eventStreamConstantsModule.Button.Continue, phoneVerificationUpsellStateModule.AddPhone)
	end
	
	local function handleVerifyPhone() --[[ line: 419 ]]
		-- upvalues: var46 (ref), var20 (ref), var36 (ref), var19 (ref), verifyPhoneCodeModule (copy), var44 (ref), var21 (ref), var17 (ref), eventStreamConstantsModule (copy), phoneVerificationUpsellStateModule (copy), var41 (ref), var54 (ref)
		var46(true)
		local var78 = var19(verifyPhoneCodeModule(var20, var36))
		
		if var78 then
			var78:andThen(function() --[[ line: 424 ]]
				-- upvalues: var44 (copy)
				var44(true)
			end):catch(function(p22) --[[ line: 427 ]]
				-- upvalues: var21 (copy), var17 (copy), eventStreamConstantsModule (copy), phoneVerificationUpsellStateModule (copy), var41 (copy), var54 (copy), var46 (copy)
				if p22 then
					var21.reportModalShownWithSectionAndError(var17.eventContext, eventStreamConstantsModule.Field.ErrorMessage, var17.origin, phoneVerificationUpsellStateModule.VerifyPhone, p22.ErrorCode)
					local errorCode = p22.ErrorCode
					var41(if errorCode == 2 then var54.invalidPhoneFormatKey elseif errorCode == 6 then var54.tooManyAttemptsKey elseif errorCode == 7 then var54.invalidVerificationCodeKey elseif errorCode == 8 then var54.invalidPhoneNumberKey elseif errorCode == 9 then var54.tooManyAccountsKey else var54.genericErrorKey)
				else
					var21.reportModalShownWithSectionAndError(var17.eventContext, eventStreamConstantsModule.Field.ErrorMessage, var17.origin, phoneVerificationUpsellStateModule.VerifyPhone, "")
					var41(var54.genericErrorKey)
				end
				var46(false)
			end)
		end
		var21.reportInteractWithActionAndSection(var17.eventContext, "", "", var17.origin, eventStreamConstantsModule.Button.AutoSubmit, phoneVerificationUpsellStateModule.VerifyPhone)
	end
	
	local function handleResendCode() --[[ line: 460 ]]
		-- upvalues: var41 (ref), var20 (ref), var19 (ref), resendPhoneCodeModule (copy), var21 (ref), var17 (ref), eventStreamConstantsModule (copy), phoneVerificationUpsellStateModule (copy), var54 (ref)
		var41("")
		local var79 = var19(resendPhoneCodeModule(var20))
		
		if var79 then
			var79:andThen(function() --[[ line: 464 ]] end):catch(function(p23) --[[ line: 464 ]]
				-- upvalues: var21 (copy), var17 (copy), eventStreamConstantsModule (copy), phoneVerificationUpsellStateModule (copy), var41 (copy), var54 (copy)
				if p23 then
					var21.reportModalShownWithSectionAndError(var17.eventContext, eventStreamConstantsModule.Field.ErrorMessage, var17.origin, phoneVerificationUpsellStateModule.VerifyPhone, p23.ErrorCode)
					local errorCode = p23.ErrorCode
					var41(if errorCode == 2 then var54.invalidPhoneFormatKey elseif errorCode == 6 then var54.tooManyAttemptsKey elseif errorCode == 7 then var54.invalidVerificationCodeKey elseif errorCode == 8 then var54.invalidPhoneNumberKey elseif errorCode == 9 then var54.tooManyAccountsKey else var54.genericErrorKey)
					
					return
				end
				var21.reportModalShownWithSectionAndError(var17.eventContext, eventStreamConstantsModule.Field.ErrorMessage, var17.origin, phoneVerificationUpsellStateModule.VerifyPhone, "")
				var41(var54.genericErrorKey)
			end)
		end
		var21.reportInteractWithActionAndSection(var17.eventContext, "", "", var17.origin, eventStreamConstantsModule.Button.ResendCode, phoneVerificationUpsellStateModule.VerifyPhone)
	end
	
	local function returnToAddPhone() --[[ line: 496 ]]
		-- upvalues: var27 (ref), phoneVerificationUpsellStateModule (copy), var21 (ref), var17 (ref), eventStreamConstantsModule (copy)
		var27(phoneVerificationUpsellStateModule.AddPhone)
		var21.reportInteractWithActionAndSection(var17.eventContext, "", "", var17.origin, eventStreamConstantsModule.Button.ChangePhoneNumber, phoneVerificationUpsellStateModule.VerifyPhone)
	end
	
	local function proceedToAddPhone() --[[ line: 508 ]]
		-- upvalues: var27 (ref), phoneVerificationUpsellStateModule (copy), var21 (ref), var17 (ref), eventStreamConstantsModule (copy)
		var27(phoneVerificationUpsellStateModule.AddPhone)
		var21.reportInteractWithActionAndSection(var17.eventContext, "", "", var17.origin, eventStreamConstantsModule.Button.Continue, phoneVerificationUpsellStateModule.Entry)
	end
	
	local function navigateToSMSTerms() --[[ line: 520 ]]
		-- upvalues: var45 (ref), var21 (ref), var17 (ref), eventStreamConstantsModule (copy), var26 (ref), constantsModule (copy)
		if not var45 then
			var21.reportModalActionWithSection(var17.eventContext, eventStreamConstantsModule.Field.TermsOfService, "", var17.origin, var26)
			var17.showWebpage(constantsModule.TERMS_OF_SERVICE_URL)
		end
	end
	
	local function navigateToPrivacy() --[[ line: 533 ]]
		-- upvalues: var45 (ref), var21 (ref), var17 (ref), eventStreamConstantsModule (copy), var26 (ref), constantsModule (copy)
		if not var45 then
			var21.reportModalActionWithSection(var17.eventContext, eventStreamConstantsModule.Field.PrivacyPolicy, "", var17.origin, var26)
			var17.showWebpage(constantsModule.PRIVACY_POLICY_URL)
		end
	end
	
	local var65 = function(p24) --[[ line: 547 ]]
		-- upvalues: var45 (ref), var39 (ref), var29 (ref)
		if not var45 then
			var39("")
			var29(p24.Text)
		end
	end
	
	local var66 = function() --[[ line: 554 ]]
		-- upvalues: var21 (ref), var17 (ref), eventStreamConstantsModule (copy), phoneVerificationUpsellStateModule (copy)
		var21.reportInteractWithActionAndSection(var17.eventContext, eventStreamConstantsModule.Field.CountryPrefix, eventStreamConstantsModule.ActionType.Focus, var17.origin, "", phoneVerificationUpsellStateModule.AddPhone)
	end
	
	local var67 = function() --[[ line: 565 ]]
		-- upvalues: var21 (ref), var17 (ref), eventStreamConstantsModule (copy), phoneVerificationUpsellStateModule (copy), identityProtocol (copy), var26 (ref), getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (copy), var30 (ref), t (copy), var29 (ref)
		var21.reportInteractWithActionAndSection(var17.eventContext, eventStreamConstantsModule.Field.PhoneNumber, eventStreamConstantsModule.ActionType.Focus, var17.origin, "", phoneVerificationUpsellStateModule.AddPhone)
		
		if not var17.shouldAutofillAndroidPhoneNumberAtLaunch then
			local default = identityProtocol.default
			default:supportsGetPhoneNumber():andThen(function(p25) --[[ line: 215 ]]
				-- upvalues: var21 (copy), var17 (copy), var26 (copy), default (ref), getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (copy), var30 (copy), t (copy), var29 (copy)
				print("PhoneVerification: Autofill phone number supported: {}!", p25)
				
				if not p25 then return end
				var21.reportModalActionWithSection(var17.eventContext, "phoneAutofillEligible", "autofill", var17.origin, var26)
				local phoneNumber = default:getPhoneNumber()
				
				if phoneNumber then
					phoneNumber:andThen(function(p26) --[[ line: 231 ]]
						-- upvalues: getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (copy), var30 (copy), t (copy), var21 (copy), var17 (copy), var26 (copy), var29 (copy)
						if not p26 or p26 == "" then
							var21.reportModalActionWithSection(var17.eventContext, "phoneAutofillNull", "autofill", var17.origin, var26)
							
							return
						end
						local var74, var75 = getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule(p26, var30.prefix)
						
						if var74 == t.prefix then
							var21.reportModalActionWithSection(var17.eventContext, "phoneAutofillUSFound", "autofill", var17.origin, var26)
						end
						var29(var75)
						var21.reportModalActionWithSection(var17.eventContext, "phoneAutofillSuccess", "autofill", var17.origin, var26)
					end)
					
					return
				end
			end)
		end
	end
	
	local var68 = debounceModule(function(p27) --[[ line: 579 ]]
		-- upvalues: var37 (ref)
		var37(p27)
	end, 0.5)
	
	local var69 = function(p28) --[[ line: 583 ]]
		-- upvalues: fFlagPhoneUpsellEnforceCodeInputLimit (copy), var34 (ref), var41 (ref), var35 (ref), var68 (ref)
		local substring = string.sub(p28.Text, 1, 6)
		
		if fFlagPhoneUpsellEnforceCodeInputLimit then
			if substring ~= var34 then
				var41("")
			end
		elseif string.len(p28.Text) <= 6 then
			var41("")
		end
		var35(substring)
		var68(substring)
	end
	
	local var70 = function() --[[ line: 598 ]]
		-- upvalues: var21 (ref), var17 (ref), eventStreamConstantsModule (copy), phoneVerificationUpsellStateModule (copy)
		var21.reportInteractWithActionAndSection(var17.eventContext, eventStreamConstantsModule.Field.VerificationCode, eventStreamConstantsModule.ActionType.Focus, var17.origin, "", phoneVerificationUpsellStateModule.VerifyPhone)
	end
	
	reactModule.useEffect(function() --[[ line: 610 ]]
		-- upvalues: var36 (ref), handleVerifyPhone (ref)
		if string.len(var36) == 6 then
			handleVerifyPhone()
		end
	end, { var36 })
	reactModule.useEffect(function() --[[ line: 617 ]]
		-- upvalues: var43 (ref), var19 (ref), setIsPhoneVerified (copy), var21 (ref), var17 (ref), phoneVerificationUpsellStateModule (copy)
		if var43 then
			local _ = var19(setIsPhoneVerified({ isPhoneVerified = true }))
			var21.reportModalShownWithSection(var17.eventContext, var17.origin, phoneVerificationUpsellStateModule.Success)
			var17.onSuccess()
		end
	end, { var43 })
	
	return {
		phoneUpsellState = var26,
		screenSize = if getFFlagPhoneUseParentSizeForScreenSizeModule() then var51 else var56,
		setParentSize = var52,
		handleCloseClick = handleCloseClick,
		proceedToAddPhone = proceedToAddPhone,
		countryCode = var30,
		setCountryCode = var31,
		phoneNumber = var28,
		addPhoneErrorMessage = var38,
		isDisabled = var45,
		onPhoneNumberTextChange = var65,
		handleSetPhone = handleSetPhone,
		navigateToSMSTerms = navigateToSMSTerms,
		navigateToPrivacy = navigateToPrivacy,
		onPhoneInputFocus = var67,
		onCountryCodeSelectorClick = var66,
		isKeyboardShowing = var47,
		onScreenKeyboardHeight = var49,
		code = var34,
		verifyPhoneErrorMessage = var40,
		onCodeTextChange = var69,
		handleResendCode = handleResendCode,
		returnToAddPhone = returnToAddPhone,
		onCodeInputFocus = var70,
		isLoading = var42,
		verifyingKey = var54.verifyingKey,
		isOTPInputTypeEnabled = var24,
		isPhoneNumberTextTypeEnabled = var25
	}
end