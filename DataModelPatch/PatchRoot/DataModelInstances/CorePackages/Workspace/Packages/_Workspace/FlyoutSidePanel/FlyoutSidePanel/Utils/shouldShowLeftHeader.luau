local Parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigationRoduxModule = require(Parent.NavigationRodux)
local FFlagAppIaHomeSubTab = require(Parent.SharedFlags).FFlagAppIaHomeSubTab

return function(Games, Games1, p1): boolean
	-- upvalues: AppPage (copy), FFlagAppIaHomeSubTab (copy), NavigationRoduxModule (copy)
	local IsGamesMatch: boolean = Games == AppPage.Home or (Games == AppPage.Games or FFlagAppIaHomeSubTab and Games == NavigationRoduxModule.Constants.HomeContainerName)
	local IsGamesMatch1: boolean = Games1 == AppPage.Home or Games1 == AppPage.Games
	
	if not IsGamesMatch and not IsGamesMatch1 then
		return false
	elseif IsGamesMatch and Games1 == Games then
		local IsGamesMatch2: boolean = IsGamesMatch and Games1 == AppPage.GameDetail
		
		return if IsGamesMatch1 then not p1 else IsGamesMatch2 and not p1
	else
		return true
	end
end