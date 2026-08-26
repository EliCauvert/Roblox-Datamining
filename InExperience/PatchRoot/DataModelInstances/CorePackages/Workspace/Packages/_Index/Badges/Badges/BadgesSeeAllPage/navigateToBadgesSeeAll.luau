local badges = script:FindFirstAncestor("Badges")
local parent = badges.Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local sduiLoadTimer = require(parent.SduiSharedUtilities).SduiLoadTimer
local fetchBadgesSeeAllPageIfNeededModule = require(badges.BadgesSeeAllPage.fetchBadgesSeeAllPageIfNeeded)

return function(p1, p2)
	-- upvalues: sduiLoadTimer (ref), appPage (ref), fetchBadgesSeeAllPageIfNeededModule (ref)
	local var1 = sduiLoadTimer.createLoadTimer(appPage.BadgesSeeAll)
	var1.start("navigate")
	p1.navigate(appPage.BadgesSeeAll, {
		universeId = p2,
		pageTimer = var1,
		url = fetchBadgesSeeAllPageIfNeededModule(p2, var1)
	})
end