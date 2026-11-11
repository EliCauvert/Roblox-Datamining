local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local React = DependenciesModule.React
local RoactServiceTags = DependenciesModule.RoactServiceTags
local RobloxAppHooks = DependenciesModule.RobloxAppHooks
local UseLocalizationFunction = DependenciesModule.Localization.Hooks.useLocalization
local NavigateDownFunction = DependenciesModule.NavigationRodux.Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = DependenciesModule.SharedFlags.FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent1.RobloxAppNavigation).NavigationCommands else nil
local CloseCentralOverlayFunction = DependenciesModule.CentralOverlay.Thunks.CloseCentralOverlay
local UserInputService = game:GetService("UserInputService")
local _ = require(Parent.Common.otpLoginTypes)
local OtpLoginConstantsModule = require(Parent.Common.otpLoginConstants)
local IsStringValidEmailModule = require(Parent.Utils.isStringValidEmail)
local DebounceModule = require(Parent.Utils.debounce)
local EnterEmailViewModule = require(script.Parent.EnterEmailView)
local EnterCodeViewModule = require(script.Parent.EnterCodeView)
local SendCodeModule = require(Parent.Thunks.SendCode)
local ResendCodeModule = require(Parent.Thunks.ResendCode)
local AnalyticsEventsModule = require(Parent.Analytics.AnalyticsEvents)
local EventConstantsModule = require(Parent.Analytics.EventConstants)
local ShouldEnableOtpSignup = game:DefineFastFlag("ShouldEnableOtpSignup", false)
local UseStateFunction = React.useState

