local _ = require(script.Components.CatalogRowItemCard.CatalogRowItemCardFooter)
local _ = require(script.Stores.AnimatedVisibilityStore.createAnimatedVisibilityStore)
local _ = require(script.Stores.AnimatedVisibilityStore.AnimatedVisibilityContext)
local _ = require(script.Types.CategoryTypes.CategoryTypes)
local _ = require(script.Types.CategoryTypes.CatalogCategoryTypes)
local _ = require(script.Types.CategoryTypes.AvatarEditorCategoryTypes)
local _ = require(script.Types.CategoryTypes.SharedCategoryTypes)
local _ = require(script.Types.ButtonStackItemType)
local _ = require(script.Types.CommonTypes)
local _ = require(script.Types.TimedOptionType)
local _ = require(script.Types.DiscountType)
local _ = require(script.Types.AvatarColorTypes)
local _ = require(script.Types.WidgetAnalyticsInfo)
local _ = require(script.Types.WidgetInfoContextTypes)
local _ = require(script.Types.ItemTypes)
local _ = require(script.Parent.AvatarExperienceModel)
local _ = require(script.Types.PurchaseItemsTypes)
local _ = require(script.Types.TryOnItemComparisonData)
local _ = require(script.Backgrounds.types)

return {
	Components = {
		ArrowNavV2 = require(script.Components.ArrowNav.ArrowNavV2),
		RobuxBalance = require(script.Components.RobuxBalance.RobuxBalance),
		AnimatedCategoryPill = require(script.Components.CategoryPill.AnimatedCategoryPill),
		AnimatedSubcategoryPill = require(script.Components.CategoryPill.AnimatedSubcategoryPill),
		CategoryPill = require(script.Components.CategoryPill.CategoryPill),
		CategoryPillCloseButton = require(script.Components.CategoryPill.CategoryPillCloseButton),
		ColorGradientCircle = require(script.Components.ColorGradientCircle.ColorGradientCircle),
		Overlay = require(script.Components.Overlay.Overlay),
		FlexLayout = require(script.Components.FlexLayout.FlexLayout),
		CatalogItemCard = {
			CatalogItemCardItemInfoEnum = require(script.Components.CatalogItemCard.Enums.CatalogItemCardItemInfoEnum),
			CatalogItemCardItemTypeEnum = require(script.Components.CatalogItemCard.Enums.CatalogItemCardItemTypeEnum),
			CatalogItemCardStatusIconTypeEnum = require(script.Components.CatalogItemCard.Enums.CatalogItemCardStatusIconTypeEnum),
			ItemStatusTypeEnum = require(script.Components.CatalogItemCard.Enums.ItemStatusTypeEnum),
			CatalogItemCard = require(script.Components.CatalogItemCard.CatalogItemCard),
			CatalogRowItemCard = require(script.Components.CatalogRowItemCard.CatalogRowItemCard)
		},
		Filters = {
			CheckboxButtonItem = require(script.Components.Filters.CheckboxButtonItem),
			CheckboxGroup = require(script.Components.Filters.CheckboxGroup),
			ExpandingFrame = require(script.Components.Filters.ExpandingFrame)
		},
		ContextualActionButton = require(script.Components.ContextualActionButton.ContextualActionButton),
		LicensingBadge = require(script.Components.LicensingBadge.LicensingBadge),
		OfferExpiryBadge = require(script.Components.OfferExpiryBadge.OfferExpiryBadge),
		AnimatedScrollingFrame = {
			useAXAnimateScrollFrame = require(script.Components.AnimatedScrollingFrame.useAXAnimateScrollFrame),
			AnimatedScrollingFrame = require(script.Components.AnimatedScrollingFrame.AnimatedScrollingFrame)
		},
		AXPartialPageModal = require(script.Components.AXPartialPageModal.AXPartialPageModal),
		BackgroundHighlight = require(script.Components.BackgroundHighlight.BackgroundHighlightContainer),
		wrapForReactPortal = require(script.Components.Wrappers.wrapForReactPortal),
		AXTooltip = require(script.Components.AXTooltip.AXTooltipContainer),
		TimeoutBanner = require(script.Components.TimeoutBanner.TimeoutBannerContainer),
		Prompts = {
			EnhancedAvatarHeadsFtuxPrompt = require(script.Components.Prompts.EnhancedAvatarHeadsFtuxPrompt)
		}
	},
	Enums = {
		AdjustmentType = require(script.Enums.AdjustmentType),
		OutfitTypes = require(script.Enums.OutfitTypes),
		ItemRestrictions = require(script.Enums.ItemRestrictions),
		ItemStatus = require(script.Enums.ItemStatus),
		SalesLocationType = require(script.Enums.SalesLocationType),
		CreatorType = require(script.Enums.CreatorType),
		NoPriceStatus = require(script.Enums.NoPriceStatus),
		ItemPurchaseActionTypeEnum = require(script.Enums.ItemPurchaseActionTypeEnum),
		CatalogSubcategories = require(script.Enums.CatalogSubcategories),
		CatalogCategoryIds = require(script.Enums.CatalogCategoryIds),
		CatalogSubcategoryIds = require(script.Enums.CatalogSubcategoryIds),
		CatalogSDUICategoryIds = require(script.Enums.CatalogSDUICategoryIds),
		CatalogCategoryKeys = require(script.Enums.CatalogCategoryKey),
		CatalogSubcategoryKeys = require(script.Enums.CatalogSubcategoryKey),
		FullView = require(script.Enums.FullView),
		WearTimeFilter = require(script.Enums.WearTimeFilter),
		DiscountTypeEnum = require(script.Enums.DiscountType)
	},
	Hooks = {
		useSelectorSignal = require(script.Hooks.useSelectorSignal),
		useSignal = require(script.Hooks.useSignal),
		useComputedSignal = require(script.Hooks.useComputedSignal),
		usePulseAnimationBinding = require(script.Hooks.usePulseAnimationBinding),
		useArrowNavScrollBehavior = require(script.Hooks.useArrowNavScrollBehavior),
		useCategoryPillColorAnimation = require(script.Hooks.useCategoryPillColorAnimation),
		useSubcategoryPillAnimation = require(script.Hooks.useSubcategoryPillAnimation),
		useRedirectFocusIntoGuiObject = require(script.Hooks.useRedirectFocusIntoGuiObject),
		useNetworking = require(script.Hooks.useNetworking),
		useHydrateEquippedAvatarOutfitId = require(script.Hooks.useHydrateEquippedAvatarOutfitId),
		useFocusOnMountEffect = require(script.Hooks.useFocusOnMountEffect),
		useEnhancedAvatarHeadsFtux = require(script.Hooks.useEnhancedAvatarHeadsFtux),
		useAdaptiveScrolling = require(script.Hooks.useAdaptiveScrolling),
		AdaptiveScrollingContext = require(script.Hooks.AdaptiveScrollingContext),
		withAdaptiveScrolling = require(script.Hooks.withAdaptiveScrolling),
		useUnifiedImpressionExposer = require(script.Hooks.useUnifiedImpressionExposer),
		useIsDirectional = require(script.Hooks.useIsDirectional)
	},
	Lib = {
		SafeAppStorageService = require(script.Lib.SafeAppStorageService)
	},
	Experiments = {
		AXRecentlyViewedSearchItemsIXPTest = require(script.Experiments.AXRecentlyViewedSearchItemsIXPTest),
		AXAvatarsTabIXP = require(script.Experiments.AXAvatarsTabIXP)
	},
	State = {
		Selectors = {
			selectColorAdjustmentButtonColor = require(script.State.Selectors.selectColorAdjustmentButtonColor),
			selectTryOnBodyIds = require(script.State.Selectors.selectTryOnBodyIds),
			selectHasBodyTryOn = require(script.State.Selectors.selectHasBodyTryOn),
			selectShowColorQuickButton = require(script.State.Selectors.selectShowColorQuickButton),
			selectAvatarPreviewColors = require(script.State.Selectors.selectAvatarPreviewColors),
			selectSearchKeyword = require(script.State.Selectors.selectSearchKeyword),
			selectCurrentAvatarRoute = require(script.State.Selectors.selectCurrentAvatarRoute),
			selectIsFullView = require(script.State.Selectors.selectIsFullView),
			selectTopBarHeight = require(script.State.Selectors.selectTopBarHeight),
			selectEquippedAssets = require(script.State.Selectors.selectEquippedAssets),
			selectHasMakeupTryOn = require(script.State.Selectors.selectHasMakeupTryOn),
			selectTryOnItems = require(script.State.Selectors.selectTryOnItems),
			selectCurrentAvatarEditorCategory = require(script.State.Selectors.selectCurrentAvatarEditorCategory),
			selectEquippedLayeredMakeupAssets = require(script.State.Selectors.selectEquippedLayeredMakeupAssets),
			selectTotalLayeredMakeupAssets = require(script.State.Selectors.selectTotalLayeredMakeupAssets),
			selectHasDynamicHead = require(script.State.Selectors.selectHasDynamicHead),
			selectTryOnsLookId = require(script.State.Selectors.selectTryOnsLookId),
			ItemData = require(script.State.Selectors.ItemData)
		},
		Actions = {
			CharacterHistoryStateChangeButtonActivated = require(script.State.CharacterHistoryStateChangeButtonActivated)
		}
	},
	Stores = {
		AnimatedVisibilityStore = {
			createAnimatedVisibilityStore = require(script.Stores.AnimatedVisibilityStore.createAnimatedVisibilityStore),
			AnimatedVisibilityContext = require(script.Stores.AnimatedVisibilityStore.AnimatedVisibilityContext),
			AnimatedVisibilityProvider = require(script.Stores.AnimatedVisibilityStore.AnimatedVisibilityContextProvider),
			useAnimatedVisibility = require(script.Stores.AnimatedVisibilityStore.useAnimatedVisibility)
		},
		AvatarLastEquippedStateStore = {
			avatarLastEquippedStateStore = require(script.Stores.AvatarLastEquippedStateStore.avatarLastEquippedStateStore)
		},
		AXTooltipStore = require(script.Stores.AXTooltipStore),
		getApplyingLayeredClothingStore = require(script.Stores.ApplyingLayeredClothingStore.getApplyingLayeredClothingStore),
		getTimeoutStatusStore = require(script.Stores.TimeoutStatusStore.getTimeoutStatusStore),
		getAdjustmentTypeSelectedStore = require(script.Stores.AdjustmentTypeSelectedStore.getAdjustmentTypeSelectedStore),
		getEquippedAvatarOutfitIdStore = require(script.Stores.EquippedAvatarOutfitIdStore.getEquippedAvatarOutfitIdStore)
	},
	Utils = {
		createSelectorSignal = require(script.Utils.createSelectorSignal),
		buildHumanoidDescription = require(script.Utils.Humanoid.buildHumanoidDescription),
		getAssetIdToAssetTypeIdFromHumanoidDescription = require(script.Utils.Humanoid.getAssetIdToAssetTypeIdFromHumanoidDescription),
		getHumanoidDescriptionFromState = require(script.Utils.Humanoid.getHumanoidDescriptionFromState),
		setHumanoidDescriptionColorsFromBodyColor3s = require(script.Utils.Humanoid.setHumanoidDescriptionColorsFromBodyColor3s),
		setMakeupDescriptions = require(script.Utils.Humanoid.setMakeupDescriptions),
		destroyMakeupDescriptions = require(script.Utils.Humanoid.destroyMakeupDescriptions),
		getMakeupDescriptionsFromHumanoidDescription = require(script.Utils.Humanoid.getMakeupDescriptionsFromHumanoidDescription),
		createHumanoidDescriptionAccessoryInfo = require(script.Utils.Humanoid.createHumanoidDescriptionAccessoryInfo),
		getGearAssetIdFromEquippedAssets = require(script.Utils.getGearAssetIdFromEquippedAssets),
		getEquippedLayeredMakeupAssets = require(script.Utils.getEquippedLayeredMakeupAssets),
		getRbxThumbType = require(script.Utils.getRbxThumbType),
		isVRHiddenRobuxBalanceScreen = require(script.Utils.isVRHiddenRobuxBalanceScreen),
		normalize = require(script.Utils.normalize),
		getRawItemLicensingInfo = require(script.Utils.getRawItemLicensingInfo),
		parseItemLicensing = require(script.Utils.parseItemLicensing),
		normalizeScreenSizeForWire = require(script.Utils.normalizeScreenSizeForWire),
		debounce = require(script.Utils.debounce),
		getZoomedSizeAndOffset = require(script.Utils.getZoomedSizeAndOffset),
		getThumbSizeVectorFromParamString = require(script.Utils.getThumbSizeVectorFromParamString),
		getUseSelectorDeepEquals = require(script.Utils.getUseSelectorDeepEquals),
		findItemInTryOnItems = require(script.Utils.findItemInTryOnItems),
		getTryOnItemReducerKey = require(script.Utils.getTryOnItemReducerKey),
		getFilteredTryOnItems = require(script.Utils.TryOns.getFilteredTryOnItems),
		getTryOnItemComparisonData = require(script.Utils.TryOns.getTryOnItemComparisonData),
		getShouldReplaceTryOn = require(script.Utils.TryOns.getShouldReplaceTryOn),
		removeMakeupAssetsFromTryOnsIfOverLimit = require(script.Utils.TryOns.removeMakeupAssetsFromTryOnsIfOverLimit),
		getItemPurchaseActionType = require(script.Utils.getItemPurchaseActionType),
		RoactGamepadMigration = {
			findValueKeyInRefCache = require(script.Utils.RoactGamepadMigration.findValueKeyInRefCache)
		},
		getBackendLayerNamesForCatalog = require(script.Utils.getBackendLayerNamesForCatalog),
		getGearAssetIdFromState = require(script.Utils.getGearAssetIdFromState),
		getEquippedAssetIdsForType = require(script.Utils.getEquippedAssetIdsForType),
		isMakeupAssetType = require(script.Utils.isMakeupAssetType),
		isMakeupOrEyebrowEyelashAssetType = require(script.Utils.isMakeupOrEyebrowEyelashAssetType),
		isLayeredClothingAssetType = require(script.Utils.isLayeredClothingAssetType),
		isDurableItemExpired = require(script.Utils.isDurableItemExpired),
		formatTimeoutEndTime = require(script.Utils.formatTimeoutEndTime),
		showAvatarChangeFeatureRestriction = require(script.Utils.showAvatarChangeFeatureRestriction),
		isOutfitNameValid = require(script.Utils.isOutfitNameValid),
		isValidAssetTypeForOutfitType = require(script.Utils.isValidAssetTypeForOutfitType),
		getHumanoidDescriptionFromStateForOutfitType = require(script.Utils.Humanoid.getHumanoidDescriptionFromStateForOutfitType),
		getIsInsufficientRobuxError = require(script.Utils.getIsInsufficientRobuxError),
		getInventoryOutfitType = require(script.Utils.getInventoryOutfitType),
		getGrantedOutfitIds = require(script.Utils.getGrantedOutfitIds)
	},
	Backgrounds = {
		loadBackgroundAsset = require(script.Backgrounds.loadBackgroundAsset),
		selectActiveBackground = require(script.Backgrounds.selectActiveBackground),
		selectActiveBackgroundPreview = require(script.Backgrounds.selectActiveBackgroundPreview),
		selectTryOnBackgroundId = require(script.Backgrounds.selectTryOnBackgroundId),
		previewImageRegistry = require(script.Backgrounds.previewImageRegistry),
		buildOutfitProfileConfiguration = require(script.Backgrounds.buildOutfitProfileConfiguration),
		normalizeBackgroundId = require(script.Backgrounds.normalizeBackgroundId),
		getTemporaryPlusBackgroundIds = require(script.Backgrounds.getTemporaryPlusBackgroundIds),
		isPlusExclusiveBackground = require(script.Backgrounds.isPlusExclusiveBackground),
		NO_BACKGROUND_ASSET_ID = require(script.Backgrounds.constants).NO_BACKGROUND_ASSET_ID
	},
	Constants = require(script.Constants),
	AnimationConstants = require(script.AnimationConstants),
	["jest.config"] = script["jest.config"]
}