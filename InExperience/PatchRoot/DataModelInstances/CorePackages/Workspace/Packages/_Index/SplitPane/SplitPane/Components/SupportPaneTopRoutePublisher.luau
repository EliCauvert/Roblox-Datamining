local ReactModule = require(script:FindFirstAncestor("SplitPane").Parent.React)
local SplitPaneStoreModule = require(script.Parent.Parent.Stores.SplitPaneStore)
local RouteIdentityMatchesModule = require(script.Parent.Parent.Utils.routeIdentityMatches)

return function(p1)
	-- upvalues: ReactModule (copy), SplitPaneStoreModule (copy), RouteIdentityMatchesModule (copy)
	local RouteState = p1.routeState
	ReactModule.useEffect(function()
		-- upvalues: RouteState (copy), SplitPaneStoreModule (upval), RouteIdentityMatchesModule (upval)
		if RouteState == nil then return end
		local Store = SplitPaneStoreModule.getStore()
		
		local function SupportPaneTopRouteMatcher(p2, p3)
			-- upvalues: RouteIdentityMatchesModule (upval), RouteState (upval)
			return RouteIdentityMatchesModule(RouteState, p2, p3)
		end
		
		local Key = RouteState.key
		Store.setSupportPaneTopRouteMatcher(SupportPaneTopRouteMatcher)
		Store.setSupportPaneTopRouteKey(Key)
		
		return function()
			-- upvalues: Store (copy), SupportPaneTopRouteMatcher (copy), Key (copy)
			if Store.getSupportPaneTopRouteMatcher(false) == SupportPaneTopRouteMatcher then
				Store.setSupportPaneTopRouteMatcher(nil)
			end
			if Store.getSupportPaneTopRouteKey(false) == Key then
				Store.setSupportPaneTopRouteKey(nil)
			end
		end
	end, { RouteState })
	
	return nil
end