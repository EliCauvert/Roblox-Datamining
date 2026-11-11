local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local ChangePasswordModule = require(Modules.LuaApp.Thunks.AccountSecurity.ChangePassword)
local InputHelpTextWithIconModule = require(Modules.LuaApp.Components.AccountSecurity.Modal.ChangePassword.InputHelpTextWithIcon)
local LockAccountPinModule = require(Modules.LuaApp.Thunks.AccountSecurity.LockAccountPin)
local ModalBaseModule = require(Modules.LuaApp.Components.AccountSecurity.Common.ModalBase)
local ModalBodyTextModule = require(Modules.LuaApp.Components.AccountSecurity.Common.ModalBodyText)
local ModalButtonConfigModule = require(Modules.LuaApp.Components.AccountSecurity.Common.ModalButtonConfig)
local ModalStateModule = require(Modules.LuaApp.Enum.AccountSecurity.ModalState)
local ModalTextInputModule = require(Modules.LuaApp.Components.AccountSecurity.Common.ModalTextInput)
local OpenWebviewModule = require(Modules.LuaApp.Thunks.OpenWebview)
local PasswordErrorModule = require(Modules.LuaApp.Enum.AccountSecurity.PasswordError)
local PromiseModule = require(Modules.LuaApp.Promise)
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local UpdateAccountPinUnlockTimeoutModule = require(Modules.LuaApp.Actions.AccountSecurity.UpdateAccountPinUnlockTimeout)
local UpdatePromptTypeWithEventModule = require(Modules.LuaApp.Thunks.AccountSecurity.UpdatePromptTypeWithEvent)
local ChainedModule = require(Modules.LuaApp.Thunks.AccountSecurity.Validators.Chained)
local EqualsModule = require(Modules.LuaApp.Thunks.AccountSecurity.Validators.Equals)
local PasswordModule = require(Modules.LuaApp.Thunks.AccountSecurity.Validators.Password)
local TrueModule = require(Modules.LuaApp.Thunks.AccountSecurity.Validators.True)
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local _Enum = require(Modules.LuaApp.Enum.AccountSecurity.AccountPinError).Enum
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local PasswordErrorModuleEnum = PasswordErrorModule.Enum
local ValidatorFunction = PasswordModule.validator
local WithStyleFunction = UIBloxModule.Style.withStyle
local IconsGraphicLockXxlarge = UIBloxModule.App.ImageSet.Images["icons/graphic/lock_xxlarge"]
local JoinResult = require(CorePackages.Packages.Cryo).Dictionary.join({
	action = "Feature.AccountSecurityPrompt.Action.SubmitChangePassword",
	errorPasswordsDoNotMatch = "Feature.AccountSecurityPrompt.Message.Error.Input.PasswordsDoNotMatch",
	header = "Feature.AccountSecurityPrompt.Header.CreateAStrongPassword",
	labelConfirmNewPassword = "Feature.AccountSecurityPrompt.Label.ConfirmNewPassword",
	labelCurrentPassword = "Feature.AccountSecurityPrompt.Label.CurrentPassword",
	labelIForgotMyPassword = "Feature.AccountSecurityPrompt.Label.IForgotMyPassword",
	labelNewPassword = "Feature.AccountSecurityPrompt.Label.NewPassword",
	labelTimeRemaining = "Feature.AccountSecurityPrompt.Label.TimeRemaining",
	labelUseAUniquePassword = "Feature.AccountSecurityPrompt.Label.UseAUniquePassword",
	webViewTitleForgotPassword = "CommonUI.Features.Label.Help"
}, PasswordErrorModule.localizationKeys, PasswordModule.localizationKeys)

local function v31(...)
	local list = { ... }
	
	return function(p1)
		-- upvalues: list (copy)
		for _, value in ipairs(list) do
			value(p1)
		end
	end
end

local ExtendResult = RoactModule.PureComponent:extend("ChangePassword" .. script.Name)

