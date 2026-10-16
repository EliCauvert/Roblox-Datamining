local _ = require(script:FindFirstAncestor("Foundation").Providers.Style.Tokens)
local TokenOverrides = nil
local List = {}
local config = {
	getTokenOverrides = function() --[[ Line: 35 ]]
		-- upvalues: TokenOverrides (ref)
		return TokenOverrides
	end,
	setTokenOverrides = function(Value) --[[ Line: 38 ]]
		-- upvalues: TokenOverrides (ref), List (copy)
		TokenOverrides = Value
		
		for _, value in List do
			value(Value)
		end
	end,
	subscribe = function(Value) --[[ Line: 44 ]]
		-- upvalues: List (copy)
		table.insert(List, Value)
		
		return function() --[[ Line: 46 ]]
			-- upvalues: List (upval), Value (copy)
			local FoundIndex: number? = table.find(List, Value)
			
			if FoundIndex then
				table.remove(List, FoundIndex)
			end
		end
	end
}

return function() --[[ Line: 55 | Named "getTokenOverridesStore" ]]
	-- upvalues: config (copy)
	return config
end