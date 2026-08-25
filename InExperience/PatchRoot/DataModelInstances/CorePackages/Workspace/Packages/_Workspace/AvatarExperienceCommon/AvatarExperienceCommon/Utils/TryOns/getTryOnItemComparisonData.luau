local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local itemTypeEnumModule = require(avatarExperienceCommon.Enums.ItemTypeEnum)
local _ = require(avatarExperienceCommon.Types.TryOnItemComparisonData)
local t = {
	[tostring(Enum.AssetType.ShirtAccessory.Value)] = "LCTops",
	[tostring(Enum.AssetType.TShirtAccessory.Value)] = "LCTops",
	[tostring(Enum.AssetType.SweaterAccessory.Value)] = "LCTops",
	[tostring(Enum.AssetType.PantsAccessory.Value)] = "LCBottoms",
	[tostring(Enum.AssetType.ShortsAccessory.Value)] = "LCBottoms",
	[tostring(Enum.AssetType.DressSkirtAccessory.Value)] = "LCBottoms"
}

function getTryOnItemComparisonData(p0)
	-- upvalues: t (ref), itemTypeEnumModule (ref)
	local t_1 = {}
	local t_2 = {}
	local var5 = false
	local var6 = false
	
	local function _(value)
		-- upvalues: t_1 (ref), t (copy), t_2 (ref)
		t_1[value] = true
		local var9 = t[value]
		
		if var9 then
			t_2[var9] = true
		end
	end
	
	if p0.itemType == itemTypeEnumModule.Asset then
		local itemSubType = p0.itemSubType
		t_1[itemSubType] = true
		local var7 = t[itemSubType]
		
		if var7 then
			t_2[var7] = true
		end
		if p0.itemSubType == tostring(Enum.AssetType.Head.Value) or p0.itemSubType == tostring(Enum.AssetType.Face.Value) then
			var5 = true
		end
	elseif p0.itemType == itemTypeEnumModule.Bundle and p0.bundleInfo then
		if p0.itemSubType == tostring(Enum.BundleType.DynamicHead.Value) then
			var6 = true
		end
		for i, v in p0.bundleInfo do
			local assetType = v.assetType
			t_1[assetType] = true
			local var8 = t[assetType]
			
			if var8 then
				t_2[var8] = true
			end
		end
	end
	return {
		assetTypes = t_1,
		layeredClothingCategories = t_2,
		isClassicHeadOrFace = var5,
		isDynamicHead = var6,
		itemType = p0.itemType,
		itemSubType = p0.itemSubType
	}
end

return getTryOnItemComparisonData