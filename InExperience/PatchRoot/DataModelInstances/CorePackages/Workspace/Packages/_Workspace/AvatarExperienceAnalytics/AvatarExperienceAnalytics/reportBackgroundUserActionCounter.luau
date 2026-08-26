local avatarExperienceCommonModule = require(script:FindFirstAncestor("AvatarExperienceAnalytics").Parent.AvatarExperienceCommon)
local constantsModule = require(script.Parent.Constants)
local sendAXCounterV2Module = require(script.Parent.sendAXCounterV2)
local avatarBackground = avatarExperienceCommonModule.Constants.ASSET_TYPE_NAME_TO_ID_STRING.AvatarBackground
local t = {
	Equip = constantsModule.AVATAR_EVENT_COUNTER_NAME.AXEquipBackground,
	Unequip = constantsModule.AVATAR_EVENT_COUNTER_NAME.AXUnequipBackground,
	TryOn = constantsModule.AVATAR_EVENT_COUNTER_NAME.AXTryOnBackground,
	RemoveTryOn = constantsModule.AVATAR_EVENT_COUNTER_NAME.AXRemoveTryOnBackground
}
local t_1 = {
	report = function(p1)
		-- upvalues: sendAXCounterV2Module (ref), t (ref)
		sendAXCounterV2Module(t[p1])
	end
}

function t_1.reportIfAvatarBackgroundAsset(value, p1, p2)
	-- upvalues: avatarBackground (ref), t_1 (ref)
	if avatarBackground and p1 == "Asset" and p2 == avatarBackground then
		t_1.report(value)
	end
end

return t_1