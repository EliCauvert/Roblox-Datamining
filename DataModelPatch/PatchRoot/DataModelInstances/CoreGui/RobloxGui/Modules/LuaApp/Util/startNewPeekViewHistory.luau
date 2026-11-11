local CorePackages = game:GetService("CorePackages")
local Modules = script:FindFirstAncestor("Modules")
local AppPageModule = require(Modules.LuaApp.AppPage)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagUseNavigationSelectors = SharedFlagsModule.FFlagUseNavigationSelectors
local FFlagSignalsNavP3hMisc = SharedFlagsModule.FFlagSignalsNavP3hMisc
local NavigationRoduxModule = require(CorePackages.Workspace.Packages.NavigationRodux)
local Selectors = NavigationRoduxModule.Selectors
local AppPagePropertiesModule = require(Modules.LuaApp.AppPageProperties)
local GetLegacyNavigationStore = if FFlagSignalsNavP3hMisc then NavigationRoduxModule.GetLegacyNavigationStore else nil

local function _()
	-- upvalues: AppPageModule (copy)
	return { { name = AppPageModule.Home } }
end

return function(p1, p2)
	-- upvalues: FFlagSignalsNavP3hMisc (copy), GetLegacyNavigationStore (copy), FFlagUseNavigationSelectors (copy), Selectors (copy), AppPageModule (copy), AppPagePropertiesModule (copy)
	local History = nil
	if FFlagSignalsNavP3hMisc then
		History = GetLegacyNavigationStore(false).getHistory(false)
	else
		local State = p1:getState()
		History = if FFlagUseNavigationSelectors then Selectors.selectLegacyHistory(State) else State.Navigation.history
	end
	local HistoryEntry = History[#History] or { { name = AppPageModule.Home } }
	local NewRoute = {}
	
	for i = 1, #HistoryEntry do
		local Name = HistoryEntry[i].name
		
		if not AppPagePropertiesModule[Name] or not AppPagePropertiesModule[Name].isPeekView then
			NewRoute[#NewRoute + 1] = HistoryEntry[i]
		end
	end
	NewRoute[#NewRoute + 1] = p2
	
	if #NewRoute == 0 then
		NewRoute = { { name = AppPageModule.Home } }
	end
	local NewHistory = {}
	
	for i1 = 1, #NewRoute do
		local t = {}
		
		for i2 = 1, i1 do
			t[#t + 1] = NewRoute[i2]
		end
		NewHistory[#NewHistory + 1] = t
	end
	return { newRoute = NewRoute, newHistory = NewHistory }
end