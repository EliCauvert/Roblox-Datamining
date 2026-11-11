local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local LockModule = require(Modules.LuaApp.Components.AccountSecurity.Common.Lock)
local ModalBaseModule = require(Modules.LuaApp.Components.AccountSecurity.Common.ModalBase)
local ModalBodyTextModule = require(Modules.LuaApp.Components.AccountSecurity.Common.ModalBodyText)
local ModalButtonConfigModule = require(Modules.LuaApp.Components.AccountSecurity.Common.ModalButtonConfig)
local NavigateDownToSecuritySettingsModule = require(Modules.LuaApp.Thunks.NavigateDownToSecuritySettings)
local PromptAssignmentActionModule = require(Modules.LuaApp.Enum.AccountSecurity.PromptAssignmentAction)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local UpdatePromptAssignmentModule = require(Modules.LuaApp.Thunks.AccountSecurity.UpdatePromptAssignment)
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local ButtonType = require(CorePackages.Packages.UIBlox).App.Button.Enum.ButtonType
local config = {
	action = "Feature.AccountSecurityPrompt.Action.SetUpAuthenticatorAccountRestoresPolicyUpsell",
	description = "Feature.AccountSecurityPrompt.Description.AccountRestoresPolicyUpsellMessageBody",
	header = "Feature.AccountSecurityPrompt.Header.AccountRestoresPolicyUpsell",
	settingsTitle = "CommonUI.Features.Label.Settings"
}
local ExtendResult = RoactModule.PureComponent:extend(script.Name)

function ExtendResult.init(p1)
	-- upvalues: PromptAssignmentActionModule (copy)
	p1:setState({ requestInFlight = false })
	
	function p1:continueToAuthenticatorAppScreen()
		-- upvalues: p1 (copy), PromptAssignmentActionModule (upval)
		return function()
			-- upvalues: p1 (upval), PromptAssignmentActionModule (upval)
			p1:setState({ requestInFlight = true })
			p1.props.navigateToSecuritySettings()
			p1.props.closeOverlay()
			p1.props.updatePromptAssignment(p1.props.networking, p1.props.promptType, PromptAssignmentActionModule.DismissPrompt)
		end
	end
	
	function p1.closeCallback()
		-- upvalues: p1 (copy), PromptAssignmentActionModule (upval)
		p1.props.updatePromptAssignment(p1.props.networking, p1.props.promptType, PromptAssignmentActionModule.DismissPrompt)
	end
end

function ExtendResult.render(p1)
	-- upvalues: WithLocalizationModule (copy), config (copy), RoactModule (copy), ModalBaseModule (copy), LockModule (copy), ModalBodyTextModule (copy), ModalButtonConfigModule (copy), ButtonType (copy)
	local RequestInFlight = p1.state.requestInFlight
	
	return WithLocalizationModule(config)(function(p2)
		-- upvalues: RoactModule (upval), ModalBaseModule (upval), p1 (copy), LockModule (upval), ModalBodyTextModule (upval), ModalButtonConfigModule (upval), RequestInFlight (copy), ButtonType (upval)
		return RoactModule.createElement(ModalBaseModule, {
			title = p2.header,
			closeCallback = p1.closeCallback,
			makeBodyFragment = function(ContentWidth)
				-- upvalues: RoactModule (upval), LockModule (upval), ModalBodyTextModule (upval), p2 (copy)
				return RoactModule.createFragment({
					Lock = RoactModule.createElement(LockModule, { layoutOrder = 1 }),
					ModalBodyText = RoactModule.createElement(ModalBodyTextModule, {
						layoutOrder = 2,
						contentWidth = ContentWidth,
						text = p2.description:gsub("{linkStartSettings}", ""):gsub("{linkEndSettings}", "")
					})
				})
			end,
			buttonConfig = ModalButtonConfigModule({
				{
					isDisabled = RequestInFlight,
					isLoading = RequestInFlight,
					onActivated = p1.continueToAuthenticatorAppScreen(p2),
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
})((RoactRoduxModule.connect(function(_, _)
	return {}
end, function(Callback)
	-- upvalues: CloseCentralOverlayModule (copy), NavigateDownToSecuritySettingsModule (copy), UpdatePromptAssignmentModule (copy)
	return {
		closeOverlay = function()
			-- upvalues: Callback (copy), CloseCentralOverlayModule (upval)
			return Callback(CloseCentralOverlayModule())
		end,
		navigateToSecuritySettings = function()
			-- upvalues: Callback (copy), NavigateDownToSecuritySettingsModule (upval)
			Callback(NavigateDownToSecuritySettingsModule())
		end,
		updatePromptAssignment = function(p1, p2, p3)
			-- upvalues: Callback (copy), UpdatePromptAssignmentModule (upval)
			return Callback(UpdatePromptAssignmentModule(p1, p2, p3))
		end
	}
end)(ExtendResult))))