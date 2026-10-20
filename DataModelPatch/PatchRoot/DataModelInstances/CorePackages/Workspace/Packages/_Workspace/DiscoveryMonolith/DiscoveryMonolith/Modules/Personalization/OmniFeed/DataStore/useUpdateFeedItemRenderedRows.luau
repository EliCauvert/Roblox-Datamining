local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local Parent = DiscoveryMonolith.Parent
local ReactModule = require(Parent.React)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local ArgCheckModule = require(Parent.ArgCheck)
local _ = require(Parent.DiscoveryTypes)
local Modules = DiscoveryMonolith.Modules
local SetFeedItemRenderedRowsModule = require(Modules.Personalization.OmniFeed.DataStore.SetFeedItemRenderedRows)
local ClearFeedItemRenderedRowsModule = require(Modules.Personalization.OmniFeed.DataStore.ClearFeedItemRenderedRows)

return function(p1, p2, p3, p4)
	-- upvalues: UseDispatchFunction (copy), UseSelectorFunction (copy), ReactModule (copy), ArgCheckModule (copy), SetFeedItemRenderedRowsModule (copy), ClearFeedItemRenderedRowsModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseSelectorResult = UseSelectorFunction(function(p5)
		-- upvalues: p1 (copy), p2 (copy), p3 (copy)
		local OrderedOmniItem = p5.Personalization.OrderedOmniItems[p1] or {}
		
		if p2 then
			OrderedOmniItem = OrderedOmniItem[p2] or {}
		end
		return OrderedOmniItem.allItems and OrderedOmniItem.allItems[p3] or nil
	end)
	ReactModule.useEffect(function()
		-- upvalues: ArgCheckModule (upval), UseSelectorResult (copy), p3 (copy), p1 (copy), p2 (copy), UseDispatchResult (copy), SetFeedItemRenderedRowsModule (upval), p4 (copy), ClearFeedItemRenderedRowsModule (upval)
		ArgCheckModule.assert(UseSelectorResult, `Trying to update the number of rows for a feed item but could not find it.  At position: {p3}, Page: {p1} (optional key: {p2})`)
		
		if UseSelectorResult then
			UseDispatchResult(SetFeedItemRenderedRowsModule(p1, p2, p3, UseSelectorResult, p4))
			
			return function()
				-- upvalues: UseDispatchResult (upval), ClearFeedItemRenderedRowsModule (upval), p1 (upval), p2 (upval), p3 (upval), UseSelectorResult (upval)
				UseDispatchResult(ClearFeedItemRenderedRowsModule(p1, p2, p3, UseSelectorResult))
			end
		else
			return function() end
		end
	end, {
		p1,
		p2,
		p3,
		UseSelectorResult,
		p4
	})
end