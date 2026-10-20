local HttpService = game:GetService("HttpService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local PromiseModule = require(CorePackages.Packages.Promise)
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local SetRecommendedItemsV2Module = require(Modules.AvatarExperience.AvatarEditor.Actions.SetRecommendedItemsV2)
local SetAssetInfoFromAvatarEditorRecommendedItemsV2Module = require(Modules.AvatarExperience.AvatarEditor.Actions.SetAssetInfoFromAvatarEditorRecommendedItemsV2)
local SetBundleInfoFromAvatarEditorRecommendedItemsV2Module = require(Modules.AvatarExperience.AvatarEditor.Actions.SetBundleInfoFromAvatarEditorRecommendedItemsV2)
local WebApiModule = require(Modules.AvatarExperience.AvatarEditor.Http.WebApi)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local ConstantsModule1 = require(Modules.AvatarExperience.AvatarEditor.Constants)
local _ = require(Modules.LuaApp.Types.RoduxTypes)
local SetAssetInfoFromSortResultsModule = require(Modules.AvatarExperience.Catalog.Actions.SetAssetInfoFromSortResults)
local SetBundleInfoFromSortResultsModule = require(Modules.AvatarExperience.Catalog.Actions.SetBundleInfoFromSortResults)
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local GetFFlagAXEnableRecommendationTypeAllInCustomizeModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableRecommendationTypeAllInCustomize)
local AXRecommendedNoOfAllItems = game:DefineFastInt("AXRecommendedNoOfAllItems", 12)
local AXEditorRecommendationCarouselModule = require(Modules.AvatarExperience.Experiments.AXEditorRecommendationCarousel)
local AXYouMayAlsoLikeCarouselNoOfItems = game:DefineFastInt("AXYouMayAlsoLikeCarouselNoOfItems", 25)
local AvatarExperienceCatalogModule = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog)
local WebApiModule1 = require(Modules.AvatarExperience.Catalog.Http.WebApi)
local SetHydratedWidgetDataModule = require(Modules.AvatarExperience.Catalog.Actions.SetHydratedWidgetData)
local WidgetConstants = AvatarExperienceCatalogModule.WidgetConstants
local ReducerUtils = require(CorePackages.Workspace.Packages.AvatarExperienceRodux).Utils.ReducerUtils
local FFlagAXAvatarTabLooksYouMayAlsoLike = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXAvatarTabLooksYouMayAlsoLike
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)

local function _(p1): string
	-- upvalues: ConstantsModule (copy)
	return ConstantsModule.RecommendedItemsKey .. tostring(p1)
end

local function fetchRecommendedItems(p1, AvatarEditorService, p2, All, Callback1: (any) -> (), Callback: (any) -> ())
	-- upvalues: AXRecommendedNoOfAllItems (copy), ConstantsModule (copy), SetAssetInfoFromSortResultsModule (copy), SetBundleInfoFromSortResultsModule (copy), SetRecommendedItemsV2Module (copy), Logging (copy)
	local CatalogSearchParams1 = CatalogSearchParams.new()
	CatalogSearchParams1.SalesTypeFilter = Enum.SalesTypeFilter.All
	CatalogSearchParams1.SortType = Enum.CatalogSortType.Relevance
	CatalogSearchParams1.CategoryFilter = Enum.CatalogCategoryFilter.Recommended
	CatalogSearchParams1.IncludeOffSale = false
	CatalogSearchParams1.SortAggregation = Enum.CatalogSortAggregation.AllTime
	CatalogSearchParams1.Limit = 120
	local Success, Result = pcall(function()
		-- upvalues: AvatarEditorService (copy), CatalogSearchParams1 (copy)
		return if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then AvatarEditorService:SearchCatalogAsync(CatalogSearchParams1) else AvatarEditorService:SearchCatalog(CatalogSearchParams1)
	end)
	
	if not Success then
		Logging.warn("GetRecommendedItems failure: " .. tostring(Result))
		Callback({ HttpError = Enum.HttpError.OK })
		
		return
	end
	local List = {}
	local List1 = {}
	local List2 = {}
	
	for i, value in Result:GetCurrentPage() do
		if i < AXRecommendedNoOfAllItems + 1 then
			if value.ItemType == ConstantsModule.ItemType.Asset then
				table.insert(List, value)
			elseif value.ItemType == ConstantsModule.ItemType.Bundle then
				table.insert(List1, value)
			end
			table.insert(List2, { itemType = value.ItemType, id = value.Id })
		end
	end
	p1:dispatch(SetAssetInfoFromSortResultsModule(List))
	p1:dispatch(SetBundleInfoFromSortResultsModule(List1))
	p1:dispatch(SetRecommendedItemsV2Module(List2, p2, All))
	Callback1(Result)
end

