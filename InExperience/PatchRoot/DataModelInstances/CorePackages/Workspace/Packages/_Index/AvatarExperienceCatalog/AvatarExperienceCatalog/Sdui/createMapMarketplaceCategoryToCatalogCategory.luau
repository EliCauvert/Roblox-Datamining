local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local _ = require(parent.AvatarExperienceCommon)
local _ = require(parent.DataHydration)
local fFlagAXM41AllCategoriesToTaxonomy = require(parent.AvatarExperienceFlags).FFlagAXM41AllCategoriesToTaxonomy
local httpService = game:GetService("HttpService")
local t = {
	AllAnimations = "AllAnimation",
	AnimationBundles = "Animation",
	Emotes = "Emotes"
}
local t_1 = {
	Recommended = { Name = "All", CategoryFilter = "Recommended" },
	HighDefinition = { CategoryFilter = "HighDefinition" }
}

local function _(p0) --[[ line: 51 | named "widgetContextFromName" ]]
	return `catalog-tab:{string.lower(p0:gsub(" ", "-"):gsub("%.", "-"))}`
end

return function() --[[ line: 56 | named "createMapMarketplaceCategoryToCatalogCategory" ]]
	-- upvalues: httpService (ref), t_1 (ref), fFlagAXM41AllCategoriesToTaxonomy (ref), t (ref)
	local t_2 = {}
	
	local function _(p1) --[[ line: 65 | named "getOrCreateSearchUuid" ]]
		-- upvalues: t_2 (ref), httpService (copy)
		local var5 = t_2[p1]
		
		if var5 then
			return var5
		end
		local var6 = httpService:GenerateGUID(true)
		t_2[p1] = var6
		
		return var6
	end
	
	local _ = nil
	
	local function mapInternal(p2, p3, p4, p5) --[[ line: 82 ]]
		-- upvalues: mapInternal (write), t_1 (copy), t_2 (ref), httpService (copy), fFlagAXM41AllCategoriesToTaxonomy (copy), t (copy)
		p5[p2.id] = true
		local t_3 = nil
		
		if p2.subcategories and #p2.subcategories > 0 then
			t_3 = {}
			
			for i, v in p2.subcategories do
				if not p5[v] then
					local var8 = p3[v]
					
					if var8 then
						table.insert(t_3, mapInternal(var8, p3, true, p5))
					end
				end
			end
			if #t_3 == 0 then
				t_3 = nil
			end
		end
		local var12
		p5[p2.id] = nil
		local id = t_1[p2.id]
		local t_4 = {
			Id = p2.id,
			Name = if id and id.Name then id.Name else p2.name,
			CategoryFilter = if id then id.CategoryFilter else nil,
			Title = p2.title,
			LocalizedTitle = p2.title,
			WidgetContext = `catalog-tab:{string.lower(p2.name:gsub(" ", "-"):gsub("%.", "-"))}`
		}
		local id_1 = p2.id
		local var10 = t_2[id_1]
		
		if var10 then
			var12 = var10
		else
			local var11 = httpService:GenerateGUID(true)
			t_2[id_1] = var11
			var12 = var11
		end
		t_4.SearchUuid = var12
		t_4.TaxonomyUuid = if fFlagAXM41AllCategoriesToTaxonomy and p2.taxonomyId ~= nil and p2.taxonomyId ~= "" then p2.taxonomyId else nil
		t_4.AssetTypeIdStrings = p2.assetTypes
		t_4.BundleTypes = p2.bundleTypes
		t_4.TileType = p2.tileType
		t_4.TimeToRefresh = p2.timeToRefresh
		t_4.CategoryId = p2.categoryId
		t_4.SubcategoryId = p2.subcategoryId
		t_4.CameraFocus = p2.cameraFocus
		t_4.CameraZoomRadius = p2.cameraZoomRadius
		t_4.CanAnimateCameraBasedMood = p2.canAnimateCameraBasedMood
		t_4.LooksWidgetContextForOrganicContent = if p2.looksWidgetContextForOrganicContent == nil or p2.looksWidgetContextForOrganicContent == "" then nil else p2.looksWidgetContextForOrganicContent
		t_4.PageType = t[p2.name]
		t_4.Subcategories = t_3
		t_4.isSubcategory = if p4 then true else nil
		
		return t_4
	end
	
	return {
		map = function(p6, p7, p8) --[[ line: 169 ]]
			-- upvalues: mapInternal (write)
			return mapInternal(p6, p7, p8, {})
		end,
		clear = function() --[[ line: 177 ]]
			-- upvalues: t_2 (ref)
			table.clear(t_2)
		end
	}
end