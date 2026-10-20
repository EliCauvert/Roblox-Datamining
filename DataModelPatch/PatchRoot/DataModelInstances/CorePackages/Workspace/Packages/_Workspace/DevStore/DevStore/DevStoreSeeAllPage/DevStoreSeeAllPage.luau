local DevStore = script:FindFirstAncestor("DevStore")
local Parent = DevStore.Parent
local _ = require(Parent.Navigation)
local ReactModule = require(Parent.React)
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local SduiLoadTimer = SduiSharedUtilitiesModule.SduiLoadTimer
local SduiPageEntryPoint = SduiSharedUtilitiesModule.SduiPageEntryPoint
local CompositionTags = require(Parent.AppComposition).CompositionTags
local FetchDevStoreSeeAllPageIfNeededModule = require(DevStore.DevStoreSeeAllPage.fetchDevStoreSeeAllPageIfNeeded)
local GetDevStoreSeeAllPageKeyModule = require(DevStore.DevStoreSeeAllPage.getDevStoreSeeAllPageKey)

local function _(p1, p2)
	return p1[p2] or p1.navigation and p1.navigation.getParam(p2)
end

return ReactModule.memo(function(p1)
	-- upvalues: GetDevStoreSeeAllPageKeyModule (copy), UseLocalizationFunction (copy), ReactModule (copy), SduiLoadTimer (copy), FetchDevStoreSeeAllPageIfNeededModule (copy), SduiPageEntryPoint (copy), CompositionTags (copy)
	local UniverseId = p1.universeId or p1.navigation and p1.navigation.getParam("universeId")
	local DevStoreSeeAllPageKeyModule = GetDevStoreSeeAllPageKeyModule(UniverseId)
	local UseLocalizationResult = UseLocalizationFunction({ pageTitle = "Feature.GameDetails.Label.Store" })
	local PageTimer = p1.pageTimer or p1.navigation and p1.navigation.getParam("pageTimer")
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: PageTimer (copy), SduiLoadTimer (upval)
		return PageTimer or SduiLoadTimer.createLoadTimer("DevStoreSeeAll")
	end, { DevStoreSeeAllPageKeyModule, PageTimer })
	ReactModule.useEffect(function()
		-- upvalues: UniverseId (copy), FetchDevStoreSeeAllPageIfNeededModule (upval), UseMemoResult (copy)
		if UniverseId then
			FetchDevStoreSeeAllPageIfNeededModule(UniverseId, UseMemoResult)
		end
	end, { UniverseId, UseMemoResult })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UniverseId (copy), SduiLoadTimer (upval), FetchDevStoreSeeAllPageIfNeededModule (upval)
		if UniverseId then
			local DevStoreSeeAll = SduiLoadTimer.createLoadTimer("DevStoreSeeAll")
			DevStoreSeeAll.start("refresh")
			FetchDevStoreSeeAllPageIfNeededModule(UniverseId, DevStoreSeeAll, true)
		end
	end, { UniverseId })
	
	return if UniverseId == nil then nil else ReactModule.createElement(SduiPageEntryPoint, {
		appPage = "DevStoreSeeAll",
		includeNavigationHeaderBar = true,
		configKey = DevStoreSeeAllPageKeyModule,
		pageTimer = UseMemoResult,
		pageTitle = UseLocalizationResult.pageTitle,
		refresh = UseResult,
		contentTag = CompositionTags.ContentRegion.Body,
		layoutTag = CompositionTags.Layout.Detail
	})
end)