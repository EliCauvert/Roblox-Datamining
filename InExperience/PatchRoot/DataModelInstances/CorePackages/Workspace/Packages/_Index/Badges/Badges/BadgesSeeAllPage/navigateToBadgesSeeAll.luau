local Badges = script:FindFirstAncestor("Badges")
local Parent = Badges.Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SduiLoadTimer = require(Parent.SduiSharedUtilities).SduiLoadTimer
local FetchBadgesSeeAllPageIfNeededModule = require(Badges.BadgesSeeAllPage.fetchBadgesSeeAllPageIfNeeded)

return function(p1, UniverseId) --[[ Line: 9 | Named "navigateToBadgesSeeAll" ]]
	-- upvalues: SduiLoadTimer (copy), AppPage (copy), FetchBadgesSeeAllPageIfNeededModule (copy)
	local LoadTimer = SduiLoadTimer.createLoadTimer(AppPage.BadgesSeeAll)
	LoadTimer.start("navigate")
	p1.navigate(AppPage.BadgesSeeAll, {
		universeId = UniverseId,
		pageTimer = LoadTimer,
		url = FetchBadgesSeeAllPageIfNeededModule(UniverseId, LoadTimer)
	})
end