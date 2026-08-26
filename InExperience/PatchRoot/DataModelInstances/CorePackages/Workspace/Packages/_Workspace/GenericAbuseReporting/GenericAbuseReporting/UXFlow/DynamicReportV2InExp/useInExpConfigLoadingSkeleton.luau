local reactModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.React)

local function _(p1, p2)
	local var1 = false
	local var2 = false
	local delayedThread = task.delay(p1, function()
		-- upvalues: var1 (write), var2 (write), p2 (ref)
		if not var1 then
			var2 = true
			p2()
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
	useInExpConfigLoadingSkeleton = function(p1, p2)
		-- upvalues: reactModule (ref)
		local idle, idle_1 = reactModule.useState("idle")
		local var1 = reactModule.useRef(p1)
		local var2 = reactModule.useRef(p2)
		var1.current = p1
		var2.current = p2
		reactModule.useEffect(function()
			-- upvalues: p1 (ref), idle_1 (ref), p2 (ref), idle (ref)
			if not p1 then
				idle_1("idle")
				
				return
			elseif p2 then
				if idle == "idle" then
					idle_1("waiting")
					
					return
				end
			elseif idle == "waiting" or idle == "visible" then
				idle_1("idle")
			end
		end, { p1, p2, idle })
		reactModule.useEffect(function()
			-- upvalues: idle (ref), var1 (ref), var2 (ref), idle_1 (ref)
			local var3, var4
			if idle == "waiting" then
				local var5 = function()
					-- upvalues: var1 (copy), var2 (copy), idle_1 (copy)
					if var1.current and var2.current then
						idle_1("minimum")
						
						return
					end
					idle_1("idle")
				end
				
				var3 = false
				var4 = false
				local delayedThread = task.delay(0.35, function()
					-- upvalues: var3 (write), var4 (write), var5 (ref)
					if not var3 then
						var2 = true
						var5()
					end
				end)
				
				return function()
					-- upvalues: var3 (write), var4 (write), delayedThread (ref)
					var1 = true
					
					if not var4 then
						task.cancel(delayedThread)
					end
				end
			elseif idle == "minimum" then
				local var6 = function()
					-- upvalues: var1 (copy), var2 (copy), idle_1 (copy)
					if var1.current and var2.current then
						idle_1("visible")
						
						return
					end
					idle_1("idle")
				end
				
				var3 = false
				var4 = false
				local delayedThread = task.delay(0.5, function()
					-- upvalues: var3 (write), var4 (write), var6 (ref)
					if not var3 then
						var2 = true
						var6()
					end
				end)
				
				return function()
					-- upvalues: var3 (write), var4 (write), delayedThread (ref)
					var1 = true
					
					if not var4 then
						task.cancel(delayedThread)
					end
				end
			end
			return nil
		end, { idle })
		
		return p1 and (if idle ~= "minimum" then idle == "visible" else true)
	end
}