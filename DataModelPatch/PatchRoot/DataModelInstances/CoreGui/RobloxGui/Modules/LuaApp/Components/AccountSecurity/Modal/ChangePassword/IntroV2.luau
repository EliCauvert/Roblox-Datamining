local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local AccountPinErrorModule = require(Modules.LuaApp.Enum.AccountSecurity.AccountPinError)
local GetAccountPinStateModule = require(Modules.LuaApp.Thunks.AccountSecurity.GetAccountPinState)
local GetDaysRemainingToForceResetStringModule = require(Modules.LuaApp.Components.AccountSecurity.Helpers.GetDaysRemainingToForceResetString)
local LockModule = require(Modules.LuaApp.Components.AccountSecurity.Common.Lock)
local ModalBaseModule = require(Modules.LuaApp.Components.AccountSecurity.Common.ModalBase)
local ModalBodyTextModule = require(Modules.LuaApp.Components.AccountSecurity.Common.ModalBodyText)
local ModalButtonConfigModule = require(Modules.LuaApp.Components.AccountSecurity.Common.ModalButtonConfig)
local ModalErrorTextModule = require(Modules.LuaApp.Components.AccountSecurity.Common.ModalErrorText)
local ModalStateModule = require(Modules.LuaApp.Enum.AccountSecurity.ModalState)
local PromptTypeModule = require(Modules.LuaApp.Enum.AccountSecurity.PromptType)
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local UpdateAccountPinUnlockTimeoutModule = require(Modules.LuaApp.Actions.AccountSecurity.UpdateAccountPinUnlockTimeout)
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local ButtonType = require(CorePackages.Packages.UIBlox).App.Button.Enum.ButtonType
local config = {
	[PromptTypeModule.ChangePasswordSuspectedCompromise] = CryoModule.Dictionary.join({
		action = "Feature.AccountSecurityPrompt.Action.ContinueChangePassword",
		descriptionEnd = "Feature.AccountSecurityPrompt.Description.ChangeYourPassword",
		descriptionStart = "Feature.AccountSecurityPrompt.Description.UnusualActivity",
		header = "Feature.AccountSecurityPrompt.Header.ChangeYourPassword"
	}, AccountPinErrorModule.localizationKeys),
	[PromptTypeModule.ChangePasswordBreachedCredential] = CryoModule.Dictionary.join({
		action = "Feature.AccountSecurityPrompt.Action.ContinueChangePassword",
		descriptionEnd = "Feature.AccountSecurityPrompt.Description.NoChangeForceReset",
		descriptionEndSingular = "Feature.AccountSecurityPrompt.Description.NoChangeForceResetSingular",
		descriptionStart = "Feature.AccountSecurityPrompt.Description.ChangeYourPassword",
		header = "Feature.AccountSecurityPrompt.Header.ChangeYourPassword"
	}, AccountPinErrorModule.localizationKeys)
}
local ExtendResult = RoactModule.PureComponent:extend("ChangePassword" .. script.Name)

function ExtendResult.init(p1)
	-- upvalues: ModalStateModule (copy), AccountPinErrorModule (copy)
	p1:setState({ requestError = nil, requestInFlight = false })
	
	function p1.continueToChangePassword(p2)
		-- upvalues: p1 (copy), ModalStateModule (upval), AccountPinErrorModule (upval)
		return function()
			-- upvalues: p1 (upval), ModalStateModule (upval), AccountPinErrorModule (upval), p2 (copy)
			p1:setState({ requestInFlight = true })
			p1.props.getAccountPinState(p1.props.networking):andThen(function(Result)
				-- upvalues: p1 (upval), ModalStateModule (upval)
				if Result.unlockedUntil ~= nil and Result.unlockedUntil > 0 or not Result.isEnabled then
					if Result.unlockedUntil == nil then
						p1.props.updateAccountPinUnlockTimeout(nil)
					else
						p1.props.updateAccountPinUnlockTimeout(DateTime.fromUnixTimestampMillis(DateTime.now().UnixTimestampMillis + math.floor(Result.unlockedUntil * 1000)))
					end
					if p1.isMounted then
						p1.props.navigateToModalState(ModalStateModule.ChangePasswordForm)
						
						return
					end
					return
				elseif p1.isMounted then
					p1.props.navigateToModalState(ModalStateModule.AccountPinForm)
					
					return
				else
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
	-- upvalues: config (copy), PromptTypeModule (copy), WithLocalizationModule (copy), GetDaysRemainingToForceResetStringModule (copy), RoactModule (copy), ModalBaseModule (copy), LockModule (copy), ModalBodyTextModule (copy), ModalErrorTextModule (copy), ModalButtonConfigModule (copy), ButtonType (copy)
	local PromptType = p1.props.promptType
	local Metadata = p1.props.metadata
	local RequestError = p1.state.requestError
	local RequestInFlight = p1.state.requestInFlight
	
	return WithLocalizationModule(config[PromptType] or config[PromptTypeModule.ChangePasswordSuspectedCompromise])(function(p2)
		-- upvalues: PromptType (copy), PromptTypeModule (upval), GetDaysRemainingToForceResetStringModule (upval), Metadata (copy), RoactModule (upval), ModalBaseModule (upval), LockModule (upval), ModalBodyTextModule (upval), RequestError (copy), ModalErrorTextModule (upval), ModalButtonConfigModule (upval), RequestInFlight (copy), p1 (copy), ButtonType (upval)
		local Text = p2.descriptionStart .. " " .. (if PromptType == PromptTypeModule.ChangePasswordBreachedCredential then GetDaysRemainingToForceResetStringModule(p2.descriptionEndSingular, p2.descriptionEnd, Metadata.forceResetTimestamp) else p2.descriptionEnd)
		
		return RoactModule.createElement(ModalBaseModule, {
			title = p2.header,
			makeBodyFragment = function(ContentWidth)
				-- upvalues: RoactModule (upval), LockModule (upval), ModalBodyTextModule (upval), Text (copy), RequestError (upval), ModalErrorTextModule (upval)
				return RoactModule.createFragment({
					Lock = RoactModule.createElement(LockModule, { layoutOrder = 1 }),
					ModalBodyText = RoactModule.createElement(ModalBodyTextModule, {
						layoutOrder = 2,
						richText = true,
						contentWidth = ContentWidth,
						text = Text
					}),
					ModalErrorText = RequestError and RoactModule.createElement(ModalErrorTextModule, {
						layoutOrder = 3,
						contentWidth = ContentWidth,
						errorText = RequestError
					})
				})
			end,
			buttonConfig = ModalButtonConfigModule({
				{
					isDisabled = RequestInFlight,
					isLoading = RequestInFlight,
					onActivated = p1.continueToChangePassword(p2),
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
})((RoactRoduxModule.connect(function(p1, _)
	return {
		promptType = p1.AccountSecurityPrompt.promptType,
		metadata = p1.AccountSecurityPrompt.metadata
	}
end, function(Callback)
	-- upvalues: GetAccountPinStateModule (copy), UpdateAccountPinUnlockTimeoutModule (copy)
	return {
		getAccountPinState = function(p1)
			-- upvalues: Callback (copy), GetAccountPinStateModule (upval)
			return Callback(GetAccountPinStateModule(p1))
		end,
		updateAccountPinUnlockTimeout = function(p1)
			-- upvalues: Callback (copy), UpdateAccountPinUnlockTimeoutModule (upval)
			return Callback(UpdateAccountPinUnlockTimeoutModule(p1))
		end
	}
end)(ExtendResult))))