local phoneUpsell = script:FindFirstAncestor("PhoneUpsell")
local parent = phoneUpsell.Parent
local userInputService = game:GetService("UserInputService")
local reactModule = require(parent.React)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useSignalState = require(parent.SignalsReact).useSignalState
local fFlagUseSignalsForCountryCodeList = require(parent.SharedFlags).FFlagUseSignalsForCountryCodeList
local getCountryCodeListStore = require(parent.AuthCommon).Stores.GetCountryCodeListStore
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
	alwaysShowAddPhoneLegalText = false,
	requireAddPhoneLegalTextCheckbox = false,
	onSuccess = var1,
	onFailure = var1,
	onCancelled = var1,
	onExtraButtonClick = var1,
	closeUpsell = var1,
	showWebpage = function(_) end
}

return function(p1)
	-- upvalues: mergePropsModule (ref), t_1 (ref), fFlagUseSignalsForCountryCodeList (ref), useSignalState (ref), getCountryCodeListStore (ref), useSelector (ref), useDispatch (ref), setPhoneNumberModule (ref), verifyPhoneCodeModule (ref), resendPhoneCodeModule (ref), setIsPhoneVerified (ref), useRoactService (ref), roactNetworking (ref), roactAnalyticsAuthEventsModule (ref), useUserExperiment (ref), getFStringAndroidPhoneVerificationLayer (ref), getFStringIOSPhoneVerificationLayer (ref), reactModule (ref), phoneVerificationUpsellStateModule (ref), t (ref), useLocalization (ref), identityProtocol (ref), getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (ref), userInputService (ref), getFFlagAddMorePhoneUpsellEvents (ref), eventStreamConstantsModule (ref), constantsModule (ref), debounceModule (ref), getFFlagPhoneUseParentSizeForScreenSizeModule (ref)
	local var2 = mergePropsModule(t_1, p1)
	local var3 = if fFlagUseSignalsForCountryCodeList then useSignalState(getCountryCodeListStore(false).getCountryCodeList) else useSelector(function(p2)
		return p2.CountryCodeList
	end)
	local var4 = useDispatch()
	
	local _ = function(p2, p3, p4, p5)
		-- upvalues: var4 (ref), setPhoneNumberModule (copy)
		return var4(setPhoneNumberModule(p2, p3, p4, p5, nil))
	end
	
	local _ = function(p2, p3)
		-- upvalues: var4 (ref), verifyPhoneCodeModule (copy)
		return var4(verifyPhoneCodeModule(p2, p3))
	end
	
	local _ = function(p2)
		-- upvalues: var4 (ref), resendPhoneCodeModule (copy)
		return var4(resendPhoneCodeModule(p2))
	end
	
	local _ = function(p2)
		-- upvalues: var4 (ref), setIsPhoneVerified (copy)
		return var4(setIsPhoneVerified(p2))
	end
	
	local var5 = useRoactService(roactNetworking)
	local var6 = useRoactService(roactAnalyticsAuthEventsModule)
	local var7, var8, var9, var10 = useUserExperiment({
		getFStringAndroidPhoneVerificationLayer(),
		getFStringIOSPhoneVerificationLayer()
	}, function(p2)
		-- upvalues: getFStringAndroidPhoneVerificationLayer (copy), getFStringIOSPhoneVerificationLayer (copy)
		local var11 = p2[getFStringAndroidPhoneVerificationLayer()] or {}
		local var12 = p2[getFStringIOSPhoneVerificationLayer()] or {}
		
		return var11.IsAutofillPhoneNumberEnabled, var11.IsAutofillSMSOtpEnabled, var12.IsAutofillSMSOtpEnabled, var12.IsAutofillPhoneNumberEnabled
	end)
	local var11, var12 = reactModule.useState(if var2.entryConfig then phoneVerificationUpsellStateModule.Entry else phoneVerificationUpsellStateModule.AddPhone)
	local var13, var14 = reactModule.useState("")
	local var15, var16 = reactModule.useState(t)
	local var17, var18 = reactModule.useState(false)
	local var19, var20 = reactModule.useState("")
	local var21, var22 = reactModule.useState("")
	local var23, var24 = reactModule.useState("")
	local var25, var26 = reactModule.useState("")
	local var27, _ = reactModule.useState(false)
	local var28, var29 = reactModule.useState(false)
	local var30, var31 = reactModule.useState(false)
	local var32, var33 = reactModule.useState(false)
	local var34, var35 = reactModule.useState(0)
	local var36, var37 = reactModule.useState(Vector2.new(400, 400))
	local var38 = reactModule.useRef(false)
	local var39 = useLocalization({
		verifyingKey = "Feature.VerificationUpsell.Label.Verifying",
		invalidPhoneFormatKey = "Feature.VerificationUpsell.Response.ErrorPhoneFormatInvalid",
		invalidPhoneNumberKey = "Feature.VerificationUpsell.Response.InvalidPhoneNumberError",
		invalidVerificationCodeKey = "Feature.VerificationUpsell.Message.InvalidSmsCode",
		tooManyAccountsKey = "Feature.VerificationUpsell.Response.PhoneHasTooManyAssociatedAccounts",
		tooManyAttemptsKey = "Feature.VerificationUpsell.Response.TooManyAttemptsTryAgainLater",
		genericErrorKey = "Feature.VerificationUpsell.Response.ErrorTryAgain"
	})
	local var40 = nil
	reactModule.useEffect(function()
		-- upvalues: var17 (ref), var3 (ref), var16 (ref), var18 (ref)
		if not var17 and var3 and #var3 > 0 then
			for i, v in var3 do
				if v.isDefault then
					var16(v)
				end
			end
			var18(true)
		end
	end, { var3, var17 })
	
	local _ = function()
		-- upvalues: identityProtocol (copy), var6 (ref), var2 (ref), var11 (ref), getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (copy), var15 (ref), t (copy), var14 (ref)
		local default = identityProtocol.default
		default:supportsGetPhoneNumber():andThen(function(p2)
			-- upvalues: var6 (copy), var2 (copy), var11 (copy), default (ref), getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (copy), var15 (copy), t (copy), var14 (copy)
			print("PhoneVerification: Autofill phone number supported: {}!", p2)
			
			if not p2 then return end
			var6.reportModalActionWithSection(var2.eventContext, "phoneAutofillEligible", "autofill", var2.origin, var11)
			local phoneNumber = default:getPhoneNumber()
			
			if phoneNumber then
				phoneNumber:andThen(function(p3)
					-- upvalues: getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (copy), var15 (copy), t (copy), var6 (copy), var2 (copy), var11 (copy), var14 (copy)
					if not p3 or p3 == "" then
						var6.reportModalActionWithSection(var2.eventContext, "phoneAutofillNull", "autofill", var2.origin, var11)
						
						return
					end
					local var41, var42 = getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule(p3, var15.prefix)
					
					if var41 == t.prefix then
						var6.reportModalActionWithSection(var2.eventContext, "phoneAutofillUSFound", "autofill", var2.origin, var11)
					end
					var14(var42)
					var6.reportModalActionWithSection(var2.eventContext, "phoneAutofillSuccess", "autofill", var2.origin, var11)
				end)
				
				return
			end
		end)
	end
	
	local _ = function()
		-- upvalues: identityProtocol (copy), var6 (ref), var2 (ref), var11 (ref), var20 (ref), var22 (ref)
		local default = identityProtocol.default
		default:supportsGetSMSOTP():andThen(function(p2)
			-- upvalues: var6 (copy), var2 (copy), var11 (copy), default (ref), var20 (copy), var22 (copy)
			print("PhoneVerification: Autofill OTP supported: {}!", p2)
			
			if p2 then
				var6.reportModalActionWithSection(var2.eventContext, "codeAutofillEligible", "autofill", var2.origin, var11)
				local SMSOTP = default:getSMSOTP()
				
				if SMSOTP then
					SMSOTP:andThen(function(p3)
						-- upvalues: var20 (copy), var22 (copy), var6 (copy), var2 (copy), var11 (copy)
						if p3 and p3 ~= "" then
							var20(p3)
							var22(p3)
							var6.reportModalActionWithSection(var2.eventContext, "codeAutofillSuccess", "autofill", var2.origin, var11)
						end
					end)
				end
			end
		end)
	end
	
	reactModule.useEffect(function()
		-- upvalues: var38 (ref), var28 (ref)
		return function()
			-- upvalues: var38 (copy), var28 (copy)
			var38.current = var28
		end
	end, { var28 })
	reactModule.useEffect(function()
		-- upvalues: var40 (write), userInputService (copy), var33 (ref), var35 (ref), var6 (ref), var2 (ref), getFFlagAddMorePhoneUpsellEvents (copy), var11 (ref), phoneVerificationUpsellStateModule (copy), var7 (ref), identityProtocol (copy), getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (copy), var15 (ref), t (copy), var14 (ref), var38 (ref)
		var40 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function()
			-- upvalues: var33 (copy), userInputService (copy), var35 (copy)
			var33(userInputService.OnScreenKeyboardVisible)
			var35(if userInputService.OnScreenKeyboardVisible then userInputService.OnScreenKeyboardSize.Y else 0)
		end)
		var6.reportModalShownWithSection(var2.eventContext, var2.origin, if getFFlagAddMorePhoneUpsellEvents() then var11 else phoneVerificationUpsellStateModule.AddPhone)
		
		if var7 then
			local default = identityProtocol.default
			default:supportsGetPhoneNumber():andThen(function(p2)
				-- upvalues: var6 (copy), var2 (copy), var11 (copy), default (ref), getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (copy), var15 (copy), t (copy), var14 (copy)
				print("PhoneVerification: Autofill phone number supported: {}!", p2)
				
				if not p2 then return end
				var6.reportModalActionWithSection(var2.eventContext, "phoneAutofillEligible", "autofill", var2.origin, var11)
				local phoneNumber = default:getPhoneNumber()
				
				if phoneNumber then
					phoneNumber:andThen(function(p3)
						-- upvalues: getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (copy), var15 (copy), t (copy), var6 (copy), var2 (copy), var11 (copy), var14 (copy)
						if not p3 or p3 == "" then
							var6.reportModalActionWithSection(var2.eventContext, "phoneAutofillNull", "autofill", var2.origin, var11)
							
							return
						end
						local var41, var42 = getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule(p3, var15.prefix)
						
						if var41 == t.prefix then
							var6.reportModalActionWithSection(var2.eventContext, "phoneAutofillUSFound", "autofill", var2.origin, var11)
						end
						var14(var42)
						var6.reportModalActionWithSection(var2.eventContext, "phoneAutofillSuccess", "autofill", var2.origin, var11)
					end)
					
					return
				end
			end)
		end
		return function()
			-- upvalues: var40 (copy), var38 (copy), var2 (copy)
			if var40 then
				var40:Disconnect()
			end
			var40 = nil
			
			if not var38.current then
				var2.onCancelled()
			end
		end
	end, {})
	local var41 = useSelector(function(p2)
		return p2.ScreenSize
	end)
	
	local function handleCloseClick()
		-- upvalues: var6 (ref), var2 (ref), var11 (ref)
		var6.reportModalDismissedWithSection(var2.eventContext, var2.origin, var11)
		var2.closeUpsell()
	end
	
	local function _(p2)
		-- upvalues: var39 (ref)
		return if p2 == 2 then var39.invalidPhoneFormatKey elseif p2 == 6 then var39.tooManyAttemptsKey elseif p2 == 7 then var39.invalidVerificationCodeKey elseif p2 == 8 then var39.invalidPhoneNumberKey elseif p2 == 9 then var39.tooManyAccountsKey else var39.genericErrorKey
	end
	
	local function handleSetPhone()
		-- upvalues: var31 (ref), var5 (ref), var15 (ref), var13 (ref), var4 (ref), setPhoneNumberModule (copy), var12 (ref), phoneVerificationUpsellStateModule (copy), var6 (ref), var2 (ref), var8 (ref), identityProtocol (copy), var11 (ref), var20 (ref), var22 (ref), eventStreamConstantsModule (copy), var24 (ref), var39 (ref)
		var31(true)
		local var42 = var4(setPhoneNumberModule(var5, var15.code, var15.prefix, var13, nil))
		
		if var42 then
			var42:andThen(function()
				-- upvalues: var12 (copy), phoneVerificationUpsellStateModule (copy), var31 (copy), var6 (copy), var2 (copy), var8 (copy), identityProtocol (copy), var11 (copy), var20 (copy), var22 (copy)
				var12(phoneVerificationUpsellStateModule.VerifyPhone)
				var31(false)
				var6.reportModalShownWithSection(var2.eventContext, var2.origin, phoneVerificationUpsellStateModule.VerifyPhone)
				
				if var8 then
					local default = identityProtocol.default
					default:supportsGetSMSOTP():andThen(function(p2)
						-- upvalues: var6 (copy), var2 (copy), var11 (copy), default (ref), var20 (copy), var22 (copy)
						print("PhoneVerification: Autofill OTP supported: {}!", p2)
						
						if p2 then
							var6.reportModalActionWithSection(var2.eventContext, "codeAutofillEligible", "autofill", var2.origin, var11)
							local SMSOTP = default:getSMSOTP()
							
							if SMSOTP then
								SMSOTP:andThen(function(p3)
									-- upvalues: var20 (copy), var22 (copy), var6 (copy), var2 (copy), var11 (copy)
									if p3 and p3 ~= "" then
										var20(p3)
										var22(p3)
										var6.reportModalActionWithSection(var2.eventContext, "codeAutofillSuccess", "autofill", var2.origin, var11)
									end
								end)
							end
						end
					end)
				end
			end):catch(function(p2)
				-- upvalues: var6 (copy), var2 (copy), eventStreamConstantsModule (copy), phoneVerificationUpsellStateModule (copy), var24 (copy), var39 (copy), var31 (copy)
				if not p2 then
					var6.reportModalShownWithSectionAndError(var2.eventContext, eventStreamConstantsModule.Field.ErrorMessage, var2.origin, phoneVerificationUpsellStateModule.AddPhone, "")
					var24(var39.genericErrorKey)
				elseif p2.PhoneRegexFailed then
					var6.reportModalShownWithSectionAndError(var2.eventContext, eventStreamConstantsModule.Field.ErrorMessage, var2.origin, phoneVerificationUpsellStateModule.AddPhone, "")
					var24(var39.invalidPhoneFormatKey)
				else
					var6.reportModalShownWithSectionAndError(var2.eventContext, eventStreamConstantsModule.Field.ErrorMessage, var2.origin, phoneVerificationUpsellStateModule.AddPhone, p2.ErrorCode)
					local errorCode = p2.ErrorCode
					var24(if errorCode == 2 then var39.invalidPhoneFormatKey elseif errorCode == 6 then var39.tooManyAttemptsKey elseif errorCode == 7 then var39.invalidVerificationCodeKey elseif errorCode == 8 then var39.invalidPhoneNumberKey elseif errorCode == 9 then var39.tooManyAccountsKey else var39.genericErrorKey)
				end
				var31(false)
			end)
		end
		var6.reportInteractWithActionAndSection(var2.eventContext, "", "", var2.origin, eventStreamConstantsModule.Button.Continue, phoneVerificationUpsellStateModule.AddPhone)
	end
	
	local function handleVerifyPhone()
		-- upvalues: var31 (ref), var5 (ref), var21 (ref), var4 (ref), verifyPhoneCodeModule (copy), var29 (ref), var6 (ref), var2 (ref), eventStreamConstantsModule (copy), phoneVerificationUpsellStateModule (copy), var26 (ref), var39 (ref)
		var31(true)
		local var42 = var4(verifyPhoneCodeModule(var5, var21))
		
		if var42 then
			var42:andThen(function()
				-- upvalues: var29 (copy)
				var29(true)
			end):catch(function(p2)
				-- upvalues: var6 (copy), var2 (copy), eventStreamConstantsModule (copy), phoneVerificationUpsellStateModule (copy), var26 (copy), var39 (copy), var31 (copy)
				if p2 then
					var6.reportModalShownWithSectionAndError(var2.eventContext, eventStreamConstantsModule.Field.ErrorMessage, var2.origin, phoneVerificationUpsellStateModule.VerifyPhone, p2.ErrorCode)
					local errorCode = p2.ErrorCode
					var26(if errorCode == 2 then var39.invalidPhoneFormatKey elseif errorCode == 6 then var39.tooManyAttemptsKey elseif errorCode == 7 then var39.invalidVerificationCodeKey elseif errorCode == 8 then var39.invalidPhoneNumberKey elseif errorCode == 9 then var39.tooManyAccountsKey else var39.genericErrorKey)
				else
					var6.reportModalShownWithSectionAndError(var2.eventContext, eventStreamConstantsModule.Field.ErrorMessage, var2.origin, phoneVerificationUpsellStateModule.VerifyPhone, "")
					var26(var39.genericErrorKey)
				end
				var31(false)
			end)
		end
		var6.reportInteractWithActionAndSection(var2.eventContext, "", "", var2.origin, eventStreamConstantsModule.Button.AutoSubmit, phoneVerificationUpsellStateModule.VerifyPhone)
	end
	
	local function handleResendCode()
		-- upvalues: var26 (ref), var5 (ref), var4 (ref), resendPhoneCodeModule (copy), var6 (ref), var2 (ref), eventStreamConstantsModule (copy), phoneVerificationUpsellStateModule (copy), var39 (ref)
		var26("")
		local var42 = var4(resendPhoneCodeModule(var5))
		
		if var42 then
			var42:andThen(function() end):catch(function(p2)
				-- upvalues: var6 (copy), var2 (copy), eventStreamConstantsModule (copy), phoneVerificationUpsellStateModule (copy), var26 (copy), var39 (copy)
				if p2 then
					var6.reportModalShownWithSectionAndError(var2.eventContext, eventStreamConstantsModule.Field.ErrorMessage, var2.origin, phoneVerificationUpsellStateModule.VerifyPhone, p2.ErrorCode)
					local errorCode = p2.ErrorCode
					var26(if errorCode == 2 then var39.invalidPhoneFormatKey elseif errorCode == 6 then var39.tooManyAttemptsKey elseif errorCode == 7 then var39.invalidVerificationCodeKey elseif errorCode == 8 then var39.invalidPhoneNumberKey elseif errorCode == 9 then var39.tooManyAccountsKey else var39.genericErrorKey)
					
					return
				end
				var6.reportModalShownWithSectionAndError(var2.eventContext, eventStreamConstantsModule.Field.ErrorMessage, var2.origin, phoneVerificationUpsellStateModule.VerifyPhone, "")
				var26(var39.genericErrorKey)
			end)
		end
		var6.reportInteractWithActionAndSection(var2.eventContext, "", "", var2.origin, eventStreamConstantsModule.Button.ResendCode, phoneVerificationUpsellStateModule.VerifyPhone)
	end
	
	local function returnToAddPhone()
		-- upvalues: var12 (ref), phoneVerificationUpsellStateModule (copy), var6 (ref), var2 (ref), eventStreamConstantsModule (copy)
		var12(phoneVerificationUpsellStateModule.AddPhone)
		var6.reportInteractWithActionAndSection(var2.eventContext, "", "", var2.origin, eventStreamConstantsModule.Button.ChangePhoneNumber, phoneVerificationUpsellStateModule.VerifyPhone)
	end
	
	local function proceedToAddPhone()
		-- upvalues: var12 (ref), phoneVerificationUpsellStateModule (copy), var6 (ref), var2 (ref), eventStreamConstantsModule (copy)
		var12(phoneVerificationUpsellStateModule.AddPhone)
		var6.reportInteractWithActionAndSection(var2.eventContext, "", "", var2.origin, eventStreamConstantsModule.Button.Continue, phoneVerificationUpsellStateModule.Entry)
	end
	
	local function navigateToSMSTerms()
		-- upvalues: var30 (ref), var6 (ref), var2 (ref), eventStreamConstantsModule (copy), var11 (ref), constantsModule (copy)
		if not var30 then
			var6.reportModalActionWithSection(var2.eventContext, eventStreamConstantsModule.Field.TermsOfService, "", var2.origin, var11)
			var2.showWebpage(constantsModule.TERMS_OF_SERVICE_URL)
		end
	end
	
	local function navigateToPrivacy()
		-- upvalues: var30 (ref), var6 (ref), var2 (ref), eventStreamConstantsModule (copy), var11 (ref), constantsModule (copy)
		if not var30 then
			var6.reportModalActionWithSection(var2.eventContext, eventStreamConstantsModule.Field.PrivacyPolicy, "", var2.origin, var11)
			var2.showWebpage(constantsModule.PRIVACY_POLICY_URL)
		end
	end
	
	local var42 = function(p2)
		-- upvalues: var30 (ref), var24 (ref), var14 (ref)
		if not var30 then
			var24("")
			var14(p2.Text)
		end
	end
	
	local var43 = function()
		-- upvalues: var6 (ref), var2 (ref), eventStreamConstantsModule (copy), phoneVerificationUpsellStateModule (copy)
		var6.reportInteractWithActionAndSection(var2.eventContext, eventStreamConstantsModule.Field.CountryPrefix, eventStreamConstantsModule.ActionType.Focus, var2.origin, "", phoneVerificationUpsellStateModule.AddPhone)
	end
	
	local var44 = function()
		-- upvalues: var6 (ref), var2 (ref), eventStreamConstantsModule (copy), phoneVerificationUpsellStateModule (copy), identityProtocol (copy), var11 (ref), getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (copy), var15 (ref), t (copy), var14 (ref)
		var6.reportInteractWithActionAndSection(var2.eventContext, eventStreamConstantsModule.Field.PhoneNumber, eventStreamConstantsModule.ActionType.Focus, var2.origin, "", phoneVerificationUpsellStateModule.AddPhone)
		
		if not var2.shouldAutofillAndroidPhoneNumberAtLaunch then
			local default = identityProtocol.default
			default:supportsGetPhoneNumber():andThen(function(p2)
				-- upvalues: var6 (copy), var2 (copy), var11 (copy), default (ref), getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (copy), var15 (copy), t (copy), var14 (copy)
				print("PhoneVerification: Autofill phone number supported: {}!", p2)
				
				if not p2 then return end
				var6.reportModalActionWithSection(var2.eventContext, "phoneAutofillEligible", "autofill", var2.origin, var11)
				local phoneNumber = default:getPhoneNumber()
				
				if phoneNumber then
					phoneNumber:andThen(function(p3)
						-- upvalues: getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule (copy), var15 (copy), t (copy), var6 (copy), var2 (copy), var11 (copy), var14 (copy)
						if not p3 or p3 == "" then
							var6.reportModalActionWithSection(var2.eventContext, "phoneAutofillNull", "autofill", var2.origin, var11)
							
							return
						end
						local var45, var46 = getPrefixAndNationalNumberFromRawPhoneAndDefaultPrefixModule(p3, var15.prefix)
						
						if var45 == t.prefix then
							var6.reportModalActionWithSection(var2.eventContext, "phoneAutofillUSFound", "autofill", var2.origin, var11)
						end
						var14(var46)
						var6.reportModalActionWithSection(var2.eventContext, "phoneAutofillSuccess", "autofill", var2.origin, var11)
					end)
					
					return
				end
			end)
		end
	end
	
	local var45 = debounceModule(function(p2)
		-- upvalues: var22 (ref)
		var22(p2)
	end, 0.5)
	
	local var46 = function(p2)
		-- upvalues: var19 (ref), var26 (ref), var20 (ref), var45 (ref)
		local substring = string.sub(p2.Text, 1, 6)
		
		if substring ~= var19 then
			var26("")
		end
		var20(substring)
		var45(substring)
	end
	
	local var47 = function()
		-- upvalues: var6 (ref), var2 (ref), eventStreamConstantsModule (copy), phoneVerificationUpsellStateModule (copy)
		var6.reportInteractWithActionAndSection(var2.eventContext, eventStreamConstantsModule.Field.VerificationCode, eventStreamConstantsModule.ActionType.Focus, var2.origin, "", phoneVerificationUpsellStateModule.VerifyPhone)
	end
	
	reactModule.useEffect(function()
		-- upvalues: var21 (ref), handleVerifyPhone (ref)
		if string.len(var21) == 6 then
			handleVerifyPhone()
		end
	end, { var21 })
	reactModule.useEffect(function()
		-- upvalues: var28 (ref), var4 (ref), setIsPhoneVerified (copy), var6 (ref), var2 (ref), phoneVerificationUpsellStateModule (copy)
		if var28 then
			local _ = var4(setIsPhoneVerified({ isPhoneVerified = true }))
			var6.reportModalShownWithSection(var2.eventContext, var2.origin, phoneVerificationUpsellStateModule.Success)
			var2.onSuccess()
		end
	end, { var28 })
	
	return {
		phoneUpsellState = var11,
		screenSize = if getFFlagPhoneUseParentSizeForScreenSizeModule() then var36 else var41,
		setParentSize = var37,
		handleCloseClick = handleCloseClick,
		proceedToAddPhone = proceedToAddPhone,
		countryCode = var15,
		setCountryCode = var16,
		phoneNumber = var13,
		addPhoneErrorMessage = var23,
		isDisabled = var30,
		onPhoneNumberTextChange = var42,
		handleSetPhone = handleSetPhone,
		navigateToSMSTerms = navigateToSMSTerms,
		navigateToPrivacy = navigateToPrivacy,
		onPhoneInputFocus = var44,
		onCountryCodeSelectorClick = var43,
		isKeyboardShowing = var32,
		onScreenKeyboardHeight = var34,
		code = var19,
		verifyPhoneErrorMessage = var25,
		onCodeTextChange = var46,
		handleResendCode = handleResendCode,
		returnToAddPhone = returnToAddPhone,
		onCodeInputFocus = var47,
		isLoading = var27,
		verifyingKey = var39.verifyingKey,
		isOTPInputTypeEnabled = var9,
		isPhoneNumberTextTypeEnabled = var10
	}
end