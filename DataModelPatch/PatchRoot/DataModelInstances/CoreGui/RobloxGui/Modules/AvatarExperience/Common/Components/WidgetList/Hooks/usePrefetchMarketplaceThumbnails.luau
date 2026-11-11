local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local TutilsModule = require(CorePackages.Packages.tutils)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UtilsModule = require(Modules.AvatarExperience.AvatarEditor.Utils)
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local FetchCatalogItemThumbnailsModule = require(Modules.AvatarExperience.Common.Components.WidgetList.Utils.fetchCatalogItemThumbnails)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local UtilsModule1 = require(Modules.AvatarExperience.Common.Utils)
local _ = require(Modules.AvatarExperience.Common.Types)
local UseGetSelectedCategoryAndSubcategoryIdModule = require(Modules.AvatarExperience.Catalog.Hooks.useGetSelectedCategoryAndSubcategoryId)
local AXMaxThumbnailsToPrefetchPerWidgetLargeScreen = game:DefineFastInt("AXMaxThumbnailsToPrefetchPerWidgetLargeScreen", 4)
local AXMaxThumbnailsToPrefetchPerWidgetSmallScreen = game:DefineFastInt("AXMaxThumbnailsToPrefetchPerWidgetSmallScreen", 3)

local function selectContextWidgetInfo(p1)
	return p1.AvatarExperience.Common.Widgets.ContextWidgetInfo
end

local function selectSearchesInCatalog(p1)
	return p1.Search.SearchesInCatalog
end

return function()
	-- upvalues: UseGetSelectedCategoryAndSubcategoryIdModule (copy), UseSelectorFunction (copy), selectContextWidgetInfo (copy), TutilsModule (copy), CatalogUtilsModule (copy), AvatarScreen (copy), selectSearchesInCatalog (copy), UtilsModule1 (copy), UtilsModule (copy), ResponsiveModule (copy), AXMaxThumbnailsToPrefetchPerWidgetLargeScreen (copy), AXMaxThumbnailsToPrefetchPerWidgetSmallScreen (copy), ReactModule (copy), FetchCatalogItemThumbnailsModule (copy)
	local UseGetSelectedCategoryAndSubcategoryIdModuleResult, UseGetSelectedCategoryAndSubcategoryIdModuleResult2 = UseGetSelectedCategoryAndSubcategoryIdModule()
	local UseSelectorResult = UseSelectorFunction(selectContextWidgetInfo, TutilsModule.deepEqual)
	local ContextForWidgetsById = if UseGetSelectedCategoryAndSubcategoryIdModuleResult then CatalogUtilsModule.getContextForWidgetsById(AvatarScreen.Catalog, UseGetSelectedCategoryAndSubcategoryIdModuleResult, UseGetSelectedCategoryAndSubcategoryIdModuleResult2) else nil
	local UseSelectorResultEntry = if ContextForWidgetsById then UseSelectorResult[ContextForWidgetsById] else nil
	local UseSelectorResult1 = UseSelectorFunction(selectSearchesInCatalog, TutilsModule.deepEqual)
	local CatalogCategoryInfoById = if UseGetSelectedCategoryAndSubcategoryIdModuleResult then UtilsModule1.getCatalogCategoryInfoById(UseGetSelectedCategoryAndSubcategoryIdModuleResult, UseGetSelectedCategoryAndSubcategoryIdModuleResult2) else nil
	local SearchUuidAndAssetTypes = if CatalogCategoryInfoById then UtilsModule.getSearchUuidAndAssetTypes(CatalogCategoryInfoById, nil, nil) else nil
	local UseSelectorResultEntry1 = if SearchUuidAndAssetTypes then UseSelectorResult1[SearchUuidAndAssetTypes] else nil
	local Items = if UseSelectorResultEntry1 then UseSelectorResultEntry1.items else nil
	local UseResponsiveResult = ResponsiveModule.useResponsive()
	local IsNotUseResponsiveResultMatch: boolean = UseResponsiveResult ~= ResponsiveModule.BreakpointConfig.Enum.Medium and (UseResponsiveResult ~= ResponsiveModule.BreakpointConfig.Enum.Small and UseResponsiveResult ~= ResponsiveModule.BreakpointConfig.Enum.XSmall)
	local AXMaxThumbnailsToPrefetchPerWidgetLargeScreen1 = if IsNotUseResponsiveResultMatch then AXMaxThumbnailsToPrefetchPerWidgetLargeScreen else AXMaxThumbnailsToPrefetchPerWidgetSmallScreen
	local AXMaxThumbnailsToPrefetchPerWidgetLargeScreen2 = if IsNotUseResponsiveResultMatch then AXMaxThumbnailsToPrefetchPerWidgetLargeScreen else AXMaxThumbnailsToPrefetchPerWidgetSmallScreen
	local AXMaxThumbnailsToPrefetchPerWidgetLargeScreen3 = if IsNotUseResponsiveResultMatch then AXMaxThumbnailsToPrefetchPerWidgetLargeScreen else AXMaxThumbnailsToPrefetchPerWidgetSmallScreen
	
	return (ReactModule.useCallback(function()
		-- upvalues: UseSelectorResultEntry (copy), AXMaxThumbnailsToPrefetchPerWidgetLargeScreen2 (copy), AXMaxThumbnailsToPrefetchPerWidgetLargeScreen1 (copy), Items (copy), AXMaxThumbnailsToPrefetchPerWidgetLargeScreen3 (copy), FetchCatalogItemThumbnailsModule (upval)
		local List = {}
		local Count = 0
		local Count1 = 0
		
		if UseSelectorResultEntry and UseSelectorResultEntry.Details then
			local function addWidgetThumbnails(Detail): boolean
				-- upvalues: AXMaxThumbnailsToPrefetchPerWidgetLargeScreen2 (upval), Count (ref), AXMaxThumbnailsToPrefetchPerWidgetLargeScreen1 (upval), List (copy)
				if AXMaxThumbnailsToPrefetchPerWidgetLargeScreen2 and AXMaxThumbnailsToPrefetchPerWidgetLargeScreen2 <= Count then
					return false
				end
				if not Detail then
					return true
				end
				if Detail.content and #Detail.content > 0 then
					for i = 1, math.min(AXMaxThumbnailsToPrefetchPerWidgetLargeScreen1, #Detail.content) do
						local ContentEntry = Detail.content[i]
						table.insert(List, { id = tostring(ContentEntry.id), type = ContentEntry.type })
					end
					Count += 1
				end
				return true
			end
			
			local List1 = {}
			
			for i, _ in UseSelectorResultEntry.Details do
				if tonumber(i) ~= nil then
					table.insert(List1, (tonumber(i)))
				end
			end
			table.sort(List1)
			
			for _, value in List1 do
				if not addWidgetThumbnails(UseSelectorResultEntry.Details[tostring(value)]) then break end
			end
		end
		if Items and #Items > 0 then
			for i1 = 1, math.min(AXMaxThumbnailsToPrefetchPerWidgetLargeScreen3, #Items) do
				local Item = Items[i1]
				
				if Item.id and Item.type then
					table.insert(List, { id = tostring(Item.id), type = Item.type })
					Count1 += 1
				end
			end
		end
		if #List > 0 then
			FetchCatalogItemThumbnailsModule(List)
		end
		return List
	end, {
		UseSelectorResultEntry,
		Items,
		AXMaxThumbnailsToPrefetchPerWidgetLargeScreen1,
		AXMaxThumbnailsToPrefetchPerWidgetLargeScreen2,
		AXMaxThumbnailsToPrefetchPerWidgetLargeScreen3
	}))
end