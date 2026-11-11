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
			CatalogItemCard = require(script.Components.CatalogItemCard.CatalogItemCard),
			CatalogRowItemCard = require(script.Components.CatalogRowItemCard.CatalogRowItemCard),
			WearTimeFTUXStatusEnum = require(script.Components.CatalogItemCard.Enums.WearTimeFTUXStatusEnum)
		},
		Filters = {
			CheckboxButtonItem = require(script.Components.Filters.CheckboxButtonItem),
			CheckboxGroup = require(script.Components.Filters.CheckboxGroup),
			ExpandingFrame = require(script.Components.Filters.ExpandingFrame)
		},
		ContextualActionButton = require(script.Components.ContextualActionButton.ContextualActionButton),
		AnimatedScrollingFrame = {
			useAXAnimateScrollFrame = require(script.Components.AnimatedScrollingFrame.useAXAnimateScrollFrame),
			AnimatedScrollingFrame = require(script.Components.AnimatedScrollingFrame.AnimatedScrollingFrame)
		},
		AXPartialPageModal = require(script.Components.AXPartialPageModal.AXPartialPageModal),
		wrapForReactPortal = require(script.Components.Wrappers.wrapForReactPortal),
		AXTooltip = require(script.Components.AXTooltip.AXTooltipContainer),
		TimeoutBanner = require(script.Components.TimeoutBanner.TimeoutBannerContainer),
		Prompts = {
			EnhancedAvatarHeadsFtuxPrompt = require(script.Components.Prompts.EnhancedAvatarHeadsFtuxPrompt)
		}
	},
	Enums = {
		OutfitTypes = require(script.Enums.OutfitTypes),
		ItemTypeEnum = require(script.Enums.ItemTypeEnum),
		ItemRestrictions = require(script.Enums.ItemRestrictions),
		ItemStatus = require(script.Enums.ItemStatus),
		SalesLocationType = require(script.Enums.SalesLocationType),
		CreatorType = require(script.Enums.CreatorType),
		NoPriceStatus = require(script.Enums.NoPriceStatus),
		ItemPurchaseActionTypeEnum = require(script.Enums.ItemPurchaseActionTypeEnum),
		CatalogCategories = require(script.Enums.CatalogCategories),
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
		useFocusOnMountEffect = require(script.Hooks.useFocusOnMountEffect),
		useEnhancedAvatarHeadsFtux = require(script.Hooks.useEnhancedAvatarHeadsFtux),
		useAdaptiveScrolling = require(script.Hooks.useAdaptiveScrolling),
		AdaptiveScrollingContext = require(script.Hooks.AdaptiveScrollingContext),
		withAdaptiveScrolling = require(script.Hooks.withAdaptiveScrolling),
		useUnifiedImpressionExposer = require(script.Hooks.useUnifiedImpressionExposer)
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
			selectAdjustableLastTryOnItem = require(script.State.Selectors.selectAdjustableLastTryOnItem),
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
			selectTryOnsLookId = require(script.State.Selectors.selectTryOnsLookId)
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
		getTimeoutStatusStore = require(script.Stores.TimeoutStatusStore.getTimeoutStatusStore)
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
		getRbxThumbType = require(script.Utils.getRbxThumbType),
		normalize = require(script.Utils.normalize),
		debounce = require(script.Utils.debounce),
		getZoomedSizeAndOffset = require(script.Utils.getZoomedSizeAndOffset),
		getThumbSizeVectorFromParamString = require(script.Utils.getThumbSizeVectorFromParamString),
		getUseSelectorDeepEquals = require(script.Utils.getUseSelectorDeepEquals),
		findItemInTryOnItems = require(script.Utils.findItemInTryOnItems),
		getTryOnItemReducerKey = require(script.Utils.getTryOnItemReducerKey),
		getItemPurchaseActionType = require(script.Utils.getItemPurchaseActionType),
		RoactGamepadMigration = {
			useTableWrappedCallbackRef = require(script.Utils.RoactGamepadMigration.useTableWrappedCallbackRef),
			findValueKeyInRefCache = require(script.Utils.RoactGamepadMigration.findValueKeyInRefCache)
		},
		getBackendLayerNamesForCatalog = require(script.Utils.getBackendLayerNamesForCatalog),
		getGearAssetIdFromState = require(script.Utils.getGearAssetIdFromState),
		getEquippedAssetIdsForType = require(script.Utils.getEquippedAssetIdsForType),
		isMakeupAssetType = require(script.Utils.isMakeupAssetType),
		isMakeupOrEyebrowEyelashAssetType = require(script.Utils.isMakeupOrEyebrowEyelashAssetType),
		isLayeredClothingAssetType = require(script.Utils.isLayeredClothingAssetType),
		isDurableItemExpired = require(script.Utils.isDurableItemExpired),
		formatTimeoutEndTime = require(script.Utils.formatTimeoutEndTime)
	},
	Backgrounds = {
		loadBackgroundAsset = require(script.Backgrounds.loadBackgroundAsset),
		selectActiveBackground = require(script.Backgrounds.selectActiveBackground),
		buildOutfitProfileConfiguration = require(script.Backgrounds.buildOutfitProfileConfiguration),
		NO_BACKGROUND_ASSET_ID = require(script.Backgrounds.constants).NO_BACKGROUND_ASSET_ID
	},
	Constants = require(script.Constants),
	AnimationConstants = require(script.AnimationConstants),
	["jest.config"] = script["jest.config"]
}