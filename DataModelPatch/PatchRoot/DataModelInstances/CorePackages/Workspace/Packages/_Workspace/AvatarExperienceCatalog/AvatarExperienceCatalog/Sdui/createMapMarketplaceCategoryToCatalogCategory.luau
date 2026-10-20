local Parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local _ = require(Parent.AvatarExperienceCommon)
local _ = require(Parent.DataHydration)
local FFlagAXM41AllCategoriesToTaxonomy = require(Parent.AvatarExperienceFlags).FFlagAXM41AllCategoriesToTaxonomy
local HttpService = game:GetService("HttpService")
local config = {
	AllAnimations = "AllAnimation",
	AnimationBundles = "Animation",
	Emotes = "Emotes"
}
local config1 = {
	Recommended = { Name = "All", CategoryFilter = "Recommended" },
	HighDefinition = { CategoryFilter = "HighDefinition" }
}

local function _(Text: string): string
	return `catalog-tab:{string.lower((Text:gsub(" ", "-"):gsub("%.", "-")))}`
end

return function()
	-- upvalues: HttpService (copy), config1 (copy), FFlagAXM41AllCategoriesToTaxonomy (copy), config (copy)
	local Guids = {}
	
	local function _(Key)
		-- upvalues: Guids (copy), HttpService (upval)
		local Guid = Guids[Key]
		
		if Guid then
			return Guid
		else
			local Guid1 = HttpService:GenerateGUID(true)
			Guids[Key] = Guid1
			
			return Guid1
		end
	end
	
	local _ = nil
	
	local function mapInternal(p1, p2, p3, p4)
		-- upvalues: mapInternal (ref), config1 (upval), Guids (copy), HttpService (upval), FFlagAXM41AllCategoriesToTaxonomy (upval), config (upval)
		p4[p1.id] = true
		local List = nil
		
		if p1.subcategories and #p1.subcategories > 0 then
			List = {}
			
			for _, subcategory in p1.subcategories do
				if not p4[subcategory] then
					local v1 = p2[subcategory]
					
					if v1 then
						table.insert(List, mapInternal(v1, p2, true, p4))
					end
				end
			end
			if #List == 0 then
				List = nil
			end
		end
		p4[p1.id] = nil
		local Entry = config1[p1.id]
		local config2 = {
			Id = p1.id,
			Name = if Entry and Entry.Name then Entry.Name else p1.name,
			CategoryFilter = if Entry then Entry.CategoryFilter else nil,
			Title = p1.title,
			LocalizedTitle = p1.title,
			WidgetContext = `catalog-tab:{string.lower((p1.name:gsub(" ", "-"):gsub("%.", "-")))}`
		}
		local Id = p1.id
		local Guid = Guids[Id]
		local SearchUuid = nil
		
		if Guid then
			SearchUuid = Guid
		else
			local Guid1 = HttpService:GenerateGUID(true)
			Guids[Id] = Guid1
			SearchUuid = Guid1
		end
		config2.SearchUuid = SearchUuid
		config2.TaxonomyUuid = if FFlagAXM41AllCategoriesToTaxonomy and p1.taxonomyId ~= nil and p1.taxonomyId ~= "" then p1.taxonomyId else nil
		config2.AssetTypeIdStrings = p1.assetTypes
		config2.BundleTypes = p1.bundleTypes
		config2.TileType = p1.tileType
		config2.TimeToRefresh = p1.timeToRefresh
		config2.CategoryId = p1.categoryId
		config2.SubcategoryId = p1.subcategoryId
		config2.CameraFocus = p1.cameraFocus
		config2.CameraZoomRadius = p1.cameraZoomRadius
		config2.CanAnimateCameraBasedMood = p1.canAnimateCameraBasedMood
		config2.LooksWidgetContextForOrganicContent = if p1.looksWidgetContextForOrganicContent == nil or p1.looksWidgetContextForOrganicContent == "" then nil else p1.looksWidgetContextForOrganicContent
		config2.PageType = config[p1.name]
		config2.Subcategories = List
		config2.isSubcategory = if p3 then true else nil
		
		return config2
	end
	
	return {
		map = function(p5, p6, p7)
			-- upvalues: mapInternal (ref)
			return mapInternal(p5, p6, p7, {})
		end,
		clear = function()
			-- upvalues: Guids (copy)
			table.clear(Guids)
		end
	}
end