local function fetchRecommendedLooks(p3, p4, p5, All, Guid, p6)
	-- upvalues: AvatarExperienceCatalogModule (copy), SetRecommendedItemsV2Module (copy), PromiseModule (copy), WebApiModule1 (copy), WidgetConstants (copy), ConstantsModule (copy), SetHydratedWidgetDataModule (copy), Logging (copy)
	local EditorTabAvatarsLooksFromWidgetListInfo, _ = AvatarExperienceCatalogModule.Api.getLooksFromWidgetListInfo(p4, Guid, nil, nil, "editor-tab:avatars")
	
	return EditorTabAvatarsLooksFromWidgetListInfo:andThen(function(Result)
		-- upvalues: p3 (copy), SetRecommendedItemsV2Module (upval), p5 (copy), All (copy), PromiseModule (upval), WebApiModule1 (upval), p4 (copy), WidgetConstants (upval), p6 (copy), ConstantsModule (upval), SetHydratedWidgetDataModule (upval), Logging (upval)
		local Content = {}
		
		for _, value in Result and Result.widgets or {} do
			Content = value.content or {}
			break
		end
		if #Content == 0 then
			p3:dispatch(SetRecommendedItemsV2Module({}, p5, All))
			
			return PromiseModule.resolve({})
		else
			return WebApiModule1.HydrateWidgetContent(p4, Content):andThen(function(Result)
				-- upvalues: p3 (upval), SetRecommendedItemsV2Module (upval), p5 (upval), All (upval), PromiseModule (upval), WidgetConstants (upval), p6 (upval), ConstantsModule (upval), Content (ref), SetHydratedWidgetDataModule (upval)
				local HydratedContent = Result and (Result.responseBody and Result.responseBody.hydratedContent)
				
				if not HydratedContent then
					p3:dispatch(SetRecommendedItemsV2Module({}, p5, All))
					
					return PromiseModule.resolve({})
				end
				local Look = WidgetConstants.ContentType.Look
				local config = { [Look] = {} }
				
				for _, value in HydratedContent do
					local Type = value.type
					
					if Type then
						if not config[Type] then
							config[Type] = {}
						end
						config[Type][tostring(value.id)] = value
					end
				end
				local P10 = p6 or ConstantsModule.NumRecommendedItems
				local List = {}
				
				for _, value1 in Content do
					local Text = tostring(value1.id)
					
					if config[Look][Text] and #List < P10 then
						table.insert(List, { id = Text, itemType = ConstantsModule.ItemType.Look })
					end
				end
				p3:dispatch(SetHydratedWidgetDataModule(config))
				p3:dispatch(SetRecommendedItemsV2Module(List, p5, All))
				
				return PromiseModule.resolve(List)
			end, function(p7)
				-- upvalues: Logging (upval), PromiseModule (upval)
				Logging.warn("GetRecommendedItems looks hydration failure: " .. tostring(p7))
				
				return PromiseModule.reject({ HttpError = Enum.HttpError.OK })
			end)
		end
	end, function(p7)
		-- upvalues: Logging (upval), PromiseModule (upval)
		Logging.warn("GetRecommendedItems looks widget failure: " .. tostring(p7))
		
		return PromiseModule.reject({ HttpError = Enum.HttpError.OK })
	end)
end

