local ReactModule = require(script:FindFirstAncestor("RoactUtils").Parent.React)
local ReactProfilerContextModule = require(script.Parent.ReactProfilerContext)
local IsReactProfilingEnabledModule = require(script.Parent.isReactProfilingEnabled)
local Context = ReactModule.createContext(nil)

local function ReactProfiler(p1)
	-- upvalues: ReactModule (copy), Context (copy), ReactProfilerContextModule (copy)
	local UseRefResult = ReactModule.useRef(0)
	local UseRefResult1 = ReactModule.useRef(0)
	local UseContextResult = ReactModule.useContext(Context)
	local UseContextResult1 = ReactModule.useContext(ReactProfilerContextModule)
	
	return ReactModule.createElement(ReactModule.Profiler, {
		id = p1.id,
		onRender = ReactModule.useCallback(function(ProfilerId, _, Duration, _, StartTime, CommitTime)
			-- upvalues: UseContextResult (copy), UseRefResult (copy), UseContextResult1 (copy)
			if UseContextResult ~= nil then
				local ExclusiveRenderDurationRef = UseContextResult.exclusiveRenderDurationRef
				ExclusiveRenderDurationRef.current -= Duration
			end
			UseRefResult.current += Duration
			
			if UseContextResult1 ~= nil then
				UseContextResult1.onRender:fire({
					profilerId = ProfilerId,
					startTime = StartTime,
					commitTime = CommitTime,
					duration = Duration,
					exclusiveDuration = UseRefResult.current
				})
			end
			UseRefResult.current = 0
		end, {}),
		onCommit = ReactModule.useCallback(function(ProfilerId, _, Duration, CommitTime)
			-- upvalues: UseContextResult (copy), UseRefResult1 (copy), UseContextResult1 (copy)
			if UseContextResult ~= nil then
				local ExclusiveEffectDurationRef = UseContextResult.exclusiveEffectDurationRef
				ExclusiveEffectDurationRef.current -= Duration
			end
			UseRefResult1.current += Duration
			
			if UseContextResult1 ~= nil then
				UseContextResult1.onCommit:fire({
					profilerId = ProfilerId,
					commitTime = CommitTime,
					duration = Duration,
					exclusiveDuration = UseRefResult1.current
				})
			end
			UseRefResult1.current = 0
		end, {})
	}, ReactModule.createElement(Context.Provider, {
		key = "ExclusiveDurationsContext",
		value = ReactModule.useMemo(function()
			-- upvalues: UseRefResult (copy), UseRefResult1 (copy)
			return {
				exclusiveRenderDurationRef = UseRefResult,
				exclusiveEffectDurationRef = UseRefResult1
			}
		end, {})
	}, p1.children))
end

return function(p1)
	-- upvalues: IsReactProfilingEnabledModule (copy), ReactModule (copy), ReactProfiler (copy)
	return if IsReactProfilingEnabledModule then ReactModule.createElement(ReactProfiler, { id = p1.id }, p1.children) else ReactModule.createElement(ReactModule.Fragment, nil, p1.children)
end