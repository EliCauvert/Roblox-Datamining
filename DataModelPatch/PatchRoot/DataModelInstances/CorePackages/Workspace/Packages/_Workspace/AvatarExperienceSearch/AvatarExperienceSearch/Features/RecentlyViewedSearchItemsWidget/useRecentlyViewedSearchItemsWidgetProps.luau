local HttpService = game:GetService("HttpService")
local AvatarExperienceSearch = script:FindFirstAncestor("AvatarExperienceSearch")
local Parent = AvatarExperienceSearch.Parent
local ReactModule = require(Parent.React)
local AXCommonModule = require(Parent.AXCommon)
local PerformFetch = require(Parent.Http).PerformFetch
local RetrievalStatus = require(Parent.Http).Enum.RetrievalStatus
local AvatarScreen = require(Parent.AvatarExperienceNavigation).Enums.AvatarScreen
local IxpUtilsModule = require(Parent.IxpUtils)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local SearchLandingPageWidgetEnumModule = require(AvatarExperienceSearch.Enums.SearchLandingPageWidgetEnum)
local CounterModule = require(AvatarExperienceSearch.Enums.Counter)
local RecentlyViewedSearchItemsAppStorageModule = require(AvatarExperienceSearch.Utils.RecentlyViewedSearchItemsAppStorage)
local FindItemInTryOnItemsFunction = AXCommonModule.Utils.findItemInTryOnItems
local GetFIntAXMaxRecentlyViewedSearchItemsInCarouselModule = require(AvatarExperienceSearch.Flags.GetFIntAXMaxRecentlyViewedSearchItemsInCarousel)
local AXRecentlyViewedSearchItemsIXPTest = AXCommonModule.Experiments.AXRecentlyViewedSearchItemsIXPTest

local function v14(p1)
	return p1.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
end

local function v15(p1)
	return p1.AvatarExperience.Common
end

local function _(p1, p2): boolean
	-- upvalues: FindItemInTryOnItemsFunction (copy)
	return p2 and FindItemInTryOnItemsFunction(p1, p2) ~= nil
end

local _ = function(p1, p2, p3)
	local Tbl = nil
	
	if p3 == "Asset" then
		Tbl = p1.AssetInfos[p2]
	elseif p3 == "Bundle" then
		Tbl = p1.BundleInfos[p2]
	end
	if Tbl then
		Tbl = table.clone(Tbl)
	end
	return Tbl
end

local function v18(p1)
	-- upvalues: SearchLandingPageWidgetEnumModule (copy)
	local ContextWidget = p1.AvatarExperience.Common.Widgets.ContextWidgetInfo[SearchLandingPageWidgetEnumModule.RecentlyViewedItems]
	
	return if ContextWidget and ContextWidget.Details and ContextWidget.Details[SearchLandingPageWidgetEnumModule.RecentlyViewedItems] then ContextWidget.Details[SearchLandingPageWidgetEnumModule.RecentlyViewedItems].content else {}
end

