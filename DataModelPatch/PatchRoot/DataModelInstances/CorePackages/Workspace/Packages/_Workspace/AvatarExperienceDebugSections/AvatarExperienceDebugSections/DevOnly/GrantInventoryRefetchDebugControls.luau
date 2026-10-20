local Parent = script:FindFirstAncestor("AvatarExperienceDebugSections").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local AvatarExperienceSlotBasedEditorModule = require(Parent.AvatarExperienceSlotBasedEditor)
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local AvatarEditorCategories = AvatarExperienceSlotBasedEditorModule.Enums.AvatarEditorCategories
local AvatarEditorSubcategories = AvatarExperienceSlotBasedEditorModule.Enums.AvatarEditorSubcategories
local GetStaleInventoryGrantStoreFunction = AvatarExperienceSlotBasedEditorModule.Stores.getStaleInventoryGrantStore
local AvatarExperience = game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience
local GetAvatarEditorCategoriesModule = require(AvatarExperience.AvatarEditor.GetAvatarEditorCategories)
local GetAvatarEditorStructureModule = require(AvatarExperience.AvatarEditor.GetAvatarEditorStructure)
local Hat = require(Parent.AvatarExperienceCommon).Constants.ASSET_TYPE_NAME_TO_ID_STRING.Hat
local _Color3 = Color3.fromRGB(120, 180, 255)

local function _()
	-- upvalues: GetStaleInventoryGrantStoreFunction (copy)
	local StaleInventoryGrantStore = GetStaleInventoryGrantStoreFunction()
	warn("=== [GrantInventoryRefetch] Stale store dump ===")
	warn("stale searchUuids:", StaleInventoryGrantStore.getStaleSearchUuids(false))
	warn("=== end dump ===")
end

local _ = function(List)
	-- upvalues: GetStaleInventoryGrantStoreFunction (copy)
	local StaleInventoryGrantStore = GetStaleInventoryGrantStoreFunction()
	
	for _, value in List do
		StaleInventoryGrantStore.markSearchUuidStale(value)
	end
	local StaleInventoryGrantStore1 = GetStaleInventoryGrantStoreFunction()
	warn("=== [GrantInventoryRefetch] Stale store dump ===")
	warn("stale searchUuids:", StaleInventoryGrantStore1.getStaleSearchUuids(false))
	warn("=== end dump ===")
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

