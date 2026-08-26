local parent = script.Parent.Parent
local _ = require(script.Parent.ReactInternalTypes)
local reactFeatureFlags = require(parent.Shared).ReactFeatureFlags
local enableProfilerTimer = reactFeatureFlags.enableProfilerTimer
local enableProfilerCommitHooks = reactFeatureFlags.enableProfilerCommitHooks
local profiler = require(script.Parent.ReactWorkTags).Profiler
local unstableNow = require(parent.Scheduler).unstable_now
local var1 = 0
local var2 = -1
local var3 = -1
local var4 = -1

function getCommitTime()
	-- upvalues: var1 (write)
	return var1
end

function recordCommitTime()
	-- upvalues: enableProfilerTimer (ref), var1 (write), unstableNow (ref)
	if enableProfilerTimer then
		var1 = unstableNow()
		
		return
	end
end

function startProfilerTimer(p1)
	-- upvalues: enableProfilerTimer (ref), var3 (write), unstableNow (ref)
	if not enableProfilerTimer then return end
	var3 = unstableNow()
	
	if p1.actualStartTime ~= nil and p1.actualStartTime < 0 then
		p1.actualStartTime = unstableNow()
	end
end

function stopProfilerTimerIfRunning(_)
	-- upvalues: enableProfilerTimer (ref), var3 (write)
	if enableProfilerTimer then
		var3 = -1
		
		return
	end
end

function stopProfilerTimerIfRunningAndRecordDelta(p1, p2)
	-- upvalues: enableProfilerTimer (ref), var3 (write), unstableNow (ref)
	if not enableProfilerTimer then return end
	if var3 >= 0 then
		local var5 = unstableNow() - var3
		p1.actualDuration += var5
		
		if p2 then
			p1.selfBaseDuration = var5
		end
		var3 = -1
	end
end

function recordLayoutEffectDuration(p1)
	-- upvalues: enableProfilerTimer (ref), enableProfilerCommitHooks (ref), var2 (write), unstableNow (ref), profiler (ref)
	if not enableProfilerTimer or not enableProfilerCommitHooks then return end
	if var2 >= 0 then
		local var5 = unstableNow() - var2
		var2 = -1
		local _return = p1.return_
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

function recordPassiveEffectDuration(p2)
	-- upvalues: enableProfilerTimer (ref), enableProfilerCommitHooks (ref), var4 (write), unstableNow (ref), profiler (ref)
	if not enableProfilerTimer or not enableProfilerCommitHooks then return end
	if var4 >= 0 then
		local var6 = unstableNow() - var4
		var4 = -1
		local _return = p2.return_
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
	-- upvalues: enableProfilerTimer (ref), enableProfilerCommitHooks (ref), var2 (write), unstableNow (ref)
	if enableProfilerTimer and enableProfilerCommitHooks then
		var2 = unstableNow()
		
		return
	end
end

function startPassiveEffectTimer()
	-- upvalues: enableProfilerTimer (ref), enableProfilerCommitHooks (ref), var4 (write), unstableNow (ref)
	if enableProfilerTimer and enableProfilerCommitHooks then
		var4 = unstableNow()
		
		return
	end
end

function transferActualDuration(p3)
	local child = p3.child
	while child do
		p3.actualDuration += child.actualDuration
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