return function(p1)
	-- upvalues: ReactModule (copy), HttpService (copy), UseNavigationFunction (copy), UseSelectorFunction (copy), PerformFetch (copy), v15 (copy), v14 (copy), v18 (copy), IxpUtilsModule (copy), AXRecentlyViewedSearchItemsIXPTest (copy), CounterModule (copy), RecentlyViewedSearchItemsAppStorageModule (copy), RetrievalStatus (copy), FindItemInTryOnItemsFunction (copy), AvatarScreen (copy), SearchLandingPageWidgetEnumModule (copy), GetFIntAXMaxRecentlyViewedSearchItemsInCarouselModule (copy)
	local UseRefResult = ReactModule.useRef(HttpService:GenerateGUID(true))
	local UseNavigationResult = UseNavigationFunction()
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: PerformFetch (upval), UseRefResult (copy)
		return PerformFetch.GetStatus(p2, UseRefResult.current)
	end)
	local UseSelectorResult1 = UseSelectorFunction(v15)
	local UseSelectorResult2 = UseSelectorFunction(v14)
	local UseSelectorResult3 = UseSelectorFunction(v18)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: IxpUtilsModule (upval), AXRecentlyViewedSearchItemsIXPTest (upval)
		return {
			isPositionTopVariant = IxpUtilsModule.readTestVariable(AXRecentlyViewedSearchItemsIXPTest.EnabledTopVariant) or false,
			isGlobalSaveVariant = IxpUtilsModule.readTestVariable(AXRecentlyViewedSearchItemsIXPTest.EnabledSaveInCatalog) or false
		}
	end, {})
	local UseRefResult1 = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseMemoResult (copy), UseRefResult1 (copy), CounterModule (upval)
		if p1.catalogAnalytics and UseMemoResult and not UseRefResult1.current then
			p1.catalogAnalytics.sendAXCounterV2(CounterModule.RecentlyViewedEligibleUserEntered, {
				isPositionTopVariant = tostring(UseMemoResult.isPositionTopVariant),
				isGlobalSaveVariant = tostring(UseMemoResult.isGlobalSaveVariant)
			})
			UseRefResult1.current = true
		end
	end, { UseMemoResult })
	ReactModule.useEffect(function()
		-- upvalues: RecentlyViewedSearchItemsAppStorageModule (upval), UseSelectorResult (copy), RetrievalStatus (upval), p1 (copy), UseRefResult (copy)
		local Items = RecentlyViewedSearchItemsAppStorageModule.getItems()
		
		if #Items > 0 and UseSelectorResult == RetrievalStatus.NotStarted and p1.fetchSearchRecentlyViewed then
			p1.fetchSearchRecentlyViewed(UseRefResult.current, Items)
		end
	end, {
		UseSelectorResult,
		UseSelectorResult1,
		p1.fetchSearchRecentlyViewed
	})
	local UseResult = ReactModule.useCallback(function(p2, p3)
		-- upvalues: p1 (copy), CounterModule (upval), UseMemoResult (copy)
		if p1.catalogAnalytics then
			p1.catalogAnalytics.sendAXCounterV2(CounterModule.RecentlyViewedCarouselItemSelected, {
				position = tostring(p3),
				itemType = p2.itemType,
				isPositionTopVariant = tostring(UseMemoResult.isPositionTopVariant),
				isGlobalSaveVariant = tostring(UseMemoResult.isGlobalSaveVariant)
			})
		end
	end, { p1.catalogAnalytics, UseMemoResult })
	local UseResult1 = ReactModule.useCallback(function(p2, p3)
		-- upvalues: UseResult (copy), p1 (copy), UseSelectorResult2 (copy), FindItemInTryOnItemsFunction (upval), UseNavigationResult (copy), AvatarScreen (upval), SearchLandingPageWidgetEnumModule (upval)
		return function()
			-- upvalues: UseResult (upval), p2 (copy), p3 (copy), p1 (upval), UseSelectorResult2 (upval), FindItemInTryOnItemsFunction (upval), UseNavigationResult (upval), AvatarScreen (upval), SearchLandingPageWidgetEnumModule (upval)
			UseResult(p2, p3)
			
			if p1.toggleTryOn then
				local Id = p2.id
				
				if not Id or FindItemInTryOnItemsFunction(UseSelectorResult2, Id) == nil then
					p1.toggleTryOn(p2)
				end
			end
			UseNavigationResult.navigate(AvatarScreen.SearchLandingFocusedWidgetPage, {
				widgetType = SearchLandingPageWidgetEnumModule.RecentlyViewedItems
			})
		end
	end, {
		UseNavigationResult,
		p1.toggleTryOn,
		UseSelectorResult2,
		UseResult
	})
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseSelectorResult3 (copy), GetFIntAXMaxRecentlyViewedSearchItemsInCarouselModule (upval), UseSelectorResult1 (copy), UseResult1 (copy)
		local AssetInfos = {}
		
		for i, value in UseSelectorResult3 do
			if GetFIntAXMaxRecentlyViewedSearchItemsInCarouselModule() <= #AssetInfos then break end
			local Id = value.id
			local Type = value.type
			local Tbl = nil
			
			if Type == "Asset" then
				Tbl = UseSelectorResult1.AssetInfos[Id]
			elseif Type == "Bundle" then
				Tbl = UseSelectorResult1.BundleInfos[Id]
			end
			if Tbl then
				Tbl = table.clone(Tbl)
			end
			local AssetInfo = Tbl
			
			if AssetInfo then
				AssetInfo.itemType = value.type
				AssetInfo.onActivated = UseResult1(AssetInfo, i)
				table.insert(AssetInfos, AssetInfo)
			end
		end
		return AssetInfos
	end, { UseSelectorResult1, UseResult1, UseSelectorResult3 })
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult1 (copy), IxpUtilsModule (upval), AXRecentlyViewedSearchItemsIXPTest (upval)
		if UseMemoResult1 and #UseMemoResult1 > 0 then
			IxpUtilsModule.logExperimentExposure(AXRecentlyViewedSearchItemsIXPTest)
		end
	end, { UseMemoResult1 })
	
	return { items = UseMemoResult1, fetchStatus = UseSelectorResult }
end