local function getSearchUuidsForAssetType(Hat)
	-- upvalues: GetAvatarEditorStructureModule (copy), GetAvatarEditorCategoriesModule (copy), AvatarEditorCategories (copy)
	local AssetTypeToSearchUuid = GetAvatarEditorStructureModule().AssetTypeToSearchUuids[Hat]
	local Copy = if AssetTypeToSearchUuid then table.clone(AssetTypeToSearchUuid) else {}
	local SearchUuid = nil
	
	for _, value in GetAvatarEditorCategoriesModule() do
		if value.Id == AvatarEditorCategories.All and value.SearchUuid then
			SearchUuid = value.SearchUuid
			break
		end
	end
	if SearchUuid then
		for _, value1 in Copy do
			if value1 == SearchUuid then
				return Copy
			end
		end
		Copy[#Copy + 1] = SearchUuid
	end
	return Copy
end

local _ = function(p1)
	-- upvalues: GetAvatarEditorCategoriesModule (copy)
	local function walk(Subcategories)
		-- upvalues: p1 (copy), walk (copy)
		local v1 = nil
		for _, subcategory in Subcategories do
			if subcategory.SubcategoryFilters then
				for _, subcategoryFilter in subcategory.SubcategoryFilters do
					if subcategoryFilter.NavigationKey == p1 and subcategoryFilter.SearchUuid then
						return subcategoryFilter.SearchUuid
					end
				end
			end
			if subcategory.Subcategories then
				v1 = walk(subcategory.Subcategories)
				
				if v1 then
					return v1
				end
			end
		end
		return nil
	end
	
	return (walk((GetAvatarEditorCategoriesModule())))
end

local function markHatsCategoryStale()
	-- upvalues: getSearchUuidsForAssetType (copy), Hat (copy), GetStaleInventoryGrantStoreFunction (copy)
	local SearchUuidsForAssetType = getSearchUuidsForAssetType(Hat)
	local StaleInventoryGrantStore = GetStaleInventoryGrantStoreFunction()
	
	for _, value in SearchUuidsForAssetType do
		StaleInventoryGrantStore.markSearchUuidStale(value)
	end
	local StaleInventoryGrantStore1 = GetStaleInventoryGrantStoreFunction()
	warn("=== [GrantInventoryRefetch] Stale store dump ===")
	warn("stale searchUuids:", StaleInventoryGrantStore1.getStaleSearchUuids(false))
	warn("=== end dump ===")
end

local function markFullBodyCategoryStale()
	-- upvalues: AvatarEditorSubcategories (copy), GetAvatarEditorCategoriesModule (copy), GetStaleInventoryGrantStoreFunction (copy)
	local FullBody = AvatarEditorSubcategories.FullBody
	
	local function walk(Subcategories)
		-- upvalues: FullBody (copy), walk (copy)
		local v2 = nil
		for _, subcategory in Subcategories do
			if subcategory.SubcategoryFilters then
				for _, subcategoryFilter in subcategory.SubcategoryFilters do
					if subcategoryFilter.NavigationKey == FullBody and subcategoryFilter.SearchUuid then
						return subcategoryFilter.SearchUuid
					end
				end
			end
			if subcategory.Subcategories then
				v2 = walk(subcategory.Subcategories)
				
				if v2 then
					return v2
				end
			end
		end
		return nil
	end
	
	local WalkResult = walk((GetAvatarEditorCategoriesModule()))
	
	if not WalkResult then
		warn("[GrantInventoryRefetch] Full Body SearchUuid not found")
		
		return
	end
	local list = { WalkResult }
	local StaleInventoryGrantStore = GetStaleInventoryGrantStoreFunction()
	
	for _, value in list do
		StaleInventoryGrantStore.markSearchUuidStale(value)
	end
	local StaleInventoryGrantStore1 = GetStaleInventoryGrantStoreFunction()
	warn("=== [GrantInventoryRefetch] Stale store dump ===")
	warn("stale searchUuids:", StaleInventoryGrantStore1.getStaleSearchUuids(false))
	warn("=== end dump ===")
end

local function HarnessButton(p2)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), FoundationModule (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(View, {
		Size = UDim2.new(1, 0, 0, 28),
		LayoutOrder = p2.layoutOrder,
		backgroundStyle = {
			Transparency = 0,
			Color3 = UseTokensResult.Color.Surface.Surface_300.Color3
		},
		cornerRadius = UDim.new(0, UseTokensResult.Radius.Small),
		padding = Vector2.new(UseTokensResult.Padding.Small, 0),
		onActivated = p2.onClick,
		stateLayer = { mode = FoundationModule.Enums.StateLayerMode.Inverse }
	}, {
		Label = ReactModule.createElement(Text, {
			tag = "text-label-small text-align-x-left",
			Size = UDim2.new(1, 0, 1, 0),
			TextColor3 = p2.accent or UseTokensResult.Color.Content.Emphasis.Color3,
			Text = p2.text
		})
	})
end

return require(Parent.DebugPanel).registerSection({
	id = "ax.grantInventoryRefetch",
	order = 155,
	defaultCollapsed = true,
	path = { "Economy", "Marketplace", "Grant Inventory Refetch" },
	component = function()
		-- upvalues: ReactModule (copy), Text (copy), HarnessButton (copy), _Color3 (copy), markHatsCategoryStale (copy), markFullBodyCategoryStale (copy)
		return ReactModule.createElement(ReactModule.Fragment, nil, {
			Help = ReactModule.createElement(Text, {
				tag = "text-caption-small text-align-x-left content-muted",
				LayoutOrder = 1,
				Text = "Mark a category stale, then open that editor tab to trigger refetch.",
				TextWrapped = true,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}),
			MarkHatsStaleButton = ReactModule.createElement(HarnessButton, {
				layoutOrder = 2,
				text = "Mark Hats stale",
				accent = _Color3,
				onClick = markHatsCategoryStale
			}),
			MarkFullBodyStaleButton = ReactModule.createElement(HarnessButton, {
				layoutOrder = 3,
				text = "Mark Full Body stale",
				accent = _Color3,
				onClick = markFullBodyCategoryStale
			})
		})
	end
})