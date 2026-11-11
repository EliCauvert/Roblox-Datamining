local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local ModalBaseModule = require(Modules.LuaApp.Components.AccountSecurity.Common.ModalBase)
local ModalBodyTextModule = require(Modules.LuaApp.Components.AccountSecurity.Common.ModalBodyText)
local ModalButtonConfigModule = require(Modules.LuaApp.Components.AccountSecurity.Common.ModalButtonConfig)
local ModalStateModule = require(Modules.LuaApp.Enum.AccountSecurity.ModalState)
local PromptAssignmentActionModule = require(Modules.LuaApp.Enum.AccountSecurity.PromptAssignmentAction)
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local UpdatePromptAssignmentModule = require(Modules.LuaApp.Thunks.AccountSecurity.UpdatePromptAssignment)
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local Images = UIBloxModule.App.ImageSet.Images
local GetIconSizeUDim2Function = UIBloxModule.App.ImageSet.getIconSizeUDim2
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local config = {
	action = "Feature.AccountSecurityPrompt.Label.AuthenticatorUpsellSetupAuthenticatorButtonMessage",
	descriptionEnd = "Feature.AccountSecurityPrompt.Description.ChangeYourPassword",
	descriptionStart = "Feature.AccountSecurityPrompt.Description.UnusualActivity",
	header = "Feature.AccountSecurityPrompt.Header.AuthenticatorUpsellWelcomeMessage",
	keepBadActorsOutHeadline = "Feature.AccountSecurityPrompt.Label.AuthenticatorUpsellBadActorHeadline",
	keepBadActorsOutMessage = "Feature.AccountSecurityPrompt.Label.AuthenticatorUpsellBadActorMessage",
	protectGamesRobuxHeadline = "Feature.AccountSecurityPrompt.Label.AuthenticatorUpsellProtectRobuxHeadline",
	protectGamesRobuxMessage = "Feature.AccountSecurityPrompt.Label.AuthenticatorUpsellProtectRobuxMessage",
	twoFactorsBetterThanOneHeadline = "Feature.AccountSecurityPrompt.Label.AuthenticatorUpsellTwoFactorHeadline",
	twoFactorsBetterThanOneMessage = "Feature.AccountSecurityPrompt.Label.AuthenticatorUpsellTwoFactorMessage"
}
local Intro = RoactModule.PureComponent:extend("Intro")
local XLarge = UIBloxModule.App.ImageSet.Enum.IconSize.XLarge
local IconSizeDelta = UIBloxModule.App.ImageSet.getIconSize(XLarge) + 6 - 13
local _UDim = UDim.new(0, 10)
local _UDim1 = UDim.new(0, 3)
local _UDim2 = UDim.new(6, 6)

function Intro.init(p1)
	-- upvalues: ModalStateModule (copy), PromptAssignmentActionModule (copy)
	p1:setState({ requestInFlight = false })
	
	function p1:continueToAuthenticatorAppScreen()
		-- upvalues: p1 (copy), ModalStateModule (upval)
		return function()
			-- upvalues: p1 (upval), ModalStateModule (upval)
			p1:setState({ requestInFlight = true })
			p1.props.navigateToModalState(ModalStateModule.AuthenticatorUpsellInstallApps)
		end
	end
	
	function p1.closeCallback()
		-- upvalues: p1 (copy), PromptAssignmentActionModule (upval)
		p1.props.updatePromptAssignment(p1.props.networking, p1.props.promptType, PromptAssignmentActionModule.DismissPrompt)
	end
end

