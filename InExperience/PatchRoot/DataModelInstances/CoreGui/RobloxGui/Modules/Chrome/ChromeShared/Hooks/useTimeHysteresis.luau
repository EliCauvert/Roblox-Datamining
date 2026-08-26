local reactModule = require(game:GetService("CorePackages").Packages.React)

return function(p1, p2, p3, p4, _)
	-- upvalues: reactModule (ref)
	if not p3 then
		p3 = p2
	end
	local var1, var2 = reactModule.useState(p4 or false)
	local var3, var4 = reactModule.useState(false)
	local var5 = reactModule.useRef(p4 or 0)
	local var6 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), var4 (ref), var3 (ref), var1 (ref), p2 (ref), p1 (ref), var6 (ref), p3 (write)
		local currentTime = tick()
		local delayedThread = nil
		local var7 = false
		
		local _ = function(p5, p6, p7)
			-- upvalues: delayedThread (write), var7 (write), var5 (copy), var4 (copy), var3 (copy)
			if p5 > 0 then
				delayedThread = task.delay(p5, function()
					-- upvalues: var7 (copy), delayedThread (copy), var5 (copy), p7 (ref), var4 (copy), p6 (ref)
					var7 = true
					delayedThread = nil
					var5.current = p7
					var4(p6)
				end)
				
				return
			elseif var3 ~= p6 then
				var7 = true
				var4(p6)
			end
		end
		
		if var1 then
			local var8 = p2 - var5.current
			local var9 = p2
			
			if var8 > 0 then
				local var10 = true
				delayedThread = task.delay(var8, function()
					-- upvalues: var7 (write), delayedThread (write), var5 (copy), var9 (ref), var4 (copy), var10 (ref)
					var7 = true
					delayedThread = nil
					var5.current = var9
					var4(var10)
				end)
			elseif var3 ~= true then
				var7 = true
				var4(true)
			end
		else
			local var11 = var5.current - p1
			local var12 = p1
			
			if var11 > 0 then
				local var13 = false
				delayedThread = task.delay(var11, function()
					-- upvalues: var7 (write), delayedThread (write), var5 (copy), var12 (ref), var4 (copy), var13 (ref)
					var7 = true
					delayedThread = nil
					var5.current = var12
					var4(var13)
				end)
			elseif var3 ~= false then
				var7 = true
				var4(false)
			end
		end
		return function()
			-- upvalues: var7 (write), delayedThread (write), var6 (copy), currentTime (ref), var1 (ref), var5 (copy), p3 (copy)
			if not var7 then
				if delayedThread then
					task.cancel(delayedThread)
				end
				if not var6.current then
					local var14 = tick() - currentTime
					
					if not var1 then
						var14 *= -1
					end
					var5.current = math.clamp(var5.current + var14, 0, p3)
				end
			end
			var6.current = false
		end
	end, {
		var1,
		var3,
		p1,
		p2,
		p3
	})
	
	return var3, reactModule.useCallback(function(p5, p6)
		-- upvalues: var6 (ref), var5 (ref), p3 (write), var2 (ref)
		var6.current = p6
		
		if p6 then
			if p5 then
				var5.current = p3
			else
				var5.current = 0
			end
		end
		var2(p5)
	end, { var2 })
end