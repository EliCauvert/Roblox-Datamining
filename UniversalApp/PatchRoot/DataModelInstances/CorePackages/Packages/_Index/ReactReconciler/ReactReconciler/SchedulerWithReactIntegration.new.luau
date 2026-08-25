local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local array = require(parent.LuauPolyfill).Array
local _ = require(script.Parent.ReactInternalTypes)
local schedulerModule = require(parent.Scheduler)
local decoupleUpdatePriorityFromScheduler = require(parent.Shared).ReactFeatureFlags.decoupleUpdatePriorityFromScheduler
local invariant = require(parent.Shared).invariant
local describeError = require(parent.Shared).describeError
local reactFiberLaneModule = require(script.Parent.ReactFiberLane)
local syncLanePriority = reactFiberLaneModule.SyncLanePriority
local getCurrentUpdateLanePriority = reactFiberLaneModule.getCurrentUpdateLanePriority
local setCurrentUpdateLanePriority = reactFiberLaneModule.setCurrentUpdateLanePriority
local unstableRunWithPriority = schedulerModule.unstable_runWithPriority
local unstableScheduleCallback = schedulerModule.unstable_scheduleCallback
local unstableCancelCallback = schedulerModule.unstable_cancelCallback
local unstableShouldYield = schedulerModule.unstable_shouldYield
local unstableRequestPaint = schedulerModule.unstable_requestPaint
local unstableNow = schedulerModule.unstable_now
local unstableGetCurrentPriorityLevel = schedulerModule.unstable_getCurrentPriorityLevel
local unstableImmediatePriority = schedulerModule.unstable_ImmediatePriority
local unstableUserBlockingPriority = schedulerModule.unstable_UserBlockingPriority
local unstableNormalPriority = schedulerModule.unstable_NormalPriority
local unstableLowPriority = schedulerModule.unstable_LowPriority
local unstableIdlePriority = schedulerModule.unstable_IdlePriority
local unknownModule = require(script.Parent["ReactFiberSchedulerPriorities.roblox"])
local immediatePriority = unknownModule.ImmediatePriority
local userBlockingPriority = unknownModule.UserBlockingPriority
local normalPriority = unknownModule.NormalPriority
local lowPriority = unknownModule.LowPriority
local idlePriority = unknownModule.IdlePriority
local noPriority = unknownModule.NoPriority
local var4 = nil
local t = {}
local var6 = if unstableRequestPaint ~= nil then function() end else unstableRequestPaint
local var7 = nil
local var8 = nil
local var9 = false
local var10 = unstableNow()

local function now()
	-- upvalues: unstableNow (ref), var10 (ref)
	return unstableNow() - var10
end

local function getCurrentPriorityLevel()
	-- upvalues: unstableGetCurrentPriorityLevel (ref), unstableImmediatePriority (ref), immediatePriority (ref), unstableUserBlockingPriority (ref), userBlockingPriority (ref), unstableNormalPriority (ref), normalPriority (ref), unstableLowPriority (ref), lowPriority (ref), unstableIdlePriority (ref), idlePriority (ref), invariant (ref), noPriority (ref)
	local var18 = unstableGetCurrentPriorityLevel()
	
	if var18 == unstableImmediatePriority then
		return immediatePriority
	elseif var18 == unstableUserBlockingPriority then
		return userBlockingPriority
	elseif var18 == unstableNormalPriority then
		return normalPriority
	elseif var18 == unstableLowPriority then
		return lowPriority
	elseif var18 == unstableIdlePriority then
		return idlePriority
	end
	invariant(false, "Unknown priority level.")
	
	return noPriority
end

function reactPriorityToSchedulerPriority(startValue)
	-- upvalues: immediatePriority (ref), unstableImmediatePriority (ref), userBlockingPriority (ref), unstableUserBlockingPriority (ref), normalPriority (ref), unstableNormalPriority (ref), lowPriority (ref), unstableLowPriority (ref), idlePriority (ref), unstableIdlePriority (ref), invariant (ref)
	if startValue == immediatePriority then
		return unstableImmediatePriority
	elseif startValue == userBlockingPriority then
		return unstableUserBlockingPriority
	elseif startValue == normalPriority then
		return unstableNormalPriority
	elseif startValue == lowPriority then
		return unstableLowPriority
	elseif startValue == idlePriority then
		return unstableIdlePriority
	end
	invariant(false, "Unknown priority level.")
	
	return nil
end

local function runWithPriority(p0, p1)
	-- upvalues: unstableRunWithPriority (ref)
	return unstableRunWithPriority(reactPriorityToSchedulerPriority(p0), p1)
