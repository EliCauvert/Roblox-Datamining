local parent = script:FindFirstAncestor("GameDetail").Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local _ = require(parent.NavigationRodux)
local sessionType = require(parent.RobloxAppSessionization).SessionType
local hasPageInCurrentRoute = require(parent.DiscoveryRouting).hasPageInCurrentRoute

return function(p1, p2)
	-- upvalues: hasPageInCurrentRoute (ref), appPage (ref), sessionType (ref)
	if not p1 or not p2 then return end
	if not hasPageInCurrentRoute(p2, appPage.GameDetail, true) and not hasPageInCurrentRoute(p2, appPage.ExperienceDetail, true) then
		p1:RemoveSession(sessionType.StructuralIdentifier.GameDetailSource)
	end
end