function Intro.render(p1)
	-- upvalues: UIBloxModule (copy), WithLocalizationModule (copy), config (copy), RoactModule (copy), ModalBaseModule (copy), _UDim (copy), _UDim2 (copy), ImageSetLabel (copy), Images (copy), GetIconSizeUDim2Function (copy), XLarge (copy), _UDim1 (copy), ModalBodyTextModule (copy), IconSizeDelta (copy), ModalButtonConfigModule (copy), ButtonType (copy)
	local RequestInFlight = p1.state.requestInFlight
	
	return UIBloxModule.Style.withStyle(function(_)
		-- upvalues: WithLocalizationModule (upval), config (upval), RoactModule (upval), ModalBaseModule (upval), p1 (copy), _UDim (upval), _UDim2 (upval), ImageSetLabel (upval), Images (upval), GetIconSizeUDim2Function (upval), XLarge (upval), _UDim1 (upval), ModalBodyTextModule (upval), IconSizeDelta (upval), ModalButtonConfigModule (upval), RequestInFlight (copy), ButtonType (upval)
		return WithLocalizationModule(config)(function(p2)
			-- upvalues: RoactModule (upval), ModalBaseModule (upval), p1 (upval), _UDim (upval), _UDim2 (upval), ImageSetLabel (upval), Images (upval), GetIconSizeUDim2Function (upval), XLarge (upval), _UDim1 (upval), ModalBodyTextModule (upval), IconSizeDelta (upval), ModalButtonConfigModule (upval), RequestInFlight (upval), ButtonType (upval)
			return RoactModule.createElement(ModalBaseModule, {
				title = p2.header,
				closeCallback = p1.closeCallback,
				makeBodyFragment = function(p3)
					-- upvalues: RoactModule (upval), _UDim (upval), _UDim2 (upval), ImageSetLabel (upval), Images (upval), GetIconSizeUDim2Function (upval), XLarge (upval), _UDim1 (upval), ModalBodyTextModule (upval), IconSizeDelta (upval), p2 (copy)
					return RoactModule.createFragment({
						ROWS_WRAPPER = RoactModule.createElement("Frame", { Transparency = 1, AutomaticSize = Enum.AutomaticSize.XY }, {
							WrappingListWrapper = RoactModule.createElement("UIListLayout", {
								FillDirection = Enum.FillDirection.Vertical,
								VerticalAlignment = Enum.VerticalAlignment.Center,
								Padding = _UDim
							}),
							FIRST_ROW = RoactModule.createElement("Frame", { Transparency = 1, AutomaticSize = Enum.AutomaticSize.Y }, {
								WrappingListB = RoactModule.createElement("UIListLayout", {
									FillDirection = Enum.FillDirection.Horizontal,
									VerticalAlignment = Enum.VerticalAlignment.Center,
									Padding = _UDim2
								}),
								Left_ProtectGamesRobuxImage = RoactModule.createElement(ImageSetLabel, {
									BorderSizePixel = 0,
									BackgroundTransparency = 1,
									Image = Images["icons/graphic/connectdevices_2xl"],
									Size = GetIconSizeUDim2Function(XLarge)
								}),
								SubFrame = RoactModule.createElement("Frame", { Transparency = 1, AutomaticSize = Enum.AutomaticSize.XY }, {
									ASubList = RoactModule.createElement("UIListLayout", {
										FillDirection = Enum.FillDirection.Vertical,
										Padding = _UDim1
									}),
									Right_TwoFactorsTextA = RoactModule.createElement(ModalBodyTextModule, {
										useBold = true,
										alignLeft = true,
										contentWidth = p3 - IconSizeDelta,
										text = p2.twoFactorsBetterThanOneHeadline
									}),
									Right_TwoFactorsTextB = RoactModule.createElement(ModalBodyTextModule, {
										useBold = false,
										alignLeft = true,
										contentWidth = p3 - IconSizeDelta,
										text = p2.twoFactorsBetterThanOneMessage
									})
								})
							}),
							SECOND_ROW = RoactModule.createElement("Frame", { Transparency = 1, AutomaticSize = Enum.AutomaticSize.Y }, {
								WrappingListB = RoactModule.createElement("UIListLayout", {
									FillDirection = Enum.FillDirection.Horizontal,
									VerticalAlignment = Enum.VerticalAlignment.Center,
									Padding = _UDim2
								}),
								Left_ProtectGamesRobuxImage = RoactModule.createElement(ImageSetLabel, {
									BorderSizePixel = 0,
									BackgroundTransparency = 1,
									Image = Images["icons/graphic/gamesanditems_2xl"],
									Size = GetIconSizeUDim2Function(XLarge)
								}),
								SubFrame = RoactModule.createElement("Frame", { Transparency = 1, AutomaticSize = Enum.AutomaticSize.XY }, {
									ASubList = RoactModule.createElement("UIListLayout", {
										FillDirection = Enum.FillDirection.Vertical,
										Padding = _UDim1
									}),
									Right_ProtectGamesRobuxHeadline = RoactModule.createElement(ModalBodyTextModule, {
										useBold = true,
										alignLeft = true,
										contentWidth = p3 - IconSizeDelta,
										text = p2.protectGamesRobuxHeadline
									}),
									Right_ProtectGamesRobuxMessage = RoactModule.createElement(ModalBodyTextModule, {
										useBold = false,
										alignLeft = true,
										contentWidth = p3 - IconSizeDelta,
										text = p2.protectGamesRobuxMessage
									})
								})
							}),
							THIRD_ROW = RoactModule.createElement("Frame", { Transparency = 1, AutomaticSize = Enum.AutomaticSize.Y }, {
								WrappingListC = RoactModule.createElement("UIListLayout", {
									FillDirection = Enum.FillDirection.Horizontal,
									VerticalAlignment = Enum.VerticalAlignment.Center,
									Padding = _UDim2
								}),
								Left_KeepBadActorsImage = RoactModule.createElement(ImageSetLabel, {
									BorderSizePixel = 0,
									BackgroundTransparency = 1,
									Image = Images["icons/graphic/blocktheft_2xl"],
									Size = GetIconSizeUDim2Function(XLarge)
								}),
								SubFrame = RoactModule.createElement("Frame", { Transparency = 1, AutomaticSize = Enum.AutomaticSize.XY }, {
									ASubList = RoactModule.createElement("UIListLayout", {
										FillDirection = Enum.FillDirection.Vertical,
										Padding = _UDim1
									}),
									Right_TwoFactorsTextA = RoactModule.createElement(ModalBodyTextModule, {
										useBold = true,
										alignLeft = true,
										contentWidth = p3 - IconSizeDelta,
										text = p2.keepBadActorsOutHeadline
									}),
									Right_TwoFactorsTextB = RoactModule.createElement(ModalBodyTextModule, {
										useBold = false,
										alignLeft = true,
										contentWidth = p3 - IconSizeDelta,
										text = p2.keepBadActorsOutMessage
									})
								})
							})
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
	end)
end

return (RoactServices.connect({
	analytics = RoactAnalyticsModule,
	networking = RoactNetworkingModule
})((RoactRoduxModule.connect(function(_, _)
	return {}
end, function(Callback)
	-- upvalues: CloseCentralOverlayModule (copy), UpdatePromptAssignmentModule (copy)
	return {
		closeOverlay = function()
			-- upvalues: Callback (copy), CloseCentralOverlayModule (upval)
			return Callback(CloseCentralOverlayModule())
		end,
		updatePromptAssignment = function(p1, p2, p3)
			-- upvalues: Callback (copy), UpdatePromptAssignmentModule (upval)
			return Callback(UpdatePromptAssignmentModule(p1, p2, p3))
		end
	}
end)(Intro))))