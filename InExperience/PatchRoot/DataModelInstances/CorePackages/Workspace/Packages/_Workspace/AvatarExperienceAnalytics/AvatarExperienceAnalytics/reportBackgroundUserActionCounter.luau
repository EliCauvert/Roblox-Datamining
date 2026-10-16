local ConstantsModule = require(script.Parent.Constants)
local SendAXCounterV2Module = require(script.Parent.sendAXCounterV2)
local AvatarBackground = require(script:FindFirstAncestor("AvatarExperienceAnalytics").Parent.AvatarExperienceCommon).Constants.ASSET_TYPE_NAME_TO_ID_STRING.AvatarBackground
local config = {
	Equip = ConstantsModule.AVATAR_EVENT_COUNTER_NAME.AXEquipBackground,
	Unequip = ConstantsModule.AVATAR_EVENT_COUNTER_NAME.AXUnequipBackground,
	TryOn = ConstantsModule.AVATAR_EVENT_COUNTER_NAME.AXTryOnBackground,
	RemoveTryOn = ConstantsModule.AVATAR_EVENT_COUNTER_NAME.AXRemoveTryOnBackground
}
local ReportBackgroundUserActionCounterModule = {
	report = function(p1) --[[ Line: 25 ]]
		-- upvalues: SendAXCounterV2Module (copy), config (copy)
		SendAXCounterV2Module(config[p1])
	end
}

function ReportBackgroundUserActionCounterModule.reportIfAvatarBackgroundAsset(p1, p2, AvatarBackground1) --[[ Line: 30 ]]
	-- upvalues: AvatarBackground (copy), ReportBackgroundUserActionCounterModule (copy)
	if AvatarBackground and p2 == "Asset" and AvatarBackground1 == AvatarBackground then
		ReportBackgroundUserActionCounterModule.report(p1)
	end
end

return ReportBackgroundUserActionCounterModule