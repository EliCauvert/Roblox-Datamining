local t = {}
local Parent = script.Parent.Parent
local WeakMap = require(Parent.LuauPolyfill).WeakMap
local _ = require(script.Parent.ReactFiberLane)
local _ = require(script.Parent.ReactInternalTypes)
local _ = require(Parent.Shared)
local EnableSchedulingProfiler = require(Parent.Shared).ReactFeatureFlags.enableSchedulingProfiler
local ReactVersion = require(Parent.Shared).ReactVersion
local GetComponentNameFunction = require(Parent.Shared).getComponentName
local HasPerformance = _G.performance ~= nil
local Performance = _G.performance or {
	mark = function(p1) --[[ Line: 41 ]]
		debug.profilebegin(p1)
		debug.profileend()
	end
}

function formatLanes(p1): string --[[ Line: 47 ]]
	return (tostring(p1))
end

local Callback = nil
local ProfilerEventTypes = {
	CommitStart = 0,
	CommitStop = 1,
	LayoutEffectsStart = 2,
	LayoutEffectsStop = 3,
	PassiveEffectsStart = 4,
	PassiveEffectsStop = 5,
	RenderStart = 6,
	RenderYield = 7,
	RenderStop = 8
}

if EnableSchedulingProfiler and HasPerformance then
	Performance.mark("--react-init-" .. tostring(ReactVersion))
end
function t.markCommitStarted(p1) --[[ Line: 75 ]]
	-- upvalues: EnableSchedulingProfiler (copy), HasPerformance (copy), Performance (copy), Callback (ref), ProfilerEventTypes (copy)
	if EnableSchedulingProfiler then
		if HasPerformance then
			Performance.mark("--commit-start-" .. formatLanes(p1))
		end
		if Callback then
			Callback(ProfilerEventTypes.CommitStart)
		end
	end
end

function t.markCommitStopped(p1) --[[ Line: 87 ]]
	-- upvalues: EnableSchedulingProfiler (copy), HasPerformance (copy), Performance (copy), Callback (ref), ProfilerEventTypes (copy)
	if EnableSchedulingProfiler then
		if HasPerformance then
			Performance.mark("--commit-stop")
		end
		if Callback then
			Callback(ProfilerEventTypes.CommitStop, p1)
		end
	end
end

local NewWeakMap = WeakMap.new()
local Count = 0

function getWakeableID(p1) --[[ Line: 105 ]]
	-- upvalues: NewWeakMap (copy), Count (ref)
	if not NewWeakMap:has(p1) then
		NewWeakMap:set(p1, Count)
		Count += 1
	end
	return NewWeakMap:get(p1)
end

function t.markComponentSuspended(p1, Promise) --[[ Line: 113 ]]
	-- upvalues: EnableSchedulingProfiler (copy), HasPerformance (copy), GetComponentNameFunction (copy), Performance (copy)
	if EnableSchedulingProfiler and HasPerformance then
		local WakeableID = getWakeableID(Promise)
		local ComponentName = GetComponentNameFunction(p1.type) or "Unknown"
		Performance.mark("--suspense-suspend-" .. tostring(WakeableID) .. "-" .. ComponentName)
		Promise:andThen(function() --[[ Line: 122 ]]
			-- upvalues: Performance (upval), WakeableID (copy), ComponentName (copy)
			Performance.mark("--suspense-resolved-" .. tostring(WakeableID) .. "-" .. ComponentName)
		end, function() --[[ Line: 126 ]]
			-- upvalues: Performance (upval), WakeableID (copy), ComponentName (copy)
			Performance.mark("--suspense-rejected-" .. tostring(WakeableID) .. "-" .. ComponentName)
		end)
	end
end

function t.markLayoutEffectsStarted(p1) --[[ Line: 135 ]]
	-- upvalues: EnableSchedulingProfiler (copy), HasPerformance (copy), Performance (copy), Callback (ref), ProfilerEventTypes (copy)
	if EnableSchedulingProfiler then
		if HasPerformance then
			Performance.mark("--layout-effects-start-" .. formatLanes(p1))
		end
		if Callback then
			Callback(ProfilerEventTypes.LayoutEffectsStart)
		end
	end
end

