local symbolsModule = require(script.Parent.symbols)

return function(...)
	-- upvalues: symbolsModule (ref)
	local list = { ... }
	assert(#list > 1, "Mock Error: tuple only accepts more than 1 value.")
	
	return setmetatable({ [symbolsModule.isTuple] = true, values = list }, {
		__tostring = function(_)
			-- upvalues: list (ref)
			local t = {}
			
			for i, v in ipairs(list) do
				table.insert(t, tostring(v))
			end
			return "<Tuple values=[" .. table.concat(t, ", ") .. "]>"
		end
	})
end