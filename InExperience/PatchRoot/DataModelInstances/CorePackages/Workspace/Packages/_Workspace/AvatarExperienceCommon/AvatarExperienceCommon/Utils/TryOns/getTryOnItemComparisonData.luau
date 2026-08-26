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

function getTryOnItemComparisonData(p1)
	-- upvalues: t (ref), itemTypeEnumModule (ref)
	local t_1 = {}
	local t_2 = {}
	local var1 = false
	local var2 = false
	
	local function _(value)
		-- upvalues: t_1 (ref), t (copy), t_2 (ref)
		t_1[value] = true
		local var3 = t[value]
		
		if var3 then
			t_2[var3] = true
		end
	end
	
	if p1.itemType == itemTypeEnumModule.Asset then
		local itemSubType = p1.itemSubType
		t_1[itemSubType] = true
		local var3 = t[itemSubType]
		
		if var3 then
			t_2[var3] = true
		end
		if p1.itemSubType == tostring(Enum.AssetType.Head.Value) or p1.itemSubType == tostring(Enum.AssetType.Face.Value) then
			var1 = true
		end
	elseif p1.itemType == itemTypeEnumModule.Bundle and p1.bundleInfo then
		if p1.itemSubType == tostring(Enum.BundleType.DynamicHead.Value) then
			var2 = true
		end
		for i, v in p1.bundleInfo do
			local assetType = v.assetType
			t_1[assetType] = true
			local var4 = t[assetType]
			
			if var4 then
				t_2[var4] = true
			end
		end
	end
	return {
		assetTypes = t_1,
		layeredClothingCategories = t_2,
		isClassicHeadOrFace = var1,
		isDynamicHead = var2,
		itemType = p1.itemType,
		itemSubType = p1.itemSubType
	}
end

return getTryOnItemComparisonData