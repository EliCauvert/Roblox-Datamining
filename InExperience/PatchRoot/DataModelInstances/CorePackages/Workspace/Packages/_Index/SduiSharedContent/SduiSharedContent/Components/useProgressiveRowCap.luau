local reactModule = require(script:FindFirstAncestor("SduiSharedContent").Parent.React)

return function(p1, p2, p3, p4)
	-- upvalues: reactModule (ref)
	local var1 = p2 ~= nil
	local maxValue = math.max(1, p3 or 1)
	local var2, var3 = reactModule.useState(function()
		-- upvalues: var1 (ref), p1 (ref), p2 (ref)
		return if var1 then math.min(math.max(0, p2), p1) else p1
	end)
	local var4 = if var1 then math.min(var2, p1) else p1
	local var5 = var1 and var4 < p1
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), var3 (ref), maxValue (ref), p4 (ref)
		if not var5 then
			return nil
		end
		local var6 = nil
		
		local function advance()
			-- upvalues: var6 (write), var3 (copy), maxValue (copy)
			if var6 then
				return
			end
			var3(function(p5)
				-- upvalues: maxValue (copy)
				return p5 + maxValue
			end)
		end
		
		if p4 and p4 > 0 then
			task.delay(p4 / 1000, advance)
		else
			task.defer(advance)
		end
		return function()
			-- upvalues: var6 (write)
			var6 = true
		end
	end, { var5, maxValue, var2, p4 })
	
	return var4, var5
end