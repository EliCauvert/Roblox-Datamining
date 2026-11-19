local ReactModule = require(script:FindFirstAncestor("SocialCarousel").Parent.React)
local Largest = math.max(game:DefineFastInt("SocialCarouselFriendRequestPresencePollInterval", 60), 1)

return function(Callback1, Callback, p1, p2)
	-- upvalues: ReactModule (copy), Largest (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), Callback (copy)
		UseRefResult.current = os.clock()
		Callback()
	end, { Callback })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: Callback1 (copy), UseRefResult (copy), Largest (upval), UseResult (copy)
		if not Callback1() then return end
		local Current = UseRefResult.current
		
		if not Current or os.clock() - Current >= Largest then
			UseResult()
			
			return
		end
	end, { Callback1, UseResult })
	ReactModule.useEffect(function()
		-- upvalues: UseResult1 (copy), UseRefResult (copy), Largest (upval)
		UseResult1()
		local DelayedThread = nil
		
		local function schedulePoll()
			-- upvalues: UseRefResult (upval), Largest (upval), DelayedThread (ref), UseResult1 (upval), schedulePoll (copy)
			local Current = UseRefResult.current
			local LargestDelta: number = if Current then Largest - (os.clock() - Current) else 0
			DelayedThread = task.delay(if LargestDelta > 0 then LargestDelta else Largest, function()
				-- upvalues: UseResult1 (upval), schedulePoll (upval)
				UseResult1()
				schedulePoll()
			end)
		end
		
		schedulePoll()
		
		return function()
			-- upvalues: DelayedThread (ref)
			task.cancel(DelayedThread)
		end
	end, { UseResult1 })
	ReactModule.useEffect(function()
		-- upvalues: Callback1 (copy), UseResult (copy), p1 (copy), p2 (copy), UseResult1 (copy)
		local function onRefreshRequested()
			-- upvalues: Callback1 (upval), UseResult (upval)
			if Callback1() then
				UseResult()
			end
		end
		
		local Connection = if p1 then p1:connect(onRefreshRequested) else nil
		local Connection1 = if p2 then p2:connect(UseResult1) else nil
		
		return function()
			-- upvalues: Connection (copy), Connection1 (copy)
			if Connection then
				Connection:disconnect()
			end
			if Connection1 then
				Connection1:disconnect()
			end
		end
	end, {
		Callback1,
		UseResult,
		UseResult1,
		p1,
		p2
	})
end