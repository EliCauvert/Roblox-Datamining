local Modules = game:GetService("CoreGui").RobloxGui.Modules
local GetAvatarEditorCategoriesModule = require(Modules.AvatarExperience.AvatarEditor.GetAvatarEditorCategories)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local FFlagAXFixBundleRedirectFromCatalogForSlotsModule = require(Modules.AvatarExperience.Flags.FFlagAXFixBundleRedirectFromCatalogForSlots)
local FFlagAXLeaveCatalogToAvatarPromptHandleSubcategoryFilters = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceFlags).FFlagAXLeaveCatalogToAvatarPromptHandleSubcategoryFilters
local v1 = nil

local function _(Category, Subcategory)
	return { category = Category, subcategory = Subcategory }
end

local function CreateAvatarEditorStructure()
	-- upvalues: FFlagAXLeaveCatalogToAvatarPromptHandleSubcategoryFilters (copy), FFlagAXFixBundleRedirectFromCatalogForSlotsModule (copy), GetAvatarEditorCategoriesModule (copy), ConstantsModule (copy)
	local AssetTypeToCategorySubcategory = {}
	local T = if FFlagAXLeaveCatalogToAvatarPromptHandleSubcategoryFilters or FFlagAXFixBundleRedirectFromCatalogForSlotsModule then {} else nil
	local OutfitTypeToCategorySubcategory = {}
	local AvatarEditorCategoriesModule = GetAvatarEditorCategoriesModule()
	
	if FFlagAXLeaveCatalogToAvatarPromptHandleSubcategoryFilters then
		local function handleCategoryInfo(p1, Category, Subcategory, SubcategoryFilter)
			-- upvalues: AssetTypeToCategorySubcategory (copy), T (ref), handleCategoryInfo (copy)
			local config = {
				category = Category,
				subcategory = Subcategory,
				subcategoryFilter = SubcategoryFilter
			}
			
			if p1.AssetTypeIdStrings then
				for _, assetTypeIdString in p1.AssetTypeIdStrings do
					AssetTypeToCategorySubcategory[assetTypeIdString] = config
				end
			end
			if p1.BundleTypeIdStrings then
				for _, bundleTypeIdString in p1.BundleTypeIdStrings do
					T[bundleTypeIdString] = config
				end
			end
			if p1.Subcategories then
				for i, subcategory in p1.Subcategories do
					handleCategoryInfo(subcategory, Category, i, nil)
				end
			end
			if p1.SubcategoryFilters then
				for i1, subcategoryFilter in p1.SubcategoryFilters do
					handleCategoryInfo(subcategoryFilter, Category, Subcategory, i1)
				end
			end
		end
		
		for i, value in AvatarEditorCategoriesModule do
			handleCategoryInfo(value, i, nil, nil)
		end
	else
		for _, value1 in AvatarEditorCategoriesModule do
			local Subcategories = value1.Subcategories
			
			if Subcategories then
				if FFlagAXFixBundleRedirectFromCatalogForSlotsModule then
					for _, subcategory in Subcategories do
						if subcategory.AssetTypeIdStrings then
							for _, assetTypeIdString in subcategory.AssetTypeIdStrings do
								AssetTypeToCategorySubcategory[assetTypeIdString] = {
									category = subcategory.Category,
									subcategory = subcategory.Subcategory
								}
							end
						end
						if subcategory.BundleTypeIdStrings then
							for _, bundleTypeIdString in subcategory.BundleTypeIdStrings do
								T[bundleTypeIdString] = {
									category = value1.Category,
									subcategory = subcategory.Subcategory
								}
							end
						end
						if subcategory.OutfitType then
							OutfitTypeToCategorySubcategory[subcategory.OutfitType] = {
								category = value1.Category,
								subcategory = value1.Subcategory
							}
						end
					end
				else
					for _, subcategory1 in Subcategories do
						if subcategory1.AssetTypeIdStrings then
							for _, assetTypeIdString1 in subcategory1.AssetTypeIdStrings do
								AssetTypeToCategorySubcategory[assetTypeIdString1] = {
									category = subcategory1.Category,
									subcategory = subcategory1.Subcategory
								}
							end
						elseif subcategory1.BundleTypes then
							T = {
								category = value1.Category,
								subcategory = value1.Subcategory
							}
						elseif subcategory1.OutfitType then
							OutfitTypeToCategorySubcategory[subcategory1.OutfitType] = {
								category = value1.Category,
								subcategory = value1.Subcategory
							}
						end
					end
				end
			else
				if not value1.AssetTypeIdStrings then
					if value1.OutfitType then
						OutfitTypeToCategorySubcategory[value1.OutfitType] = {
							category = value1.Category,
							subcategory = value1.Subcategory
						}
						continue
					end
					continue
				end
				for _, assetTypeIdString2 in value1.AssetTypeIdStrings do
					AssetTypeToCategorySubcategory[assetTypeIdString2] = {
						category = value1.Category,
						subcategory = value1.Subcategory
					}
				end
			end
		end
	end
	local AssetTypeToSearchUuids = {}
	
	local function fillFromAssetTypes(SearchUuid, AssetTypeIdStrings)
		-- upvalues: AssetTypeToSearchUuids (copy)
		for _, assetTypeIdString in AssetTypeIdStrings do
			if not AssetTypeToSearchUuids[assetTypeIdString] then
				AssetTypeToSearchUuids[assetTypeIdString] = {}
			end
			local AssetTypeToSearchUuid = AssetTypeToSearchUuids[assetTypeIdString]
			AssetTypeToSearchUuid[#AssetTypeToSearchUuid + 1] = SearchUuid
		end
	end
	
	local function fillAssetTypeToSearchUuids(Subcategories)
		-- upvalues: fillFromAssetTypes (copy), fillAssetTypeToSearchUuids (copy)
		for _, subcategory in Subcategories do
			if subcategory.AssetTypeIdStrings and subcategory.SearchUuid then
				fillFromAssetTypes(subcategory.SearchUuid, subcategory.AssetTypeIdStrings)
			end
			if subcategory.Subcategories then
				fillAssetTypeToSearchUuids(subcategory.Subcategories)
			end
		end
	end
	
	local function fillAssetTypeNoCategories()
		-- upvalues: ConstantsModule (upval), AssetTypeToCategorySubcategory (copy), FFlagAXLeaveCatalogToAvatarPromptHandleSubcategoryFilters (upval), T (ref), OutfitTypeToCategorySubcategory (copy)
		for i, _ in ConstantsModule.DynamicHeadAssetTypes do
			if not AssetTypeToCategorySubcategory[i] then
				if FFlagAXLeaveCatalogToAvatarPromptHandleSubcategoryFilters then
					AssetTypeToCategorySubcategory[i] = T[ConstantsModule.BundleTypeIdStrings.DynamicHead]
				else
					AssetTypeToCategorySubcategory[i] = OutfitTypeToCategorySubcategory[ConstantsModule.OutfitTypes.DynamicHead]
				end
			end
		end
	end
	
	fillAssetTypeToSearchUuids(GetAvatarEditorCategoriesModule())
	fillAssetTypeNoCategories()
	
	return {
		AssetTypeToCategorySubcategory = AssetTypeToCategorySubcategory,
		AssetTypeToSearchUuids = AssetTypeToSearchUuids,
		BundleToCategorySubcategory = T,
		OutfitTypeToCategorySubcategory = OutfitTypeToCategorySubcategory
	}
end

return function()
	-- upvalues: v1 (ref), CreateAvatarEditorStructure (copy)
	if not v1 then
		v1 = CreateAvatarEditorStructure()
	end
	return v1
end