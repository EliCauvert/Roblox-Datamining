local _ = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceCommon)

local function deepCompareTables(List, List1, Text: string)
	-- upvalues: deepCompareTables (copy)
	local List2 = {}
	
	if type(List) ~= type(List1) then
		table.insert(List2, string.format("%s: type mismatch (SDUI: %s, Legacy: %s)", Text, type(List), (type(List1))))
		
		return List2
	end
	if type(List) ~= "table" then
		return List2
	end
	if #List > 0 or #List1 > 0 then
		if #List ~= #List1 then
			table.insert(List2, string.format("%s: array length mismatch (SDUI: %d, Legacy: %d)", Text, #List, #List1))
		end
		for i = 1, math.max(#List, #List1) do
			local Entry = List[i]
			local Entry1 = List1[i]
			local Formatted = string.format("%s[%d]", Text, i)
			
			if Entry == nil and Entry1 ~= nil then
				table.insert(List2, string.format("%s: missing in SDUI", Formatted))
			elseif Entry == nil or Entry1 ~= nil then
				if Entry ~= nil and Entry1 ~= nil then
					for _, value in deepCompareTables(Entry, Entry1, Formatted) do
						table.insert(List2, value)
					end
				end
			else
				table.insert(List2, string.format("%s: missing in Legacy", Formatted))
			end
		end
		return List2
	else
		local t = {}
		
		for i1 in List do
			t[i1] = true
		end
		for i2 in List1 do
			t[i2] = true
		end
		for i3 in t do
			local Entry = List[i3]
			local Entry2 = List1[i3]
			local Formatted = string.format("%s.%s", Text, (tostring(i3)))
			
			if Entry == nil and Entry2 ~= nil then
				local IsNotEntry: boolean = i3 == "CanAnimateCameraBasedMood" and Entry2 == false
				local IsCategoryId: boolean = i3 == "CategoryId" or (i3 == "SubcategoryId" or i3 == "isSubcategory")
				
				if (not string.match(Text, "^All%.") and Text ~= "All" or i3 ~= "ShowSponsored" and (i3 ~= "ShowTopics" and i3 ~= "CategoryFilter")) and (not IsNotEntry and not IsCategoryId) then
					table.insert(List2, string.format("%s: missing in SDUI (Legacy has: %s)", Formatted, (tostring(Entry2))))
					continue
				end
				continue
			end
			if Entry == nil or Entry2 ~= nil then
				if Entry ~= nil and Entry2 ~= nil then
					for _, value1 in deepCompareTables(Entry, Entry2, Formatted) do
						table.insert(List2, value1)
					end
				end
			elseif i3 ~= "WidgetContext" and i3 ~= "LocalizedTitle" and (i3 ~= "DisableFilters" or Entry ~= false) and (i3 ~= "CanAnimateCameraBasedMood" or Entry ~= false) and (i3 ~= "ShowLooksAsOrganicContent" or Entry ~= false) and (i3 ~= "CategoryId" and (i3 ~= "SubcategoryId" and i3 ~= "isSubcategory")) then
				table.insert(List2, string.format("%s: missing in Legacy (SDUI has: %s)", Formatted, (tostring(Entry))))
			end
		end
		return List2
	end
end

local function compareCategories(List, List1)
	-- upvalues: deepCompareTables (copy)
	local t = {}
	local t1 = {}
	
	for i, value in List do
		if i ~= "Subcategories" then
			t[i] = value
		end
	end
	for i1, value1 in List1 do
		if i1 ~= "Subcategories" then
			t1[i1] = value1
		end
	end
	return (deepCompareTables(t, t1, List.Name or "Unknown"))
end

local function _(p1, p2)
	-- upvalues: deepCompareTables (copy)
	print("compareSubcategories", p1, p2)
	
	return (deepCompareTables(p1, p2, p1.Name or "Unknown"))
end

local function logSubcategoryDifferences(Subcategories, Subcategories1, Name)
	-- upvalues: deepCompareTables (copy)
	local v1 = nil
	for _, subcategory in Subcategories do
		v1 = nil
		
		for _, value in Subcategories1 do
			local IsAnimationBundles: boolean = subcategory.Name == "Bundles" and value.Id == "AnimationBundles"
			local IsTShirts: boolean = subcategory.Name == "T-Shirts" and value.Id == "TShirts"
			local IsDressSkirt: boolean = subcategory.Name == "Dresses & Pants" and value.Id == "DressSkirt"
			local IsHats: boolean = subcategory.Name == "Heads" and (subcategory.Id == "22" and value.Id == "Hats")
			
			if subcategory.Name == value.Id or IsAnimationBundles or IsTShirts or IsDressSkirt or IsHats then
				v1 = value
				break
			end
		end
		if v1 then
			print("compareSubcategories", subcategory, v1)
			local DeepCompareTablesResult = deepCompareTables(subcategory, v1, subcategory.Name or "Unknown")
			
			if #DeepCompareTablesResult > 0 then
				warn(string.format("[GetCatalogCategoriesSDUI] Differences found for subcategory '%s' in category '%s':", subcategory.Name, Name))
				
				for _, value1 in DeepCompareTablesResult do
					warn(string.format("  - %s", value1))
				end
			end
		else
			warn(string.format("[GetCatalogCategoriesSDUI] No matching legacy subcategory found for SDUI subcategory '%s' in category '%s'", subcategory.Name, Name))
		end
	end
end

return {
	logCategoryDifferences = function(List, List1)
		-- upvalues: compareCategories (copy), logSubcategoryDifferences (copy)
		local v2 = nil
		for _, value in List do
			print("sduiCategory", value)
			v2 = nil
			
			for _, value1 in List1 do
				local IsAllAnimations: boolean = value.Name == "Animations" and (value1.Id == "AllAnimations" or value1.Name == "AllAnimations") or value.Name == "AllAnimations" and (value1.Id == "Animations" or value1.Name == "Animations")
				
				if value.Name == value1.Id or value.Name == value1.Name or IsAllAnimations then
					v2 = value1
					print("matchingLegacyCategory", v2)
					break
				end
			end
			if v2 then
				local CompareCategoriesResult = compareCategories(value, v2)
				
				if #CompareCategoriesResult > 0 then
					warn(string.format("[GetCatalogCategoriesSDUI] Differences found for category '%s':", value.Name))
					
					for _, value2 in CompareCategoriesResult do
						warn(string.format("  - %s", value2))
					end
				end
				if value.Subcategories and v2.Subcategories then
					logSubcategoryDifferences(value.Subcategories, v2.Subcategories, value.Name)
				elseif value.Subcategories and not v2.Subcategories then
					warn(string.format("[GetCatalogCategoriesSDUI] SDUI category '%s' has subcategories but legacy category does not", value.Name))
				elseif not value.Subcategories and v2.Subcategories then
					warn(string.format("[GetCatalogCategoriesSDUI] Legacy category '%s' has subcategories but SDUI category does not", value.Name))
				end
			else
				warn(string.format("[GetCatalogCategoriesSDUI] No matching legacy category found for SDUI category '%s'", value.Name))
			end
		end
	end
}