local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)

return function(p0, p1) --[[ line: 11 | named "useOptimisticUpdateStatus" ]]
	-- upvalues: reactModule (ref), signalsModule (ref)
	local var2 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 18 ]]
		-- upvalues: var2 (ref)
		return function() --[[ line: 19 ]]
			-- upvalues: var2 (copy)
			if var2.current then
				var2.current()
			end
		end
	end, {})
	
	return reactModule.useCallback(function(...) --[[ line: 27 ]]
		-- upvalues: var2 (ref), p0 (ref), signalsModule (copy), p1 (ref)
		if var2.current then
			var2.current()
			var2.current = nil
		end
		local var3 = p0(...)
		
		if var3 then
			var2.current = signalsModule.createEffect(function(p2) --[[ line: 39 ]]
				-- upvalues: var3 (ref), p1 (copy)
				local var4 = var3(p2)
				
				if var4 ~= nil then
					p1(var4)
				end
			end)
		end
	end, { p0, p1 })
end