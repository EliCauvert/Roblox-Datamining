local playersService = game:GetService("Players")
local accountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local parent = accountUpgrade.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local coreScriptsRootProvider = require(parent.CoreScriptsRoactCommon).CoreScriptsRootProvider
local inExperienceProviderContainer = require(parent.InExperienceContainer).InExperienceProviderContainer
local accountUpgradeContainerModule = require(accountUpgrade.Components.AccountUpgradeContainer)
local accountUpgradeSuccessViewModule = require(accountUpgrade.SuccessModal.AccountUpgradeSuccessView)
local respawnIntoExperienceModule = require(script.Parent.respawnIntoExperience)
local resolveSuccessIdentityModule = require(script.Parent.resolveSuccessIdentity)
local fStringAccountUpgradeLinkedAccountTypeModule = require(accountUpgrade.Flags.FStringAccountUpgradeLinkedAccountType)

return function(p1)
	-- upvalues: reactModule (ref), playersService (ref), respawnIntoExperienceModule (ref), resolveSuccessIdentityModule (ref), accountUpgradeSuccessViewModule (ref), fStringAccountUpgradeLinkedAccountTypeModule (ref), accountUpgradeContainerModule (ref), coreScriptsRootProvider (ref), foundationModule (ref), inExperienceProviderContainer (ref)
	local var1
	local var2, var3 = reactModule.useState(nil)
	local var4, var5 = reactModule.useState(nil)
	local localPlayer = playersService.LocalPlayer
	local var6 = if localPlayer then localPlayer.Name else nil
	local onComplete = p1.onComplete
	local var7 = reactModule.useCallback(function(p2)
		-- upvalues: var5 (ref)
		if p2.isSuccess then
			var5(p2)
		end
	end, {})
	local var8 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), onComplete (ref)
		if var4 ~= nil then
			onComplete(var4)
		end
	end, { onComplete, var4 })
	local var9 = reactModule.useCallback(function()
		-- upvalues: var8 (ref), respawnIntoExperienceModule (copy)
		var8()
		respawnIntoExperienceModule()
	end, { var8 })
	local _ = nil
	
	if var4 == nil then
		var1 = reactModule.createElement(accountUpgradeContainerModule, {
			hasBackdrop = true,
			currentUsername = var6,
			onClose = p1.onDismiss,
			onSignUpComplete = var7
		})
	else
		local var10 = resolveSuccessIdentityModule(var4, {
			username = var6,
			displayName = if localPlayer then localPlayer.DisplayName else nil
		})
		var1 = reactModule.createElement(accountUpgradeSuccessViewModule, {
			hasBackdrop = true,
			userId = if localPlayer then localPlayer.UserId else 0,
			displayName = var10.displayName,
			username = var10.username,
			didUsernameChange = var10.didUsernameChange,
			linkedAccountType = fStringAccountUpgradeLinkedAccountTypeModule,
			onRespawnNow = var9,
			onApplyLater = var8,
			onConfirm = var8
		})
	end
	return reactModule.createElement(coreScriptsRootProvider, {}, {
		ModalFix = reactModule.createElement("ImageButton", {
			BackgroundTransparency = 1,
			Modal = true,
			Size = UDim2.fromOffset(0, 0)
		}),
		Overlay = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 2,
			Size = UDim2.fromScale(1, 1),
			ref = var3
		}),
		Content = if var2 then reactModule.createElement(foundationModule.OverlayProvider, { gui = var2 }, {
			Providers = reactModule.createElement(inExperienceProviderContainer, {}, var1)
		}) else nil
	})
end