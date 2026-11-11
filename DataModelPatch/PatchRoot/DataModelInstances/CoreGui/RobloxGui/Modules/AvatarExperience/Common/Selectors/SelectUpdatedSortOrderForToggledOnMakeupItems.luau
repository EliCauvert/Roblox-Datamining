local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local LayeredMakeupSortUtilsModule = require(Modules.AvatarExperience.LayeredMakeupSort.LayeredMakeupSortUtils)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local _ = require(Modules.AvatarExperience.Common.Types)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local ASSETTYPEIDSTRINGTOMAKEUPTYPE = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Constants.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE

local function _(p1, _, p2, p3, _)
	if p1[p2.typeId] and p1[p2.typeId][p2.id] then
		p3[p2.id] = { assetTypeId = p2.typeId, order = p2.order }
	end
end

local function v10(Id, Bundle, TypeId, p1, _, _, _)
	-- upvalues: ConstantsModule (copy), ASSETTYPEIDSTRINGTOMAKEUPTYPE (copy), LayeredMakeupSortUtilsModule (copy)
	local BundleInfoMapping = {}
	local OverrideOrder = nil
	local EquippedAssetsToSetOrder = {}
	local ItemIdToOrderMap = {}
	
	if Bundle ~= ConstantsModule.ItemType.Bundle and TypeId and ASSETTYPEIDSTRINGTOMAKEUPTYPE[TypeId] then
		local _, TableAndOrderAfterEquippingIntoSort2 = LayeredMakeupSortUtilsModule.getTableAndOrderAfterEquippingIntoSort(p1, { id = Id, typeId = TypeId })
		OverrideOrder = TableAndOrderAfterEquippingIntoSort2
	end
	return {
		overrideOrder = OverrideOrder,
		bundleInfoMapping = BundleInfoMapping,
		equippedAssetsToSetOrder = EquippedAssetsToSetOrder,
		itemIdToOrderMap = ItemIdToOrderMap
	}
end

return function(p1, Id, p2, TypeId, p3)
	-- upvalues: UtilsModule (copy), v10 (copy)
	return (v10(Id, p2, TypeId, p3, p1.AvatarExperience.AvatarEditor.Character.EquippedAssets, p1.AvatarExperience.Common.AssetInfos, (UtilsModule.getBundleInfoFromState(p1, Id))))
end