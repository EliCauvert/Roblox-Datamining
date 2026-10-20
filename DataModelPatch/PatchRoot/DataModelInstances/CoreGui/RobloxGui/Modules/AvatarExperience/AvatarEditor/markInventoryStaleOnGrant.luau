local CorePackages = game:GetService("CorePackages")
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local AvatarExperienceSlotBasedEditorModule = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local GetAvatarEditorStructureModule = require(Modules.AvatarExperience.AvatarEditor.GetAvatarEditorStructure)
local GetAvatarEditorCategoriesModule = require(Modules.AvatarExperience.AvatarEditor.GetAvatarEditorCategories)
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)
local ConstantsModule1 = require(Modules.AvatarExperience.Common.Constants)
local GetStaleInventoryGrantStoreFunction = AvatarExperienceSlotBasedEditorModule.Stores.getStaleInventoryGrantStore
local AvatarEditorCategories = AvatarExperienceSlotBasedEditorModule.Enums.AvatarEditorCategories
local FFlagAXRefetchInventoryOnAssetGrant = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXRefetchInventoryOnAssetGrant

local function _(p1, List)
	if not List then return end
	for _, value in List do
		p1.markSearchUuidStale(value)
	end
end

local _ = function()
	-- upvalues: GetAvatarEditorCategoriesModule (copy), AvatarEditorCategories (copy)
	for _, value in GetAvatarEditorCategoriesModule() do
		if value.Id == AvatarEditorCategories.All and value.SearchUuid then
			return value.SearchUuid
		end
	end
	return nil
end

local _ = function(Tbl, p2)
	if not p2 then
		return Tbl
	end
	for _, value in Tbl do
		if value == p2 then
			return Tbl
		end
	end
	local Copy = table.clone(Tbl)
	Copy[#Copy + 1] = p2
	
	return Copy
end

local _ = function(Keys, p3, Key)
	if Key and not p3[Key] then
		p3[Key] = true
		Keys[#Keys + 1] = Key
		
		return
	end
end

local function getOutfitInventoryKeysForGrant(OutfitType)
	-- upvalues: ConstantsModule1 (copy), ConstantsModule (copy), GetAvatarEditorCategoriesModule (copy)
	if OutfitType == ConstantsModule1.OutfitTypes.EditableAvatar then
		return { ConstantsModule.EditableCharacterKey }
	end
	if OutfitType == ConstantsModule1.OutfitTypes.Avatar then
		return {
			ConstantsModule.PurchasedCharacterKey,
			ConstantsModule.CharacterKey
		}
	end
	if OutfitType == ConstantsModule1.OutfitTypes.Makeup then
		return { ConstantsModule.MakeupOutfitKey }
	end
	if OutfitType == ConstantsModule1.OutfitTypes.DynamicHead then
		for _, value in GetAvatarEditorCategoriesModule() do
			if value.Subcategories then
				for _, subcategory in value.Subcategories do
					if subcategory.OutfitType == ConstantsModule1.OutfitTypes.DynamicHead and subcategory.SearchUuid then
						return { subcategory.SearchUuid }
					end
				end
			end
		end
	end
	return {}
end

local function getBundleTypeIdStringsForOutfitType(EditableAvatar)
	-- upvalues: ConstantsModule1 (copy)
	if EditableAvatar == ConstantsModule1.OutfitTypes.EditableAvatar then
		return { ConstantsModule1.BundleTypeIdStrings.Avatars }
	end
	local t = {}
	
	for i, value in ConstantsModule1.BundleTypeIdStringToOutfitType do
		if value == EditableAvatar then
			t[#t + 1] = i
		end
	end
	return t
end

local function collectSearchUuidsForBundleTypes(Subcategories, List, SearchUuids, p3)
	-- upvalues: collectSearchUuidsForBundleTypes (copy)
	for _, subcategory in Subcategories do
		local BundleTypeIdStrings = subcategory.BundleTypeIdStrings or subcategory.BundleTypes
		
		if subcategory.SearchUuid and BundleTypeIdStrings then
			for _, bundleTypeIdString in BundleTypeIdStrings do
				for _, value in List do
					if bundleTypeIdString == value then
						local SearchUuid = subcategory.SearchUuid
						
						if SearchUuid and not p3[SearchUuid] then
							p3[SearchUuid] = true
							SearchUuids[#SearchUuids + 1] = SearchUuid
						end
					end
				end
			end
		end
		if subcategory.Subcategories then
			collectSearchUuidsForBundleTypes(subcategory.Subcategories, List, SearchUuids, p3)
		end
		if subcategory.SubcategoryFilters then
			collectSearchUuidsForBundleTypes(subcategory.SubcategoryFilters, List, SearchUuids, p3)
		end
	end
end

local function getSearchUuidsForGrant(p4)
	-- upvalues: GetAvatarEditorStructureModule (copy), GetAvatarEditorCategoriesModule (copy), AvatarEditorCategories (copy), getOutfitInventoryKeysForGrant (copy), getBundleTypeIdStringsForOutfitType (copy), collectSearchUuidsForBundleTypes (copy)
	if p4.assetTypeIdString then
		local AssetTypeToSearchUuid = GetAvatarEditorStructureModule().AssetTypeToSearchUuids[p4.assetTypeIdString] or {}
		local SearchUuid = nil
		
		for _, value in GetAvatarEditorCategoriesModule() do
			if value.Id == AvatarEditorCategories.All and value.SearchUuid then
				SearchUuid = value.SearchUuid
				break
			end
		end
		if not SearchUuid then
			return AssetTypeToSearchUuid
		end
		for _, value1 in AssetTypeToSearchUuid do
			if value1 == SearchUuid then
				return AssetTypeToSearchUuid
			end
		end
		local Copy = table.clone(AssetTypeToSearchUuid)
		Copy[#Copy + 1] = SearchUuid
		
		return Copy
	else
		local OutfitType = p4.outfitType
		local SearchUuids = {}
		local t = {}
		
		if OutfitType then
			for _, value2 in getOutfitInventoryKeysForGrant(OutfitType) do
				if value2 and not t[value2] then
					t[value2] = true
					SearchUuids[#SearchUuids + 1] = value2
				end
			end
			collectSearchUuidsForBundleTypes(GetAvatarEditorCategoriesModule(), getBundleTypeIdStringsForOutfitType(OutfitType), SearchUuids, t)
		end
		local SearchUuid = nil
		
		for _, value3 in GetAvatarEditorCategoriesModule() do
			if value3.Id == AvatarEditorCategories.All and value3.SearchUuid then
				SearchUuid = value3.SearchUuid
				break
			end
		end
		if SearchUuid then
			if t[SearchUuid] then
				return SearchUuids
			end
			t[SearchUuid] = true
			SearchUuids[#SearchUuids + 1] = SearchUuid
		end
		return SearchUuids
	end
end

return function(p5)
	-- upvalues: ArgCheckModule (copy), FFlagAXRefetchInventoryOnAssetGrant (copy), GetStaleInventoryGrantStoreFunction (copy), getSearchUuidsForGrant (copy)
	ArgCheckModule.isType(p5, "table", "markInventoryStaleOnGrant expects grantCategory")
	
	if not FFlagAXRefetchInventoryOnAssetGrant then return end
	local StaleInventoryGrantStore = GetStaleInventoryGrantStoreFunction()
	local SearchUuidsForGrant = getSearchUuidsForGrant(p5)
	
	if not SearchUuidsForGrant then return end
	for _, value in SearchUuidsForGrant do
		StaleInventoryGrantStore.markSearchUuidStale(value)
	end
end