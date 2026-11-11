local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AccountSecurityPromptEventModule = require(Modules.LuaApp.Analytics.Events.accountSecurityPromptEvent)
local EventStreamConstantsModule = require(Modules.LuaApp.EventStreamConstants)
local AccountPinFormModule = require(Modules.LuaApp.Components.AccountSecurity.Modal.AccountPinForm)
local ModalStateModule = require(Modules.LuaApp.Enum.AccountSecurity.ModalState)
local PromptTypeModule = require(Modules.LuaApp.Enum.AccountSecurity.PromptType)
local RoactModule = require(Modules.Common.Roact)
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local RoactRoduxModule = require(Modules.Common.RoactRodux)
local RoactServices = require(game:GetService("CorePackages").Workspace.Packages.RoactServices).RoactServices
local config = {
	[ModalStateModule.ChangePasswordIntro] = require(Modules.LuaApp.Components.AccountSecurity.Modal.ChangePassword.IntroV2),
	[ModalStateModule.ChangePasswordForm] = require(Modules.LuaApp.Components.AccountSecurity.Modal.ChangePassword.Form),
	[ModalStateModule.ChangePasswordConfirmation] = require(Modules.LuaApp.Components.AccountSecurity.Modal.ChangePassword.Confirmation),
	[ModalStateModule.ChangePasswordDismissConfirmation] = require(Modules.LuaApp.Components.AccountSecurity.Modal.DismissConfirmation),
	[ModalStateModule.AccountPinForm] = AccountPinFormModule,
	[ModalStateModule.AccountPinFormExpired] = AccountPinFormModule,
	[ModalStateModule.AuthenticatorUpsellIntro] = require(Modules.LuaApp.Components.AccountSecurity.Modal.AuthenticatorUpsell.Intro),
	[ModalStateModule.AuthenticatorUpsellInstallApps] = require(Modules.LuaApp.Components.AccountSecurity.Modal.AuthenticatorUpsell.InstallApps),
	[ModalStateModule.AccountRestoresPolicyUpsell] = require(Modules.LuaApp.Components.AccountSecurity.Modal.AccountRestoresPolicyUpsell),
	[ModalStateModule.Email2SVUpsell] = require(Modules.LuaApp.Components.AccountSecurity.Modal.Email2SVUpsell)
}
local ExtendResult = RoactModule.PureComponent:extend(script.Name)

function ExtendResult.init(p1)
	p1:setState({
		initialPromptType = p1.props.promptType,
		modalState = p1.props.modalState
	})
	
	function p1.setModalState(ModalState)
		-- upvalues: p1 (copy)
		if p1.isMounted then
			p1:setState({ modalState = ModalState })
			
			return
		end
	end
end

function ExtendResult.didMount(p1)
	-- upvalues: AccountSecurityPromptEventModule (copy), EventStreamConstantsModule (copy), PromptTypeModule (copy), ModalStateModule (copy)
	p1.isMounted = true
	
	if p1.state.initialPromptType ~= nil then
		AccountSecurityPromptEventModule(p1.props.analytics.EventStream, EventStreamConstantsModule.Context.ModalStateViewed, PromptTypeModule.toRawValue(p1.state.initialPromptType), ModalStateModule.toRawValue(p1.state.modalState))
	end
end

function ExtendResult.didUpdate(p1, _, p2)
	-- upvalues: AccountSecurityPromptEventModule (copy), EventStreamConstantsModule (copy), PromptTypeModule (copy), ModalStateModule (copy)
	if p1.state.initialPromptType ~= nil and p1.state.modalState ~= p2.modalState then
		AccountSecurityPromptEventModule(p1.props.analytics.EventStream, EventStreamConstantsModule.Context.ModalStateViewed, PromptTypeModule.toRawValue(p1.state.initialPromptType), ModalStateModule.toRawValue(p1.state.modalState))
	end
end

function ExtendResult.willUnmount(p1)
	-- upvalues: AccountSecurityPromptEventModule (copy), EventStreamConstantsModule (copy), PromptTypeModule (copy)
	if p1.props.promptType ~= nil then
		AccountSecurityPromptEventModule(p1.props.analytics.EventStream, EventStreamConstantsModule.Context.ModalStateViewed, PromptTypeModule.toRawValue(p1.props.promptType), "NONE")
	end
	p1.isMounted = false
end

function ExtendResult.render(p1)
	-- upvalues: config (copy), RoactModule (copy)
	local ModalState = p1.state.modalState
	local Entry = config[ModalState]
	
	return Entry and RoactModule.createElement(Entry, {
		modalState = ModalState,
		navigateToModalState = p1.setModalState,
		openWebView = p1.props.openWebView,
		closeOverlay = p1.props.closeOverlay,
		updatePromptAssignment = p1.props.updatePromptAssignment,
		promptType = p1.props.promptType
	})
end

return (RoactServices.connect({ analytics = RoactAnalyticsModule })((RoactRoduxModule.connect(function(p1, _)
	return { promptType = p1.AccountSecurityPrompt.promptType }
end)(ExtendResult))))