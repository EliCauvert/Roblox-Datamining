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

local function _(p1)
	return `catalog-tab:{string.lower(p1:gsub(" ", "-"):gsub("%.", "-"))}`
end

return function()
	-- upvalues: httpService (ref), t_1 (ref), fFlagAXM41AllCategoriesToTaxonomy (ref), t (ref)
	local t_2 = {}
	
	local function _(p1)
		-- upvalues: t_2 (ref), httpService (copy)
		local var1 = t_2[p1]
		
		if var1 then
			return var1
		end
		local var2 = httpService:GenerateGUID(true)
		t_2[p1] = var2
		
		return var2
	end
	
	local _ = nil
	
	local function mapInternal(p1, p2, p3, p4)
		-- upvalues: mapInternal (write), t_1 (copy), t_2 (ref), httpService (copy), fFlagAXM41AllCategoriesToTaxonomy (copy), t (copy)
		p4[p1.id] = true
		local t_3 = nil
		
		if p1.subcategories and #p1.subcategories > 0 then
			t_3 = {}
			
			for i, v in p1.subcategories do
				if not p4[v] then
					local var1 = p2[v]
					
					if var1 then
						table.insert(t_3, mapInternal(var1, p2, true, p4))
					end
				end
			end
			if #t_3 == 0 then
				t_3 = nil
			end
		end
		local var2
		p4[p1.id] = nil
		local id = t_1[p1.id]
		local t_4 = {
			Id = p1.id,
			Name = if id and id.Name then id.Name else p1.name,
			CategoryFilter = if id then id.CategoryFilter else nil,
			Title = p1.title,
			LocalizedTitle = p1.title,
			WidgetContext = `catalog-tab:{string.lower(p1.name:gsub(" ", "-"):gsub("%.", "-"))}`
		}
		local id_1 = p1.id
		local var3 = t_2[id_1]
		
		if var3 then
			var2 = var3
		else
			local var4 = httpService:GenerateGUID(true)
			t_2[id_1] = var4
			var2 = var4
		end
		t_4.SearchUuid = var2
		t_4.TaxonomyUuid = if fFlagAXM41AllCategoriesToTaxonomy and p1.taxonomyId ~= nil and p1.taxonomyId ~= "" then p1.taxonomyId else nil
		t_4.AssetTypeIdStrings = p1.assetTypes
		t_4.BundleTypes = p1.bundleTypes
		t_4.TileType = p1.tileType
		t_4.TimeToRefresh = p1.timeToRefresh
		t_4.CategoryId = p1.categoryId
		t_4.SubcategoryId = p1.subcategoryId
		t_4.CameraFocus = p1.cameraFocus
		t_4.CameraZoomRadius = p1.cameraZoomRadius
		t_4.CanAnimateCameraBasedMood = p1.canAnimateCameraBasedMood
		t_4.LooksWidgetContextForOrganicContent = if p1.looksWidgetContextForOrganicContent == nil or p1.looksWidgetContextForOrganicContent == "" then nil else p1.looksWidgetContextForOrganicContent
		t_4.PageType = t[p1.name]
		t_4.Subcategories = t_3
		t_4.isSubcategory = if p3 then true else nil
		
		return t_4
	end
	
	return {
		map = function(p5, p6, p7)
			-- upvalues: mapInternal (write)
			return mapInternal(p5, p6, p7, {})
		end,
		clear = function()
			-- upvalues: t_2 (ref)
			table.clear(t_2)
		end
	}
end