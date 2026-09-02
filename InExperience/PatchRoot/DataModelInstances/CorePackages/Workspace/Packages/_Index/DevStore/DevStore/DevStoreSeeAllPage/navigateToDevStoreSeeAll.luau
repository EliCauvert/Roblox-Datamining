local devStore = script:FindFirstAncestor("DevStore")
local parent = devStore.Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local fFlagLuaAppDevStoreSeeAllForceRefreshOnNavigate = require(parent.SharedFlags).FFlagLuaAppDevStoreSeeAllForceRefreshOnNavigate
local sduiLoadTimer = require(parent.SduiSharedUtilities).SduiLoadTimer
local fetchDevStoreSeeAllPageIfNeededModule = require(devStore.DevStoreSeeAllPage.fetchDevStoreSeeAllPageIfNeeded)

return function(p1, p2)
	-- upvalues: sduiLoadTimer (ref), appPage (ref), fFlagLuaAppDevStoreSeeAllForceRefreshOnNavigate (ref), fetchDevStoreSeeAllPageIfNeededModule (ref)
	local var1 = sduiLoadTimer.createLoadTimer(appPage.DevStoreSeeAll)
	var1.start("navigate")
	p1.navigate(appPage.DevStoreSeeAll, {
		universeId = p2,
		pageTimer = var1,
		url = fetchDevStoreSeeAllPageIfNeededModule(p2, var1, if fFlagLuaAppDevStoreSeeAllForceRefreshOnNavigate then true else nil)
	})
end