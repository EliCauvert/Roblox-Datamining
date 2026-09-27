local parent = script:FindFirstAncestor("ProgressLoading").Parent
local _ = require(parent.React)
local var1, var2 = require(parent.Signals).createSignal(nil)

return {
	getPregameOverride = var1,
	setPregameOverride = function(value, p1)
		-- upvalues: var2 (ref)
		if value == nil then
			var2(nil)
			
			return
		end
		local cloned = table.clone(value)
		cloned.setAt = p1 or os.clock()
		var2(cloned)
	end,
	claims = function(p1, p2, p3)
		return p1.placeId == p2 and p3 - (p1.setAt or 0) <= 15
	end
}