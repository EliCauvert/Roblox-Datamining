local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local AccountPinErrorModule = require(Modules.LuaApp.Enum.AccountSecurity.AccountPinError)
local LockModule = require(Modules.LuaApp.Components.AccountSecurity.Common.Lock)
local ModalBaseModule = require(Modules.LuaApp.Components.AccountSecurity.Common.ModalBase)
local ModalBodyTextModule = require(Modules.LuaApp.Components.AccountSecurity.Common.ModalBodyText)
local ModalButtonConfigModule = require(Modules.LuaApp.Components.AccountSecurity.Common.ModalButtonConfig)
local ModalStateModule = require(Modules.LuaApp.Enum.AccountSecurity.ModalState)
local ModalTextInputModule = require(Modules.LuaApp.Components.AccountSecurity.Common.ModalTextInput)
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local UpdateAccountPinUnlockTimeoutModule = require(Modules.LuaApp.Actions.AccountSecurity.UpdateAccountPinUnlockTimeout)
local UnlockAccountPinModule = require(Modules.LuaApp.Thunks.AccountSecurity.UnlockAccountPin)
local TrueModule = require(Modules.LuaApp.Thunks.AccountSecurity.Validators.True)
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local ButtonType = require(CorePackages.Packages.UIBlox).App.Button.Enum.ButtonType
local JoinResult = require(CorePackages.Packages.Cryo).Dictionary.join({
	action = "Feature.AccountSecurityPrompt.Action.UnlockAccountPin",
	description = "Feature.AccountSecurityPrompt.Description.EnterYourAccountPin",
	header = "Feature.AccountSecurityPrompt.Header.AccountPinRequired",
	headerExpired = "Feature.AccountSecurityPrompt.Header.AccountPinExpired",
	label = "Feature.AccountSecurityPrompt.Label.AccountPin"
}, AccountPinErrorModule.localizationKeys)
local ExtendResult = RoactModule.PureComponent:extend(script.Name)

function ExtendResult.init(p1)
	-- upvalues: RoactModule (copy), ModalStateModule (copy), AccountPinErrorModule (copy)
	p1:setState({
		accountPin = "",
		accountPinError = nil,
		requestError = nil,
		requestInFlight = false
	})
	
	function p1.setAccountPin(AccountPin)
		-- upvalues: p1 (copy)
		p1:setState({ accountPin = AccountPin })
	end
	
	function p1.setAccountPinError(p2)
		-- upvalues: p1 (copy), RoactModule (upval)
		p1:setState({ accountPinError = p2 or RoactModule.None })
	end
	
	function p1.clearRequestError()
		-- upvalues: p1 (copy), RoactModule (upval)
		p1:setState({ requestError = RoactModule.None })
	end
	
	function p1.unlockAccountPin(p2)
		-- upvalues: p1 (copy), ModalStateModule (upval), AccountPinErrorModule (upval)
		return function()
			-- upvalues: p1 (upval), ModalStateModule (upval), AccountPinErrorModule (upval), p2 (copy)
			p1:setState({ requestInFlight = true })
			p1.props.unlockAccountPin(p1.props.networking, p1.state.accountPin):andThen(function(Result)
				-- upvalues: p1 (upval), ModalStateModule (upval)
				p1.props.updateAccountPinUnlockTimeout(DateTime.fromUnixTimestampMillis(DateTime.now().UnixTimestampMillis + math.floor(Result.unlockedUntil * 1000)))
				
				if p1.isMounted then
					p1.props.navigateToModalState(ModalStateModule.ChangePasswordForm)
					
					return
				end
			end):catch(function(Err)
				-- upvalues: p1 (upval), AccountPinErrorModule (upval), p2 (upval)
				if p1.isMounted then
					p1:setState({
						requestInFlight = false,
						requestError = AccountPinErrorModule.toString(p2, Err)
					})
					
					return
				end
			end)
		end
	end
end

function ExtendResult.didMount(p1)
	p1.isMounted = true
end

function ExtendResult.willUnmount(p1)
	p1.isMounted = false
end

function ExtendResult.render(p1)
	-- upvalues: WithLocalizationModule (copy), JoinResult (copy), ModalStateModule (copy), RoactModule (copy), ModalBaseModule (copy), LockModule (copy), ModalBodyTextModule (copy), ModalTextInputModule (copy), TrueModule (copy), ModalButtonConfigModule (copy), ButtonType (copy)
	local AccountPin = p1.state.accountPin
	local RequestError = p1.state.requestError
	local RequestInFlight = p1.state.requestInFlight
	local IsNotAccountPinMatch = AccountPin ~= ""
	
	return WithLocalizationModule(JoinResult)(function(p2)
		-- upvalues: p1 (copy), ModalStateModule (upval), RoactModule (upval), ModalBaseModule (upval), LockModule (upval), ModalBodyTextModule (upval), ModalTextInputModule (upval), RequestError (copy), TrueModule (upval), AccountPin (copy), ModalButtonConfigModule (upval), RequestInFlight (copy), IsNotAccountPinMatch (copy), ButtonType (upval)
		return RoactModule.createElement(ModalBaseModule, {
			title = if p1.props.modalState == ModalStateModule.AccountPinForm then p2.header else p2.headerExpired,
			makeBodyFragment = function(ContentWidth)
				-- upvalues: RoactModule (upval), LockModule (upval), ModalBodyTextModule (upval), p2 (copy), ModalTextInputModule (upval), RequestError (upval), p1 (upval), TrueModule (upval), AccountPin (upval)
				return RoactModule.createFragment({
					Lock = RoactModule.createElement(LockModule, { layoutOrder = 1 }),
					ModalBodyText = RoactModule.createElement(ModalBodyTextModule, {
						layoutOrder = 2,
						contentWidth = ContentWidth,
						text = p2.description
					}),
					ModalTextInput = RoactModule.createElement(ModalTextInputModule, {
						layoutOrder = 3,
						placeholderText = "",
						errorText = RequestError,
						labelText = p2.label,
						onChanged = p1.clearRequestError,
						setError = p1.setAccountPinError,
						setValue = p1.setAccountPin,
						textInputType = Enum.TextInputType.Password,
						validate = TrueModule,
						value = AccountPin
					})
				})
			end,
			buttonConfig = ModalButtonConfigModule({
				{
					isDisabled = RequestInFlight or not IsNotAccountPinMatch,
					isLoading = RequestInFlight,
					onActivated = p1.unlockAccountPin(p2),
					text = p2.action,
					type = ButtonType.PrimarySystem
				}
			})
		})
	end)
end

return (RoactServices.connect({
	analytics = RoactAnalyticsModule,
	networking = RoactNetworkingModule
})((RoactRoduxModule.connect(nil, function(Callback)
	-- upvalues: UpdateAccountPinUnlockTimeoutModule (copy), UnlockAccountPinModule (copy)
	return {
		updateAccountPinUnlockTimeout = function(p1)
			-- upvalues: Callback (copy), UpdateAccountPinUnlockTimeoutModule (upval)
			return Callback(UpdateAccountPinUnlockTimeoutModule(p1))
		end,
		unlockAccountPin = function(p1, p2)
			-- upvalues: Callback (copy), UnlockAccountPinModule (upval)
			return Callback(UnlockAccountPinModule(p1, p2))
		end
	}
end)(ExtendResult))))