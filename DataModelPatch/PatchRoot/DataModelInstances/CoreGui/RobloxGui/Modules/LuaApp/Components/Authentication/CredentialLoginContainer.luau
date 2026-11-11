local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(Modules.Common.Roact)
local EventStreamConstantsModule = require(Modules.LuaApp.EventStreamConstants)
local CredentialLoginFormModule = require(Modules.LuaApp.Components.Authentication.CredentialLoginForm)
local GetFFlagEnableTextFieldContentTypeFunction = require(game:GetService("CorePackages").Workspace.Packages.SharedFlags).GetFFlagEnableTextFieldContentType
local DisableLoginOnEmptyUserOrPass = game:DefineFastFlag("DisableLoginOnEmptyUserOrPass", false)
local LoggerModule = if DisableLoginOnEmptyUserOrPass then require(Modules.LuaApp.Components.Authentication.Logger) else nil

return function(p1)
	-- upvalues: GetFFlagEnableTextFieldContentTypeFunction (copy), EventStreamConstantsModule (copy), DisableLoginOnEmptyUserOrPass (copy), LoggerModule (copy), RoactModule (copy), CredentialLoginFormModule (copy)
	local Username = GetFFlagEnableTextFieldContentTypeFunction() and Enum.TextInputType.Username or Enum.TextInputType.NoSuggestions
	
	local function OnLoginButtonActivated()
		-- upvalues: p1 (copy), EventStreamConstantsModule (upval)
		if p1.loginButtonDisabled then return end
		if not p1.isLoginInProgress then
			p1.updateIsLoginInProgress(true)
			p1.authAnalytics.reportLogInButtonClicked(EventStreamConstantsModule.Context.LoginScreen)
			p1.authAnalytics.reportAuthButtonClick(EventStreamConstantsModule.Context.LoginForm, EventStreamConstantsModule.Button.LogIn)
			p1.handleLoginWithFormDataCallback()
			
			return
		end
	end
	
	local Flag = false
	local Flag1 = false
	
	return RoactModule.createElement(CredentialLoginFormModule, {
		disableRegularLogin = p1.disableRegularLogin,
		usernameTextInputType = Username,
		crossDeviceLoginEnabled = p1.crossDeviceLoginEnabled,
		loginWithExistingAccountVariantEnabled = p1.loginWithExistingAccountVariantEnabled,
		quickLoginButtonText = p1.quickLoginButtonText,
		cvalueText = p1.cvalueText,
		passwordText = p1.passwordText,
		onTextBoxesChanged = p1.onTextBoxesChanged,
		onReturnPressedFromOnScreenKeyboardWhenFocusedOnCValue = function()
			-- upvalues: p1 (copy)
			spawn(function()
				-- upvalues: p1 (upval)
				p1.cvalueRef.current:ReleaseFocus()
				p1.passwordRef.current:CaptureFocus()
			end)
		end,
		onReturnPressedFromOnScreenKeyboardWhenFocusedOnPassword = function()
			-- upvalues: p1 (copy), DisableLoginOnEmptyUserOrPass (upval), LoggerModule (upval), OnLoginButtonActivated (copy)
			p1.passwordRef.current:ReleaseFocus()
			
			if DisableLoginOnEmptyUserOrPass then
				local Text = p1.cvalueRef and (p1.cvalueRef.current and p1.cvalueRef.current.Text)
				local Text1 = p1.passwordRef and (p1.passwordRef.current and p1.passwordRef.current.Text)
				
				if not Text or Text == "" or not Text1 or Text1 == "" then
					LoggerModule:warning("Login attempt skipped: empty credential or password field")
					
					return
				end
			end
			OnLoginButtonActivated()
		end,
		cvalueTextBoxOnFocus = function()
			-- upvalues: Flag (ref), p1 (copy), EventStreamConstantsModule (upval)
			if not Flag then
				Flag = true
				p1.authAnalytics.reportUsernameFocus(EventStreamConstantsModule.Context.LoginScreen)
				p1.authAnalytics.reportAuthFormInteraction(EventStreamConstantsModule.Context.LoginForm, EventStreamConstantsModule.Field.Username)
			end
		end,
		passwordTextBoxOnFocus = function()
			-- upvalues: Flag1 (ref), p1 (copy), EventStreamConstantsModule (upval)
			if not Flag1 then
				Flag1 = true
				p1.authAnalytics.reportPasswordFocus(EventStreamConstantsModule.Context.LoginScreen)
				p1.authAnalytics.reportAuthFormInteraction(EventStreamConstantsModule.Context.LoginForm, EventStreamConstantsModule.Field.Password)
			end
		end,
		passwordVisibilityToggleCallback = function(p2)
			-- upvalues: p1 (copy), EventStreamConstantsModule (upval)
			p1.authAnalytics.reportAuthButtonClick(EventStreamConstantsModule.Context.LoginForm, EventStreamConstantsModule.Button.ShowPassword, if p2 then "show" else "hide")
			
			if p2 then
				p1.authAnalytics.reportShowPasswordButtonClicked(EventStreamConstantsModule.Context.LoginScreen)
				
				return
			else
				p1.authAnalytics.reportHidePasswordButtonClicked(EventStreamConstantsModule.Context.LoginScreen)
			end
		end,
		buttonRef = p1.buttonRef,
		cvalueRef = p1.cvalueRef,
		passwordRef = p1.passwordRef,
		loginButtonRef = p1.loginButtonRef,
		forgotLinkRef = p1.forgotLinkRef,
		crossDeviceButtonRef = p1.crossDeviceButtonRef,
		emailOtpRef = p1.emailOtpRef,
		localizedError = p1.localizedError,
		localizedErrorMessage = p1.localizedErrorMessage,
		forceLoginByUsername = p1.forceLoginByUsername,
		showLinkAccountText = p1.showLinkAccountText,
		showForgotButton = p1.showForgotButton,
		onForgetButtonActivated = p1.onForgetButtonActivated,
		onCrossDeviceLoginActivated = p1.onCrossDeviceLoginActivated,
		loginButtonDisabled = p1.loginButtonDisabled,
		isLoginInProgress = p1.isLoginInProgress,
		onLoginButtonActivated = OnLoginButtonActivated,
		maxSizeX = p1.maxSizeX,
		showDisclaimerLinks = p1.showDisclaimerLinks,
		showDisclaimerButtons = p1.showDisclaimerButtons,
		showCredentialHeader = p1.showCredentialHeader,
		isDualLayout = p1.isDualLayout,
		isTenFootUiMode = p1.isTenFootUiMode,
		onEmailOtpActivated = p1.onEmailOtpActivated,
		emailOtpEnabled = p1.emailOtpEnabled
	})
end