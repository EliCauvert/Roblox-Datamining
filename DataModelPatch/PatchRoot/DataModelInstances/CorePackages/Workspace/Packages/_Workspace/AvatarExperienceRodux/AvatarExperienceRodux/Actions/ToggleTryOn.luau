local AvatarExperienceRodux = script:FindFirstAncestor("AvatarExperienceRodux")
local Parent = AvatarExperienceRodux.Parent
local _ = require(Parent.AvatarExperienceCommon)
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXMISEnableMultiShopping = AvatarExperienceFlagsModule.FFlagAXMISEnableMultiShopping
local FFlagAXDurablesForMIS = AvatarExperienceFlagsModule.FFlagAXDurablesForMIS
local _ = require(AvatarExperienceRodux.Types.OutfitTryOn)

return require(Parent.Rodux).makeActionCreator(script.Name, function(ItemType, ItemSubType, ItemId, SelectedInTryOnManager, OverrideOrder, BundleInfo, WidgetInfo, ReceivedBundleInfo, IsRecolorable, p1, p2, p3)
	-- upvalues: FFlagAXMISEnableMultiShopping (copy), FFlagAXDurablesForMIS (copy)
	return {
		itemType = ItemType,
		itemSubType = ItemSubType,
		itemId = ItemId,
		selectedInTryOnManager = SelectedInTryOnManager,
		overrideOrder = OverrideOrder,
		bundleInfo = BundleInfo,
		widgetInfo = WidgetInfo,
		receivedBundleInfo = ReceivedBundleInfo,
		isRecolorable = IsRecolorable,
		bundleItems = if FFlagAXMISEnableMultiShopping then p1 else nil,
		resetTryOnsBeforeToggleOn = if FFlagAXMISEnableMultiShopping then p2 else nil,
		selectedTimedOptionIndex = if FFlagAXDurablesForMIS then p3 else nil
	}
end)