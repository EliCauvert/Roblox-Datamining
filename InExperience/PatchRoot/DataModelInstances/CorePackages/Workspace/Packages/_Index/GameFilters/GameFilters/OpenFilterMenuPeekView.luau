local parent = script:FindFirstAncestor("GameFilters").Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var0 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

return function(p0, p1, p2, p3) --[[ line: 12 | named "OpenFilterMenuPeekView" ]]
	-- upvalues: appPage (ref), fFlagSignalsNavP3Dispatch (ref), var0 (ref), navigateDown (ref)
	return function(p4) --[[ line: 13 ]]
		-- upvalues: appPage (copy), p0 (ref), p1 (ref), p2 (ref), p3 (ref), fFlagSignalsNavP3Dispatch (copy), var0 (copy), navigateDown (copy)
		local t = {
			name = appPage.GameFilterMenuPeekView,
			extraProps = {
				filter = p0,
				onFilterApplied = p1,
				onFilterMenuClosed = p2,
				sendFilterClick = p3
			}
		}
		
		if fFlagSignalsNavP3Dispatch then
			var0.down(var0.fromLegacyPage(t))
			
			return
		end
		p4:dispatch(navigateDown(t))
	end
end