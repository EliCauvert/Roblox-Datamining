local reactModule = require(script:FindFirstAncestor("RoactUtils").Parent.React)
local reactProfilerContextModule = require(script.Parent.ReactProfilerContext)
local isReactProfilingEnabledModule = require(script.Parent.isReactProfilingEnabled)
local var3 = reactModule.createContext(nil)

local function ReactProfiler(p0)
	-- upvalues: reactModule (ref), var3 (ref), reactProfilerContextModule (ref)
	local var5 = reactModule.useRef(0)
	local var6 = reactModule.useRef(0)
	local var7 = reactModule.useContext(var3)
	local var8 = reactModule.useContext(reactProfilerContextModule)
	
	return reactModule.createElement(reactModule.Profiler, {
		id = p0.id,
		onRender = reactModule.useCallback(function(p1, _, p2, _, p3, p4)
			-- upvalues: var7 (ref), var5 (ref), var8 (ref)
			if var7 ~= nil then
				var7.exclusiveRenderDurationRef.current -= p2
			end
			var5.current += p2
			
			if var8 ~= nil then
				var8.onRender:fire({
					profilerId = p1,
					startTime = p3,
					commitTime = p4,
					duration = p2,
					exclusiveDuration = var5.current
				})
			end
			var5.current = 0
		end, {}),
		onCommit = reactModule.useCallback(function(p5, _, p6, p7)
			-- upvalues: var7 (ref), var6 (ref), var8 (ref)
			if var7 ~= nil then
				var7.exclusiveEffectDurationRef.current -= p6
			end
			var6.current += p6
			
			if var8 ~= nil then
				var8.onCommit:fire({
					profilerId = p5,
					commitTime = p7,
					duration = p6,
					exclusiveDuration = var6.current
				})
			end
			var6.current = 0
		end, {})
	}, reactModule.createElement(var3.Provider, {
		key = "ExclusiveDurationsContext",
		value = reactModule.useMemo(function()
			-- upvalues: var5 (ref), var6 (ref)
			return {
				exclusiveRenderDurationRef = var5,
				exclusiveEffectDurationRef = var6
			}
		end, {})
	}, p0.children))
end

return function(p8)
	-- upvalues: isReactProfilingEnabledModule (ref), reactModule (ref), ReactProfiler (ref)
	return if isReactProfilingEnabledModule then reactModule.createElement(ReactProfiler, { id = p8.id }, p8.children) else reactModule.createElement(reactModule.Fragment, nil, p8.children)
end