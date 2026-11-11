local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local TutilsModule = require(CorePackages.Packages.tutils)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local ItemDataModule = require(Modules.AvatarExperience.Common.Selectors.ItemData)
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local ToastTypeModule = require(Modules.LuaApp.Enum.ToastType)
local SelectItemPromptTypeModule = require(Modules.AvatarExperience.Common.Selectors.SelectItemPromptType)
local OpenPurchasePromptModule = require(Modules.AvatarExperience.Catalog.Thunks.OpenPurchasePrompt)
local OpenPremiumUpsellPromptModule = require(Modules.AvatarExperience.Catalog.Thunks.OpenPremiumUpsellPrompt)
local OpenGoToAvatarEditorPromptModule = require(Modules.AvatarExperience.Catalog.Thunks.OpenGoToAvatarEditorPrompt)
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local ApiFetchEconomyCurrencyModule = require(Modules.LuaApp.Thunks.ApiFetchEconomyCurrency)
local GetFFlagCollectiblesCatalogFollowUpForSaleLocationModule = require(Modules.AvatarExperience.Flags.GetFFlagCollectiblesCatalogFollowUpForSaleLocation)
local FFlagPurchasePromptSubtitleForTimedOptions = require(CorePackages.Workspace.Packages.SharedFlags).FFlagPurchasePromptSubtitleForTimedOptions
local config = {
	toastMessage = "Feature.Catalog.LabelNoResellers",
	toastSubMessage = "Feature.Catalog.Label.NoSellersWarning",
	isLocalized = false,
	toastType = ToastTypeModule.SuccessConfirmation
}
local config1 = {
	toastMessage = "Feature.Catalog.Heading.NotForSale",
	toastSubMessage = "Feature.Catalog.Label.NoLongerAvailable",
	isLocalized = false,
	toastType = ToastTypeModule.SuccessConfirmation
}
local config2 = {
	toastMessage = "Feature.Catalog.Heading.InExperienceOnly",
	toastSubMessage = "Feature.Catalog.Label.InExperienceOnly",
	isLocalized = false,
	toastType = ToastTypeModule.SuccessConfirmation
}
local config3 = {
	toastMessage = "Feature.Catalog.Heading.QuantityLimitReached",
	toastSubMessage = "Feature.Catalog.Label.QuantityLimitReached",
	isLocalized = false,
	toastType = ToastTypeModule.SuccessConfirmation
}

local function _(p1, p2, p3)
	-- upvalues: ApiFetchEconomyCurrencyModule (copy)
	local LocalUserId = p2.LocalUserId
	
	if typeof(LocalUserId) == "string" and LocalUserId ~= "" then
		p1:dispatch(ApiFetchEconomyCurrencyModule(p3, LocalUserId, false))
	end
end

local function clickDisabledButton(p1, State, p2, p3)
	-- upvalues: CatalogUtilsModule (copy), ApiFetchEconomyCurrencyModule (copy), GetFFlagCollectiblesCatalogFollowUpForSaleLocationModule (copy), SetCurrentToastMessageModule (copy), config2 (copy), config1 (copy), config3 (copy), config (copy)
	local ResellerUserAssetIds = p2 and p2.resellerUserAssetIds
	local IsResellable = CatalogUtilsModule.IsResellable(p2)
	local CollectibleItemId = p2 and p2.collectibleItemId
	local UserAsset = State.AvatarExperience.Catalog.UserAssets[ResellerUserAssetIds and ResellerUserAssetIds[1]]
	local NoUserAsset: boolean = IsResellable and UserAsset == nil
	
	if State.UserRobux[State.LocalUserId] == nil then
		local LocalUserId = State.LocalUserId
		
		if typeof(LocalUserId) == "string" and LocalUserId ~= "" then
			p1:dispatch(ApiFetchEconomyCurrencyModule(p3, LocalUserId, false))
		end
		return
	else
		local v1 = false
		
		if CollectibleItemId then
			local CollectiblesItem = State.AvatarExperience.Common.Collectibles.CollectiblesItemInfo[CollectibleItemId]
			v1 = not CatalogUtilsModule.isOriginalStockSellableInShop(CollectiblesItem)
			NoUserAsset = not CollectiblesItem or not CollectiblesItem.hasResellers
		end
		local ReachQuantityLimitResult = false
		
		if CollectibleItemId then
			local CollectiblesItem = State.AvatarExperience.Common.Collectibles.CollectiblesItemInfo[CollectibleItemId]
			local CollectiblesResellableInstance = State.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances[CollectibleItemId]
			NoUserAsset = not CollectiblesItem or not CollectiblesItem.hasResellers
			ReachQuantityLimitResult = NoUserAsset and CatalogUtilsModule.reachQuantityLimit(CollectiblesItem, CollectiblesResellableInstance)
		end
		return if v1 then if GetFFlagCollectiblesCatalogFollowUpForSaleLocationModule() then p1:dispatch(SetCurrentToastMessageModule(config2)) else p1:dispatch(SetCurrentToastMessageModule(config1)) elseif ReachQuantityLimitResult then p1:dispatch(SetCurrentToastMessageModule(config3)) elseif IsResellable and NoUserAsset then p1:dispatch(SetCurrentToastMessageModule(config)) else p1:dispatch(SetCurrentToastMessageModule(config1))
	end
