local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)

return function(p1, p2)
	-- upvalues: reactModule (ref), signalsModule (ref)
	local var1 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref)
		return function()
			-- upvalues: var1 (copy)
			if var1.current then
				var1.current()
			end
		end
	end, {})
	
	return reactModule.useCallback(function(...)
		-- upvalues: var1 (ref), p1 (ref), signalsModule (copy), p2 (ref)
		if var1.current then
			var1.current()
			var1.current = nil
		end
		local var2 = p1(...)
		
		if var2 then
			var1.current = signalsModule.createEffect(function(p3)
				-- upvalues: var2 (ref), p2 (copy)
				local var3 = var2(p3)
				
				if var3 ~= nil then
					p2(var3)
				end
			end)
		end
	end, { p1, p2 })
end