function t.markLayoutEffectsStopped() --[[ Line: 147 ]]
	-- upvalues: EnableSchedulingProfiler (copy), HasPerformance (copy), Performance (copy), Callback (ref), ProfilerEventTypes (copy)
	if EnableSchedulingProfiler then
		if HasPerformance then
			Performance.mark("--layout-effects-stop")
		end
		if Callback then
			Callback(ProfilerEventTypes.LayoutEffectsStop)
		end
	end
end

function t.markPassiveEffectsStarted(p1) --[[ Line: 159 ]]
	-- upvalues: EnableSchedulingProfiler (copy), HasPerformance (copy), Performance (copy), Callback (ref), ProfilerEventTypes (copy)
	if EnableSchedulingProfiler then
		if HasPerformance then
			Performance.mark("--passive-effects-start-" .. formatLanes(p1))
		end
		if Callback then
			Callback(ProfilerEventTypes.PassiveEffectsStart)
		end
	end
end

function t.markPassiveEffectsStopped(p1) --[[ Line: 171 ]]
	-- upvalues: EnableSchedulingProfiler (copy), HasPerformance (copy), Performance (copy), Callback (ref), ProfilerEventTypes (copy)
	if EnableSchedulingProfiler then
		if HasPerformance then
			Performance.mark("--passive-effects-stop")
		end
		if Callback then
			Callback(ProfilerEventTypes.PassiveEffectsStop, p1)
		end
	end
end

function t.markRenderStarted(p1) --[[ Line: 183 ]]
	-- upvalues: EnableSchedulingProfiler (copy), HasPerformance (copy), Performance (copy), Callback (ref), ProfilerEventTypes (copy)
	if EnableSchedulingProfiler then
		if HasPerformance then
			Performance.mark("--render-start-" .. formatLanes(p1))
		end
		if Callback then
			Callback(ProfilerEventTypes.RenderStart)
		end
	end
end

function t.markRenderYielded() --[[ Line: 195 ]]
	-- upvalues: EnableSchedulingProfiler (copy), HasPerformance (copy), Performance (copy), Callback (ref), ProfilerEventTypes (copy)
	if EnableSchedulingProfiler then
		if HasPerformance then
			Performance.mark("--render-yield")
		end
		if Callback then
			Callback(ProfilerEventTypes.RenderYield)
		end
	end
end

function t.markRenderStopped() --[[ Line: 207 ]]
	-- upvalues: EnableSchedulingProfiler (copy), HasPerformance (copy), Performance (copy), Callback (ref), ProfilerEventTypes (copy)
	if EnableSchedulingProfiler then
		if HasPerformance then
			Performance.mark("--render-stop")
		end
		if Callback then
			Callback(ProfilerEventTypes.RenderStop)
		end
	end
end

function t.markRenderScheduled(p1) --[[ Line: 219 ]]
	-- upvalues: EnableSchedulingProfiler (copy), HasPerformance (copy), Performance (copy)
	if EnableSchedulingProfiler and HasPerformance then
		Performance.mark("--schedule-render-" .. formatLanes(p1))
	end
end

function t.markForceUpdateScheduled(p1, p2) --[[ Line: 227 ]]
	-- upvalues: EnableSchedulingProfiler (copy), HasPerformance (copy), GetComponentNameFunction (copy), Performance (copy)
	if EnableSchedulingProfiler and HasPerformance then
		Performance.mark("--schedule-forced-update-" .. formatLanes(p2) .. "-" .. (GetComponentNameFunction(p1.type) or "Unknown"))
	end
end

function t.markStateUpdateScheduled(p1, p2) --[[ Line: 239 ]]
	-- upvalues: EnableSchedulingProfiler (copy), HasPerformance (copy), GetComponentNameFunction (copy), Performance (copy)
	if EnableSchedulingProfiler and HasPerformance then
		Performance.mark("--schedule-state-update-" .. formatLanes(p2) .. "-" .. (GetComponentNameFunction(p1.type) or "Unknown"))
	end
end

t.profilerEventTypes = ProfilerEventTypes

function t.registerProfilerEventCallback(p1) --[[ Line: 254 ]]
	-- upvalues: Callback (ref)
	if Callback then
		warn("SchedulingProfiler: Another event callback was already registered.")
	end
	Callback = p1
end

return t