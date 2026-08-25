local parent = script.Parent.Parent
local _ = require(script.Parent.ReactInternalTypes)
local reactFeatureFlags = require(parent.Shared).ReactFeatureFlags
local enableProfilerTimer = reactFeatureFlags.enableProfilerTimer
local enableProfilerCommitHooks = reactFeatureFlags.enableProfilerCommitHooks
local profiler = require(script.Parent.ReactWorkTags).Profiler
local unstableNow = require(parent.Scheduler).unstable_now
local var0 = 0
local var1 = -1
local var2 = -1
local var3 = -1

function getCommitTime()
	-- upvalues: var0 (write)
	return var0
end

function recordCommitTime()
	-- upvalues: enableProfilerTimer (ref), var0 (write), unstableNow (ref)
	if enableProfilerTimer then
		var0 = unstableNow()
		
		return
	end
end

function startProfilerTimer(p0)
	-- upvalues: enableProfilerTimer (ref), var2 (write), unstableNow (ref)
	if not enableProfilerTimer then return end
	var2 = unstableNow()
	
	if p0.actualStartTime ~= nil and p0.actualStartTime < 0 then
		p0.actualStartTime = unstableNow()
	end
end

function stopProfilerTimerIfRunning(_)
	-- upvalues: enableProfilerTimer (ref), var2 (write)
	if enableProfilerTimer then
		var2 = -1
		
		return
	end
end

function stopProfilerTimerIfRunningAndRecordDelta(p1, p2)
	-- upvalues: enableProfilerTimer (ref), var2 (write), unstableNow (ref)
	if not enableProfilerTimer then return end
	if var2 >= 0 then
		local var4 = unstableNow() - var2
		p1.actualDuration += var4
		
		if p2 then
			p1.selfBaseDuration = var4
		end
		var2 = -1
	end
end

function recordLayoutEffectDuration(p3)
	-- upvalues: enableProfilerTimer (ref), enableProfilerCommitHooks (ref), var1 (write), unstableNow (ref), profiler (ref)
	if not enableProfilerTimer or not enableProfilerCommitHooks then return end
	if var1 >= 0 then
		local var5 = unstableNow() - var1
		var1 = -1
		local _return = p3.return_
		while _return ~= nil do
			if _return.tag ~= profiler then
				_return = _return.return_
				continue
			end
			_return.stateNode.effectDuration += var5
			
			return
		end
	end
end

function recordPassiveEffectDuration(p4)
	-- upvalues: enableProfilerTimer (ref), enableProfilerCommitHooks (ref), var3 (write), unstableNow (ref), profiler (ref)
	if not enableProfilerTimer or not enableProfilerCommitHooks then return end
	if var3 >= 0 then
		local var6 = unstableNow() - var3
		var3 = -1
		local _return = p4.return_
		while _return ~= nil do
			if _return.tag ~= profiler then
				_return = _return.return_
				continue
			end
			local stateNode = _return.stateNode
			
			if stateNode == nil then break end
			stateNode.passiveEffectDuration += var6
			
			return
		end
	end
end

function startLayoutEffectTimer()
	-- upvalues: enableProfilerTimer (ref), enableProfilerCommitHooks (ref), var1 (write), unstableNow (ref)
	if enableProfilerTimer and enableProfilerCommitHooks then
		var1 = unstableNow()
		
		return
	end
end

function startPassiveEffectTimer()
	-- upvalues: enableProfilerTimer (ref), enableProfilerCommitHooks (ref), var3 (write), unstableNow (ref)
	if enableProfilerTimer and enableProfilerCommitHooks then
		var3 = unstableNow()
		
		return
	end
end

function transferActualDuration(p5)
	local child = p5.child
	while child do
		p5.actualDuration += child.actualDuration
		child = child.sibling
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