local reactModule = require(script:FindFirstAncestor("Impressions").Parent.React)

return function(p1)
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef({})
	local var2 = reactModule.useRef(nil)
	local var3 = reactModule.useRef({})
	local var4 = reactModule.useRef({})
	local var5 = reactModule.useRef(0)
	local var6 = reactModule.useRef(p1.onFlush)
	var6.current = p1.onFlush
	local var7 = reactModule.useCallback(function()
		-- upvalues: var1 (ref), var6 (ref), var4 (ref), var3 (ref), var5 (ref)
		if #var1.current == 0 then return end
		local current = var6.current
		
		if not current then
			var1.current = {}
			var4.current = {}
			
			return
		end
		local t = {}
		
		for i, v in var1.current do
			var3.current[v.key] = true
			table.insert(t, v.item)
		end
		if #t > 0 then
			var5.current += 1
			current(t, var5.current)
		end
		var1.current = {}
		var4.current = {}
	end, {})
	local var8 = reactModule.useCallback(function(p2, p3, p4)
		-- upvalues: var3 (ref), var4 (ref), p1 (ref), var1 (ref), var2 (ref), var7 (ref)
		if not p2 or not p3 or (var3.current[p2] or var4.current[p2]) then return end
		local var9 = p1.mapItem(p2, p3, p4)
		
		if not var9 then return end
		var4.current[p2] = true
		table.insert(var1.current, { key = p2, item = var9 })
		
		if var2.current then
			pcall(task.cancel, var2.current)
		end
		var2.current = task.delay(p1.batchTimeMs * 0.001, var7)
	end, { p1.batchTimeMs, p1.mapItem, var7 })
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var7 (ref)
		return function()
			-- upvalues: var2 (copy), var7 (copy)
			if var2.current then
				pcall(task.cancel, var2.current)
			end
			var2.current = nil
			var7()
		end
	end, { var7 })
	
	return reactModule.useMemo(function()
		-- upvalues: var8 (ref)
		return { addImpression = var8 }
	end, { var8 })
end