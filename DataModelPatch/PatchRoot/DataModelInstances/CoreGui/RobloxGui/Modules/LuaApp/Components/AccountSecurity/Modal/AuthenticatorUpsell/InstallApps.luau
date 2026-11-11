local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local ModalBaseModule = require(Modules.LuaApp.Components.AccountSecurity.Common.ModalBase)
local ModalBodyTextModule = require(Modules.LuaApp.Components.AccountSecurity.Common.ModalBodyText)
local ModalButtonConfigModule = require(Modules.LuaApp.Components.AccountSecurity.Common.ModalButtonConfig)
local OpenWebviewModule = require(Modules.LuaApp.Thunks.OpenWebview)
local PromptAssignmentActionModule = require(Modules.LuaApp.Enum.AccountSecurity.PromptAssignmentAction)
local PromptConstantsModule = require(Modules.LuaApp.Components.AccountSecurity.Common.PromptConstants)
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local UpdatePromptAssignmentModule = require(Modules.LuaApp.Thunks.AccountSecurity.UpdatePromptAssignment)
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local GetIconSizeUDim2Function = UIBloxModule.App.ImageSet.getIconSizeUDim2
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local config = {
	action = "Feature.AccountSecurityPrompt.Action.AuthenticatorUpsellNextButtonMessage",
	downloadInstruction = "Feature.AccountSecurityPrompt.Label.AuthenticatorUpsellDownloadInstruction",
	header = "Feature.AccountSecurityPrompt.Header.AuthenticatorUpsellDownloadAuthenticator",
	googleAuthenticator = "Feature.AccountSecurityPrompt.Label.AuthenticatorUpsellGoogleOption",
	microsoftAuthenticator = "Feature.AccountSecurityPrompt.Label.AuthenticatorUpsellMicrosoftOption",
	twilioAuthenticator = "Feature.AccountSecurityPrompt.Label.AuthenticatorUpsellTwilioOption",
	settingsTitle = "CommonUI.Features.Label.Settings"
}
local InstallApps = RoactModule.PureComponent:extend("InstallApps")
local Medium = UIBloxModule.App.ImageSet.Enum.IconSize.Medium
local IconsStatusSuccess = UIBloxModule.App.ImageSet.Images["icons/status/success"]
local _UDim = UDim.new(0, 10)

function InstallApps.init(p1)
	-- upvalues: PromptConstantsModule (copy), PromptAssignmentActionModule (copy)
	p1:setState({ requestInFlight = false })
	
	function p1.continueToAuthenticatorAppScreen(p2)
		-- upvalues: p1 (copy), PromptConstantsModule (upval), PromptAssignmentActionModule (upval)
		return function()
			-- upvalues: p1 (upval), PromptConstantsModule (upval), p2 (copy), PromptAssignmentActionModule (upval)
			p1:setState({ requestInFlight = true })
			p1.props.openWebView(PromptConstantsModule.getWebViewUrlAccountSettings(), p2.settingsTitle)
			p1.props.closeOverlay()
			p1.props.updatePromptAssignment(p1.props.networking, p1.props.promptType, PromptAssignmentActionModule.DismissPrompt)
		end
	end
	
	function p1.closeCallback()
		-- upvalues: p1 (copy), PromptAssignmentActionModule (upval)
		p1.props.updatePromptAssignment(p1.props.networking, p1.props.promptType, PromptAssignmentActionModule.DismissPrompt)
	end
end

