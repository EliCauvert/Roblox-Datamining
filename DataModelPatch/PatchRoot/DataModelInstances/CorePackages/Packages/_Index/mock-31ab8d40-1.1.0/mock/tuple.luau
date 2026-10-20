local SymbolsModule = require(script.Parent.symbols)

return function(...)
	-- upvalues: SymbolsModule (copy)
	local Values = { ... }
	assert(#Values > 1, "Mock Error: tuple only accepts more than 1 value.")
	
	return (setmetatable({ [SymbolsModule.isTuple] = true, values = Values }, {
		__tostring = function(_): string
			-- upvalues: Values (copy)
			local List = {}
			
			for _, value in ipairs(Values) do
				table.insert(List, (tostring(value)))
			end
			return "<Tuple values=[" .. table.concat(List, ", ") .. "]>"
		end
	}))
end