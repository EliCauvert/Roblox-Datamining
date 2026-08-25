local reactModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.React)

local function _(p0, p1)
	local var1 = false
	local var2 = false
	local delayedThread = task.delay(p0, function()
		-- upvalues: var1 (write), var2 (write), p1 (ref)
		if not var1 then
			var2 = true
			p1()
		end
	end)
	
	return function()
		-- upvalues: var1 (write), var2 (write), delayedThread (ref)
		var1 = true
		
		if not var2 then
			task.cancel(delayedThread)
		end
	end
end

return {
	CONFIG_LOADING_DELAY_SECONDS = 0.35,
	CONFIG_LOADING_MINIMUM_DISPLAY_SECONDS = 0.5,
	useInExpConfigLoadingSkeleton = function(p2, p3)
		-- upvalues: reactModule (ref)
		local idle, idle_1 = reactModule.useState("idle")
		local var6 = reactModule.useRef(p2)
		local var7 = reactModule.useRef(p3)
		var6.current = p2
		var7.current = p3
		reactModule.useEffect(function()
			-- upvalues: p2 (ref), idle_1 (ref), p3 (ref), idle (ref)
			if not p2 then
				idle_1("idle")
				
				return
			elseif p3 then
				if idle == "idle" then
					idle_1("waiting")
					
					return
				end
			elseif idle == "waiting" or idle == "visible" then
				idle_1("idle")
			end
		end, { p2, p3, idle })
		reactModule.useEffect(function()
			-- upvalues: idle (ref), var6 (ref), var7 (ref), idle_1 (ref)
			local var9, var10
			if idle == "waiting" then
				local var8 = function()
					-- upvalues: var6 (copy), var7 (copy), idle_1 (copy)
					if var6.current and var7.current then
						idle_1("minimum")
						
						return
					end
					idle_1("idle")
				end
				
				var9 = false
				var10 = false
				local delayedThread = task.delay(0.35, function()
					-- upvalues: var9 (write), var10 (write), var8 (ref)
					if not var9 then
						var2 = true
						var8()
					end
				end)
				
				return function()
					-- upvalues: var9 (write), var10 (write), delayedThread (ref)
					var1 = true
					
					if not var10 then
						task.cancel(delayedThread)
					end
				end
			elseif idle == "minimum" then
				local var12 = function()
					-- upvalues: var6 (copy), var7 (copy), idle_1 (copy)
					if var6.current and var7.current then
						idle_1("visible")
						
						return
					end
					idle_1("idle")
				end
				
				var9 = false
				var10 = false
				local delayedThread = task.delay(0.5, function()
					-- upvalues: var9 (write), var10 (write), var12 (ref)
					if not var9 then
						var2 = true
						var12()
					end
				end)
				
				return function()
					-- upvalues: var9 (write), var10 (write), delayedThread (ref)
					var1 = true
					
					if not var10 then
						task.cancel(delayedThread)
					end
				end
			end
			return nil
		end, { idle })
		
		return p2 and (if idle ~= "minimum" then idle == "visible" else true)
	end
}