function ExtendResult.init(p1)
	-- upvalues: RoactModule (copy), PromiseModule (copy), _Enum (copy), ModalStateModule (copy), PasswordErrorModuleEnum (copy), PasswordErrorModule (copy)
	p1:setState({
		currentPassword = "",
		currentPasswordError = nil,
		newPassword = "",
		newPasswordError = nil,
		confirmNewPassword = "",
		confirmNewPasswordError = nil,
		requestError = nil,
		requestErrorForCurrentPassword = false,
		requestInFlight = false,
		accountPinUnlockedForMinutes = 0,
		accountPinUnlockedForSeconds = 0
	})
	
	function p1.setCurrentPassword(CurrentPassword)
		-- upvalues: p1 (copy)
		p1:setState({ currentPassword = CurrentPassword })
	end
	
	function p1.setNewPassword(NewPassword)
		-- upvalues: p1 (copy)
		p1:setState({ newPassword = NewPassword })
	end
	
	function p1.setConfirmNewPassword(ConfirmNewPassword)
		-- upvalues: p1 (copy)
		p1:setState({ confirmNewPassword = ConfirmNewPassword })
	end
	
	function p1.setRequestError(p2)
		-- upvalues: p1 (copy), RoactModule (upval)
		p1:setState({ requestError = p2 or RoactModule.None })
	end
	
	function p1.clearRequestError()
		-- upvalues: p1 (copy)
		p1.setRequestError(nil)
	end
	
	function p1.setCurrentPasswordError(p2)
		-- upvalues: p1 (copy), RoactModule (upval)
		p1:setState({ currentPasswordError = p2 or RoactModule.None })
	end
	
	function p1.setNewPasswordError(p2)
		-- upvalues: p1 (copy), RoactModule (upval)
		p1:setState({ newPasswordError = p2 or RoactModule.None })
	end
	
	function p1.clearNewPasswordError()
		-- upvalues: p1 (copy)
		p1.setNewPasswordError(nil)
	end
	
	function p1.setConfirmNewPasswordError(p2)
		-- upvalues: p1 (copy), RoactModule (upval)
		p1:setState({ confirmNewPasswordError = p2 or RoactModule.None })
	end
	
	function p1.clearConfirmNewPasswordError()
		-- upvalues: p1 (copy)
		p1.setConfirmNewPasswordError(nil)
	end
	
	function p1.changePassword(p2)
		-- upvalues: p1 (copy), PromiseModule (upval), _Enum (upval), ModalStateModule (upval), PasswordErrorModuleEnum (upval), PasswordErrorModule (upval)
		return function()
			-- upvalues: p1 (upval), PromiseModule (upval), _Enum (upval), ModalStateModule (upval), PasswordErrorModuleEnum (upval), PasswordErrorModule (upval), p2 (copy)
			p1:setState({ requestInFlight = true })
			p1.props.changePassword(p1.props.networking, p1.state.currentPassword, p1.state.newPassword):andThen(function(_)
				-- upvalues: PromiseModule (upval), p1 (upval), _Enum (upval), ModalStateModule (upval)
				(if p1.props.accountPinUnlockedUntil == nil then PromiseModule.resolve() else p1.props.lockAccountPin(p1.props.networking):andThen(function(_)
					-- upvalues: p1 (upval)
					p1.props.updateAccountPinUnlockTimeout(nil)
				end):catch(function(Err)
					-- upvalues: _Enum (upval), p1 (upval)
					if Err == _Enum.AccountLocked then
						p1.props.updateAccountPinUnlockTimeout(nil)
					end
				end)):andThen(function()
					-- upvalues: p1 (upval), ModalStateModule (upval)
					p1.props.updatePromptType(p1.props.analytics, nil, nil, nil)
					
					if p1.isMounted then
						p1.props.navigateToModalState(ModalStateModule.ChangePasswordConfirmation)
						
						return
					end
				end)
			end):catch(function(Err)
				-- upvalues: p1 (upval), PasswordErrorModuleEnum (upval), ModalStateModule (upval), PasswordErrorModule (upval), p2 (upval)
				if not p1.isMounted then return end
				p1:setState({ requestInFlight = false })
				
				if Err == PasswordErrorModuleEnum.PinLocked then
					p1.props.navigateToModalState(ModalStateModule.AccountPinFormExpired)
					
					return
				else
					p1:setState({
						requestError = PasswordErrorModule.toString(p2, Err),
						requestErrorForCurrentPassword = Err == PasswordErrorModuleEnum.InvalidCurrentPassword
					})
				end
			end)
		end
	end
	
	function p1.openForgotPasswordSupportPage(p2)
		-- upvalues: p1 (copy)
		return function()
			-- upvalues: p1 (upval), p2 (copy)
			p1.props.openWebView("https://en.help.roblox.com/hc/articles/203313070-I-Forgot-My-Password", p2.webViewTitleForgotPassword)
		end
	end
