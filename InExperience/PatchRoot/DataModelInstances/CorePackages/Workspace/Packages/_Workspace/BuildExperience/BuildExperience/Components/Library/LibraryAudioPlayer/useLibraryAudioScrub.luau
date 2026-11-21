local Parent = script:FindFirstAncestor("BuildExperience").Parent
local _ = require(Parent.MediaPlayback)
local ReactModule = require(Parent.React)

return function(p1)
	-- upvalues: ReactModule (copy)
	local AudioStore = p1.audioStore
	local Elapsed = p1.elapsed
	local Duration = p1.duration
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(-1)
	local UseRefResult = ReactModule.useRef(false)
	UseRefResult.current = p1.canSeek
	local UseRefResult1 = ReactModule.useRef(Duration)
	UseRefResult1.current = Duration
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), Elapsed (copy), UseBindingResult (copy), Duration (copy)
		return ReactModule.joinBindings({ elapsed = Elapsed, scrub = UseBindingResult }):map(function(p2)
			-- upvalues: Duration (upval)
			return if p2.scrub == -1 then p2.elapsed else p2.scrub * Duration
		end)
	end, { Elapsed, UseBindingResult, Duration })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), Elapsed (copy), UseBindingResult (copy), Duration (copy)
		return ReactModule.joinBindings({ elapsed = Elapsed, scrub = UseBindingResult }):map(function(p2)
			-- upvalues: Duration (upval)
			return if p2.scrub == -1 then if Duration > 0 then math.clamp(p2.elapsed / Duration, 0, 1) else 0 else p2.scrub
		end)
	end, { Elapsed, UseBindingResult, Duration })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UseBindingResult2 (copy), UseMemoResult1 (copy)
		if UseRefResult.current then
			UseBindingResult2(UseMemoResult1:getValue())
		end
	end, { UseMemoResult1 })
	local UseResult1 = ReactModule.useCallback(function(Value: number)
		-- upvalues: UseBindingResult (copy), UseBindingResult2 (copy), UseRefResult (copy), AudioStore (copy), UseRefResult1 (copy)
		local ClampedValue = math.clamp(Value, 0, 1)
		
		if UseBindingResult:getValue() ~= -1 then
			UseBindingResult2(ClampedValue)
			
			return
		end
		if UseRefResult.current then
			AudioStore.seek(ClampedValue * UseRefResult1.current)
		end
	end, { AudioStore, UseBindingResult })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseBindingResult (copy), UseBindingResult2 (copy), UseRefResult (copy), AudioStore (copy), UseRefResult1 (copy)
		local Value = UseBindingResult:getValue()
		UseBindingResult2(-1)
		
		if Value ~= -1 and UseRefResult.current then
			AudioStore.seek(Value * UseRefResult1.current)
		end
	end, { AudioStore, UseBindingResult })
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseBindingResult2 (copy)
		if not p1.canSeek then
			UseBindingResult2(-1)
		end
	end, { p1.canSeek })
	
	return {
		elapsed = UseMemoResult,
		progress = UseMemoResult1,
		onScrubStarted = UseResult,
		onScrub = UseResult1,
		onScrubEnded = UseResult2
	}
end