local reactModule = require(game:GetService("CorePackages").Packages.React)

return function(p0, p1, p2, p3, _)
	-- upvalues: reactModule (ref)
	if not p2 then
		p2 = p1
	end
	local var1, var2 = reactModule.useState(p3 or false)
	local var3, var4 = reactModule.useState(false)
	local var5 = reactModule.useRef(p3 or 0)
	local var6 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), var4 (ref), var3 (ref), var1 (ref), p1 (ref), p0 (ref), var6 (ref), p2 (write)
		local currentTime = tick()
		local delayedThread = nil
		local var9 = false
		
		local _ = function(p4, p5, p6)
			-- upvalues: delayedThread (write), var9 (write), var5 (copy), var4 (copy), var3 (copy)
			if p4 > 0 then
				delayedThread = task.delay(p4, function()
					-- upvalues: var9 (copy), delayedThread (copy), var5 (copy), p6 (ref), var4 (copy), p5 (ref)
					var9 = true
					delayedThread = nil
					var5.current = p6
					var4(p5)
				end)
				
				return
			elseif var3 ~= p5 then
				var9 = true
				var4(p5)
			end
		end
		
		if var1 then
			local var10 = p1 - var5.current
			local var11 = p1
			
			if var10 > 0 then
				local var12 = true
				delayedThread = task.delay(var10, function()
					-- upvalues: var9 (write), delayedThread (write), var5 (copy), var11 (ref), var4 (copy), var12 (ref)
					var9 = true
					delayedThread = nil
					var5.current = var11
					var4(var12)
				end)
			elseif var3 ~= true then
				var9 = true
				var4(true)
			end
		else
			local var13 = var5.current - p0
			local var14 = p0
			
			if var13 > 0 then
				local var15 = false
				delayedThread = task.delay(var13, function()
					-- upvalues: var9 (write), delayedThread (write), var5 (copy), var14 (ref), var4 (copy), var15 (ref)
					var9 = true
					delayedThread = nil
					var5.current = var14
					var4(var15)
				end)
			elseif var3 ~= false then
				var9 = true
				var4(false)
			end
		end
		return function()
			-- upvalues: var9 (write), delayedThread (write), var6 (copy), currentTime (ref), var1 (ref), var5 (copy), p2 (copy)
			if not var9 then
				if delayedThread then
					task.cancel(delayedThread)
				end
				if not var6.current then
					local var16 = tick() - currentTime
					
					if not var1 then
						var16 *= -1
					end
					var5.current = math.clamp(var5.current + var16, 0, p2)
				end
			end
			var6.current = false
		end
	end, {
		var1,
		var3,
		p0,
		p1,
		p2
	})
	
	return var3, reactModule.useCallback(function(p7, p8)
		-- upvalues: var6 (ref), var5 (ref), p2 (write), var2 (ref)
		var6.current = p8
		
		if p8 then
			if p7 then
				var5.current = p2
			else
				var5.current = 0
			end
		end
		var2(p7)
	end, { var2 })
end