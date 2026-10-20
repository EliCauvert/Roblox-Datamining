local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local GetPromptAssignmentsModule = require(Modules.LuaApp.Thunks.AccountSecurity.GetPromptAssignments)
local LockModule = require(Modules.LuaApp.Components.AccountSecurity.Common.Lock)
local ModalBaseModule = require(Modules.LuaApp.Components.AccountSecurity.Common.ModalBase)
local ModalBodyTextModule = require(Modules.LuaApp.Components.AccountSecurity.Common.ModalBodyText)
local ModalButtonConfigModule = require(Modules.LuaApp.Components.AccountSecurity.Common.ModalButtonConfig)
local ModalErrorTextModule = require(Modules.LuaApp.Components.AccountSecurity.Common.ModalErrorText)
local ModalStateModule = require(Modules.LuaApp.Enum.AccountSecurity.ModalState)
local PromptAssignmentActionModule = require(Modules.LuaApp.Enum.AccountSecurity.PromptAssignmentAction)
local PromptTypeModule = require(Modules.LuaApp.Enum.AccountSecurity.PromptType)
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local UpdatePromptAssignmentModule = require(Modules.LuaApp.Thunks.AccountSecurity.UpdatePromptAssignment)
local UpdatePromptTypeWithEventModule = require(Modules.LuaApp.Thunks.AccountSecurity.UpdatePromptTypeWithEvent)
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local ButtonType = require(CorePackages.Packages.UIBlox).App.Button.Enum.ButtonType

local function _(_)
	return {
		actionDismissForever = "Feature.AccountSecurityPrompt.Action.DismissForever",
		actionDismissTemporary = "Feature.AccountSecurityPrompt.Action.DismissTemporary",
		actionSecureAccount = "Feature.AccountSecurityPrompt.Action.SecureAccount",
		description = "Feature.AccountSecurityPrompt.Description.AreYouSureDismissForeverChangePassword",
		header = "Feature.AccountSecurityPrompt.Header.AreYouSure",
		messageError = "Feature.AccountSecurityPrompt.Message.Error.PromptAssignments.Default"
	}
end

local ExtendResult = RoactModule.PureComponent:extend(script.Name)

function ExtendResult.init(p1)
	-- upvalues: PromptTypeModule (copy), ModalStateModule (copy)
	p1:setState({
		requestError = nil,
		requestInFlightDismissForever = false,
		requestInFlightDismissTemporary = false,
		requestInFlightSecureAccount = false
	})
	
	function p1.updatePromptAssignment(p2, p3)
		-- upvalues: p1 (copy), PromptTypeModule (upval)
		return function()
			-- upvalues: p1 (upval), PromptTypeModule (upval), p3 (copy), p2 (copy)
			p1:setState({
				requestInFlightDismissForever = true,
				requestInFlightDismissTemporary = false,
				requestInFlightSecureAccount = false
			})
			p1.props.updatePromptAssignment(p1.props.networking, PromptTypeModule.ChangePasswordSuspectedCompromise, p3):andThen(function()
				-- upvalues: p1 (upval)
				p1.props.updatePromptType(p1.props.analytics, nil, nil, nil)
				p1.props.closeOverlay()
			end):catch(function(_)
				-- upvalues: p1 (upval), p2 (upval)
				if p1.isMounted then
					p1:setState({
						requestInFlightDismissForever = false,
						requestError = p2.messageError
					})
					
					return
				end
			end)
		end
	end
	
	function p1.secureAccount()
		-- upvalues: p1 (copy), ModalStateModule (upval)
		p1:setState({
			requestInFlightDismissForever = false,
			requestInFlightDismissTemporary = false,
			requestInFlightSecureAccount = true
		})
		p1.props.navigateToModalState(ModalStateModule.ChangePasswordIntro)
	end
end

function ExtendResult.didMount(p1)
	p1.isMounted = true
end

function ExtendResult.willUnmount(p1)
	p1.isMounted = false
end

