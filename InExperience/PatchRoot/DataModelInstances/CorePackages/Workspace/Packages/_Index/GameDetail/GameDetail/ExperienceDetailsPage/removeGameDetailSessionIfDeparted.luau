local parent = script:FindFirstAncestor("GameDetail").Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local _ = require(parent.NavigationRodux)
local sessionType = require(parent.RobloxAppSessionization).SessionType
local hasPageInCurrentRoute = require(parent.DiscoveryRouting).hasPageInCurrentRoute

return function(p0, p1)
	-- upvalues: hasPageInCurrentRoute (ref), appPage (ref), sessionType (ref)
	if not p0 or not p1 then return end
	if not hasPageInCurrentRoute(p1, appPage.GameDetail, true) and not hasPageInCurrentRoute(p1, appPage.ExperienceDetail, true) then
		p0:RemoveSession(sessionType.StructuralIdentifier.GameDetailSource)
	end
end