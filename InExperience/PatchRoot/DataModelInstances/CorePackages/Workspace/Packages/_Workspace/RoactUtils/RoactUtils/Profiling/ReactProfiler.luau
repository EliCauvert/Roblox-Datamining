local reactModule = require(script:FindFirstAncestor("RoactUtils").Parent.React)
local reactProfilerContextModule = require(script.Parent.ReactProfilerContext)
local isReactProfilingEnabledModule = require(script.Parent.isReactProfilingEnabled)
local var1 = reactModule.createContext(nil)

local function ReactProfiler(p1)
	-- upvalues: reactModule (ref), var1 (ref), reactProfilerContextModule (ref)
	local var2 = reactModule.useRef(0)
	local var3 = reactModule.useRef(0)
	local var4 = reactModule.useContext(var1)
	local var5 = reactModule.useContext(reactProfilerContextModule)
	
	return reactModule.createElement(reactModule.Profiler, {
		id = p1.id,
		onRender = reactModule.useCallback(function(p2, _, p3, _, p4, p5)
			-- upvalues: var4 (ref), var2 (ref), var5 (ref)
			if var4 ~= nil then
				var4.exclusiveRenderDurationRef.current -= p3
			end
			var2.current += p3
			
			if var5 ~= nil then
				var5.onRender:fire({
					profilerId = p2,
					startTime = p4,
					commitTime = p5,
					duration = p3,
					exclusiveDuration = var2.current
				})
			end
			var2.current = 0
		end, {}),
		onCommit = reactModule.useCallback(function(p2, _, p3, p4)
			-- upvalues: var4 (ref), var3 (ref), var5 (ref)
			if var4 ~= nil then
				var4.exclusiveEffectDurationRef.current -= p3
			end
			var3.current += p3
			
			if var5 ~= nil then
				var5.onCommit:fire({
					profilerId = p2,
					commitTime = p4,
					duration = p3,
					exclusiveDuration = var3.current
				})
			end
			var3.current = 0
		end, {})
	}, reactModule.createElement(var1.Provider, {
		key = "ExclusiveDurationsContext",
		value = reactModule.useMemo(function()
			-- upvalues: var2 (ref), var3 (ref)
			return {
				exclusiveRenderDurationRef = var2,
				exclusiveEffectDurationRef = var3
			}
		end, {})
	}, p1.children))
end

return function(p1)
	-- upvalues: isReactProfilingEnabledModule (ref), reactModule (ref), ReactProfiler (ref)
	return if isReactProfilingEnabledModule then reactModule.createElement(ReactProfiler, { id = p1.id }, p1.children) else reactModule.createElement(reactModule.Fragment, nil, p1.children)
end