function ExtendResult.render(p1)
	-- upvalues: WithLocalizationModule (copy), RoactModule (copy), ModalBaseModule (copy), LockModule (copy), ModalBodyTextModule (copy), ModalErrorTextModule (copy), ModalButtonConfigModule (copy), ButtonType (copy), PromptAssignmentActionModule (copy)
	local RequestError = p1.state.requestError
	local RequestInFlightDismissForever = p1.state.requestInFlightDismissForever
	local RequestInFlightDismissTemporary = p1.state.requestInFlightDismissTemporary
	local RequestInFlightSecureAccount = p1.state.requestInFlightSecureAccount
	local RequestInFlightDismissForever1 = RequestInFlightDismissForever or (RequestInFlightDismissTemporary or RequestInFlightSecureAccount)
	local _ = p1.props.modalState
	
	return WithLocalizationModule({
		actionDismissForever = "Feature.AccountSecurityPrompt.Action.DismissForever",
		actionDismissTemporary = "Feature.AccountSecurityPrompt.Action.DismissTemporary",
		actionSecureAccount = "Feature.AccountSecurityPrompt.Action.SecureAccount",
		description = "Feature.AccountSecurityPrompt.Description.AreYouSureDismissForeverChangePassword",
		header = "Feature.AccountSecurityPrompt.Header.AreYouSure",
		messageError = "Feature.AccountSecurityPrompt.Message.Error.PromptAssignments.Default"
	})(function(p2)
		-- upvalues: RoactModule (upval), ModalBaseModule (upval), LockModule (upval), ModalBodyTextModule (upval), RequestError (copy), ModalErrorTextModule (upval), ModalButtonConfigModule (upval), RequestInFlightDismissForever1 (copy), RequestInFlightSecureAccount (copy), p1 (copy), ButtonType (upval), RequestInFlightDismissForever (copy), PromptAssignmentActionModule (upval), RequestInFlightDismissTemporary (copy)
		return RoactModule.createElement(ModalBaseModule, {
			title = p2.header,
			makeBodyFragment = function(ContentWidth)
				-- upvalues: RoactModule (upval), LockModule (upval), ModalBodyTextModule (upval), p2 (copy), RequestError (upval), ModalErrorTextModule (upval)
				return RoactModule.createFragment({
					Lock = RoactModule.createElement(LockModule, { layoutOrder = 1 }),
					ModalBodyText = RoactModule.createElement(ModalBodyTextModule, {
						layoutOrder = 2,
						contentWidth = ContentWidth,
						text = p2.description
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
					isDisabled = RequestInFlightDismissForever1,
					isLoading = RequestInFlightSecureAccount,
					onActivated = p1.secureAccount,
					text = p2.actionSecureAccount,
					type = ButtonType.PrimarySystem
				},
				{
					isDisabled = RequestInFlightDismissForever1,
					isLoading = RequestInFlightDismissForever,
					onActivated = p1.updatePromptAssignment(p2, PromptAssignmentActionModule.DisablePrompt),
					text = p2.actionDismissForever,
					type = ButtonType.Secondary
				},
				{
					isDisabled = RequestInFlightDismissForever1,
					isLoading = RequestInFlightDismissTemporary,
					onActivated = p1.updatePromptAssignment(p2, PromptAssignmentActionModule.DismissPrompt),
					text = p2.actionDismissTemporary,
					type = ButtonType.Secondary
				}
			})
		})
	end)
end

return (RoactServices.connect({
	analytics = RoactAnalyticsModule,
	networking = RoactNetworkingModule
})((RoactRoduxModule.connect(nil, function(Callback)
	-- upvalues: CloseCentralOverlayModule (copy), GetPromptAssignmentsModule (copy), UpdatePromptTypeWithEventModule (copy), UpdatePromptAssignmentModule (copy)
	return {
		closeOverlay = function()
			-- upvalues: Callback (copy), CloseCentralOverlayModule (upval)
			return Callback(CloseCentralOverlayModule())
		end,
		getPromptAssignments = function(p1)
			-- upvalues: Callback (copy), GetPromptAssignmentsModule (upval)
			return Callback(GetPromptAssignmentsModule(p1))
		end,
		updatePromptType = function(p1, p2, p3, p4)
			-- upvalues: Callback (copy), UpdatePromptTypeWithEventModule (upval)
			return Callback(UpdatePromptTypeWithEventModule(p1, p2, p3, p4))
		end,
		updatePromptAssignment = function(p1, p2, p3)
			-- upvalues: Callback (copy), UpdatePromptAssignmentModule (upval)
			return Callback(UpdatePromptAssignmentModule(p1, p2, p3))
		end
	}
end)(ExtendResult))))