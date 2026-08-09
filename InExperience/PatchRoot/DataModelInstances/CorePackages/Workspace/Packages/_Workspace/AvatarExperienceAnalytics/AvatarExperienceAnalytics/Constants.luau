local unifiedEventLogEnumsModule = require(script.Parent.UnifiedEventLogEnums)
local fFlagAXExportTimedOptionsConstant = require(script:FindFirstAncestor("AvatarExperienceAnalytics").Parent.AvatarExperienceFlags).FFlagAXExportTimedOptionsConstant

return {
	AVATAR_EVENT_COUNTER_NAME = {
		AXEquipAsset = "AXEquipAsset",
		AXUnequipAsset = "AXUnequipAsset",
		AXCreateCostume = "AXCreateCostume",
		AXCreateMakeupLook = "AXCreateMakeupLook",
		AXColorPickerChanged = "AXColorPickerChanged",
		AXCameraEnabled = "AXCameraEnabled",
		AXCameraDisabled = "AXCameraDisabled",
		AXUpdateProfilePicture = "AXUpdateProfilePicture",
		AXPurchaseAsset = "AXPurchaseAsset",
		AXPurchaseBundle = "AXPurchaseBundle",
		CatalogPurchaseShownEnableTwoStepAuth = "CatalogPurchaseShownEnableTwoStepAuth",
		CatalogPurchaseShownTwoStepAuth = "CatalogPurchaseShownTwoStepAuth",
		CatalogPurchaseFailedShowTwoStepAuth = "CatalogPurchaseFailedShowTwoStepAuth",
		CatalogPurchaseCompletedTwoStepAuth = "CatalogPurchaseCompletedTwoStepAuth",
		CatalogPurchaseInvalidatedTwoStepAuth = "CatalogPurchaseInvalidatedTwoStepAuth",
		CatalogPurchaseAbandonedTwoStepAuth = "CatalogPurchaseAbandonedTwoStepAuth",
		CatalogPurchaseLoadFailedTwoStepAuth = "CatalogPurchaseLoadFailedTwoStepAuth"
	},
	AVATAR_EDITOR_SERVICE_ERRORS = {
		GetRecommendedAssets = "AvatarEditorServiceGetRecommendedAssetsError",
		GetOutfits = "AvatarEditorServiceGetOutfitsError",
		CreateOutfit = "AvatarEditorServiceCreateOutfitError",
		GetAvatarRules = "AvatarEditorServiceGetAvatarRulesError",
		GetInventory = "AvatarEditorServiceGetInventoryError",
		SearchCatalog = "AvatarEditorServiceSearchCatalogError",
		GetBatchItemDetails = "AvatarEditorServiceGetBatchItemDetailsError",
		GetRecommendedBundles = "AvatarEditorServiceGetRecommendedBundlesError",
		NoPromptSetFavorite = "AvatarEditorServiceNoPromptSetFavoriteError",
		NoPromptSaveAvatarThumbnailCustomization = "AvatarEditorServiceNoPromptSaveAvatarThumbnailCustomizationError",
		NoPromptCreateOutfit = "AvatarEditorServiceNoPromptCreateOutfitError",
		GetOutfitDetails = "AvatarEditorServiceGetOutfitDetailsError",
		FetchAssetOrBundleInfo = "AvatarEditorServiceFetchAssetOrBundleInfoError",
		FetchBundleInfo = "AvatarEditorServiceFetchBundleInfoError",
		GetAssetFavorite = "AvatarEditorServiceGetAssetFavoriteError",
		GetBundleFavorite = "AvatarEditorServiceGetBundleFavoriteError",
		SetBundleFavorite = "AvatarEditorServiceSetBundleFavoriteError",
		SetAssetFavorite = "AvatarEditorServiceSetAssetFavoriteError",
		ConformToAvatarRules = "AvatarEditorServiceConformToAvatarRulesError",
		NoPromptSaveAvatar = "AvatarEditorServiceNoPromptSaveAvatarError",
		PromptSaveAvatarCompleted = "AvatarEditorServicePromptSaveAvatarCompletedError",
		NoPromptApplyProfileConfiguration = "AvatarEditorServiceNoPromptApplyProfileConfigurationError",
		PromptApplyProfileConfigurationCompleted = "AvatarEditorServicePromptApplyProfileConfigurationCompletedError",
		GetProfileConfiguration = "AvatarEditorServiceGetProfileConfigurationError"
	},
	IMPRESSIONS_EVENTS = {
		AvatarItems = "avatarItemImpressions",
		AvatarItemsCatalog = "avatarItemImpressionsCatalog"
	},
	TIMED_OPTION_BY_DAYS = if fFlagAXExportTimedOptionsConstant then if fFlagAXExportTimedOptionsConstant then {
		[3] = unifiedEventLogEnumsModule.MarketplaceTimedOption.DAYS_3,
		[7] = unifiedEventLogEnumsModule.MarketplaceTimedOption.DAYS_7,
		[14] = unifiedEventLogEnumsModule.MarketplaceTimedOption.DAYS_14
	} else nil else nil
}