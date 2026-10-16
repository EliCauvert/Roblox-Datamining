local Parent = script:FindFirstAncestor("GameDetail").Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local _ = require(Parent.NavigationRodux)
local SessionType = require(Parent.RobloxAppSessionization).SessionType
local HasPageInCurrentRouteFunction = require(Parent.DiscoveryRouting).hasPageInCurrentRoute

return function(SessionService, p1) --[[ Line: 11 | Named "removeGameDetailSessionIfDeparted" ]]
	-- upvalues: HasPageInCurrentRouteFunction (copy), AppPage (copy), SessionType (copy)
	if not SessionService or not p1 then return end
	if not HasPageInCurrentRouteFunction(p1, AppPage.GameDetail, true) and not HasPageInCurrentRouteFunction(p1, AppPage.ExperienceDetail, true) then
		SessionService:RemoveSession(SessionType.StructuralIdentifier.GameDetailSource)
	end
end