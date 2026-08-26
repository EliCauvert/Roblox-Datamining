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

local var1 = function() end

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
	onSuccess = var1,
	onFailure = var1,
	onCancelled = var1,
	onExtraButtonClick = var1,
	closeUpsell = var1,
	showWebpage = function(_) end
}
local var2 = roactRoduxModule.connect(if fFlagUseSignalsForCountryCodeList then nil else function(p1, _)
	return { countryCodeList = p1.CountryCodeList }
end, function(p1)
	-- upvalues: setPhoneNumberModule (ref), verifyPhoneCodeModule (ref), resendPhoneCodeModule (ref), setIsPhoneVerified (ref)
	return {
		setPhoneNumber = function(value, p2, p3, p4)
			-- upvalues: p1 (ref), setPhoneNumberModule (copy)
			return p1(setPhoneNumberModule(value, p2, p3, p4, nil))
		end,
		verifyPhoneCode = function(p2, p3)
			-- upvalues: p1 (ref), verifyPhoneCodeModule (copy)
			return p1(verifyPhoneCodeModule(p2, p3))
		end,
		resendPhoneCode = function(p2)
			-- upvalues: p1 (ref), resendPhoneCodeModule (copy)
			return p1(resendPhoneCodeModule(p2))
		end,
		setIsPhoneVerified = function(value)
			-- upvalues: p1 (ref), setIsPhoneVerified (copy)
			return p1(setIsPhoneVerified(value))
		end
	}
end)(function(p1)
	-- upvalues: mergePropsModule (ref), t_1 (ref), reactModule (ref), phoneVerificationUpsellStateModule (ref), t (ref), useLocalization (ref), identityProtocol (ref), getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (ref), userInputService (ref), useSelector (ref), eventStreamConstantsModule (ref), debounceModule (ref), loading (ref), iconSize (ref), getFFlagPhoneUseParentSizeForScreenSizeModule (ref), roactModule (ref), entryViewModule (ref), addPhoneViewModule (ref), getFFlagLuaUsePhoneNumberTextTypeForPhoneUpsellModule (ref), verifyPhoneViewModule (ref), phoneVerificationStatusOverlayModule (ref)
	local var3 = mergePropsModule(t_1, p1)
	local var4, var5 = reactModule.useState(if var3.entryConfig then phoneVerificationUpsellStateModule.Entry else phoneVerificationUpsellStateModule.AddPhone)
	local var6, var7 = reactModule.useState("")
	local var8, var9 = reactModule.useState(t)
	local var10, var11 = reactModule.useState(false)
	local var12, var13 = reactModule.useState("")
	local var14, var15 = reactModule.useState("")
	local var16, var17 = reactModule.useState("")
	local var18, var19 = reactModule.useState("")
	local var20, _ = reactModule.useState(false)
	local var21, var22 = reactModule.useState(false)
	local var23, var24 = reactModule.useState(false)
	local var25, var26 = reactModule.useState(false)
	local var27, var28 = reactModule.useState(0)
	local var29, var30 = reactModule.useState(Vector2.new(400, 400))
	local var31 = reactModule.useRef(false)
	local var32 = useLocalization({
		verifyingKey = "Feature.VerificationUpsell.Label.Verifying",
		invalidPhoneFormatKey = "Feature.VerificationUpsell.Response.ErrorPhoneFormatInvalid",
		invalidPhoneNumberKey = "Feature.VerificationUpsell.Response.InvalidPhoneNumberError",
		invalidVerificationCodeKey = "Feature.VerificationUpsell.Message.InvalidSmsCode",
		tooManyAccountsKey = "Feature.VerificationUpsell.Response.PhoneHasTooManyAssociatedAccounts",
		tooManyAttemptsKey = "Feature.VerificationUpsell.Response.TooManyAttemptsTryAgainLater",
		genericErrorKey = "Feature.VerificationUpsell.Response.ErrorTryAgain"
	})
	local var33 = nil
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), var3 (ref), var9 (ref), var11 (ref)
		if not var10 and var3.countryCodeList and #var3.countryCodeList > 0 then
			for i, v in var3.countryCodeList do
				if v.isDefault then
					var9(v)
				end
			end
			var11(true)
		end
	end, { var3.countryCodeList, var10 })
	
	local _ = function()
		-- upvalues: identityProtocol (copy), var3 (ref), var4 (ref), getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (copy), var8 (ref), t (copy), var7 (ref)
		local default = identityProtocol.default
		default:supportsGetPhoneNumber():andThen(function(p2)
			-- upvalues: var3 (copy), var4 (copy), default (ref), getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (copy), var8 (copy), t (copy), var7 (copy)
			print("PhoneVerification: Autofill phone number supported: {}!", p2)
			
			if not p2 then return end
			var3.authEventAnalytics.reportModalActionWithSection(var3.eventContext, "phoneAutofillEligible", "autofill", var3.origin, var4)
			local phoneNumber = default:getPhoneNumber()
			
			if phoneNumber then
				phoneNumber:andThen(function(p3)
					-- upvalues: getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (copy), var8 (copy), t (copy), var3 (copy), var4 (copy), var7 (copy)
					if not p3 or p3 == "" then
						var3.authEventAnalytics.reportModalActionWithSection(var3.eventContext, "phoneAutofillNull", "autofill", var3.origin, var4)
						
						return
					end
					local var34, var35 = getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule(p3, var8.prefix)
					
					if var34 == t.prefix then
						var3.authEventAnalytics.reportModalActionWithSection(var3.eventContext, "phoneAutofillUSFound", "autofill", var3.origin, var4)
					end
					var7(var35)
					var3.authEventAnalytics.reportModalActionWithSection(var3.eventContext, "phoneAutofillSuccess", "autofill", var3.origin, var4)
				end)
				
				return
			end
		end)
	end
	
	local _ = function()
		-- upvalues: identityProtocol (copy), var3 (ref), var4 (ref), var13 (ref), var15 (ref)
		local default = identityProtocol.default
		default:supportsGetSMSOTP():andThen(function(p2)
			-- upvalues: var3 (copy), var4 (copy), default (ref), var13 (copy), var15 (copy)
			print("PhoneVerification: Autofill OTP supported: {}!", p2)
			
			if p2 then
				var3.authEventAnalytics.reportModalActionWithSection(var3.eventContext, "codeAutofillEligible", "autofill", var3.origin, var4)
				local SMSOTP = default:getSMSOTP()
				
				if SMSOTP then
					SMSOTP:andThen(function(p3)
						-- upvalues: var13 (copy), var15 (copy), var3 (copy), var4 (copy)
						if p3 and p3 ~= "" then
							var13(p3)
							var15(p3)
							var3.authEventAnalytics.reportModalActionWithSection(var3.eventContext, "codeAutofillSuccess", "autofill", var3.origin, var4)
						end
					end)
				end
			end
		end)
	end
	
	reactModule.useEffect(function()
		-- upvalues: var31 (ref), var21 (ref)
		return function()
			-- upvalues: var31 (copy), var21 (copy)
			var31.current = var21
		end
	end, { var21 })
	reactModule.useEffect(function()
		-- upvalues: var33 (write), userInputService (copy), var26 (ref), var28 (ref), var3 (ref), phoneVerificationUpsellStateModule (copy), identityProtocol (copy), var4 (ref), getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (copy), var8 (ref), t (copy), var7 (ref), var31 (ref)
		var33 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function()
			-- upvalues: var26 (copy), userInputService (copy), var28 (copy)
			var26(userInputService.OnScreenKeyboardVisible)
			var28(if userInputService.OnScreenKeyboardVisible then userInputService.OnScreenKeyboardSize.Y else 0)
		end)
		var3.authEventAnalytics.reportModalShownWithSection(var3.eventContext, var3.origin, phoneVerificationUpsellStateModule.AddPhone)
		
		if var3.isAutofillPhoneNumberEnabled then
			local default = identityProtocol.default
			default:supportsGetPhoneNumber():andThen(function(p2)
				-- upvalues: var3 (copy), var4 (copy), default (ref), getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (copy), var8 (copy), t (copy), var7 (copy)
				print("PhoneVerification: Autofill phone number supported: {}!", p2)
				
				if not p2 then return end
				var3.authEventAnalytics.reportModalActionWithSection(var3.eventContext, "phoneAutofillEligible", "autofill", var3.origin, var4)
				local phoneNumber = default:getPhoneNumber()
				
				if phoneNumber then
					phoneNumber:andThen(function(p3)
						-- upvalues: getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (copy), var8 (copy), t (copy), var3 (copy), var4 (copy), var7 (copy)
						if not p3 or p3 == "" then
							var3.authEventAnalytics.reportModalActionWithSection(var3.eventContext, "phoneAutofillNull", "autofill", var3.origin, var4)
							
							return
						end
						local var34, var35 = getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule(p3, var8.prefix)
						
						if var34 == t.prefix then
							var3.authEventAnalytics.reportModalActionWithSection(var3.eventContext, "phoneAutofillUSFound", "autofill", var3.origin, var4)
						end
						var7(var35)
						var3.authEventAnalytics.reportModalActionWithSection(var3.eventContext, "phoneAutofillSuccess", "autofill", var3.origin, var4)
					end)
					
					return
				end
			end)
		end
		return function()
			-- upvalues: var33 (copy), var31 (copy), var3 (copy)
			if var33 then
				var33:Disconnect()
			end
			var33 = nil
			
			if not var31.current then
				var3.onCancelled()
			end
		end
	end, {})
	local var34 = useSelector(function(p2)
		return p2.ScreenSize
	end)
	
	local function handleCloseClick()
		-- upvalues: var3 (ref), var4 (ref)
		var3.authEventAnalytics.reportModalDismissedWithSection(var3.eventContext, var3.origin, var4)
		var3.closeUpsell()
	end
	
	local function _(p2)
		-- upvalues: var32 (ref)
		return if p2 == 2 then var32.invalidPhoneFormatKey elseif p2 == 6 then var32.tooManyAttemptsKey elseif p2 == 7 then var32.invalidVerificationCodeKey elseif p2 == 8 then var32.invalidPhoneNumberKey elseif p2 == 9 then var32.tooManyAccountsKey else var32.genericErrorKey
	end
	
	local function handleSetPhone()
		-- upvalues: var24 (ref), var3 (ref), var8 (ref), var6 (ref), var5 (ref), phoneVerificationUpsellStateModule (copy), identityProtocol (copy), var4 (ref), var13 (ref), var15 (ref), eventStreamConstantsModule (copy), var17 (ref), var32 (ref)
		var24(true)
		local var35 = var3.setPhoneNumber(var3.networking, var8.code, var8.prefix, var6)
		
		if var35 then
			var35:andThen(function()
				-- upvalues: var5 (copy), phoneVerificationUpsellStateModule (copy), var24 (copy), var3 (copy), identityProtocol (copy), var4 (copy), var13 (copy), var15 (copy)
				var5(phoneVerificationUpsellStateModule.VerifyPhone)
				var24(false)
				var3.authEventAnalytics.reportModalShownWithSection(var3.eventContext, var3.origin, phoneVerificationUpsellStateModule.VerifyPhone)
				
				if var3.isAutofillSMSOtpEnabled then
					local default = identityProtocol.default
					default:supportsGetSMSOTP():andThen(function(p2)
						-- upvalues: var3 (copy), var4 (copy), default (ref), var13 (copy), var15 (copy)
						print("PhoneVerification: Autofill OTP supported: {}!", p2)
						
						if p2 then
							var3.authEventAnalytics.reportModalActionWithSection(var3.eventContext, "codeAutofillEligible", "autofill", var3.origin, var4)
							local SMSOTP = default:getSMSOTP()
							
							if SMSOTP then
								SMSOTP:andThen(function(p3)
									-- upvalues: var13 (copy), var15 (copy), var3 (copy), var4 (copy)
									if p3 and p3 ~= "" then
										var13(p3)
										var15(p3)
										var3.authEventAnalytics.reportModalActionWithSection(var3.eventContext, "codeAutofillSuccess", "autofill", var3.origin, var4)
									end
								end)
							end
						end
					end)
				end
			end):catch(function(p2)
				-- upvalues: var3 (copy), eventStreamConstantsModule (copy), phoneVerificationUpsellStateModule (copy), var17 (copy), var32 (copy), var24 (copy)
				if not p2 then
					var3.authEventAnalytics.reportModalShownWithSectionAndError(var3.eventContext, eventStreamConstantsModule.Field.ErrorMessage, var3.origin, phoneVerificationUpsellStateModule.AddPhone, "")
					var17(var32.genericErrorKey)
				elseif p2.PhoneRegexFailed then
					var3.authEventAnalytics.reportModalShownWithSectionAndError(var3.eventContext, eventStreamConstantsModule.Field.ErrorMessage, var3.origin, phoneVerificationUpsellStateModule.AddPhone, "")
					var17(var32.invalidPhoneFormatKey)
				else
					var3.authEventAnalytics.reportModalShownWithSectionAndError(var3.eventContext, eventStreamConstantsModule.Field.ErrorMessage, var3.origin, phoneVerificationUpsellStateModule.AddPhone, p2.ErrorCode)
					local errorCode = p2.ErrorCode
					var17(if errorCode == 2 then var32.invalidPhoneFormatKey elseif errorCode == 6 then var32.tooManyAttemptsKey elseif errorCode == 7 then var32.invalidVerificationCodeKey elseif errorCode == 8 then var32.invalidPhoneNumberKey elseif errorCode == 9 then var32.tooManyAccountsKey else var32.genericErrorKey)
				end
				var24(false)
			end)
		end
		var3.authEventAnalytics.reportInteractWithActionAndSection(var3.eventContext, "", "", var3.origin, eventStreamConstantsModule.Button.Continue, phoneVerificationUpsellStateModule.AddPhone)
	end
	
	local function handleVerifyPhone()
		-- upvalues: var24 (ref), var3 (ref), var14 (ref), var22 (ref), eventStreamConstantsModule (copy), phoneVerificationUpsellStateModule (copy), var19 (ref), var32 (ref)
		var24(true)
		local var35 = var3.verifyPhoneCode(var3.networking, var14)
		
		if var35 then
			var35:andThen(function()
				-- upvalues: var22 (copy)
				var22(true)
			end):catch(function(p2)
				-- upvalues: var3 (copy), eventStreamConstantsModule (copy), phoneVerificationUpsellStateModule (copy), var19 (copy), var32 (copy), var24 (copy)
				if p2 then
					var3.authEventAnalytics.reportModalShownWithSectionAndError(var3.eventContext, eventStreamConstantsModule.Field.ErrorMessage, var3.origin, phoneVerificationUpsellStateModule.VerifyPhone, p2.ErrorCode)
					local errorCode = p2.ErrorCode
					var19(if errorCode == 2 then var32.invalidPhoneFormatKey elseif errorCode == 6 then var32.tooManyAttemptsKey elseif errorCode == 7 then var32.invalidVerificationCodeKey elseif errorCode == 8 then var32.invalidPhoneNumberKey elseif errorCode == 9 then var32.tooManyAccountsKey else var32.genericErrorKey)
				else
					var3.authEventAnalytics.reportModalShownWithSectionAndError(var3.eventContext, eventStreamConstantsModule.Field.ErrorMessage, var3.origin, phoneVerificationUpsellStateModule.VerifyPhone, "")
					var19(var32.genericErrorKey)
				end
				var24(false)
			end)
		end
		var3.authEventAnalytics.reportInteractWithActionAndSection(var3.eventContext, "", "", var3.origin, eventStreamConstantsModule.Button.AutoSubmit, phoneVerificationUpsellStateModule.VerifyPhone)
	end
	
	local function handleResendCode()
		-- upvalues: var3 (ref), eventStreamConstantsModule (copy), phoneVerificationUpsellStateModule (copy), var19 (ref), var32 (ref)
		local var35 = var3.resendPhoneCode(var3.networking)
		
		if var35 then
			var35:andThen(function() end):catch(function(p2)
				-- upvalues: var3 (copy), eventStreamConstantsModule (copy), phoneVerificationUpsellStateModule (copy), var19 (copy), var32 (copy)
				if p2 then
					var3.authEventAnalytics.reportModalShownWithSectionAndError(var3.eventContext, eventStreamConstantsModule.Field.ErrorMessage, var3.origin, phoneVerificationUpsellStateModule.VerifyPhone, p2.ErrorCode)
					local errorCode = p2.ErrorCode
					var19(if errorCode == 2 then var32.invalidPhoneFormatKey elseif errorCode == 6 then var32.tooManyAttemptsKey elseif errorCode == 7 then var32.invalidVerificationCodeKey elseif errorCode == 8 then var32.invalidPhoneNumberKey elseif errorCode == 9 then var32.tooManyAccountsKey else var32.genericErrorKey)
					
					return
				end
				var3.authEventAnalytics.reportModalShownWithSectionAndError(var3.eventContext, eventStreamConstantsModule.Field.ErrorMessage, var3.origin, phoneVerificationUpsellStateModule.VerifyPhone, "")
				var19(var32.genericErrorKey)
			end)
		end
		var3.authEventAnalytics.reportInteractWithActionAndSection(var3.eventContext, "", "", var3.origin, eventStreamConstantsModule.Button.ResendCode, phoneVerificationUpsellStateModule.VerifyPhone)
	end
	
	local function returnToAddPhone()
		-- upvalues: var5 (ref), phoneVerificationUpsellStateModule (copy), var3 (ref), eventStreamConstantsModule (copy)
		var5(phoneVerificationUpsellStateModule.AddPhone)
		var3.authEventAnalytics.reportInteractWithActionAndSection(var3.eventContext, "", "", var3.origin, eventStreamConstantsModule.Button.ChangePhoneNumber, phoneVerificationUpsellStateModule.VerifyPhone)
	end
	
	local function proceedToAddPhone()
		-- upvalues: var5 (ref), phoneVerificationUpsellStateModule (copy), var3 (ref), eventStreamConstantsModule (copy)
		var5(phoneVerificationUpsellStateModule.AddPhone)
		var3.authEventAnalytics.reportInteractWithActionAndSection(var3.eventContext, "", "", var3.origin, eventStreamConstantsModule.Button.Continue, phoneVerificationUpsellStateModule.Entry)
	end
	
	local function navigateToSMSTerms()
		-- upvalues: var23 (ref), var3 (ref), eventStreamConstantsModule (copy), var4 (ref)
		if not var23 then
			var3.authEventAnalytics.reportModalActionWithSection(var3.eventContext, eventStreamConstantsModule.Field.TermsOfService, "", var3.origin, var4)
			var3.showWebpage("https://en.help.roblox.com/hc/articles/9483830673556-Roblox-SMS-Terms-of-Service")
		end
	end
	
	local function navigateToPrivacy()
		-- upvalues: var23 (ref), var3 (ref), eventStreamConstantsModule (copy), var4 (ref)
		if not var23 then
			var3.authEventAnalytics.reportModalActionWithSection(var3.eventContext, eventStreamConstantsModule.Field.PrivacyPolicy, "", var3.origin, var4)
			var3.showWebpage("https://en.help.roblox.com/hc/articles/115004630823")
		end
	end
	
	local var35 = function(p2)
		-- upvalues: var23 (ref), var17 (ref), var7 (ref)
		if not var23 then
			var17("")
			var7(p2.Text)
		end
	end
	
	local var36 = function()
		-- upvalues: var3 (ref), eventStreamConstantsModule (copy), phoneVerificationUpsellStateModule (copy)
		var3.authEventAnalytics.reportInteractWithActionAndSection(var3.eventContext, eventStreamConstantsModule.Field.CountryPrefix, eventStreamConstantsModule.ActionType.Focus, var3.origin, "", phoneVerificationUpsellStateModule.AddPhone)
	end
	
	local var37 = function()
		-- upvalues: var3 (ref), eventStreamConstantsModule (copy), phoneVerificationUpsellStateModule (copy), identityProtocol (copy), var4 (ref), getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (copy), var8 (ref), t (copy), var7 (ref)
		var3.authEventAnalytics.reportInteractWithActionAndSection(var3.eventContext, eventStreamConstantsModule.Field.PhoneNumber, eventStreamConstantsModule.ActionType.Focus, var3.origin, "", phoneVerificationUpsellStateModule.AddPhone)
		
		if not var3.shouldAutofillAndroidPhoneNumberAtLaunch then
			local default = identityProtocol.default
			default:supportsGetPhoneNumber():andThen(function(p2)
				-- upvalues: var3 (copy), var4 (copy), default (ref), getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (copy), var8 (copy), t (copy), var7 (copy)
				print("PhoneVerification: Autofill phone number supported: {}!", p2)
				
				if not p2 then return end
				var3.authEventAnalytics.reportModalActionWithSection(var3.eventContext, "phoneAutofillEligible", "autofill", var3.origin, var4)
				local phoneNumber = default:getPhoneNumber()
				
				if phoneNumber then
					phoneNumber:andThen(function(p3)
						-- upvalues: getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (copy), var8 (copy), t (copy), var3 (copy), var4 (copy), var7 (copy)
						if not p3 or p3 == "" then
							var3.authEventAnalytics.reportModalActionWithSection(var3.eventContext, "phoneAutofillNull", "autofill", var3.origin, var4)
							
							return
						end
						local var38, var39 = getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule(p3, var8.prefix)
						
						if var38 == t.prefix then
							var3.authEventAnalytics.reportModalActionWithSection(var3.eventContext, "phoneAutofillUSFound", "autofill", var3.origin, var4)
						end
						var7(var39)
						var3.authEventAnalytics.reportModalActionWithSection(var3.eventContext, "phoneAutofillSuccess", "autofill", var3.origin, var4)
					end)
					
					return
				end
			end)
		end
	end
	
	local var38 = debounceModule(function(p2)
		-- upvalues: var15 (ref)
		var15(p2)
	end, 0.5)
	
	local var39 = function(p2)
		-- upvalues: var12 (ref), var19 (ref), var13 (ref), var38 (ref)
		local substring = string.sub(p2.Text, 1, 6)
		
		if substring ~= var12 then
			var19("")
		end
		var13(substring)
		var38(substring)
	end
	
	local var40 = function()
		-- upvalues: var3 (ref), eventStreamConstantsModule (copy), phoneVerificationUpsellStateModule (copy)
		var3.authEventAnalytics.reportInteractWithActionAndSection(var3.eventContext, eventStreamConstantsModule.Field.VerificationCode, eventStreamConstantsModule.ActionType.Focus, var3.origin, "", phoneVerificationUpsellStateModule.VerifyPhone)
	end
	
	reactModule.useEffect(function()
		-- upvalues: var14 (ref), handleVerifyPhone (ref)
		if string.len(var14) == 6 then
			handleVerifyPhone()
		end
	end, { var14 })
	reactModule.useEffect(function()
		-- upvalues: var21 (ref), var3 (ref), phoneVerificationUpsellStateModule (copy)
		if var21 then
			var3.setIsPhoneVerified({ isPhoneVerified = true })
			var3.authEventAnalytics.reportModalShownWithSection(var3.eventContext, var3.origin, phoneVerificationUpsellStateModule.Success)
			var3.onSuccess()
		end
	end, { var21 })
	
	return reactModule.createElement(if getFFlagPhoneUseParentSizeForScreenSizeModule() then "Frame" else reactModule.Fragment, if getFFlagPhoneUseParentSizeForScreenSizeModule() then {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		[roactModule.Change.AbsoluteSize] = function(p2)
			-- upvalues: var30 (ref)
			var30(p2.AbsoluteSize)
		end
	} else nil, {
		Entry = var4 == phoneVerificationUpsellStateModule.Entry and (var3.entryConfig and reactModule.createElement(entryViewModule, {
			screenSize = if getFFlagPhoneUseParentSizeForScreenSizeModule() then var29 else var34,
			onClose = handleCloseClick,
			titleKey = var3.entryConfig.titleKey,
			descriptionKey = var3.entryConfig.descriptionKey,
			buttonKey = var3.entryConfig.buttonKey,
			onButtonClick = proceedToAddPhone,
			extraButtonKey = var3.entryConfig.extraButtonConfig.extraButtonKey,
			onExtraButtonClick = var3.entryConfig.extraButtonConfig.onExtraButtonClick
		})),
		AddPhone = var4 == phoneVerificationUpsellStateModule.AddPhone and reactModule.createElement(addPhoneViewModule, {
			screenSize = if getFFlagPhoneUseParentSizeForScreenSizeModule() then var29 else var34,
			countryCode = var8,
			setCountryCode = var9,
			phoneNumber = var6,
			errorMessage = var16,
			isDisabled = var23,
			onPhoneNumberTextChange = var35,
			onSetPhoneNumber = handleSetPhone,
			onClose = handleCloseClick,
			onTermsOfUseClick = navigateToSMSTerms,
			onPrivacyPolicyClick = navigateToPrivacy,
			onPhoneInputFocus = var37,
			onCountryCodeSelectorClick = var36,
			isKeyboardShowing = var25,
			keyboardHeight = var27,
			usePhoneNumberTextType = getFFlagLuaUsePhoneNumberTextTypeForPhoneUpsellModule() and var3.isPhoneNumberTextTypeEnabled,
			titleKey = var3.addPhoneTitleKey,
			descriptionKey = var3.addPhoneDescriptionKey,
			buttonKey = var3.addPhoneButtonKey,
			legalTextKey = var3.addPhoneLegalTextKey,
			extraButtonKey = var3.extraButtonTextKey,
			onExtraButtonClick = var3.onExtraButtonClick,
			alwaysShowLegalText = var3.alwaysShowAddPhoneLegalText,
			requireLegalTextCheckbox = var3.requireAddPhoneLegalTextCheckbox
		}),
		VerifyPhone = var4 == phoneVerificationUpsellStateModule.VerifyPhone and reactModule.createElement(verifyPhoneViewModule, {
			screenSize = if getFFlagPhoneUseParentSizeForScreenSizeModule() then var29 else var34,
			phoneNumber = var6,
			prefix = var8.prefix,
			code = var12,
			errorMessage = var18,
			onCodeTextChange = var39,
			onResendPhoneCode = handleResendCode,
			onClose = handleCloseClick,
			returnToAddPhone = returnToAddPhone,
			onCodeInputFocus = var40,
			isKeyboardShowing = var25,
			keyboardHeight = var27,
			useOTPInputType = var3.isOTPInputTypeEnabled,
			extraButtonKey = var3.verifyPhoneExtraButtonKey,
			onExtraButtonClick = var3.onVerifyPhoneExtraButtonClick
		}),
		LoadingOverlay = var20 and reactModule.createElement(phoneVerificationStatusOverlayModule, {
			image = reactModule.createElement(loading, {
				size = iconSize.Large,
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5)
			}),
			text = var32.verifyingKey
		})
	})
