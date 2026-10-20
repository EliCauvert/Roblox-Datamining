local Parent = script.Parent.Parent
local ReactGlobalsModule = require(Parent.ReactGlobals)
local Array = require(Parent.LuauPolyfill).Array
local _ = require(script.Parent.ReactInternalTypes)
local SchedulerModule = require(Parent.Scheduler)
local ReactFeatureFlags = require(Parent.Shared).ReactFeatureFlags
local DecoupleUpdatePriorityFromScheduler = ReactFeatureFlags.decoupleUpdatePriorityFromScheduler
local InvariantFunction = require(Parent.Shared).invariant
local DescribeError = require(Parent.Shared).describeError
local ReactFiberLaneModule = require(script.Parent.ReactFiberLane)
local SyncLanePriority = ReactFiberLaneModule.SyncLanePriority
local GetCurrentUpdateLanePriorityFunction = ReactFiberLaneModule.getCurrentUpdateLanePriority
local SetCurrentUpdateLanePriorityFunction = ReactFiberLaneModule.setCurrentUpdateLanePriority
local UnstableRunWithPriorityFunction = SchedulerModule.unstable_runWithPriority
local UnstableScheduleCallbackFunction = SchedulerModule.unstable_scheduleCallback
local UnstableCancelCallbackFunction = SchedulerModule.unstable_cancelCallback
local UnstableShouldYield = SchedulerModule.unstable_shouldYield
local UnstableRequestPaint = SchedulerModule.unstable_requestPaint
local UnstableNowFunction = SchedulerModule.unstable_now
local UnstableGetCurrentPriorityLevelFunction = SchedulerModule.unstable_getCurrentPriorityLevel
local UnstableImmediatePriority = SchedulerModule.unstable_ImmediatePriority
local UnstableUserBlockingPriority = SchedulerModule.unstable_UserBlockingPriority
local UnstableNormalPriority = SchedulerModule.unstable_NormalPriority
local UnstableLowPriority = SchedulerModule.unstable_LowPriority
local UnstableIdlePriority = SchedulerModule.unstable_IdlePriority
local ReactFiberSchedulerPrioritiesRobloxModule = require(script.Parent["ReactFiberSchedulerPriorities.roblox"])
local ImmediatePriority = ReactFiberSchedulerPrioritiesRobloxModule.ImmediatePriority
local UserBlockingPriority = ReactFiberSchedulerPrioritiesRobloxModule.UserBlockingPriority
local NormalPriority = ReactFiberSchedulerPrioritiesRobloxModule.NormalPriority
local LowPriority = ReactFiberSchedulerPrioritiesRobloxModule.LowPriority
local IdlePriority = ReactFiberSchedulerPrioritiesRobloxModule.IdlePriority
local NoPriority = ReactFiberSchedulerPrioritiesRobloxModule.NoPriority
local Callback = nil
local t = {}
local UnstableRequestPaint1 = if UnstableRequestPaint == nil then function() end else UnstableRequestPaint
local List = nil
local v1 = nil
local Flag = false
local UnstableNowResult = UnstableNowFunction()

local function now()
	-- upvalues: UnstableNowFunction (copy), UnstableNowResult (copy)
	return UnstableNowFunction() - UnstableNowResult
end

local function getCurrentPriorityLevel()
	-- upvalues: UnstableGetCurrentPriorityLevelFunction (copy), UnstableImmediatePriority (copy), ImmediatePriority (copy), UnstableUserBlockingPriority (copy), UserBlockingPriority (copy), UnstableNormalPriority (copy), NormalPriority (copy), UnstableLowPriority (copy), LowPriority (copy), UnstableIdlePriority (copy), IdlePriority (copy), InvariantFunction (copy), NoPriority (copy)
	local UnstableGetCurrentPriorityLevelResult = UnstableGetCurrentPriorityLevelFunction()
	
	if UnstableGetCurrentPriorityLevelResult == UnstableImmediatePriority then
		return ImmediatePriority
	elseif UnstableGetCurrentPriorityLevelResult == UnstableUserBlockingPriority then
		return UserBlockingPriority
	elseif UnstableGetCurrentPriorityLevelResult == UnstableNormalPriority then
		return NormalPriority
	elseif UnstableGetCurrentPriorityLevelResult == UnstableLowPriority then
		return LowPriority
	elseif UnstableGetCurrentPriorityLevelResult == UnstableIdlePriority then
		return IdlePriority
	else
		InvariantFunction(false, "Unknown priority level.")
		
		return NoPriority
	end
end

function reactPriorityToSchedulerPriority(IdlePriority1)
	-- upvalues: ImmediatePriority (copy), UnstableImmediatePriority (copy), UserBlockingPriority (copy), UnstableUserBlockingPriority (copy), NormalPriority (copy), UnstableNormalPriority (copy), LowPriority (copy), UnstableLowPriority (copy), IdlePriority (copy), UnstableIdlePriority (copy), InvariantFunction (copy)
	if IdlePriority1 == ImmediatePriority then
		return UnstableImmediatePriority
	elseif IdlePriority1 == UserBlockingPriority then
		return UnstableUserBlockingPriority
	elseif IdlePriority1 == NormalPriority then
		return UnstableNormalPriority
	elseif IdlePriority1 == LowPriority then
		return UnstableLowPriority
	elseif IdlePriority1 == IdlePriority then
		return UnstableIdlePriority
	else
		InvariantFunction(false, "Unknown priority level.")
		
		return nil
	end
end