return function(p7, Animations, All)
	-- upvalues: ArgCheckModule (copy), AXEditorRecommendationCarouselModule (copy), IxpUtilsModule (copy), ConstantsModule1 (copy), ConstantsModule (copy), FFlagAXAvatarTabLooksYouMayAlsoLike (copy), GetFFlagAXEnableRecommendationTypeAllInCustomizeModule (copy), ReducerUtils (copy), PerformFetch (copy), AXYouMayAlsoLikeCarouselNoOfItems (copy), fetchRecommendedLooks (copy), HttpService (copy), PromiseModule (copy), fetchRecommendedItems (copy), WebApiModule (copy), SetAssetInfoFromAvatarEditorRecommendedItemsV2Module (copy), SetBundleInfoFromAvatarEditorRecommendedItemsV2Module (copy), SetRecommendedItemsV2Module (copy), Logging (copy)
	return function(p8, p9)
		-- upvalues: ArgCheckModule (upval), p7 (copy), Animations (copy), All (copy), AXEditorRecommendationCarouselModule (upval), IxpUtilsModule (upval), ConstantsModule1 (upval), ConstantsModule (upval), FFlagAXAvatarTabLooksYouMayAlsoLike (upval), GetFFlagAXEnableRecommendationTypeAllInCustomizeModule (upval), ReducerUtils (upval), PerformFetch (upval), AXYouMayAlsoLikeCarouselNoOfItems (upval), fetchRecommendedLooks (upval), HttpService (upval), PromiseModule (upval), fetchRecommendedItems (upval), WebApiModule (upval), SetAssetInfoFromAvatarEditorRecommendedItemsV2Module (upval), SetBundleInfoFromAvatarEditorRecommendedItemsV2Module (upval), SetRecommendedItemsV2Module (upval), Logging (upval)
		ArgCheckModule.isType(p7, "function", "GetRecommendedItems thunk expects networkImpl")
		ArgCheckModule.isTypeOrNil(Animations, "string", "GetRecommendedItems thunk expects assetTypeIdString")
		ArgCheckModule.isType(All, "string", "GetRecommendedItems thunk expects recommendationsType")
		local TestVariable = if AXEditorRecommendationCarouselModule.isEnabled() then IxpUtilsModule.readTestVariable(AXEditorRecommendationCarouselModule.EnableAvatarEditorRecommendationCarousel) else nil
		
		if not All or All == ConstantsModule1.RecommendationsType.None then
			return nil
		end
		local Animations1 = Animations
		local Animations2 = Animations
		local Flag = true
		
		if All ~= ConstantsModule1.RecommendationsType.Asset then
			Animations1 = All
			Flag = false
			
			if All == ConstantsModule1.RecommendationsType.BodyParts then
				Animations2 = ConstantsModule.BundleTypeIdStrings.BodyParts
			elseif All == ConstantsModule1.RecommendationsType.AvatarAnimations then
				Animations2 = ConstantsModule.BundleTypeIdStrings.Animations
			elseif All == ConstantsModule1.RecommendationsType.Shoes then
				Animations2 = ConstantsModule.BundleTypeIdStrings.Shoes
			elseif All == ConstantsModule1.RecommendationsType.DynamicHeads then
				Animations2 = ConstantsModule.BundleTypeIdStrings.DynamicHead
			end
		end
		if FFlagAXAvatarTabLooksYouMayAlsoLike and GetFFlagAXEnableRecommendationTypeAllInCustomizeModule() and All == ConstantsModule1.RecommendationsType.AvatarLooks then
			return PerformFetch.Single(ConstantsModule.RecommendedItemsKey .. tostring((ReducerUtils.generateRecommendedItemsKey(Animations1, All))), function(p10)
				-- upvalues: TestVariable (copy), AXYouMayAlsoLikeCarouselNoOfItems (upval), fetchRecommendedLooks (upval), p7 (upval), Animations1 (ref), All (upval), HttpService (upval)
				return fetchRecommendedLooks(p10, p7, Animations1, All, HttpService:GenerateGUID(false), if TestVariable then AXYouMayAlsoLikeCarouselNoOfItems else nil)
			end)(p8)
		elseif GetFFlagAXEnableRecommendationTypeAllInCustomizeModule() and All == ConstantsModule1.RecommendationsType.All then
			local AvatarEditorService = p9.avatarEditorService
			
			return PromiseModule.new(function(p10, p11)
				-- upvalues: PerformFetch (upval), Animations1 (ref), ConstantsModule (upval), fetchRecommendedItems (upval), AvatarEditorService (copy), All (upval), p8 (copy)
				return PerformFetch.Single(ConstantsModule.RecommendedItemsKey .. tostring(Animations1), function(p12)
					-- upvalues: fetchRecommendedItems (upval), AvatarEditorService (upval), Animations1 (upval), All (upval), p10 (copy), p11 (copy)
					return fetchRecommendedItems(p12, AvatarEditorService, Animations1, All, p10, p11)
				end)(p8)
			end)
		else
			return PerformFetch.Single(ConstantsModule.RecommendedItemsKey .. tostring(Animations1), function(p10)
				-- upvalues: TestVariable (copy), AXYouMayAlsoLikeCarouselNoOfItems (upval), WebApiModule (upval), p7 (upval), Animations2 (ref), Flag (ref), SetAssetInfoFromAvatarEditorRecommendedItemsV2Module (upval), Animations (upval), SetBundleInfoFromAvatarEditorRecommendedItemsV2Module (upval), GetFFlagAXEnableRecommendationTypeAllInCustomizeModule (upval), SetRecommendedItemsV2Module (upval), Animations1 (ref), All (upval), PromiseModule (upval), Logging (upval)
				return WebApiModule.GetRecommendations(p7, Animations2, Flag, if TestVariable then AXYouMayAlsoLikeCarouselNoOfItems else nil):andThen(function(Result)
					-- upvalues: Flag (upval), p10 (copy), SetAssetInfoFromAvatarEditorRecommendedItemsV2Module (upval), Animations (upval), SetBundleInfoFromAvatarEditorRecommendedItemsV2Module (upval), GetFFlagAXEnableRecommendationTypeAllInCustomizeModule (upval), SetRecommendedItemsV2Module (upval), Animations1 (upval), All (upval), PromiseModule (upval), Logging (upval), Animations2 (upval)
					local Data = Result and (Result.responseBody and Result.responseBody.data)
					
					if not Data then
						Logging.warn("Response from GetRecommendations with recommendationId of " .. tostring(Animations2) .. " is malformed!")
						
						return PromiseModule.reject({ HttpError = Enum.HttpError.OK })
					end
					if Flag then
						p10:dispatch(SetAssetInfoFromAvatarEditorRecommendedItemsV2Module(Data, Animations))
					else
						p10:dispatch(SetBundleInfoFromAvatarEditorRecommendedItemsV2Module(Data))
					end
					if GetFFlagAXEnableRecommendationTypeAllInCustomizeModule() then
						p10:dispatch(SetRecommendedItemsV2Module(Data, Animations1, All))
					else
						p10:dispatch(SetRecommendedItemsV2Module(Data, Animations1))
					end
					return PromiseModule.resolve(Data)
				end)
			end)(p8)
		end
	end
end