end)

if fFlagUseSignalsForCountryCodeList then
	local var34 = var2
	var2 = reactModule.memo(function(p2)
		-- upvalues: useSignalState (ref), getCountryCodeListStore (ref), reactModule (ref), var34 (ref), cryoModule (ref)
		return reactModule.createElement(var34, cryoModule.Dictionary.union(p2, {
			countryCodeList = useSignalState(getCountryCodeListStore(false).getCountryCodeList)
		}))
	end)
end
return roactAppExperimentModule.connectUserLayer({
	getFStringAndroidPhoneVerificationLayer(),
	getFStringIOSPhoneVerificationLayer()
}, function(p2, _)
	-- upvalues: getFStringAndroidPhoneVerificationLayer (ref), getFStringIOSPhoneVerificationLayer (ref)
	local var35 = p2[getFStringAndroidPhoneVerificationLayer()] or {}
	local var36 = p2[getFStringIOSPhoneVerificationLayer()] or {}
	
	return {
		isAutofillPhoneNumberEnabled = var35.IsAutofillPhoneNumberEnabled,
		isAutofillSMSOtpEnabled = var35.IsAutofillSMSOtpEnabled,
		isOTPInputTypeEnabled = var36.IsAutofillSMSOtpEnabled,
		isPhoneNumberTextTypeEnabled = var36.IsAutofillPhoneNumberEnabled
	}
end)(roactServices.connect({
	networking = roactNetworking,
	authEventAnalytics = roactAnalyticsAuthEventsModule
})(var2))