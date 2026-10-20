local _ = require(script:FindFirstAncestor("Foundation").Providers.Style.Tokens)
local TokenOverrides = nil
local List = {}
local config = {
	getTokenOverrides = function()
		-- upvalues: TokenOverrides (ref)
		return TokenOverrides
	end,
	setTokenOverrides = function(Value)
		-- upvalues: TokenOverrides (ref), List (copy)
		TokenOverrides = Value
		
		for _, value in List do
			value(Value)
		end
	end,
	subscribe = function(Value)
		-- upvalues: List (copy)
		table.insert(List, Value)
		
		return function()
			-- upvalues: List (upval), Value (copy)
			local FoundIndex: number? = table.find(List, Value)
			
			if FoundIndex then
				table.remove(List, FoundIndex)
			end
		end
	end
}

return function()
	-- upvalues: config (copy)
	return config
end