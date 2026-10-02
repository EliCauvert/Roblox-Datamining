local avatarExperienceRodux = script:FindFirstAncestor("AvatarExperienceRodux")
local parent = avatarExperienceRodux.Parent
local roduxModule = require(parent.Rodux)
local _ = require(parent.AvatarExperienceCommon)
local _ = require(parent.AvatarExperienceModel)
local fFlagAXDurablesForMIS = require(parent.AvatarExperienceFlags).FFlagAXDurablesForMIS
local _ = require(avatarExperienceRodux.Types.OutfitTryOn)

return roduxModule.makeActionCreator(script.Name, function(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12)
	-- upvalues: fFlagAXDurablesForMIS (ref)
	return {
		itemType = p1,
		itemSubType = p2,
		itemId = p3,
		selectedInTryOnManager = p4,
		overrideOrder = p5,
		bundleInfo = p6,
		widgetInfo = p7,
		receivedBundleInfo = p8,
		isRecolorable = p9,
		bundleItems = p10,
		resetTryOnsBeforeToggleOn = p11,
		selectedTimedOptionIndex = if fFlagAXDurablesForMIS then p12 else nil
	}
end)