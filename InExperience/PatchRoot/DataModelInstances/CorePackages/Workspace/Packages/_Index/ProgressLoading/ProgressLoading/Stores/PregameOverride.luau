local Parent = script:FindFirstAncestor("ProgressLoading").Parent
local _ = require(Parent.React)
local Signal, Signal2 = require(Parent.Signals).createSignal(nil)

return {
	getPregameOverride = Signal,
	setPregameOverride = function(Tbl, p1)
		-- upvalues: Signal2 (copy)
		if Tbl == nil then
			Signal2(nil)
			
			return
		else
			local Copy = table.clone(Tbl)
			Copy.setAt = p1 or os.clock()
			Signal2(Copy)
		end
	end,
	claims = function(p1, PlaceId, p2): boolean
		return p1.placeId == PlaceId and p2 - (p1.setAt or 0) <= 15
	end
}