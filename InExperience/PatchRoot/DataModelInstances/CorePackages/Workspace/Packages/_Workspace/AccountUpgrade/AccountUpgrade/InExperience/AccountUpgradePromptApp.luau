local Players = game:GetService("Players")
local AccountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local Parent = AccountUpgrade.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local CoreScriptsRootProvider = require(Parent.CoreScriptsRoactCommon).CoreScriptsRootProvider
local InExperienceProviderContainer = require(Parent.InExperienceContainer).InExperienceProviderContainer
local _ = require(AccountUpgrade.AccountUpgradeFlow)
local AccountUpgradeContainerModule = require(AccountUpgrade.Components.AccountUpgradeContainer)
local AccountUpgradeSuccessViewModule = require(AccountUpgrade.SuccessModal.AccountUpgradeSuccessView)
local RespawnIntoExperienceModule = require(script.Parent.respawnIntoExperience)
local ResolveSuccessIdentityModule = require(script.Parent.resolveSuccessIdentity)
local FStringAccountUpgradeLinkedAccountTypeModule = require(AccountUpgrade.Flags.FStringAccountUpgradeLinkedAccountType)

return function(p1) --[[ Line: 35 | Named "AccountUpgradePromptApp" ]]
	-- upvalues: ReactModule (copy), Players (copy), RespawnIntoExperienceModule (copy), ResolveSuccessIdentityModule (copy), AccountUpgradeSuccessViewModule (copy), FStringAccountUpgradeLinkedAccountTypeModule (copy), AccountUpgradeContainerModule (copy), CoreScriptsRootProvider (copy), FoundationModule (copy), InExperienceProviderContainer (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local LocalPlayer = Players.LocalPlayer
	local Name = if LocalPlayer then LocalPlayer.Name else nil
	local OnCompleteFunction = p1.onComplete
	local UseResult = ReactModule.useCallback(function(p2) --[[ Line: 45 ]]
		-- upvalues: UseStateResult2_1 (copy)
		if p2.isSuccess then
			UseStateResult2_1(p2)
		end
	end, {})
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 51 ]]
		-- upvalues: UseStateResult1 (copy), OnCompleteFunction (copy)
		if UseStateResult1 ~= nil then
			OnCompleteFunction(UseStateResult1)
		end
	end, { OnCompleteFunction, UseStateResult1 })
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 59 ]]
		-- upvalues: UseResult1 (copy), RespawnIntoExperienceModule (upval)
		UseResult1()
		RespawnIntoExperienceModule()
	end, { UseResult1 })
	local Element = nil
	
	if UseStateResult1 == nil then
		Element = ReactModule.createElement(AccountUpgradeContainerModule, {
			hasBackdrop = true,
			flow = p1.flow,
			currentUsername = Name,
			onClose = p1.onDismiss,
			onSignUpComplete = UseResult
		})
	else
		local ResolveSuccessIdentityModuleResult = ResolveSuccessIdentityModule(UseStateResult1, {
			username = Name,
			displayName = if LocalPlayer then LocalPlayer.DisplayName else nil
		})
		Element = ReactModule.createElement(AccountUpgradeSuccessViewModule, {
			hasBackdrop = true,
			userId = if LocalPlayer then LocalPlayer.UserId else 0,
			displayName = ResolveSuccessIdentityModuleResult.displayName,
			username = ResolveSuccessIdentityModuleResult.username,
			didUsernameChange = ResolveSuccessIdentityModuleResult.didUsernameChange,
			linkedAccountType = FStringAccountUpgradeLinkedAccountTypeModule,
			onRespawnNow = UseResult2,
			onApplyLater = UseResult1,
			onConfirm = UseResult1
		})
	end
	return ReactModule.createElement(CoreScriptsRootProvider, {}, {
		ModalFix = ReactModule.createElement("ImageButton", {
			BackgroundTransparency = 1,
			Modal = true,
			Size = UDim2.fromOffset(0, 0)
		}),
		Overlay = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 2,
			Size = UDim2.fromScale(1, 1),
			ref = UseStateResult2
		}),
		Content = if UseStateResult then ReactModule.createElement(FoundationModule.OverlayProvider, { gui = UseStateResult }, {
			Providers = ReactModule.createElement(InExperienceProviderContainer, {}, Element)
		}) else nil
	})
end