local function runWithPriority(p1, p2)
	-- upvalues: UnstableRunWithPriorityFunction (copy)
	return UnstableRunWithPriorityFunction(reactPriorityToSchedulerPriority(p1), p2)
end

local function scheduleSyncCallback(p1)
	-- upvalues: List (ref), v1 (ref), UnstableScheduleCallbackFunction (copy), UnstableImmediatePriority (copy), Callback (ref), t (copy)
	if List == nil then
		List = { p1 }
		v1 = UnstableScheduleCallbackFunction(UnstableImmediatePriority, Callback)
	else
		table.insert(List, p1)
	end
	return t
end

local function flushSyncCallbackQueue()
	-- upvalues: v1 (ref), UnstableCancelCallbackFunction (copy), Callback (ref)
	if v1 ~= nil then
		local v2 = v1
		v1 = nil
		UnstableCancelCallbackFunction(v2)
	end
	return Callback()
end

Callback = function(): boolean
	-- upvalues: Flag (ref), List (ref), DecoupleUpdatePriorityFromScheduler (copy), GetCurrentUpdateLanePriorityFunction (copy), ReactGlobalsModule (copy), SetCurrentUpdateLanePriorityFunction (copy), SyncLanePriority (copy), runWithPriority (copy), DescribeError (copy), ImmediatePriority (copy), ReactFeatureFlags (copy), UnstableRunWithPriorityFunction (copy), Array (copy), UnstableScheduleCallbackFunction (copy), UnstableImmediatePriority (copy), flushSyncCallbackQueue (copy)
	if Flag or List == nil then
		local Count = false
		
		return Count
	end
	Flag = true
	local Count = 1
	
	if DecoupleUpdatePriorityFromScheduler then
		local CurrentUpdateLanePriority = GetCurrentUpdateLanePriorityFunction()
		local v2 = nil
		local Success = nil
		
		if ReactGlobalsModule.__YOLO__ then
			Success = true
			local SliceResult1 = List
			SetCurrentUpdateLanePriorityFunction(SyncLanePriority)
			local _ = UnstableRunWithPriorityFunction(reactPriorityToSchedulerPriority(ImmediatePriority), function()
				-- upvalues: SliceResult1 (copy), Count (ref)
				for i, Callback in SliceResult1 do
					Count = i
					repeat
						Callback = Callback(true)
					until Callback == nil
					Count += 1
				end
			end)
			List = nil
		else
			local SliceResult = List
			SetCurrentUpdateLanePriorityFunction(SyncLanePriority)
			Success, v40 = xpcall(runWithPriority, DescribeError, ImmediatePriority, function()
				-- upvalues: SliceResult (copy), Count (ref)
				for i, Callback in SliceResult do
					Count = i
					repeat
						Callback = Callback(true)
					until Callback == nil
				end
			end)
			
			if ReactFeatureFlags.keepSyncQueueOnError then
				if Success then
					List = nil
				end
			else
				List = nil
			end
		end
		SetCurrentUpdateLanePriorityFunction(CurrentUpdateLanePriority)
		Flag = false
		
		if not Success then
			if List ~= nil then
				List = Array.slice(List, Count + 1)
			end
			UnstableScheduleCallbackFunction(UnstableImmediatePriority, flushSyncCallbackQueue)
			error(v2)
		end
	else
		local v3 = nil
		local Success1 = nil
		
		if ReactGlobalsModule.__YOLO__ then
			Success1 = true
			local SliceResult3 = List
			local _ = UnstableRunWithPriorityFunction(reactPriorityToSchedulerPriority(ImmediatePriority), function()
				-- upvalues: SliceResult3 (copy), Count (ref)
				for i, Callback in SliceResult3 do
					Count = i
					repeat
						Callback = Callback(true)
					until Callback == nil
				end
			end)
			List = nil
		else
			local SliceResult2 = List
			Success1, v41 = xpcall(runWithPriority, DescribeError, ImmediatePriority, function()
				-- upvalues: SliceResult2 (copy), Count (ref)
				for i, Callback in SliceResult2 do
					Count = i
					repeat
						Callback = Callback(true)
					until Callback == nil
				end
			end)
			
			if ReactFeatureFlags.keepSyncQueueOnError then
				if Success1 then
					List = nil
				end
			else
				List = nil
			end
		end
		Flag = false
		
		if not Success1 then
			if List ~= nil then
				List = Array.slice(List, Count + 1)
			end
			UnstableScheduleCallbackFunction(UnstableImmediatePriority, flushSyncCallbackQueue)
			error(v3)
		end
	end
	return true
end

return {
	ImmediatePriority = ImmediatePriority,
	UserBlockingPriority = UserBlockingPriority,
	NormalPriority = NormalPriority,
	LowPriority = LowPriority,
	IdlePriority = IdlePriority,
	NoPriority = NoPriority,
	getCurrentPriorityLevel = getCurrentPriorityLevel,
	flushSyncCallbackQueue = flushSyncCallbackQueue,
	runWithPriority = runWithPriority,
	scheduleCallback = function(p1, p2, p3)
		-- upvalues: UnstableScheduleCallbackFunction (copy)
		return UnstableScheduleCallbackFunction(reactPriorityToSchedulerPriority(p1), p2, p3)
	end,
	scheduleSyncCallback = scheduleSyncCallback,
	cancelCallback = function(p1)
		-- upvalues: t (copy), UnstableCancelCallbackFunction (copy)
		if p1 ~= t then
			UnstableCancelCallbackFunction(p1)
		end
	end,
	now = now,
	requestPaint = UnstableRequestPaint1,
	shouldYield = UnstableShouldYield
}