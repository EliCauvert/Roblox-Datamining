local devStore = script:FindFirstAncestor("DevStore")
local parent = devStore.Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local fFlagLuaAppDevStoreSeeAllForceRefreshOnNavigate = require(parent.SharedFlags).FFlagLuaAppDevStoreSeeAllForceRefreshOnNavigate
local sduiLoadTimer = require(parent.SduiSharedUtilities).SduiLoadTimer
local fetchDevStoreSeeAllPageIfNeededModule = require(devStore.DevStoreSeeAllPage.fetchDevStoreSeeAllPageIfNeeded)

return function(p0, p1)
	-- upvalues: sduiLoadTimer (ref), appPage (ref), fFlagLuaAppDevStoreSeeAllForceRefreshOnNavigate (ref), fetchDevStoreSeeAllPageIfNeededModule (ref)
	local var2 = sduiLoadTimer.createLoadTimer(appPage.DevStoreSeeAll)
	var2.start("navigate")
	p0.navigate(appPage.DevStoreSeeAll, {
		universeId = p1,
		pageTimer = var2,
		url = fetchDevStoreSeeAllPageIfNeededModule(p1, var2, if fFlagLuaAppDevStoreSeeAllForceRefreshOnNavigate then true else nil)
	})
end