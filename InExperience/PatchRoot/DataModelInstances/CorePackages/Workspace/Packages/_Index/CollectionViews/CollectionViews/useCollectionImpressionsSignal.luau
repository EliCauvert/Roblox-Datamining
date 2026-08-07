local parent = script:FindFirstAncestor("CollectionViews").Parent
local reactModule = require(parent.React)
local signal = require(parent.AppCommonLib).Signal

return function(value) --[[ line: 18 | named "useCollectionImpressionsSignal" ]]
	-- upvalues: reactModule (ref), signal (ref)
	local var1 = reactModule.useRef(nil)
	
	if var1.current == nil then
		var1.current = signal.new()
	end
	local current = var1.current
	reactModule.useEffect(function() --[[ line: 25 ]]
		-- upvalues: current (ref), value (ref)
		current:fire()
		local var2 = if value then value:connect(function() --[[ line: 34 ]]
			-- upvalues: current (copy)
			current:fire()
		end) else nil
		
		return function() --[[ line: 39 ]]
			-- upvalues: var2 (write)
			if var2 then
				var2:disconnect()
			end
		end
	end, { value, current })
	
	return current, reactModule.useCallback(function() --[[ line: 46 ]]
		-- upvalues: current (ref)
		current:fire()
	end, { current })
end