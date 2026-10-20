local AvatarExperienceRodux = script:FindFirstAncestor("AvatarExperienceRodux")
local Parent = AvatarExperienceRodux.Parent
local _ = require(Parent.AvatarExperienceCommon)
local _ = require(Parent.AvatarExperienceModel)
local FFlagAXDurablesForMIS = require(Parent.AvatarExperienceFlags).FFlagAXDurablesForMIS
local _ = require(AvatarExperienceRodux.Types.OutfitTryOn)

return require(Parent.Rodux).makeActionCreator(script.Name, function(ItemType, ItemSubType, ItemId, SelectedInTryOnManager, OverrideOrder, BundleInfo, WidgetInfo, ReceivedBundleInfo, IsRecolorable, BundleItems, ResetTryOnsBeforeToggleOn, p1)
	-- upvalues: FFlagAXDurablesForMIS (copy)
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
		bundleItems = BundleItems,
		resetTryOnsBeforeToggleOn = ResetTryOnsBeforeToggleOn,
		selectedTimedOptionIndex = if FFlagAXDurablesForMIS then p1 else nil
	}
end)