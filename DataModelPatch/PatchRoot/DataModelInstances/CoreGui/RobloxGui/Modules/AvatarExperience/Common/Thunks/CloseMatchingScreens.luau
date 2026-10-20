local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local AppPageModule = require(Modules.LuaApp.AppPage)
local ResetNavigationHistoryModule = require(Modules.LuaApp.Thunks.ResetNavigationHistory)
local AvatarExperienceActionsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.AvatarExperienceActions)
local FFlagUseNavigationSelectors = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors
local FFlagSignalsNavP3gAvatarExperience = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3gAvatarExperience
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local GetLegacyNavigationStoreFunction = require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore
local config = {
	[AppPageModule.AvatarExperienceWrapper] = true,
	[AppPageModule.AvatarExperienceWrapperTransparent] = true
}

local function buildHistoryFromRoute(p1)
	local List = {}
	
	for i = 1, #p1 do
		local List1 = {}
		
		for i1 = 1, i do
			table.insert(List1, p1[i1])
		end
		table.insert(List, List1)
	end
	return List
end

local function _(p2)
	-- upvalues: AppPageModule (copy)
	local Name = p2.name
	
	if Name == AppPageModule.AvatarExperienceWrapper or Name == AppPageModule.AvatarExperienceWrapperTransparent then
		Name = p2.extraProps and p2.extraProps.routeName or nil
	end
	return Name
end

local function closeAppRouterPages(p2, p3)
	-- upvalues: CryoModule (copy), FFlagSignalsNavP3gAvatarExperience (copy), GetLegacyNavigationStoreFunction (copy), FFlagUseNavigationSelectors (copy), Selectors (copy), AppPageModule (copy), buildHistoryFromRoute (copy), ResetNavigationHistoryModule (copy)
	local Set = CryoModule.List.toSet(p3)
	local State = p2:getState()
	local CurrentLegacyRoute = if FFlagSignalsNavP3gAvatarExperience then GetLegacyNavigationStoreFunction(false).getCurrentLegacyRoute(false) elseif FFlagUseNavigationSelectors then Selectors.selectCurrentLegacyRoute(State) else State.Navigation.history[#State.Navigation.history]
	local List = {}
	local Flag = false
	
	for i = 1, #CurrentLegacyRoute do
		local CurrentLegacyRouteEntry = CurrentLegacyRoute[i]
		local Name = CurrentLegacyRouteEntry.name
		
		if Name == AppPageModule.AvatarExperienceWrapper or Name == AppPageModule.AvatarExperienceWrapperTransparent then
			Name = CurrentLegacyRouteEntry.extraProps and CurrentLegacyRouteEntry.extraProps.routeName or nil
		end
		if Set[Name] then
			Flag = true
		else
			table.insert(List, CurrentLegacyRoute[i])
		end
	end
	if Flag then
		p2:dispatch(ResetNavigationHistoryModule(nil, (buildHistoryFromRoute(List))))
		
		return
	end
end

local function getCurrentAppRouterPageName(p4)
	-- upvalues: FFlagSignalsNavP3gAvatarExperience (copy), GetLegacyNavigationStoreFunction (copy), FFlagUseNavigationSelectors (copy), Selectors (copy)
	local State = p4:getState()
	local CurrentPage = nil
	
	if FFlagSignalsNavP3gAvatarExperience then
		CurrentPage = GetLegacyNavigationStoreFunction(false).getCurrentPage(false)
	elseif FFlagUseNavigationSelectors then
		CurrentPage = Selectors.selectCurrentLegacyPage(State)
	else
		local HistoryEntry = State.Navigation.history[#State.Navigation.history]
		CurrentPage = HistoryEntry[#HistoryEntry]
	end
	return CurrentPage.name
end

return function(p4, p5)
	-- upvalues: getCurrentAppRouterPageName (copy), config (copy), closeAppRouterPages (copy), AvatarExperienceActionsModule (copy)
	return function(p6)
		-- upvalues: getCurrentAppRouterPageName (upval), config (upval), closeAppRouterPages (upval), p5 (copy), p4 (copy), AvatarExperienceActionsModule (upval)
		if config[getCurrentAppRouterPageName(p6)] then
			closeAppRouterPages(p6, p5)
			
			return
		else
			p4.dispatch(AvatarExperienceActionsModule.clearScreens(p5))
		end
	end
end