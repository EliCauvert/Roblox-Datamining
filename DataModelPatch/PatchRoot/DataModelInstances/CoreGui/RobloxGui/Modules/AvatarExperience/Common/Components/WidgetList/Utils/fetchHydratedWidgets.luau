local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local FetchWidgetInfoModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchWidgetInfo)
local FetchHydratedWidgetContentModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchHydratedWidgetContent)
local GetContentToHyderateModule = require(Modules.AvatarExperience.Common.Components.WidgetList.Utils.getContentToHyderate)
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local PromiseModule = require(CorePackages.Packages.Promise)
local _ = require(Modules.AvatarExperience.Catalog.Reducers.Categories)
local SelectIsPortraitModule = require(Modules.AvatarExperience.Common.Selectors.selectIsPortrait)
local FFlagAXCatalogCategoriesSDUI = AvatarExperienceFlagsModule.FFlagAXCatalogCategoriesSDUI
local MutedErrorModule = require(Modules.LuaApp.mutedError)
local FFlagAXMoveAllTabToWidgetOnly = AvatarExperienceFlagsModule.FFlagAXMoveAllTabToWidgetOnly
local FFlagAXFixHydratedWidgetsParams = AvatarExperienceFlagsModule.FFlagAXFixHydratedWidgetsParams
local FFlagAXOnlyHydrateVisibleRows = AvatarExperienceFlagsModule.FFlagAXOnlyHydrateVisibleRows
local FIntAXPrefetchWidgetHydrationRowsPortrait = AvatarExperienceFlagsModule.FIntAXPrefetchWidgetHydrationRowsPortrait
local FIntAXPrefetchWidgetHydrationRowsLandscape = AvatarExperienceFlagsModule.FIntAXPrefetchWidgetHydrationRowsLandscape

local function _(p1)
	return p1.AvatarExperience.Catalog.Categories
end

local _ = function(p1)
	return p1.AvatarExperience and (p1.AvatarExperience.Common and p1.AvatarExperience.Common.Widgets)
end

local _ = function(p1)
	-- upvalues: CatalogUtilsModule (copy), AvatarScreen (copy)
	local ContextForWidgetsById = nil
	local CategoryId = p1.categoryId
	local SubcategoryId = p1.subcategoryId
	
	if CategoryId then
		ContextForWidgetsById = CatalogUtilsModule.getContextForWidgetsById(AvatarScreen.Catalog, CategoryId, SubcategoryId)
	end
	return ContextForWidgetsById
end