end

local function scheduleCallback(p2, p3, p4)
	-- upvalues: unstableScheduleCallback (ref)
	return unstableScheduleCallback(reactPriorityToSchedulerPriority(p2), p3, p4)
end

local function scheduleSyncCallback(p5)
	-- upvalues: var7 (write), var8 (write), unstableScheduleCallback (ref), unstableImmediatePriority (ref), var4 (write), t (ref)
	if var7 == nil then
		var7 = { p5 }
		var8 = unstableScheduleCallback(unstableImmediatePriority, var4)
	else
		table.insert(var7, p5)
	end
	return t
end

local function cancelCallback(p6)
	-- upvalues: t (ref), unstableCancelCallback (ref)
	if p6 ~= t then
		unstableCancelCallback(p6)
	end
end

local function flushSyncCallbackQueue()
	-- upvalues: var8 (write), unstableCancelCallback (ref), var4 (write)
	if var8 ~= nil then
		local var19 = var8
		var8 = nil
		unstableCancelCallback(var19)
	end
	return var4()
end

var4 = function()
	-- upvalues: var9 (write), var7 (write), decoupleUpdatePriorityFromScheduler (ref), getCurrentUpdateLanePriority (ref), reactGlobalsModule (ref), setCurrentUpdateLanePriority (ref), syncLanePriority (ref), runWithPriority (ref), describeError (ref), immediatePriority (ref), unstableRunWithPriority (ref), array (ref), unstableScheduleCallback (ref), unstableImmediatePriority (ref), flushSyncCallbackQueue (ref)
	if var9 or var7 == nil then
		return false
	end
	var9 = true
	local var20 = 1
	
	if decoupleUpdatePriorityFromScheduler then
		local var24
		local var21 = getCurrentUpdateLanePriority()
		local _ = true
		local var22 = nil
		
		if reactGlobalsModule.__YOLO__ then
			var24 = true
			local var25 = var7
			setCurrentUpdateLanePriority(syncLanePriority)
			local _ = unstableRunWithPriority(reactPriorityToSchedulerPriority(immediatePriority), function()
				-- upvalues: var25 (ref), var20 (write)
				for i, v in var25 do
					var20 = i
				end
			end)
			var7 = nil
		else
			local var23 = var7
			setCurrentUpdateLanePriority(syncLanePriority)
			local ok, status = xpcall(runWithPriority, describeError, immediatePriority, function()
				-- upvalues: var23 (ref), var20 (write)
				for i, v in var23 do
					var20 = i
				end
			end)
			var24 = ok
			var22 = status
			var7 = nil
		end
		setCurrentUpdateLanePriority(var21)
		var9 = false
		
		if not var24 then
			if var7 ~= nil then
				var7 = array.slice(var7, var20 + 1)
			end
			unstableScheduleCallback(unstableImmediatePriority, flushSyncCallbackQueue)
			error(var22)
		end
	else
		local var28
		local _ = nil
		local var26 = nil
		
		if reactGlobalsModule.__YOLO__ then
			var28 = true
			local var29 = var7
			local _ = unstableRunWithPriority(reactPriorityToSchedulerPriority(immediatePriority), function()
				-- upvalues: var29 (ref), var20 (write)
				for i, v in var29 do
					var20 = i
				end
			end)
			var7 = nil
		else
			local var27 = var7
			local ok, status = xpcall(runWithPriority, describeError, immediatePriority, function()
				-- upvalues: var27 (ref), var20 (write)
				for i, v in var27 do
					var20 = i
				end
			end)
			var28 = ok
			var26 = status
			var7 = nil
		end
		var9 = false
		
		if not var28 then
			if var7 ~= nil then
				var7 = array.slice(var7, var20 + 1)
			end
			unstableScheduleCallback(unstableImmediatePriority, flushSyncCallbackQueue)
			error(var26)
		end
	end
	return true
end

return {
	ImmediatePriority = immediatePriority,
	UserBlockingPriority = userBlockingPriority,
	NormalPriority = normalPriority,
	LowPriority = lowPriority,
	IdlePriority = idlePriority,
	NoPriority = noPriority,
	getCurrentPriorityLevel = getCurrentPriorityLevel,
	flushSyncCallbackQueue = flushSyncCallbackQueue,
	runWithPriority = runWithPriority,
	scheduleCallback = scheduleCallback,
	scheduleSyncCallback = scheduleSyncCallback,
	cancelCallback = cancelCallback,
	now = now,
	requestPaint = var6,
	shouldYield = unstableShouldYield
}