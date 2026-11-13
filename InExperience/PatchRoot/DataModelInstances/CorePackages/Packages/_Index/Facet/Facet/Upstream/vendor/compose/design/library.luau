local _ = require("./types")

return {
	extend = function(Tbl, p1)
		local Copy = table.clone(Tbl.kinds)
		
		for i, kind in p1.kinds do
			assert(Copy[i] == nil, `{Tbl.name} already has a kind named {i}`)
			Copy[i] = kind
		end
		local Copy1 = table.clone(Tbl.prelude)
		local Prelude = p1.prelude or {}
		for _, value in Prelude do
			if table.find(Copy1, value) == nil then
				table.insert(Copy1, value)
			end
		end
		local Copy2 = table.clone(Tbl)
		Copy2.kinds = Copy
		Copy2.prelude = Copy1
		
		return Copy2
	end
}