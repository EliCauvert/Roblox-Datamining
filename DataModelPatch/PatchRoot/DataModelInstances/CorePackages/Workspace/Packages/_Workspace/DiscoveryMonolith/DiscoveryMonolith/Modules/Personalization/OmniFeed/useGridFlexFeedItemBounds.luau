local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local Parent = DiscoveryMonolith.Parent
local ReactModule = require(Parent.React)
local RoactUtilsModule = require(Parent.RoactUtils)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local Modules = DiscoveryMonolith.Modules
local SetGameGridFlexFeedItemInputModule = require(Modules.Personalization.OmniFeed.DataStore.SetGameGridFlexFeedItemInput)
local ClearGameGridFlexFeedItemBoundsModule = require(Modules.Personalization.OmniFeed.DataStore.ClearGameGridFlexFeedItemBounds)

return function(p1, p2, p3, p4, p5)
	-- upvalues: UseDispatchFunction (copy), UseSelectorFunction (copy), ReactModule (copy), SetGameGridFlexFeedItemInputModule (copy), ClearGameGridFlexFeedItemBoundsModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseSelectorResult = UseSelectorFunction(function(p6)
		-- upvalues: p1 (copy), p2 (copy)
		return ((p6.Personalization.GameGridFlexFeedItemBounds[p1] or {}).flexItemsBounds or {})[p2]
	end)
	ReactModule.useEffect(function()
		-- upvalues: p3 (copy), UseDispatchResult (copy), SetGameGridFlexFeedItemInputModule (upval), p1 (copy), p2 (copy), p4 (copy), p5 (copy), ClearGameGridFlexFeedItemBoundsModule (upval)
		if p3 and p3 > 0 then
			UseDispatchResult(SetGameGridFlexFeedItemInputModule(p1, p2, p4, p3, p5))
		end
		return function()
			-- upvalues: p3 (upval), UseDispatchResult (upval), ClearGameGridFlexFeedItemBoundsModule (upval), p1 (upval), p2 (upval), p5 (upval)
			if p3 and p3 > 0 then
				UseDispatchResult(ClearGameGridFlexFeedItemBoundsModule(p1, p2, p3, p5))
			end
		end
	end, {
		p1,
		p2,
		p3,
		p4,
		p5
	})
	
	return UseSelectorResult
end