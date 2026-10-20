local ReactModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.React)

local function _(Delay, p1)
	local v1 = false
	local v2 = false
	local DelayedThread = task.delay(Delay, function()
		-- upvalues: v1 (ref), v2 (ref), p1 (copy)
		if not v1 then
			v2 = true
			p1()
		end
	end)
	
	return function()
		-- upvalues: v1 (ref), v2 (ref), DelayedThread (copy)
		v1 = true
		
		if not v2 then
			task.cancel(DelayedThread)
		end
	end
end

return {
	CONFIG_LOADING_DELAY_SECONDS = 0.35,
	CONFIG_LOADING_MINIMUM_DISPLAY_SECONDS = 0.5,
	useInExpConfigLoadingSkeleton = function(Current, Current1): boolean
		-- upvalues: ReactModule (copy)
		local Idle, Idle2 = ReactModule.useState("idle")
		local UseRefResult = ReactModule.useRef(Current)
		local UseRefResult1 = ReactModule.useRef(Current1)
		UseRefResult.current = Current
		UseRefResult1.current = Current1
		ReactModule.useEffect(function()
			-- upvalues: Current (copy), Idle2 (copy), Current1 (copy), Idle (copy)
			if not Current then
				Idle2("idle")
				
				return
			end
			if Current1 then
				if Idle == "idle" then
					Idle2("waiting")
					
					return
				end
			elseif Idle == "waiting" or Idle == "visible" then
				Idle2("idle")
			end
		end, { Current, Current1, Idle })
		ReactModule.useEffect(function()
			-- upvalues: Idle (copy), UseRefResult (copy), UseRefResult1 (copy), Idle2 (copy)
			if Idle == "waiting" then
				local function v9()
					-- upvalues: UseRefResult (upval), UseRefResult1 (upval), Idle2 (upval)
					if UseRefResult.current and UseRefResult1.current then
						Idle2("minimum")
						
						return
					else
						Idle2("idle")
					end
				end
				
				local Flag = false
				local Flag1 = false
				local DelayedThread = task.delay(0.35, function()
					-- upvalues: Flag (ref), Flag1 (ref), v9 (copy)
					if not Flag then
						Flag1 = true
						v9()
					end
				end)
				
				return function()
					-- upvalues: Flag (ref), Flag1 (ref), DelayedThread (copy)
					Flag = true
					
					if not Flag1 then
						task.cancel(DelayedThread)
					end
				end
			elseif Idle == "minimum" then
				local function v13()
					-- upvalues: UseRefResult (upval), UseRefResult1 (upval), Idle2 (upval)
					if UseRefResult.current and UseRefResult1.current then
						Idle2("visible")
						
						return
					else
						Idle2("idle")
					end
				end
				
				local Flag = false
				local Flag1 = false
				local DelayedThread1 = task.delay(0.5, function()
					-- upvalues: Flag (ref), Flag1 (ref), v13 (copy)
					if not Flag then
						Flag1 = true
						v13()
					end
				end)
				
				return function()
					-- upvalues: Flag (ref), Flag1 (ref), DelayedThread1 (copy)
					Flag = true
					
					if not Flag1 then
						task.cancel(DelayedThread1)
					end
				end
			else
				return nil
			end
		end, { Idle })
		
		return Current and (Idle == "minimum" or Idle == "visible")
	end
}