end

return function(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12)
	-- upvalues: SelectItemPromptTypeModule (copy), TutilsModule (copy), ConstantsModule (copy), OpenPurchasePromptModule (copy), FFlagPurchasePromptSubtitleForTimedOptions (copy), OpenGoToAvatarEditorPromptModule (copy), OpenPremiumUpsellPromptModule (copy), ItemDataModule (copy), clickDisabledButton (copy)
	return function(p13)
		-- upvalues: p6 (copy), p7 (copy), p5 (copy), SelectItemPromptTypeModule (upval), TutilsModule (upval), ConstantsModule (upval), OpenPurchasePromptModule (upval), p1 (copy), p3 (copy), p4 (copy), p2 (copy), p8 (copy), p9 (copy), p10 (copy), FFlagPurchasePromptSubtitleForTimedOptions (upval), p11 (copy), p12 (copy), OpenGoToAvatarEditorPromptModule (upval), OpenPremiumUpsellPromptModule (upval), ItemDataModule (upval), clickDisabledButton (upval)
		local State = p13:getState()
		local ItemId = nil
		local ItemType = nil
		
		if p6 and p7 then
			ItemId = p6
			ItemType = p7
		else
			ItemId = p5.current.params.itemId
			ItemType = p5.current.params.itemType
		end
		local SelectItemPromptTypeModuleResult = SelectItemPromptTypeModule(State, ItemId, ItemType, {})
		local FromContentFeed = p5.current.params.fromContentFeed
		local FromProfile = p5.current.params.fromProfile
		local WidgetInfo = p5.current.params.widgetInfo
		
		if not WidgetInfo then
			local TryOnItems = State.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
			
			if TutilsModule.fieldCount(TryOnItems) == 1 then
				local _, Value = next(TryOnItems)
				WidgetInfo = Value.widgetInfo
			end
		end
		if SelectItemPromptTypeModuleResult == ConstantsModule.ItemPromptType.OpenPurchasePrompt then
			p13:dispatch(OpenPurchasePromptModule(p1, p3, p4, p2, FromProfile, p5, ItemId, ItemType, p8, p9, WidgetInfo, FromContentFeed, p10, if FFlagPurchasePromptSubtitleForTimedOptions then p11 else nil, p12))
			
			return
		end
		if SelectItemPromptTypeModuleResult == ConstantsModule.ItemPromptType.OpenGoToAvatarEditorPrompt then
			p13:dispatch(OpenGoToAvatarEditorPromptModule(p3, p4, p5, ItemId, ItemType))
			
			return
		end
		if SelectItemPromptTypeModuleResult == ConstantsModule.ItemPromptType.OpenPremiumUpsellPrompt then
			p13:dispatch(OpenPremiumUpsellPromptModule(p1, p2, p3, p4, nil, ItemId, ItemType))
			
			return
		end
		if SelectItemPromptTypeModuleResult == ConstantsModule.ItemPromptType.Disabled then
			clickDisabledButton(p13, State, ItemDataModule(State.AvatarExperience.Common, ItemId, ItemType), p1)
		end
	end
end