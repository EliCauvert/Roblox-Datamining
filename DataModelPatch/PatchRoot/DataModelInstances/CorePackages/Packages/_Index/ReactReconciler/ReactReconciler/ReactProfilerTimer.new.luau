local Parent = script.Parent.Parent
local _ = require(script.Parent.ReactInternalTypes)
local ReactFeatureFlags = require(Parent.Shared).ReactFeatureFlags
local EnableProfilerTimer = ReactFeatureFlags.enableProfilerTimer
local EnableProfilerCommitHooks = ReactFeatureFlags.enableProfilerCommitHooks
local Profiler = require(script.Parent.ReactWorkTags).Profiler
local UnstableNowFunction = require(Parent.Scheduler).unstable_now
local v1 = 0
local v2 = -1
local v3 = -1
local v4 = -1

function getCommitTime()
	-- upvalues: v1 (ref)
	return v1
end

function recordCommitTime()
	-- upvalues: EnableProfilerTimer (copy), v1 (ref), UnstableNowFunction (copy)
	if EnableProfilerTimer then
		v1 = UnstableNowFunction()
		
		return
	end
end

function startProfilerTimer(p1)
	-- upvalues: EnableProfilerTimer (copy), v3 (ref), UnstableNowFunction (copy)
	if not EnableProfilerTimer then return end
	v3 = UnstableNowFunction()
	
	if p1.actualStartTime ~= nil and p1.actualStartTime < 0 then
		p1.actualStartTime = UnstableNowFunction()
	end
end

function stopProfilerTimerIfRunning(_)
	-- upvalues: EnableProfilerTimer (copy), v3 (ref)
	if EnableProfilerTimer then
		v3 = -1
		
		return
	end
end

function stopProfilerTimerIfRunningAndRecordDelta(p1, p2)
	-- upvalues: EnableProfilerTimer (copy), v3 (ref), UnstableNowFunction (copy)
	if not EnableProfilerTimer then return end
	if v3 >= 0 then
		local UnstableNowResultDelta = UnstableNowFunction() - v3
		p1.actualDuration += UnstableNowResultDelta
		
		if p2 then
			p1.selfBaseDuration = UnstableNowResultDelta
		end
		v3 = -1
	end
end

function recordLayoutEffectDuration(p1)
	-- upvalues: EnableProfilerTimer (copy), EnableProfilerCommitHooks (copy), v2 (ref), UnstableNowFunction (copy), Profiler (copy)
	if not EnableProfilerTimer or not EnableProfilerCommitHooks then return end
	if v2 >= 0 then
		local UnstableNowResultDelta = UnstableNowFunction() - v2
		v2 = -1
		local Return = p1.return_
		while Return ~= nil do
			if Return.tag == Profiler then
				local StateNode = Return.stateNode
				StateNode.effectDuration += UnstableNowResultDelta
				break
			end
			Return = Return.return_
		end
	end
end

function recordPassiveEffectDuration(p2)
	-- upvalues: EnableProfilerTimer (copy), EnableProfilerCommitHooks (copy), v4 (ref), UnstableNowFunction (copy), Profiler (copy)
	if not EnableProfilerTimer or not EnableProfilerCommitHooks then return end
	if v4 >= 0 then
		local UnstableNowResultDelta = UnstableNowFunction() - v4
		v4 = -1
		local Return = p2.return_
		while Return ~= nil do
			if Return.tag ~= Profiler then
				Return = Return.return_
				continue
			end
			local StateNode = Return.stateNode
			
			if StateNode == nil then break end
			StateNode.passiveEffectDuration += UnstableNowResultDelta
			break
		end
	end
end

function startLayoutEffectTimer()
	-- upvalues: EnableProfilerTimer (copy), EnableProfilerCommitHooks (copy), v2 (ref), UnstableNowFunction (copy)
	if EnableProfilerTimer and EnableProfilerCommitHooks then
		v2 = UnstableNowFunction()
		
		return
	end
end

function startPassiveEffectTimer()
	-- upvalues: EnableProfilerTimer (copy), EnableProfilerCommitHooks (copy), v4 (ref), UnstableNowFunction (copy)
	if EnableProfilerTimer and EnableProfilerCommitHooks then
		v4 = UnstableNowFunction()
		
		return
	end
end

function transferActualDuration(p3)
	local Child = p3.child
	while Child do
		p3.actualDuration += Child.actualDuration
		Child = Child.sibling
	end
end

return {
	getCommitTime = getCommitTime,
	recordCommitTime = recordCommitTime,
	recordLayoutEffectDuration = recordLayoutEffectDuration,
	recordPassiveEffectDuration = recordPassiveEffectDuration,
	startLayoutEffectTimer = startLayoutEffectTimer,
	startPassiveEffectTimer = startPassiveEffectTimer,
	startProfilerTimer = startProfilerTimer,
	stopProfilerTimerIfRunning = stopProfilerTimerIfRunning,
	stopProfilerTimerIfRunningAndRecordDelta = stopProfilerTimerIfRunningAndRecordDelta,
	transferActualDuration = transferActualDuration
}