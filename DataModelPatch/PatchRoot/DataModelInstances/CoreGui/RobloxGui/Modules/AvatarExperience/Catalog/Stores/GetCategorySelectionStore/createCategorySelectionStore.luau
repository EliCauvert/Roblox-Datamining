local CorePackages = game:GetService("CorePackages")
local SignalsModule = require(CorePackages.Packages.Signals)
local CreateSignalFunction = SignalsModule.createSignal
local CreateComputedFunction = SignalsModule.createComputed
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local MutedErrorModule = require(Modules.LuaApp.mutedError)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local _ = require(Modules.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore.createCatalogCategoriesStore)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXCatalogCategoriesSDUI = AvatarExperienceFlagsModule.FFlagAXCatalogCategoriesSDUI
local FFlagAXMigrateAllTabToSduiDev = AvatarExperienceFlagsModule.FFlagAXMigrateAllTabToSduiDev

return function(p1)
	-- upvalues: FFlagAXMigrateAllTabToSduiDev (copy), ConstantsModule (copy), FFlagAXCatalogCategoriesSDUI (copy), CreateSignalFunction (copy), CreateComputedFunction (copy), MutedErrorModule (copy)
	local DefaultCatalogCategoryId = nil
	
	if FFlagAXMigrateAllTabToSduiDev then
		DefaultCatalogCategoryId = ConstantsModule.DefaultCatalogCategoryId
	elseif FFlagAXCatalogCategoriesSDUI then
		local Categories = p1.getCategories(false)
		DefaultCatalogCategoryId = #Categories > 0 and Categories[1].Id or ConstantsModule.DefaultCatalogCategoryId
	end
	local Signal, Signal2 = CreateSignalFunction({
		subcategoryId = nil,
		categoryId = if FFlagAXCatalogCategoriesSDUI then DefaultCatalogCategoryId else ConstantsModule.DefaultCatalogCategoryId
	})
	local Computed = CreateComputedFunction(function(p2)
		-- upvalues: Signal (copy), FFlagAXMigrateAllTabToSduiDev (upval), p1 (copy), ConstantsModule (upval)
		local CategoryId = Signal(p2).categoryId
		
		return if FFlagAXMigrateAllTabToSduiDev and not p1.getCategoriesMap(p2)[CategoryId] then ConstantsModule.DefaultCatalogCategoryId else CategoryId
	end)
	local Computed1 = CreateComputedFunction(function(p2)
		-- upvalues: Signal (copy)
		return Signal(p2).subcategoryId
	end)
	local Computed2 = CreateComputedFunction(function(p2)
		-- upvalues: Computed (copy), ConstantsModule (upval), p1 (copy)
		local ComputedResult = Computed(p2)
		
		if ComputedResult == nil then
			ComputedResult = ConstantsModule.DefaultCatalogCategoryId
		end
		return p1.getCategoriesMap(p2)[ComputedResult]
	end)
	local Computed3 = CreateComputedFunction(function(p2)
		-- upvalues: Computed1 (copy), Computed2 (copy)
		local ComputedResult = Computed1(p2)
		
		if ComputedResult == nil then
			return nil
		end
		local ComputedResult1 = Computed2(p2)
		
		if ComputedResult1 == nil then
			return nil
		end
		local Subcategories = ComputedResult1.Subcategories
		
		if Subcategories ~= nil then
			for _, subcategory in Subcategories do
				if subcategory.Id == ComputedResult then
					return subcategory
				end
			end
		end
		return nil
	end)
	
	return {
		selectedCategoryId = Computed,
		selectedCategory = Computed2,
		selectedSubcategoryId = Computed1,
		selectedSubcategory = Computed3,
		selectedCategoryInfo = CreateComputedFunction(function(p3)
			-- upvalues: Computed3 (copy), Computed2 (copy)
			local ComputedResult = Computed3(p3)
			
			return if ComputedResult then ComputedResult else Computed2(p3)
		end),
		changeCategory = function(CategoryId, SubcategoryId): boolean
			-- upvalues: MutedErrorModule (upval), p1 (copy), Signal2 (copy), FFlagAXMigrateAllTabToSduiDev (upval)
			if SubcategoryId ~= nil then
				local Categories = nil
				
				if CategoryId == nil then
					repeat
						if FFlagAXMigrateAllTabToSduiDev then
							for _, value in p1.getCategoriesMap(false) do
								if value and value.SubcategoriesMap and value.SubcategoriesMap[SubcategoryId] then
									Categories = value
									break
								end
							end
							break
						end
						for _, value1 in p1.getCategories(false) do
							if value1 and value1.SubcategoriesMap and value1.SubcategoriesMap[SubcategoryId] then
								Categories = value1
							else
								continue
							end
						end
						break
					until true
				else
					Categories = p1.getCategoriesMap(false)[CategoryId]
				end
				if not Categories then
					return false
				end
				local Flag = false
				local Subcategories = Categories.Subcategories
				
				if Subcategories ~= nil then
					for _, subcategory in Subcategories do
						if subcategory.Id == SubcategoryId then
							Flag = true
							break
						end
					end
				end
				if Flag then
					Signal2({
						categoryId = Categories.Id,
						subcategoryId = SubcategoryId
					})
					
					return true
				else
					return false
				end
			elseif CategoryId == nil then
				MutedErrorModule("[Category Selection Store] changeCategory received both categoryId and subcategoryId as nil")
				
				return false
			elseif p1.getCategoriesMap(false)[CategoryId] then
				Signal2({ subcategoryId = nil, categoryId = CategoryId })
				
				return true
			else
				return false
			end
		end
	}
end