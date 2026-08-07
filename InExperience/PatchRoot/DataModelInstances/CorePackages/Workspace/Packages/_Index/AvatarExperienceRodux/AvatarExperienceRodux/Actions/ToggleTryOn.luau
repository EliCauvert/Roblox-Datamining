local avatarExperienceRodux = script:FindFirstAncestor("AvatarExperienceRodux")
local parent = avatarExperienceRodux.Parent
local roduxModule = require(parent.Rodux)
local _ = require(parent.AvatarExperienceCommon)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXMISEnableMultiShopping = avatarExperienceFlagsModule.FFlagAXMISEnableMultiShopping
local fFlagAXDurablesForMIS = avatarExperienceFlagsModule.FFlagAXDurablesForMIS
local _ = require(avatarExperienceRodux.Types.OutfitTryOn)

return roduxModule.makeActionCreator(script.Name, function(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11) --[[ line: 40 ]]
	-- upvalues: fFlagAXMISEnableMultiShopping (ref), fFlagAXDurablesForMIS (ref)
	return {
		itemType = p0,
		itemSubType = p1,
		itemId = p2,
		selectedInTryOnManager = p3,
		overrideOrder = p4,
		bundleInfo = p5,
		widgetInfo = p6,
		receivedBundleInfo = p7,
		isRecolorable = p8,
		bundleItems = if fFlagAXMISEnableMultiShopping then p9 else nil,
		resetTryOnsBeforeToggleOn = if fFlagAXMISEnableMultiShopping then p10 else nil,
		selectedTimedOptionIndex = if fFlagAXDurablesForMIS then p11 else nil
	}
end)