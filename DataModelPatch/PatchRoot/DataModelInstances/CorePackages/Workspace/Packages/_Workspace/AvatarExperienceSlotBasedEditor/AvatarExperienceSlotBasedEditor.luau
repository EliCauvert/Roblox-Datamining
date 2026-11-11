local _ = require(script.Types)
local _ = require(script.Hooks.useSlotItemCardBreakpoints)

return {
	Components = {
		SlotItemCard = require(script.Components.SlotItemCard),
		SlotItemCardFooter = require(script.Components.SlotItemCardFooter),
		SlotCircularGradientFrame = require(script.Components.SlotCircularGradientFrame),
		SlotItemCardThumbnail = require(script.Components.SlotItemCardThumbnail),
		ClearAllButton = require(script.Components.ClearAllButton),
		CloseableHeader = require(script.Components.CloseableHeader),
		AXPartialPageModal = require(script.Components.AXPartialPageModal)
	},
	Hooks = {
		useSlotItemCardBreakpoints = require(script.Hooks.useSlotItemCardBreakpoints),
		useSlotCustomizeFtux = require(script.Hooks.useSlotCustomizeFtux)
	},
	Context = {
		SlotBasedEditorContext = require(script.Context.SlotBasedEditorContext),
		useSlotBasedEditorContext = require(script.Context.useSlotBasedEditorContext),
		AvatarEditorStores = require(script.Context.AvatarEditorStores),
		useAvatarEditorStores = require(script.Context.useAvatarEditorStores)
	},
	Stores = {
		createCategoryInventoryStore = require(script.Stores.createCategoryInventoryStore),
		createSortAndFiltersStore = require(script.Stores.createSortAndFiltersStore),
		createAvatarEditorStores = require(script.Stores.createAvatarEditorStores),
		createSlotBasedEditorStore = require(script.Stores.createSlotBasedEditorStore),
		createStaleInventoryGrantStore = require(script.Stores.createStaleInventoryGrantStore),
		getStaleInventoryGrantStore = require(script.Stores.getStaleInventoryGrantStore)
	},
	Enums = {
		ScreenLayout = require(script.Enums.ScreenLayout),
		AvatarEditorCategories = require(script.Enums.AvatarEditorCategories),
		AvatarEditorSubcategories = require(script.Enums.AvatarEditorSubcategories),
		Categories = require(script.Enums.Categories),
		ItemView = require(script.Enums.ItemView),
		NavigationParams = require(script.Enums.NavigationParams),
		InventoryItemType = require(script.Enums.InventoryItemType),
		InventorySorts = require(script.Enums.InventorySorts),
		InventoryFilters = require(script.Enums.InventoryFilters),
		InventoryItemAvailability = require(script.Enums.InventoryItemAvailability),
		SlotType = require(script.Enums.SlotType)
	},
	Constants = require(script.Constants),
	Utils = {
		buildStringsToLocalize = require(script.Utils.buildStringsToLocalize),
		buildSlots = require(script.Utils.buildSlots),
		getAssetTypesByCategory = require(script.Utils.getAssetTypesByCategory),
		buildBodySlotViewportProps = require(script.Utils.buildBodySlotViewportProps),
		getRemainingTimeFromExpiration = require(script.Utils.getRemainingTimeFromExpiration)
	},
	["jest.config"] = script["jest.config"]
}