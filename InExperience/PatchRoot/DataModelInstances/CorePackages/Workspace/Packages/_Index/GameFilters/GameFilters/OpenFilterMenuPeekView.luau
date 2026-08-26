local parent = script:FindFirstAncestor("GameFilters").Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

return function(p1, p2, p3, p4)
	-- upvalues: appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref)
	return function(p5)
		-- upvalues: appPage (copy), p1 (ref), p2 (ref), p3 (ref), p4 (ref), fFlagSignalsNavP3Dispatch (copy), var1 (copy), navigateDown (copy)
		local t = {
			name = appPage.GameFilterMenuPeekView,
			extraProps = {
				filter = p1,
				onFilterApplied = p2,
				onFilterMenuClosed = p3,
				sendFilterClick = p4
			}
		}
		
		if fFlagSignalsNavP3Dispatch then
			var1.down(var1.fromLegacyPage(t))
			
			return
		end
		p5:dispatch(navigateDown(t))
	end
end