local Badges = script:FindFirstAncestor("Badges")
local Parent = Badges.Parent
local _ = require(Parent.Navigation)
local ReactModule = require(Parent.React)
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local SduiLoadTimer = SduiSharedUtilitiesModule.SduiLoadTimer
local SduiPageEntryPoint = SduiSharedUtilitiesModule.SduiPageEntryPoint
local CompositionTags = require(Parent.AppComposition).CompositionTags
local FetchBadgesSeeAllPageIfNeededModule = require(Badges.BadgesSeeAllPage.fetchBadgesSeeAllPageIfNeeded)
local GetBadgesSeeAllPageKeyModule = require(Badges.BadgesSeeAllPage.getBadgesSeeAllPageKey)

local function _(p1, p2)
	return p1[p2] or p1.navigation and p1.navigation.getParam(p2)
end

return ReactModule.memo(function(p1)
	-- upvalues: GetBadgesSeeAllPageKeyModule (copy), UseLocalizationFunction (copy), ReactModule (copy), SduiLoadTimer (copy), FetchBadgesSeeAllPageIfNeededModule (copy), SduiPageEntryPoint (copy), CompositionTags (copy)
	local UniverseId = p1.universeId or p1.navigation and p1.navigation.getParam("universeId")
	local BadgesSeeAllPageKeyModule = GetBadgesSeeAllPageKeyModule(UniverseId)
	local UseLocalizationResult = UseLocalizationFunction({ pageTitle = "CommonUI.Features.Label.Badges" })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), SduiLoadTimer (upval)
		return (if p1.pageTimer then p1.pageTimer else p1.navigation and p1.navigation.getParam("pageTimer")) or SduiLoadTimer.createLoadTimer("BadgesSeeAll")
	end, { BadgesSeeAllPageKeyModule })
	ReactModule.useEffect(function()
		-- upvalues: UniverseId (copy), FetchBadgesSeeAllPageIfNeededModule (upval), UseMemoResult (copy)
		if UniverseId then
			FetchBadgesSeeAllPageIfNeededModule(UniverseId, UseMemoResult)
		end
	end, { UniverseId, UseMemoResult })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UniverseId (copy), SduiLoadTimer (upval), FetchBadgesSeeAllPageIfNeededModule (upval)
		if UniverseId then
			local BadgesSeeAll = SduiLoadTimer.createLoadTimer("BadgesSeeAll")
			BadgesSeeAll.start("refresh")
			FetchBadgesSeeAllPageIfNeededModule(UniverseId, BadgesSeeAll, true)
		end
	end, { UniverseId })
	
	return if UniverseId == nil then nil else ReactModule.createElement(SduiPageEntryPoint, {
		appPage = "BadgesSeeAll",
		includeNavigationHeaderBar = true,
		configKey = BadgesSeeAllPageKeyModule,
		pageTimer = UseMemoResult,
		pageTitle = UseLocalizationResult.pageTitle,
		refresh = UseResult,
		contentTag = CompositionTags.ContentRegion.Body
	})
end)