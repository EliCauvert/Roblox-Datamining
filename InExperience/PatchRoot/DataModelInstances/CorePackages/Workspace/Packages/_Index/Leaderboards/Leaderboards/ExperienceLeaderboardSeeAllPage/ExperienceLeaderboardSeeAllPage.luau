local Leaderboards = script:FindFirstAncestor("Leaderboards")
local Parent = Leaderboards.Parent
local _ = require(Parent.Navigation)
local ReactModule = require(Parent.React)
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local SduiLoadTimer = SduiSharedUtilitiesModule.SduiLoadTimer
local SduiPageEntryPoint = SduiSharedUtilitiesModule.SduiPageEntryPoint
local UsePageScopeRefFunction = SduiSharedUtilitiesModule.usePageScopeRef
local CompositionTags = require(Parent.AppComposition).CompositionTags
local FetchExperienceLeaderboardSeeAllPageIfNeededModule = require(Leaderboards.ExperienceLeaderboardSeeAllPage.fetchExperienceLeaderboardSeeAllPageIfNeeded)
local GetExperienceLeaderboardSeeAllPageKeyModule = require(Leaderboards.ExperienceLeaderboardSeeAllPage.getExperienceLeaderboardSeeAllPageKey)

local function _(p1, p2)
	return p1[p2] or p1.navigation and p1.navigation.getParam(p2)
end

return ReactModule.memo(function(p1)
	-- upvalues: GetExperienceLeaderboardSeeAllPageKeyModule (copy), UsePageScopeRefFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), SduiLoadTimer (copy), FetchExperienceLeaderboardSeeAllPageIfNeededModule (copy), SduiPageEntryPoint (copy), CompositionTags (copy)
	local UniverseId = p1.universeId or p1.navigation and p1.navigation.getParam("universeId")
	local InitialTab = p1.initialTab or p1.navigation and p1.navigation.getParam("initialTab")
	local ExperienceLeaderboardSeeAllPageKeyModule = GetExperienceLeaderboardSeeAllPageKeyModule(UniverseId)
	UsePageScopeRefFunction(ExperienceLeaderboardSeeAllPageKeyModule)
	local UseLocalizationResult = UseLocalizationFunction({ pageTitle = "Feature.Leaderboards.Heading.Leaderboard" })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), SduiLoadTimer (upval)
		return (if p1.pageTimer then p1.pageTimer else p1.navigation and p1.navigation.getParam("pageTimer")) or SduiLoadTimer.createLoadTimer("ExperienceLeaderboardSeeAll")
	end, { ExperienceLeaderboardSeeAllPageKeyModule })
	ReactModule.useEffect(function()
		-- upvalues: UniverseId (copy), FetchExperienceLeaderboardSeeAllPageIfNeededModule (upval), InitialTab (copy), UseMemoResult (copy)
		if UniverseId then
			FetchExperienceLeaderboardSeeAllPageIfNeededModule(UniverseId, InitialTab, UseMemoResult)
		end
	end, { UniverseId, InitialTab, UseMemoResult })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UniverseId (copy), SduiLoadTimer (upval), FetchExperienceLeaderboardSeeAllPageIfNeededModule (upval), InitialTab (copy)
		if UniverseId then
			local ExperienceLeaderboardSeeAll = SduiLoadTimer.createLoadTimer("ExperienceLeaderboardSeeAll")
			ExperienceLeaderboardSeeAll.start("refresh")
			FetchExperienceLeaderboardSeeAllPageIfNeededModule(UniverseId, InitialTab, ExperienceLeaderboardSeeAll, true)
		end
	end, { UniverseId, InitialTab })
	
	return if UniverseId == nil then nil else ReactModule.createElement(SduiPageEntryPoint, {
		appPage = "ExperienceLeaderboardSeeAll",
		includeNavigationHeaderBar = true,
		configKey = ExperienceLeaderboardSeeAllPageKeyModule,
		pageTimer = UseMemoResult,
		pageTitle = UseLocalizationResult.pageTitle,
		refresh = UseResult,
		layoutTag = CompositionTags.Layout.Detail,
		contentTag = CompositionTags.ContentRegion.Body
	})
end)