return function(Callback, p1, p2, p3, CategoryId, SubcategoryId)
	-- upvalues: PromiseModule (copy), FFlagAXFixHydratedWidgetsParams (copy), MutedErrorModule (copy), FFlagAXCatalogCategoriesSDUI (copy), CatalogUtilsModule (copy), AvatarScreen (copy), FetchWidgetInfoModule (copy), FFlagAXMoveAllTabToWidgetOnly (copy), GetContentToHyderateModule (copy), FFlagAXOnlyHydrateVisibleRows (copy), SelectIsPortraitModule (copy), FIntAXPrefetchWidgetHydrationRowsPortrait (copy), FIntAXPrefetchWidgetHydrationRowsLandscape (copy), FetchHydratedWidgetContentModule (copy), Logging (copy)
	return PromiseModule.new(function(Callback1: (any) -> (), Callback2)
		-- upvalues: FFlagAXFixHydratedWidgetsParams (upval), CategoryId (copy), MutedErrorModule (upval), SubcategoryId (copy), p2 (copy), FFlagAXCatalogCategoriesSDUI (upval), CatalogUtilsModule (upval), AvatarScreen (upval), Callback (copy), FetchWidgetInfoModule (upval), p1 (copy), p3 (copy), FFlagAXMoveAllTabToWidgetOnly (upval), GetContentToHyderateModule (upval), FFlagAXOnlyHydrateVisibleRows (upval), SelectIsPortraitModule (upval), FIntAXPrefetchWidgetHydrationRowsPortrait (upval), FIntAXPrefetchWidgetHydrationRowsLandscape (upval), FetchHydratedWidgetContentModule (upval), Logging (upval)
		local config = nil
		if FFlagAXFixHydratedWidgetsParams then
			if CategoryId == nil then
				MutedErrorModule("[fetchHydratedWidgets] categoryId is required")
			end
			config = { categoryId = CategoryId, subcategoryId = SubcategoryId }
		else
			config = {
				categoryId = p2.Id,
				subcategoryId = if FFlagAXFixHydratedWidgetsParams then nil else p2.subcategoryId,
				category = if FFlagAXFixHydratedWidgetsParams then nil else p2.Category or 1,
				subcategory = if FFlagAXFixHydratedWidgetsParams then nil else p2.Subcategory or 0
			}
		end
		local WidgetContext = nil
		if FFlagAXCatalogCategoriesSDUI then
			WidgetContext = p2.WidgetContext
		else
			local ContextForWidgetsById = nil
			local CategoryId1 = config.categoryId
			local SubcategoryId1 = config.subcategoryId
			
			if CategoryId1 then
				ContextForWidgetsById = CatalogUtilsModule.getContextForWidgetsById(AvatarScreen.Catalog, CategoryId1, SubcategoryId1)
			end
			WidgetContext = ContextForWidgetsById
		end
		local CallbackResult = Callback(FetchWidgetInfoModule(p1, nil, WidgetContext))
		
		if CallbackResult and CallbackResult.andThen then
			CallbackResult:andThen(function(Result)
				-- upvalues: p3 (upval), CatalogUtilsModule (upval), AvatarScreen (upval), FFlagAXMoveAllTabToWidgetOnly (upval), GetContentToHyderateModule (upval), FFlagAXOnlyHydrateVisibleRows (upval), SelectIsPortraitModule (upval), FIntAXPrefetchWidgetHydrationRowsPortrait (upval), FIntAXPrefetchWidgetHydrationRowsLandscape (upval), Callback1 (copy), Callback (upval), FetchHydratedWidgetContentModule (upval), p1 (upval)
				local State = p3:getState()
				local Widgets = State.AvatarExperience and (State.AvatarExperience.Common and State.AvatarExperience.Common.Widgets)
				local HydratedWidgetData = Widgets and Widgets.HydratedWidgetData or {}
				local ContextWidgetInfo = Widgets and Widgets.ContextWidgetInfo or {}
				local Categories = State.AvatarExperience.Catalog.Categories
				local ContextForWidgetsById = nil
				local CategoryId = Categories.categoryId
				local SubcategoryId = Categories.subcategoryId
				
				if CategoryId then
					ContextForWidgetsById = CatalogUtilsModule.getContextForWidgetsById(AvatarScreen.Catalog, CategoryId, SubcategoryId)
				end
				local ContextWidget = ContextForWidgetsById and ContextWidgetInfo[ContextForWidgetsById] or nil
				local Details = ContextWidget and ContextWidget.Details or {}
				local Count = 0
				
				if FFlagAXMoveAllTabToWidgetOnly then
					local List = {}
					
					for _, detail in Details do
						local ContentToHyderateModule = GetContentToHyderateModule(detail, HydratedWidgetData)
						
						if ContentToHyderateModule and #ContentToHyderateModule > 0 then
							Count += 1
							table.insert(List, { content = ContentToHyderateModule, id = detail.id })
						end
					end
					if FFlagAXOnlyHydrateVisibleRows then
						local List1 = {}
						
						for i = 1, math.min(#List, if SelectIsPortraitModule(State) then FIntAXPrefetchWidgetHydrationRowsPortrait else FIntAXPrefetchWidgetHydrationRowsLandscape) do
							table.insert(List1, List[i])
						end
						List = List1
						Count = #List
					end
					if Count == 0 then
						Callback1(Result)
						
						return
					end
					local Count2 = 0
					
					for _, value in List do
						task.spawn(function()
							-- upvalues: Callback (upval), FetchHydratedWidgetContentModule (upval), p1 (upval), value (copy), Count2 (ref), Count (ref), Callback1 (upval), Result (copy)
							local CallbackResult = Callback(FetchHydratedWidgetContentModule(p1, value.content, value.id))
							
							if CallbackResult and CallbackResult.andThen then
								CallbackResult:finally(function()
									-- upvalues: Count2 (upval), Count (upval), Callback1 (upval), Result (upval)
									Count2 += 1
									
									if Count <= Count2 then
										Callback1(Result)
									end
								end)
							end
						end)
					end
				else
					local Count1 = 0
					
					for _, detail1 in Details do
						local ContentToHyderateModule = GetContentToHyderateModule(detail1, HydratedWidgetData)
						
						if ContentToHyderateModule and #ContentToHyderateModule > 0 then
							Count += 1
							local CallbackResult = Callback(FetchHydratedWidgetContentModule(p1, ContentToHyderateModule, detail1.id))
							
							if CallbackResult and CallbackResult.andThen then
								CallbackResult:finally(function()
									-- upvalues: Count1 (ref), Count (ref), Callback1 (upval), Result (copy)
									Count1 += 1
									
									if Count <= Count1 then
										Callback1(Result)
									end
								end)
							end
						end
					end
					if Count == 0 then
						Callback1(Result)
					end
				end
			end, function(p4)
				-- upvalues: Logging (upval), Callback2 (copy)
				Logging.warn("fetchHydratedWidgets: Hydrated widgets fetch failed: " .. tostring(p4))
				Callback2(p4)
			end)
			
			return
		else
			Callback1(true)
		end
	end)
end