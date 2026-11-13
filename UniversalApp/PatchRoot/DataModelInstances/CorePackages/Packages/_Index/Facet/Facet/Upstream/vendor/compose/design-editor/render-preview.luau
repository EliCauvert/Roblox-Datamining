local _ = require("../core")
local _ = require("../design")

return {
	bindings = function(p1, Tbl, Callback)
		if Tbl == nil then
			return nil
		end
		local Copy = table.clone(Tbl)
		
		for _, input in p1.contract.inputs do
			local Entry = Tbl[input.id]
			
			if input.kind == "value" and Entry then
				if Entry.readable then
					Copy[input.id] = { literal = Callback(Entry.readable) }
				elseif Entry.rows then
					local Literal = {}
					
					for i, value in Callback(Entry.rows) do
						Literal[i] = value
					end
					Copy[input.id] = { literal = Literal }
				end
			end
		end
		return Copy
	end
}