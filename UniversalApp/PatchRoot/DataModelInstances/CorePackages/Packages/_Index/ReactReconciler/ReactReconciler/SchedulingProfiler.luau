local t = {}
local parent = script.Parent.Parent
local weakMap = require(parent.LuauPolyfill).WeakMap
local _ = require(script.Parent.ReactFiberLane)
local _ = require(script.Parent.ReactInternalTypes)
local _ = require(parent.Shared)
local enableSchedulingProfiler = require(parent.Shared).ReactFeatureFlags.enableSchedulingProfiler
local reactVersion = require(parent.Shared).ReactVersion
local getComponentName = require(parent.Shared).getComponentName
local var1 = _G.performance ~= nil
local performance = _G.performance or {
	mark = function(p1)
		debug.profilebegin(p1)
		debug.profileend()
	end
}

function formatLanes(p1)
	return tostring(p1)
end

local var2 = nil
local t_1 = {
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

if enableSchedulingProfiler and var1 then
	performance.mark("--react-init-" .. tostring(reactVersion))
end
function t.markCommitStarted(p1)
	-- upvalues: enableSchedulingProfiler (ref), var1 (ref), performance (ref), var2 (write), t_1 (ref)
	if enableSchedulingProfiler then
		if var1 then
			performance.mark("--commit-start-" .. formatLanes(p1))
		end
		if var2 then
			var2(t_1.CommitStart)
		end
	end
end

function t.markCommitStopped(p1)
	-- upvalues: enableSchedulingProfiler (ref), var1 (ref), performance (ref), var2 (write), t_1 (ref)
	if enableSchedulingProfiler then
		if var1 then
			performance.mark("--commit-stop")
		end
		if var2 then
			var2(t_1.CommitStop, p1)
		end
	end
end

local var3 = weakMap.new()
local var4 = 0

function getWakeableID(p1)
	-- upvalues: var3 (ref), var4 (write)
	if not var3:has(p1) then
		var3:set(p1, var4)
		var4 += 1
	end
	return var3:get(p1)
end

function t.markComponentSuspended(p1, p2)
	-- upvalues: enableSchedulingProfiler (ref), var1 (ref), getComponentName (ref), performance (ref)
	if enableSchedulingProfiler and var1 then
		local var5 = getWakeableID(p2)
		local type = getComponentName(p1.type) or "Unknown"
		performance.mark("--suspense-suspend-" .. tostring(var5) .. "-" .. type)
		p2:andThen(function()
			-- upvalues: performance (copy), var5 (ref), type (ref)
			performance.mark("--suspense-resolved-" .. tostring(var5) .. "-" .. type)
		end, function()
			-- upvalues: performance (copy), var5 (ref), type (ref)
			performance.mark("--suspense-rejected-" .. tostring(var5) .. "-" .. type)
		end)
	end
end

function t.markLayoutEffectsStarted(p1)
	-- upvalues: enableSchedulingProfiler (ref), var1 (ref), performance (ref), var2 (write), t_1 (ref)
	if enableSchedulingProfiler then
		if var1 then
			performance.mark("--layout-effects-start-" .. formatLanes(p1))
		end
		if var2 then
			var2(t_1.LayoutEffectsStart)
		end
	end
end

function t.markLayoutEffectsStopped()
	-- upvalues: enableSchedulingProfiler (ref), var1 (ref), performance (ref), var2 (write), t_1 (ref)
	if enableSchedulingProfiler then
		if var1 then
			performance.mark("--layout-effects-stop")
		end
		if var2 then
			var2(t_1.LayoutEffectsStop)
		end
	end
end

function t.markPassiveEffectsStarted(p1)
	-- upvalues: enableSchedulingProfiler (ref), var1 (ref), performance (ref), var2 (write), t_1 (ref)
	if enableSchedulingProfiler then
		if var1 then
			performance.mark("--passive-effects-start-" .. formatLanes(p1))
		end
		if var2 then
			var2(t_1.PassiveEffectsStart)
		end
	end
end

function t.markPassiveEffectsStopped(p1)
	-- upvalues: enableSchedulingProfiler (ref), var1 (ref), performance (ref), var2 (write), t_1 (ref)
	if enableSchedulingProfiler then
		if var1 then
			performance.mark("--passive-effects-stop")
		end
		if var2 then
			var2(t_1.PassiveEffectsStop, p1)
		end
	end
end

function t.markRenderStarted(p1)
	-- upvalues: enableSchedulingProfiler (ref), var1 (ref), performance (ref), var2 (write), t_1 (ref)
	if enableSchedulingProfiler then
		if var1 then
			performance.mark("--render-start-" .. formatLanes(p1))
		end
		if var2 then
			var2(t_1.RenderStart)
		end
	end
end

function t.markRenderYielded()
	-- upvalues: enableSchedulingProfiler (ref), var1 (ref), performance (ref), var2 (write), t_1 (ref)
	if enableSchedulingProfiler then
		if var1 then
			performance.mark("--render-yield")
		end
		if var2 then
			var2(t_1.RenderYield)
		end
	end
end

function t.markRenderStopped()
	-- upvalues: enableSchedulingProfiler (ref), var1 (ref), performance (ref), var2 (write), t_1 (ref)
	if enableSchedulingProfiler then
		if var1 then
			performance.mark("--render-stop")
		end
		if var2 then
			var2(t_1.RenderStop)
		end
	end
end

function t.markRenderScheduled(p1)
	-- upvalues: enableSchedulingProfiler (ref), var1 (ref), performance (ref)
	if enableSchedulingProfiler and var1 then
		performance.mark("--schedule-render-" .. formatLanes(p1))
	end
end

function t.markForceUpdateScheduled(p1, p2)
	-- upvalues: enableSchedulingProfiler (ref), var1 (ref), getComponentName (ref), performance (ref)
	if enableSchedulingProfiler and var1 then
		performance.mark("--schedule-forced-update-" .. formatLanes(p2) .. "-" .. (getComponentName(p1.type) or "Unknown"))
	end
end

function t.markStateUpdateScheduled(p1, p2)
	-- upvalues: enableSchedulingProfiler (ref), var1 (ref), getComponentName (ref), performance (ref)
	if enableSchedulingProfiler and var1 then
		performance.mark("--schedule-state-update-" .. formatLanes(p2) .. "-" .. (getComponentName(p1.type) or "Unknown"))
	end
end

t.profilerEventTypes = t_1

function t.registerProfilerEventCallback(p1)
	-- upvalues: var2 (write)
	if var2 then
		warn("SchedulingProfiler: Another event callback was already registered.")
	end
	var2 = p1
end

return t