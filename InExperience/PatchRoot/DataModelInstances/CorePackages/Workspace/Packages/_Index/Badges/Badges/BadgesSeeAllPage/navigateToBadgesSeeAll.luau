local badges = script:FindFirstAncestor("Badges")
local parent = badges.Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local sduiLoadTimer = require(parent.SduiSharedUtilities).SduiLoadTimer
local fetchBadgesSeeAllPageIfNeededModule = require(badges.BadgesSeeAllPage.fetchBadgesSeeAllPageIfNeeded)

return function(p0, p1) --[[ line: 9 | named "navigateToBadgesSeeAll" ]]
	-- upvalues: sduiLoadTimer (ref), appPage (ref), fetchBadgesSeeAllPageIfNeededModule (ref)
	local var2 = sduiLoadTimer.createLoadTimer(appPage.BadgesSeeAll)
	var2.start("navigate")
	p0.navigate(appPage.BadgesSeeAll, {
		universeId = p1,
		pageTimer = var2,
		url = fetchBadgesSeeAllPageIfNeededModule(p1, var2)
	})
end