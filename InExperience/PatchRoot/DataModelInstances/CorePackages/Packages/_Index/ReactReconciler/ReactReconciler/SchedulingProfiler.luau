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
	mark = function(p0) --[[ line: 41 ]]
		debug.profilebegin(p0)
		debug.profileend()
	end
}

function formatLanes(p1) --[[ line: 47 ]]
	return tostring(p1)
end

local var3 = nil
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
function t.markCommitStarted(p2) --[[ line: 75 ]]
	-- upvalues: enableSchedulingProfiler (ref), var1 (ref), performance (ref), var3 (write), t_1 (ref)
	if enableSchedulingProfiler then
		if var1 then
			performance.mark("--commit-start-" .. formatLanes(p2))
		end
		if var3 then
			var3(t_1.CommitStart)
		end
	end
end

function t.markCommitStopped(p3) --[[ line: 87 ]]
	-- upvalues: enableSchedulingProfiler (ref), var1 (ref), performance (ref), var3 (write), t_1 (ref)
	if enableSchedulingProfiler then
		if var1 then
			performance.mark("--commit-stop")
		end
		if var3 then
			var3(t_1.CommitStop, p3)
		end
	end
end

local var5 = weakMap.new()
local var6 = 0

function getWakeableID(p4) --[[ line: 105 ]]
	-- upvalues: var5 (ref), var6 (write)
	if not var5:has(p4) then
		var5:set(p4, var6)
		var6 += 1
	end
	return var5:get(p4)
end

function t.markComponentSuspended(p5, p6) --[[ line: 113 ]]
	-- upvalues: enableSchedulingProfiler (ref), var1 (ref), getComponentName (ref), performance (ref)
	if enableSchedulingProfiler and var1 then
		local var7 = getWakeableID(p6)
		local type = getComponentName(p5.type) or "Unknown"
		performance.mark("--suspense-suspend-" .. tostring(var7) .. "-" .. type)
		p6:andThen(function() --[[ line: 122 ]]
			-- upvalues: performance (copy), var7 (ref), type (ref)
			performance.mark("--suspense-resolved-" .. tostring(var7) .. "-" .. type)
		end, function() --[[ line: 126 ]]
			-- upvalues: performance (copy), var7 (ref), type (ref)
			performance.mark("--suspense-rejected-" .. tostring(var7) .. "-" .. type)
		end)
	end
end

function t.markLayoutEffectsStarted(p7) --[[ line: 135 ]]
	-- upvalues: enableSchedulingProfiler (ref), var1 (ref), performance (ref), var3 (write), t_1 (ref)
	if enableSchedulingProfiler then
		if var1 then
			performance.mark("--layout-effects-start-" .. formatLanes(p7))
		end
		if var3 then
			var3(t_1.LayoutEffectsStart)
		end
	end
end

function t.markLayoutEffectsStopped() --[[ line: 147 ]]
	-- upvalues: enableSchedulingProfiler (ref), var1 (ref), performance (ref), var3 (write), t_1 (ref)
	if enableSchedulingProfiler then
		if var1 then
			performance.mark("--layout-effects-stop")
		end
		if var3 then
			var3(t_1.LayoutEffectsStop)
		end
	end
end

function t.markPassiveEffectsStarted(p8) --[[ line: 159 ]]
	-- upvalues: enableSchedulingProfiler (ref), var1 (ref), performance (ref), var3 (write), t_1 (ref)
	if enableSchedulingProfiler then
		if var1 then
			performance.mark("--passive-effects-start-" .. formatLanes(p8))
		end
		if var3 then
			var3(t_1.PassiveEffectsStart)
		end
	end
end

function t.markPassiveEffectsStopped(p9) --[[ line: 171 ]]
	-- upvalues: enableSchedulingProfiler (ref), var1 (ref), performance (ref), var3 (write), t_1 (ref)
	if enableSchedulingProfiler then
		if var1 then
			performance.mark("--passive-effects-stop")
		end
		if var3 then
			var3(t_1.PassiveEffectsStop, p9)
		end
	end
end

function t.markRenderStarted(p10) --[[ line: 183 ]]
	-- upvalues: enableSchedulingProfiler (ref), var1 (ref), performance (ref), var3 (write), t_1 (ref)
	if enableSchedulingProfiler then
		if var1 then
			performance.mark("--render-start-" .. formatLanes(p10))
		end
		if var3 then
			var3(t_1.RenderStart)
		end
	end
end

function t.markRenderYielded() --[[ line: 195 ]]
	-- upvalues: enableSchedulingProfiler (ref), var1 (ref), performance (ref), var3 (write), t_1 (ref)
	if enableSchedulingProfiler then
		if var1 then
			performance.mark("--render-yield")
		end
		if var3 then
			var3(t_1.RenderYield)
		end
	end
end

function t.markRenderStopped() --[[ line: 207 ]]
	-- upvalues: enableSchedulingProfiler (ref), var1 (ref), performance (ref), var3 (write), t_1 (ref)
	if enableSchedulingProfiler then
		if var1 then
			performance.mark("--render-stop")
		end
		if var3 then
			var3(t_1.RenderStop)
		end
	end
end

function t.markRenderScheduled(p11) --[[ line: 219 ]]
	-- upvalues: enableSchedulingProfiler (ref), var1 (ref), performance (ref)
	if enableSchedulingProfiler and var1 then
		performance.mark("--schedule-render-" .. formatLanes(p11))
	end
end

function t.markForceUpdateScheduled(p12, p13) --[[ line: 227 ]]
	-- upvalues: enableSchedulingProfiler (ref), var1 (ref), getComponentName (ref), performance (ref)
	if enableSchedulingProfiler and var1 then
		performance.mark("--schedule-forced-update-" .. formatLanes(p13) .. "-" .. (getComponentName(p12.type) or "Unknown"))
	end
end

function t.markStateUpdateScheduled(p14, p15) --[[ line: 239 ]]
	-- upvalues: enableSchedulingProfiler (ref), var1 (ref), getComponentName (ref), performance (ref)
	if enableSchedulingProfiler and var1 then
		performance.mark("--schedule-state-update-" .. formatLanes(p15) .. "-" .. (getComponentName(p14.type) or "Unknown"))
	end
end

t.profilerEventTypes = t_1

function t.registerProfilerEventCallback(p16) --[[ line: 254 ]]
	-- upvalues: var3 (write)
	if var3 then
		warn("SchedulingProfiler: Another event callback was already registered.")
	end
	var3 = p16
end

return t