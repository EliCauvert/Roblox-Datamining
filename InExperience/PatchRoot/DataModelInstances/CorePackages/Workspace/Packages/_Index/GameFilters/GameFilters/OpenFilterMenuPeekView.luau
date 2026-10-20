local Parent = script:FindFirstAncestor("GameFilters").Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil

return function(Filter, OnFilterApplied, OnFilterMenuClosed, SendFilterClick)
	-- upvalues: AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy)
	return function(p1)
		-- upvalues: AppPage (upval), Filter (copy), OnFilterApplied (copy), OnFilterMenuClosed (copy), SendFilterClick (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownFunction (upval)
		local config = {
			name = AppPage.GameFilterMenuPeekView,
			extraProps = {
				filter = Filter,
				onFilterApplied = OnFilterApplied,
				onFilterMenuClosed = OnFilterMenuClosed,
				sendFilterClick = SendFilterClick
			}
		}
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
			
			return
		else
			p1:dispatch(NavigateDownFunction(config))
		end
	end
end