end

function ExtendResult.didMount(p1)
	-- upvalues: ModalStateModule (copy)
	p1.isMounted = true
	spawn(function()
		-- upvalues: p1 (copy), ModalStateModule (upval)
		while p1.isMounted and p1.props.accountPinUnlockedUntil ~= nil do
			local UnixTimestampMillis = DateTime.now().UnixTimestampMillis
			local UnixTimestampMillis1 = p1.props.accountPinUnlockedUntil.UnixTimestampMillis
			
			if UnixTimestampMillis >= UnixTimestampMillis1 then
				p1.props.navigateToModalState(ModalStateModule.AccountPinFormExpired)
				break
			end
			local UnixTimestampMillisRatio = (UnixTimestampMillis1 - UnixTimestampMillis) / 1000
			p1:setState({
				accountPinUnlockedForMinutes = math.floor(UnixTimestampMillisRatio / 60),
				accountPinUnlockedForSeconds = math.floor(UnixTimestampMillisRatio % 60)
			})
			wait(1)
		end
	end)
end

function ExtendResult.willUnmount(p2)
	p2.isMounted = false
end

function ExtendResult.render(p2)
	-- upvalues: WithStyleFunction (copy), WithLocalizationModule (copy), JoinResult (copy), RoactModule (copy), ModalBaseModule (copy), ModalBodyTextModule (copy), ModalTextInputModule (copy), TrueModule (copy), InputHelpTextWithIconModule (copy), IconsGraphicLockXxlarge (copy), v31 (copy), ChainedModule (copy), ValidatorFunction (copy), EqualsModule (copy), ModalButtonConfigModule (copy), ButtonType (copy)
	local CurrentPassword = p2.state.currentPassword
	local CurrentPasswordError = p2.state.currentPasswordError
	local NewPassword = p2.state.newPassword
	local NewPasswordError = p2.state.newPasswordError
	local ConfirmNewPassword = p2.state.confirmNewPassword
	local ConfirmNewPasswordError = p2.state.confirmNewPasswordError
	local RequestError = p2.state.requestError
	local RequestErrorForCurrentPassword = p2.state.requestErrorForCurrentPassword
	local RequestInFlight = p2.state.requestInFlight
	local AccountPinUnlockedForMinutes = p2.state.accountPinUnlockedForMinutes
	local AccountPinUnlockedForSeconds = p2.state.accountPinUnlockedForSeconds
	local AccountPinUnlockedUntil = p2.props.accountPinUnlockedUntil
	local Username = p2.props.username
	local Networking = p2.props.networking
	local NoConfirmNewPasswordError: boolean = CurrentPassword ~= "" and (CurrentPasswordError == nil and (NewPassword ~= "" and (NewPasswordError == nil and (ConfirmNewPassword ~= "" and ConfirmNewPasswordError == nil))))
	
	return WithStyleFunction(function(p3)
		-- upvalues: WithLocalizationModule (upval), JoinResult (upval), RoactModule (upval), ModalBaseModule (upval), AccountPinUnlockedUntil (copy), ModalBodyTextModule (upval), AccountPinUnlockedForMinutes (copy), AccountPinUnlockedForSeconds (copy), ModalTextInputModule (upval), CurrentPasswordError (copy), RequestErrorForCurrentPassword (copy), RequestError (copy), p2 (copy), TrueModule (upval), CurrentPassword (copy), NewPasswordError (copy), InputHelpTextWithIconModule (upval), IconsGraphicLockXxlarge (upval), v31 (upval), ChainedModule (upval), ValidatorFunction (upval), Networking (copy), Username (copy), ConfirmNewPassword (copy), EqualsModule (upval), NewPassword (copy), ConfirmNewPasswordError (copy), ModalButtonConfigModule (upval), RequestInFlight (copy), NoConfirmNewPasswordError (copy), ButtonType (upval)
		return WithLocalizationModule(JoinResult)(function(p4)
			-- upvalues: RoactModule (upval), ModalBaseModule (upval), AccountPinUnlockedUntil (upval), ModalBodyTextModule (upval), AccountPinUnlockedForMinutes (upval), AccountPinUnlockedForSeconds (upval), ModalTextInputModule (upval), CurrentPasswordError (upval), RequestErrorForCurrentPassword (upval), RequestError (upval), p2 (upval), p3 (copy), TrueModule (upval), CurrentPassword (upval), NewPasswordError (upval), InputHelpTextWithIconModule (upval), IconsGraphicLockXxlarge (upval), v31 (upval), ChainedModule (upval), ValidatorFunction (upval), Networking (upval), Username (upval), ConfirmNewPassword (upval), EqualsModule (upval), NewPassword (upval), ConfirmNewPasswordError (upval), ModalButtonConfigModule (upval), RequestInFlight (upval), NoConfirmNewPasswordError (upval), ButtonType (upval)
			return RoactModule.createElement(ModalBaseModule, {
				title = p4.header,
				makeBodyFragment = function(ContentWidth)
					-- upvalues: RoactModule (upval), AccountPinUnlockedUntil (upval), ModalBodyTextModule (upval), p4 (copy), AccountPinUnlockedForMinutes (upval), AccountPinUnlockedForSeconds (upval), ModalTextInputModule (upval), CurrentPasswordError (upval), RequestErrorForCurrentPassword (upval), RequestError (upval), p2 (upval), p3 (upval), TrueModule (upval), CurrentPassword (upval), NewPasswordError (upval), InputHelpTextWithIconModule (upval), IconsGraphicLockXxlarge (upval), v31 (upval), ChainedModule (upval), ValidatorFunction (upval), Networking (upval), Username (upval), ConfirmNewPassword (upval), EqualsModule (upval), NewPassword (upval), ConfirmNewPasswordError (upval)
					return RoactModule.createFragment({
						ModalBodyText = AccountPinUnlockedUntil ~= nil and RoactModule.createElement(ModalBodyTextModule, {
							layoutOrder = 1,
							contentWidth = ContentWidth,
							text = p4.labelTimeRemaining .. "\n" .. string.format("%02d:%02d", AccountPinUnlockedForMinutes, AccountPinUnlockedForSeconds)
						}),
						ModalTextInputCurrentPassword = RoactModule.createElement(ModalTextInputModule, {
							layoutOrder = 2,
							placeholderText = "",
							errorText = CurrentPasswordError or (RequestErrorForCurrentPassword and RequestError or nil),
							helpComponent = RoactModule.createElement("TextButton", {
								[RoactModule.Event.Activated] = p2.openForgotPasswordSupportPage(p4),
								AutomaticSize = Enum.AutomaticSize.Y,
								BackgroundTransparency = 1,
								Font = p3.Font.CaptionBody.Font,
								Size = UDim2.fromScale(1, 0),
								Text = p4.labelIForgotMyPassword,
								TextColor3 = p3.Theme.TextLink.Color,
								TextSize = p3.Font.CaptionBody.RelativeSize * p3.Font.BaseSize,
								TextWrapped = true,
								TextXAlignment = Enum.TextXAlignment.Left
							}),
							labelText = p4.labelCurrentPassword,
							onChanged = p2.clearRequestError,
							setError = p2.setCurrentPasswordError,
							setValue = p2.setCurrentPassword,
							textInputType = Enum.TextInputType.Password,
							validate = TrueModule,
							value = CurrentPassword
						}),
						ModalTextInputNewPassword = RoactModule.createElement(ModalTextInputModule, {
							layoutOrder = 3,
							placeholderText = "",
							errorText = NewPasswordError,
							helpComponent = RoactModule.createElement(InputHelpTextWithIconModule, {
								helpText = p4.labelUseAUniquePassword,
								iconImage = IconsGraphicLockXxlarge
							}),
							labelText = p4.labelNewPassword,
							onChanged = p2.clearRequestError,
							setError = v31(p2.clearConfirmNewPasswordError, p2.setNewPasswordError),
							setValue = p2.setNewPassword,
							textInputType = Enum.TextInputType.Password,
							validate = ChainedModule(ValidatorFunction(Networking, p4, Username), if ConfirmNewPassword == "" then TrueModule else EqualsModule(p4.errorPasswordsDoNotMatch, ConfirmNewPassword) or TrueModule),
							value = NewPassword
						}),
						ModalTextInputConfirmNewPassword = RoactModule.createElement(ModalTextInputModule, {
							layoutOrder = 4,
							placeholderText = "",
							errorText = ConfirmNewPasswordError or (if RequestErrorForCurrentPassword then nil else RequestError or nil),
							labelText = p4.labelConfirmNewPassword,
							onChanged = p2.clearRequestError,
							setError = v31(p2.clearNewPasswordError, p2.setConfirmNewPasswordError),
							setValue = p2.setConfirmNewPassword,
							textInputType = Enum.TextInputType.Password,
							validate = ChainedModule(EqualsModule(p4.errorPasswordsDoNotMatch, NewPassword), ValidatorFunction(Networking, p4, Username)),
							value = ConfirmNewPassword
						})
					})
				end,
				buttonConfig = ModalButtonConfigModule({
					{
						isDisabled = RequestInFlight or not NoConfirmNewPasswordError,
						isLoading = RequestInFlight,
						onActivated = p2.changePassword(p4),
						text = p4.action,
						type = ButtonType.PrimarySystem
					}
				})
			})
		end)
	end)
