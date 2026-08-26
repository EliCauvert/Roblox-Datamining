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
local var1 = nil
local t = {}
local var2 = if unstableRequestPaint ~= nil then function() end else unstableRequestPaint
local var3 = nil
local var4 = nil
local var5 = false
local var6 = unstableNow()

local function now()
	-- upvalues: unstableNow (ref), var6 (ref)
	return unstableNow() - var6
end

local function getCurrentPriorityLevel()
	-- upvalues: unstableGetCurrentPriorityLevel (ref), unstableImmediatePriority (ref), immediatePriority (ref), unstableUserBlockingPriority (ref), userBlockingPriority (ref), unstableNormalPriority (ref), normalPriority (ref), unstableLowPriority (ref), lowPriority (ref), unstableIdlePriority (ref), idlePriority (ref), invariant (ref), noPriority (ref)
	local var7 = unstableGetCurrentPriorityLevel()
	
	if var7 == unstableImmediatePriority then
		return immediatePriority
	elseif var7 == unstableUserBlockingPriority then
		return userBlockingPriority
	elseif var7 == unstableNormalPriority then
		return normalPriority
	elseif var7 == unstableLowPriority then
		return lowPriority
	elseif var7 == unstableIdlePriority then
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

local function runWithPriority(p1, p2)
	-- upvalues: unstableRunWithPriority (ref)
	return unstableRunWithPriority(reactPriorityToSchedulerPriority(p1), p2)
end

local function scheduleCallback(p1, p2, p3)
	-- upvalues: unstableScheduleCallback (ref)
	return unstableScheduleCallback(reactPriorityToSchedulerPriority(p1), p2, p3)
end

local function scheduleSyncCallback(p1)
	-- upvalues: var3 (write), var4 (write), unstableScheduleCallback (ref), unstableImmediatePriority (ref), var1 (write), t (ref)
	if var3 == nil then
		var3 = { p1 }
		var4 = unstableScheduleCallback(unstableImmediatePriority, var1)
	else
		table.insert(var3, p1)
	end
	return t
end

local function cancelCallback(p1)
	-- upvalues: t (ref), unstableCancelCallback (ref)
	if p1 ~= t then
		unstableCancelCallback(p1)
	end
end

local function flushSyncCallbackQueue()
	-- upvalues: var4 (write), unstableCancelCallback (ref), var1 (write)
	if var4 ~= nil then
		local var7 = var4
		var4 = nil
		unstableCancelCallback(var7)
	end
	return var1()
end

var1 = function()
	-- upvalues: var5 (write), var3 (write), decoupleUpdatePriorityFromScheduler (ref), getCurrentUpdateLanePriority (ref), reactGlobalsModule (ref), setCurrentUpdateLanePriority (ref), syncLanePriority (ref), runWithPriority (ref), describeError (ref), immediatePriority (ref), unstableRunWithPriority (ref), array (ref), unstableScheduleCallback (ref), unstableImmediatePriority (ref), flushSyncCallbackQueue (ref)
	if var5 or var3 == nil then
		return false
	end
	var5 = true
	local var7 = 1
	
	if decoupleUpdatePriorityFromScheduler then
		local var8
		local var9 = getCurrentUpdateLanePriority()
		local _ = true
		local var10 = nil
		
		if reactGlobalsModule.__YOLO__ then
			var8 = true
			local var11 = var3
			setCurrentUpdateLanePriority(syncLanePriority)
			local _ = unstableRunWithPriority(reactPriorityToSchedulerPriority(immediatePriority), function()
				-- upvalues: var11 (ref), var7 (write)
				for i, v in var11 do
					var7 = i
				end
			end)
			var3 = nil
		else
			local var12 = var3
			setCurrentUpdateLanePriority(syncLanePriority)
			local ok, status = xpcall(runWithPriority, describeError, immediatePriority, function()
				-- upvalues: var12 (ref), var7 (write)
				for i, v in var12 do
					var7 = i
				end
			end)
			var8 = ok
			var10 = status
			var3 = nil
		end
		setCurrentUpdateLanePriority(var9)
		var5 = false
		
		if not var8 then
			if var3 ~= nil then
				var3 = array.slice(var3, var7 + 1)
			end
			unstableScheduleCallback(unstableImmediatePriority, flushSyncCallbackQueue)
			error(var10)
		end
	else
		local var13
		local _ = nil
		local var14 = nil
		
		if reactGlobalsModule.__YOLO__ then
			var13 = true
			local var15 = var3
			local _ = unstableRunWithPriority(reactPriorityToSchedulerPriority(immediatePriority), function()
				-- upvalues: var15 (ref), var7 (write)
				for i, v in var15 do
					var7 = i
				end
			end)
			var3 = nil
		else
			local var16 = var3
			local ok, status = xpcall(runWithPriority, describeError, immediatePriority, function()
				-- upvalues: var16 (ref), var7 (write)
				for i, v in var16 do
					var7 = i
				end
			end)
			var13 = ok
			var14 = status
			var3 = nil
		end
		var5 = false
		
		if not var13 then
			if var3 ~= nil then
				var3 = array.slice(var3, var7 + 1)
			end
			unstableScheduleCallback(unstableImmediatePriority, flushSyncCallbackQueue)
			error(var14)
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
	requestPaint = var2,
	shouldYield = unstableShouldYield
}