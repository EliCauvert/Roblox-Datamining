local reactModule = require(script:FindFirstAncestor("ExpChat").Parent.React)

return function()
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useBinding({})
	local var3 = reactModule.useRef(nil)
	
	return {
		binding = var1,
		begin = function(p1)
			-- upvalues: var3 (ref)
			var3.current = var3.current or p1
		end,
		commit = function(p1)
			-- upvalues: var3 (ref), var1 (ref), var2 (ref)
			local current = var3.current
			var3.current = nil
			
			if current == nil or p1 < current then
				return
			end
			local cloned = table.clone(var1:getValue())
			table.insert(cloned, { startIdx = current, endIdx = p1 })
			var2(cloned)
		end,
		reset = function()
			-- upvalues: var3 (ref), var2 (ref)
			var3.current = nil
			var2({})
		end
	}
end