end

return (RoactServices.connect({
	analytics = RoactAnalyticsModule,
	networking = RoactNetworkingModule
})((RoactRoduxModule.connect(function(p2, _)
	return {
		accountPinUnlockedUntil = p2.AccountSecurityPrompt.accountPinUnlockedUntil,
		username = p2.Users[p2.LocalUserId] and p2.Users[p2.LocalUserId].name or ""
	}
end, function(Callback)
	-- upvalues: ChangePasswordModule (copy), OpenWebviewModule (copy), LockAccountPinModule (copy), UpdateAccountPinUnlockTimeoutModule (copy), UpdatePromptTypeWithEventModule (copy)
	return {
		changePassword = function(p2, p3, p4)
			-- upvalues: Callback (copy), ChangePasswordModule (upval)
			return Callback(ChangePasswordModule(p2, p3, p4))
		end,
		openWebView = function(p2, p3)
			-- upvalues: Callback (copy), OpenWebviewModule (upval)
			return Callback(OpenWebviewModule(p2, p3))
		end,
		lockAccountPin = function(p2)
			-- upvalues: Callback (copy), LockAccountPinModule (upval)
			return Callback(LockAccountPinModule(p2))
		end,
		updateAccountPinUnlockTimeout = function(p2)
			-- upvalues: Callback (copy), UpdateAccountPinUnlockTimeoutModule (upval)
			return Callback(UpdateAccountPinUnlockTimeoutModule(p2))
		end,
		updatePromptType = function(p2, p3, p4, p5)
			-- upvalues: Callback (copy), UpdatePromptTypeWithEventModule (upval)
			return Callback(UpdatePromptTypeWithEventModule(p2, p3, p4, p5))
		end
	}
end)(ExtendResult))))