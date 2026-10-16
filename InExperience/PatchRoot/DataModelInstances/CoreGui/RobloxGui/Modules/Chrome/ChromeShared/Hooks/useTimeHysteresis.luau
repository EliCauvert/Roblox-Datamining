local ReactModule = require(game:GetService("CorePackages").Packages.React)

return function(p1, Current, MaxValue, p2, _) --[[ Line: 32 ]]
	-- upvalues: ReactModule (copy)
	if not MaxValue then
		MaxValue = Current
	end
	local UseStateResult, UseStateResult2 = ReactModule.useState(p2 or false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(p2 or 0)
	local UseRefResult1 = ReactModule.useRef(false)
	ReactModule.useEffect(function() --[[ Line: 48 ]]
		-- upvalues: UseRefResult (copy), UseStateResult2_1 (copy), UseStateResult1 (copy), UseStateResult (copy), Current (copy), p1 (copy), UseRefResult1 (copy), MaxValue (ref)
		local CurrentTime = tick()
		local DelayedThread = nil
		local Flag = false
		
		local function _(Delay: number, p3, Current) --[[ Line: 53 ]]
			-- upvalues: DelayedThread (ref), Flag (ref), UseRefResult (upval), UseStateResult2_1 (upval), UseStateResult1 (upval)
			if Delay > 0 then
				DelayedThread = task.delay(Delay, function() --[[ Line: 55 ]]
					-- upvalues: Flag (upval), DelayedThread (upval), UseRefResult (upval), Current (copy), UseStateResult2_1 (upval), p3 (copy)
					Flag = true
					DelayedThread = nil
					UseRefResult.current = Current
					UseStateResult2_1(p3)
				end)
				
				return
			end
			if UseStateResult1 ~= p3 then
				Flag = true
				UseStateResult2_1(p3)
			end
		end
		
		if UseStateResult then
			local CurrentDelta = Current - UseRefResult.current
			
			if CurrentDelta > 0 then
				local v1 = true
				DelayedThread = task.delay(CurrentDelta, function() --[[ Line: 55 ]]
					-- upvalues: Flag (ref), DelayedThread (ref), UseRefResult (upval), Current (copy), UseStateResult2_1 (upval), v1 (copy)
					Flag = true
					DelayedThread = nil
					UseRefResult.current = Current
					UseStateResult2_1(v1)
				end)
			elseif UseStateResult1 ~= true then
				Flag = true
				UseStateResult2_1(true)
			end
		else
			local CurrentDelta1 = UseRefResult.current - p1
			
			if CurrentDelta1 > 0 then
				local v2 = false
				DelayedThread = task.delay(CurrentDelta1, function() --[[ Line: 55 ]]
					-- upvalues: Flag (ref), DelayedThread (ref), UseRefResult (upval), p1 (copy), UseStateResult2_1 (upval), v2 (copy)
					Flag = true
					DelayedThread = nil
					UseRefResult.current = p1
					UseStateResult2_1(v2)
				end)
			elseif UseStateResult1 ~= false then
				Flag = true
				UseStateResult2_1(false)
			end
		end
		return function() --[[ Line: 74 ]]
			-- upvalues: Flag (ref), DelayedThread (ref), UseRefResult1 (upval), CurrentTime (copy), UseStateResult (copy), UseRefResult (upval), MaxValue (upval)
			if not Flag then
				if DelayedThread then
					task.cancel(DelayedThread)
				end
				if not UseRefResult1.current then
					local Elapsed = tick() - CurrentTime
					
					if not UseStateResult then
						Elapsed *= -1
					end
					UseRefResult.current = math.clamp(UseRefResult.current + Elapsed, 0, MaxValue)
				end
			end
			UseRefResult1.current = false
		end
	end, {
		UseStateResult,
		UseStateResult1,
		p1,
		Current,
		MaxValue
	})
	
	return UseStateResult1, (ReactModule.useCallback(function(p3, Current) --[[ Line: 91 ]]
		-- upvalues: UseRefResult1 (copy), UseRefResult (copy), MaxValue (ref), UseStateResult2 (copy)
		UseRefResult1.current = Current
		
		if Current then
			if p3 then
				UseRefResult.current = MaxValue
			else
				UseRefResult.current = 0
			end
		end
		UseStateResult2(p3)
	end, { UseStateResult2 }))
end