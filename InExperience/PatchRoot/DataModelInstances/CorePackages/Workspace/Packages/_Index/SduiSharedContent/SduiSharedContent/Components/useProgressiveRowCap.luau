local reactModule = require(script:FindFirstAncestor("SduiSharedContent").Parent.React)

return function(p0, p1, p2, p3)
	-- upvalues: reactModule (ref)
	local var1 = p1 ~= nil
	local maxValue = math.max(1, p2 or 1)
	local var3, var4 = reactModule.useState(function()
		-- upvalues: var1 (ref), p0 (ref), p1 (ref)
		return if var1 then math.min(math.max(0, p1), p0) else p0
	end)
	local var5 = if var1 then math.min(var3, p0) else p0
	local var6 = var1 and var5 < p0
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), var4 (ref), maxValue (ref), p3 (ref)
		if not var6 then
			return nil
		end
		local var7 = nil
		
		local function advance()
			-- upvalues: var7 (write), var4 (copy), maxValue (copy)
			if var7 then
				return
			end
			var4(function(p4)
				-- upvalues: maxValue (copy)
				return p4 + maxValue
			end)
		end
		
		if p3 and p3 > 0 then
			task.delay(p3 / 1000, advance)
		else
			task.defer(advance)
		end
		return function()
			-- upvalues: var7 (write)
			var7 = true
		end
	end, { var6, maxValue, var3, p3 })
	
	return var5, var6
end