return (DependenciesModule.RoactRodux.connect(function(p1, _)
	return { screenSize = p1.screenSize }
end, function(Callback)
	-- upvalues: SendCodeModule (copy), ResendCodeModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), CloseCentralOverlayFunction (copy)
	return {
		sendCode = function(UseRoactServiceResult, p1)
			-- upvalues: Callback (copy), SendCodeModule (upval)
			return Callback(SendCodeModule(UseRoactServiceResult, p1))
		end,
		resendCode = function(UseRoactServiceResult, p1)
			-- upvalues: Callback (copy), ResendCodeModule (upval)
			return Callback(ResendCodeModule(UseRoactServiceResult, p1))
		end,
		navigateToPage = function(p1)
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownFunction (upval)
			return if FFlagSignalsNavP3Dispatch then NavigationCommands.down(NavigationCommands.fromLegacyPage(p1)) else Callback(NavigateDownFunction(p1))
		end,
		closeCentralOverlay = function()
			-- upvalues: Callback (copy), CloseCentralOverlayFunction (upval)
			return Callback(CloseCentralOverlayFunction())
		end
	}
end)(function(p1)
	-- upvalues: UseLocalizationFunction (copy), OtpLoginConstantsModule (copy), UseStateFunction (copy), React (copy), RobloxAppHooks (copy), RoactServiceTags (copy), AnalyticsEventsModule (copy), EventConstantsModule (copy), DebounceModule (copy), IsStringValidEmailModule (copy), ShouldEnableOtpSignup (copy), UserInputService (copy), EnterEmailViewModule (copy), EnterCodeViewModule (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		enterEmailTitle = p1.enterEmailTitleKey,
		enterEmailDescription = p1.enterEmailDescriptionKey,
		enterCodeTitle = p1.enterCodeTitleKey,
		enterCodeDescription = p1.enterCodeDescriptionKey
	})
	local UseLocalizationResult1 = UseLocalizationFunction(OtpLoginConstantsModule.errorMessageKeys)
	local SendOtp, SendOtp2 = UseStateFunction("sendOtp")
	local UseStateResult, UseStateResult2 = UseStateFunction("")
	local UseStateResult1, UseStateResult2_1 = UseStateFunction("")
	local UseStateResult3, UseStateResult2_2 = UseStateFunction("")
	local UseStateResult4, UseStateResult2_3 = UseStateFunction(false)
	local UseStateResult5, UseStateResult2_4 = UseStateFunction(false)
	local UseStateResult6, UseStateResult2_5 = UseStateFunction(0)
	local UseRefResult = React.useRef(false)
	local UseRoactServiceResult = RobloxAppHooks.useRoactService(RoactServiceTags.RoactNetworking)
	local Connection = nil
	local UseResult = React.useCallback(function()
		-- upvalues: AnalyticsEventsModule (upval), EventConstantsModule (upval), p1 (copy), SendOtp2 (copy)
		AnalyticsEventsModule.sendButtonClickEvent(EventConstantsModule.ctx.enterOtp, p1.origin, EventConstantsModule.btn.changeEmail)
		SendOtp2("sendOtp")
	end, { SendOtp2, p1.origin })
	local UseResult1 = React.useCallback(function()
		-- upvalues: p1 (copy)
		p1.navigateToPage({
			name = "GenericWebPage",
			detail = "https://en.help.roblox.com/hc/articles/11014749736980",
			extraProps = { title = "", transitionAnimation = "SlideInFromBottom" }
		})
	end, { p1.navigateToPage })
	local UseResult2 = React.useCallback(function()
		-- upvalues: UseStateResult2_2 (copy)
		UseStateResult2_2("")
	end, { UseStateResult2_2 })
	local UseResult3 = React.useCallback(DebounceModule(function(p2)
		-- upvalues: AnalyticsEventsModule (upval), EventConstantsModule (upval), p1 (copy), UseResult2 (copy), UseStateResult2 (copy), IsStringValidEmailModule (upval), UseStateResult2_2 (copy), UseLocalizationResult1 (copy)
		AnalyticsEventsModule.sendFormInteractionEvent(EventConstantsModule.ctx.sendOtp, p1.origin, EventConstantsModule.field.email)
		UseResult2()
		
		if p2.Text then
			UseStateResult2(p2.Text)
			
			if not IsStringValidEmailModule(p2.Text) then
				UseStateResult2_2(UseLocalizationResult1.InvalidEmail)
			end
		end
	end, 0.5), { UseStateResult2, p1.origin })
	
	local function v43(Number)
		-- upvalues: OtpLoginConstantsModule (upval), UseLocalizationResult1 (copy), UseStateResult2_2 (copy), SendOtp (copy), AnalyticsEventsModule (upval), p1 (copy), EventConstantsModule (upval)
		local StatusCode = if Number then OtpLoginConstantsModule.statusCodeMap[Number] else nil
		
		if StatusCode and UseLocalizationResult1[StatusCode] then
			UseStateResult2_2(UseLocalizationResult1[StatusCode])
			
			if SendOtp == "sendOtp" then
				AnalyticsEventsModule.sendMsgShownEvent(SendOtp, p1.origin, EventConstantsModule.field.errorMessage, Number)
				
				return
			else
				AnalyticsEventsModule.sendMsgShownEvent(SendOtp, p1.origin, EventConstantsModule.field.resendErrorMessage, Number)
				
				return
			end
		else
			UseStateResult2_2(UseLocalizationResult1.Unknown)
			
			if SendOtp == "sendOtp" then
				AnalyticsEventsModule.sendMsgShownEvent(SendOtp, p1.origin, EventConstantsModule.field.errorMessage, 1)
				
				return
			else
				AnalyticsEventsModule.sendMsgShownEvent(SendOtp, p1.origin, EventConstantsModule.field.resendErrorMessage, 1)
			end
		end
	end
	
	local function _(p2)
		-- upvalues: OtpLoginConstantsModule (upval)
		return p2 == "signup" and OtpLoginConstantsModule.otpServiceOriginSignup or OtpLoginConstantsModule.otpServiceOrigin
	end
	
	local function v45(ContactValue)
		-- upvalues: UseStateResult2_3 (copy), p1 (copy), OtpLoginConstantsModule (upval), UseRoactServiceResult (copy), UseStateResult2_1 (copy), SendOtp2 (copy), v43 (copy)
		UseStateResult2_3(true)
		local SendCodeResult = p1.sendCode(UseRoactServiceResult, {
			origin = p1.origin == "signup" and OtpLoginConstantsModule.otpServiceOriginSignup or OtpLoginConstantsModule.otpServiceOrigin,
			contactType = OtpLoginConstantsModule.otpServiceContactType,
			contactValue = ContactValue
		})
		
		if SendCodeResult then
			SendCodeResult:andThen(function(Result)
				-- upvalues: UseStateResult2_3 (upval), UseStateResult2_1 (upval), SendOtp2 (upval)
				UseStateResult2_3(false)
				UseStateResult2_1(Result.otpSessionToken)
				SendOtp2("enterOtp")
			end):catch(function(Err)
				-- upvalues: UseStateResult2_3 (upval), v43 (upval)
				UseStateResult2_3(false)
				v43((tonumber(Err)))
			end)
		end
	end
	
	local UseResult4 = React.useCallback(function()
		-- upvalues: AnalyticsEventsModule (upval), EventConstantsModule (upval), p1 (copy), v45 (copy), UseStateResult (copy)
		AnalyticsEventsModule.sendButtonClickEvent(EventConstantsModule.ctx.sendOtp, p1.origin, EventConstantsModule.btn.sendCode)
		v45(UseStateResult)
	end, { UseStateResult, p1.origin })
	
	local function v47(OtpSessionToken)
		-- upvalues: p1 (copy), OtpLoginConstantsModule (upval), UseRoactServiceResult (copy), UseStateResult2_1 (copy), v43 (copy)
		local ResendCodeResult = p1.resendCode(UseRoactServiceResult, {
			origin = p1.origin == "signup" and OtpLoginConstantsModule.otpServiceOriginSignup or OtpLoginConstantsModule.otpServiceOrigin,
			contactType = OtpLoginConstantsModule.otpServiceContactType,
			otpSessionToken = OtpSessionToken
		})
		
		if ResendCodeResult then
			ResendCodeResult:andThen(function(Result)
				-- upvalues: UseStateResult2_1 (upval)
				UseStateResult2_1(Result.otpSessionToken)
			end):catch(function(Err)
				-- upvalues: v43 (upval)
				v43((tonumber(Err)))
			end)
		end
	end
	
	local UseResult5 = React.useCallback(function()
		-- upvalues: AnalyticsEventsModule (upval), EventConstantsModule (upval), p1 (copy), v47 (copy), UseStateResult1 (copy)
		AnalyticsEventsModule.sendButtonClickEvent(EventConstantsModule.ctx.enterOtp, p1.origin, EventConstantsModule.btn.resendCode)
		v47(UseStateResult1)
	end, { UseStateResult1, p1.origin })
	local UseResult6 = React.useCallback(function(p2)
		-- upvalues: AnalyticsEventsModule (upval), EventConstantsModule (upval), p1 (copy), UseStateResult2_3 (copy), UseRefResult (copy), UseStateResult1 (copy), ShouldEnableOtpSignup (upval), OtpLoginConstantsModule (upval), v43 (copy), UseStateResult2_2 (copy), UseLocalizationResult1 (copy)
		AnalyticsEventsModule.sendButtonClickEvent(EventConstantsModule.ctx.enterOtp, p1.origin, EventConstantsModule.btn.login)
		UseStateResult2_3(true)
		UseRefResult.current = true
		local OnSubmitCodeResult = p1.onSubmitCode(UseStateResult1, p2)
		
		if ShouldEnableOtpSignup then
			if OnSubmitCodeResult then
				if p1.origin == OtpLoginConstantsModule.otpServiceOriginSignup then
					OnSubmitCodeResult:andThen(function() end):catch(function(Err)
						-- upvalues: v43 (upval), UseRefResult (upval)
						v43((tonumber(Err)))
						UseRefResult.current = false
					end)
				end
				UseStateResult2_3(false)
				
				return
			end
		else
			OnSubmitCodeResult:andThen(function(Result)
				-- upvalues: OtpLoginConstantsModule (upval), UseStateResult2_2 (upval), UseLocalizationResult1 (upval), UseRefResult (upval), UseStateResult2_3 (upval)
				if Result and type(Result) == "string" then
					for i, errorMessageKey in OtpLoginConstantsModule.errorMessageKeys do
						if Result == errorMessageKey then
							UseStateResult2_2(UseLocalizationResult1[i])
						end
					end
					UseRefResult.current = false
				end
				UseStateResult2_3(false)
			end)
		end
	end, { UseStateResult1, p1.origin })
	
	local function OnClose()
		-- upvalues: AnalyticsEventsModule (upval), SendOtp (copy), p1 (copy), EventConstantsModule (upval)
		AnalyticsEventsModule.sendButtonClickEvent(SendOtp, p1.origin, EventConstantsModule.btn.cancel)
		p1.closeCentralOverlay()
	end
	
	React.useEffect(function()
		-- upvalues: Connection (ref), UserInputService (upval), UseStateResult2_4 (copy), UseStateResult2_5 (copy), UseRefResult (copy), p1 (copy)
		Connection = UserInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function()
			-- upvalues: UseStateResult2_4 (upval), UserInputService (upval), UseStateResult2_5 (upval)
			UseStateResult2_4(UserInputService.OnScreenKeyboardVisible)
			UseStateResult2_5(UserInputService.OnScreenKeyboardVisible and UserInputService.OnScreenKeyboardSize.Y or 0)
		end)
		
		return function()
			-- upvalues: Connection (upval), UseRefResult (upval), p1 (upval)
			if Connection then
				Connection:Disconnect()
			end
			Connection = nil
			
			if not UseRefResult.current then
				p1.onModalAbandoned()
			end
		end
	end, {})
	
	return React.createElement(React.Fragment, nil, {
		EnterEmail = SendOtp == "sendOtp" and React.createElement(EnterEmailViewModule, {
			origin = p1.origin,
			enterEmailTitle = UseLocalizationResult.enterEmailTitle,
			enterEmailDescription = UseLocalizationResult.enterEmailDescription,
			email = UseStateResult,
			onEmailTextChange = UseResult3,
			errorMessage = UseStateResult3,
			handleContinue = UseResult4,
			onClose = OnClose,
			isDisabled = UseStateResult4,
			isKeyboardShowing = UseStateResult5,
			keyboardHeight = UseStateResult6,
			screenSize = p1.screenSize
		}),
		EnterCode = SendOtp == "enterOtp" and React.createElement(EnterCodeViewModule, {
			origin = p1.origin,
			enterCodeTitle = UseLocalizationResult.enterCodeTitle,
			enterCodeDescription = UseLocalizationResult.enterCodeDescription,
			email = UseStateResult,
			errorMessage = UseStateResult3,
			clearErrorMessage = UseResult2,
			onResendCode = UseResult5,
			onSubmitCode = UseResult6,
			complianceCheckboxMessageKey = p1.complianceCheckboxMessageKey,
			returnToEnterEmail = UseResult,
			navigateToHelp = UseResult1,
			onClose = OnClose,
			isDisabled = UseStateResult4,
			isKeyboardShowing = UseStateResult5,
			keyboardHeight = UseStateResult6,
			screenSize = p1.screenSize
		})
	})
end))