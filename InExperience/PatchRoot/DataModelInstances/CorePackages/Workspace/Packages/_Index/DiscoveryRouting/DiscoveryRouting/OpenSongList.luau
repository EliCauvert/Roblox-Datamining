local parent = script:FindFirstAncestor("DiscoveryRouting").Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

return function(p1, p2)
	-- upvalues: appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref)
	return function(p3)
		-- upvalues: appPage (copy), p1 (ref), p2 (ref), fFlagSignalsNavP3Dispatch (copy), var1 (copy), navigateDown (copy)
		local t = {
			name = appPage.SongList,
			detail = p1,
			extraProps = { pageContext = p2 }
		}
		
		if fFlagSignalsNavP3Dispatch then
			var1.down(var1.fromLegacyPage(t))
			
			return
		end
		p3:dispatch(navigateDown(t))
	end
end