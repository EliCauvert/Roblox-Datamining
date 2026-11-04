local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local SignalsReactModule = require(Parent.SignalsReact)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local GetInExperienceShopStoreModule = require(InExperienceShop.Stores.getInExperienceShopStore)
local InitiateShopItemPurchaseModule = require(InExperienceShop.initiateShopItemPurchase)
local GetTrialRedemptionErrorKeysModule = require(script.Parent.getTrialRedemptionErrorKeys)
local _ = require(InExperienceShop.Types)
local config = {
	FreeTrialAlreadyRedeemed = true,
	GamePassTrialNotEnabled = true
}

return function()
	-- upvalues: SignalsReactModule (copy), GetInExperienceShopStoreModule (copy), GetTrialRedemptionErrorKeysModule (copy), UseLocalizationFunction (copy), config (copy), InitiateShopItemPurchaseModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetInExperienceShopStoreModule)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(UseSignalStateResult.getTrialRedemptionError)
	local ErrorCode = if UseSignalStateResult1 == nil then nil else UseSignalStateResult1.errorCode
	local TrialRedemptionErrorKeysModule = GetTrialRedemptionErrorKeysModule(ErrorCode)
	local UseLocalizationResult = UseLocalizationFunction({
		okText = "CommonUI.Controls.Action.OK",
		buyText = "Feature.Catalog.Action.Buy",
		title = TrialRedemptionErrorKeysModule.title,
		body = TrialRedemptionErrorKeysModule.body
	})
	
	if UseSignalStateResult1 == nil then
		return nil
	end
	local DismissTrialRedemptionErrorFunction = UseSignalStateResult.dismissTrialRedemptionError
	
	if ErrorCode == nil or not config[ErrorCode] then
		return {
			title = UseLocalizationResult.title,
			body = UseLocalizationResult.body,
			actionText = UseLocalizationResult.okText,
			onAction = DismissTrialRedemptionErrorFunction,
			onClose = DismissTrialRedemptionErrorFunction
		}
	else
		local GamePassId = UseSignalStateResult1.gamePassId
		local PurchaseContext = UseSignalStateResult1.purchaseContext or {}
		
		return {
			title = UseLocalizationResult.title,
			body = UseLocalizationResult.body,
			actionText = UseLocalizationResult.buyText,
			onAction = function()
				-- upvalues: DismissTrialRedemptionErrorFunction (copy), InitiateShopItemPurchaseModule (upval), GamePassId (copy), PurchaseContext (copy)
				DismissTrialRedemptionErrorFunction()
				InitiateShopItemPurchaseModule(GamePassId, "GamePass", PurchaseContext.shopPageType, PurchaseContext.categoryLocation)
			end,
			onClose = DismissTrialRedemptionErrorFunction
		}
	end
end