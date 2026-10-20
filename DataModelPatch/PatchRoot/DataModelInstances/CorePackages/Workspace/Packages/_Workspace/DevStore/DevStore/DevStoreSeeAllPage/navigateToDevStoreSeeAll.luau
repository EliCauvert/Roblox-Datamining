local DevStore = script:FindFirstAncestor("DevStore")
local Parent = DevStore.Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local FFlagLuaAppDevStoreSeeAllForceRefreshOnNavigate = require(Parent.SharedFlags).FFlagLuaAppDevStoreSeeAllForceRefreshOnNavigate
local SduiLoadTimer = require(Parent.SduiSharedUtilities).SduiLoadTimer
local FetchDevStoreSeeAllPageIfNeededModule = require(DevStore.DevStoreSeeAllPage.fetchDevStoreSeeAllPageIfNeeded)

return function(p1, UniverseId)
	-- upvalues: SduiLoadTimer (copy), AppPage (copy), FFlagLuaAppDevStoreSeeAllForceRefreshOnNavigate (copy), FetchDevStoreSeeAllPageIfNeededModule (copy)
	local LoadTimer = SduiLoadTimer.createLoadTimer(AppPage.DevStoreSeeAll)
	LoadTimer.start("navigate")
	p1.navigate(AppPage.DevStoreSeeAll, {
		universeId = UniverseId,
		pageTimer = LoadTimer,
		url = FetchDevStoreSeeAllPageIfNeededModule(UniverseId, LoadTimer, if FFlagLuaAppDevStoreSeeAllForceRefreshOnNavigate then true else nil)
	})
end