function InstallApps.render(p1)
	-- upvalues: UIBloxModule (copy), WithLocalizationModule (copy), config (copy), RoactModule (copy), ModalBaseModule (copy), ModalBodyTextModule (copy), _UDim (copy), ImageSetLabel (copy), IconsStatusSuccess (copy), GetIconSizeUDim2Function (copy), Medium (copy), ModalButtonConfigModule (copy), ButtonType (copy)
	local RequestInFlight = p1.state.requestInFlight
	
	return UIBloxModule.Style.withStyle(function(p2)
		-- upvalues: WithLocalizationModule (upval), config (upval), RoactModule (upval), ModalBaseModule (upval), p1 (copy), ModalBodyTextModule (upval), _UDim (upval), ImageSetLabel (upval), IconsStatusSuccess (upval), GetIconSizeUDim2Function (upval), Medium (upval), ModalButtonConfigModule (upval), RequestInFlight (copy), ButtonType (upval)
		local Color = p2.Theme.SystemPrimaryDefault.Color
		
		return WithLocalizationModule(config)(function(p3)
			-- upvalues: RoactModule (upval), ModalBaseModule (upval), p1 (upval), ModalBodyTextModule (upval), _UDim (upval), ImageSetLabel (upval), IconsStatusSuccess (upval), Color (copy), GetIconSizeUDim2Function (upval), Medium (upval), ModalButtonConfigModule (upval), RequestInFlight (upval), ButtonType (upval)
			return RoactModule.createElement(ModalBaseModule, {
				title = p3.header,
				closeCallback = p1.closeCallback,
				makeBodyFragment = function(ContentWidth)
					-- upvalues: RoactModule (upval), ModalBodyTextModule (upval), p3 (copy), _UDim (upval), ImageSetLabel (upval), IconsStatusSuccess (upval), Color (upval), GetIconSizeUDim2Function (upval), Medium (upval)
					return RoactModule.createFragment({
						BEFORE_TEXT = RoactModule.createElement(ModalBodyTextModule, {
							layoutOrder = 1,
							useBold = true,
							contentWidth = ContentWidth,
							text = p3.downloadInstruction
						}),
						ROWS_WRAPPER = RoactModule.createElement("Frame", {
							Transparency = 1,
							LayoutOrder = 2,
							AutomaticSize = Enum.AutomaticSize.XY
						}, {
							WrappingListWrapper = RoactModule.createElement("UIListLayout", {
								FillDirection = Enum.FillDirection.Vertical,
								VerticalAlignment = Enum.VerticalAlignment.Center,
								HorizontalAlignment = Enum.HorizontalAlignment.Left,
								Padding = _UDim
							}),
							FIRST_ROW = RoactModule.createElement("Frame", { Transparency = 1, AutomaticSize = Enum.AutomaticSize.XY }, {
								WrappingListA = RoactModule.createElement("UIListLayout", {
									FillDirection = Enum.FillDirection.Horizontal,
									VerticalAlignment = Enum.VerticalAlignment.Center,
									Padding = _UDim
								}),
								CheckmarkIconA = RoactModule.createElement(ImageSetLabel, {
									BorderSizePixel = 0,
									BackgroundTransparency = 1,
									Image = IconsStatusSuccess,
									ImageColor3 = Color,
									Size = GetIconSizeUDim2Function(Medium)
								}),
								MicrosoftAuthenticator = RoactModule.createElement(ModalBodyTextModule, {
									contentWidth = 0,
									useBold = true,
									alignLeft = true,
									text = p3.microsoftAuthenticator
								})
							}),
							SECOND_ROW = RoactModule.createElement("Frame", { Transparency = 1, AutomaticSize = Enum.AutomaticSize.XY }, {
								WrappingListB = RoactModule.createElement("UIListLayout", {
									FillDirection = Enum.FillDirection.Horizontal,
									VerticalAlignment = Enum.VerticalAlignment.Center,
									Padding = _UDim
								}),
								CheckmarkIconB = RoactModule.createElement(ImageSetLabel, {
									BorderSizePixel = 0,
									BackgroundTransparency = 1,
									Image = IconsStatusSuccess,
									ImageColor3 = Color,
									Size = GetIconSizeUDim2Function(Medium)
								}),
								GoogleAuthenticator = RoactModule.createElement(ModalBodyTextModule, {
									contentWidth = 0,
									useBold = true,
									alignLeft = true,
									text = p3.googleAuthenticator
								})
							}),
							THIRD_ROW = RoactModule.createElement("Frame", { Transparency = 1, AutomaticSize = Enum.AutomaticSize.XY }, {
								WrappingListC = RoactModule.createElement("UIListLayout", {
									FillDirection = Enum.FillDirection.Horizontal,
									VerticalAlignment = Enum.VerticalAlignment.Center,
									Padding = _UDim
								}),
								CheckmarkIconC = RoactModule.createElement(ImageSetLabel, {
									BorderSizePixel = 0,
									BackgroundTransparency = 1,
									Image = IconsStatusSuccess,
									ImageColor3 = Color,
									Size = GetIconSizeUDim2Function(Medium)
								}),
								TwilioAuthenticator = RoactModule.createElement(ModalBodyTextModule, {
									contentWidth = 0,
									useBold = true,
									alignLeft = true,
									text = p3.twilioAuthenticator
								})
							})
						})
					})
				end,
				buttonConfig = ModalButtonConfigModule({
					{
						isDisabled = RequestInFlight,
						isLoading = RequestInFlight,
						onActivated = p1.continueToAuthenticatorAppScreen(p3),
						text = p3.action,
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
})((RoactRoduxModule.connect(function(_, _)
	return {}
end, function(Callback)
	-- upvalues: CloseCentralOverlayModule (copy), OpenWebviewModule (copy), UpdatePromptAssignmentModule (copy)
	return {
		closeOverlay = function()
			-- upvalues: Callback (copy), CloseCentralOverlayModule (upval)
			return Callback(CloseCentralOverlayModule())
		end,
		openWebView = function(p1, p2)
			-- upvalues: Callback (copy), OpenWebviewModule (upval)
			return Callback(OpenWebviewModule(p1, p2))
		end,
		updatePromptAssignment = function(p1, p2, p3)
			-- upvalues: Callback (copy), UpdatePromptAssignmentModule (upval)
			return Callback(UpdatePromptAssignmentModule(p1, p2, p3))
		end
	}
end)(InstallApps))))