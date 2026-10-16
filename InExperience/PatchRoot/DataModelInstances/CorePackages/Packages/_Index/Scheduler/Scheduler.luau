local function _(p1) --[[ Line: 17 | Named "onlyInTestError" ]]
	return function() --[[ Line: 18 ]]
		-- upvalues: p1 (copy)
		error(p1 .. " is only available in tests, not in production")
	end
end

local v1 = require(script.Scheduler)(nil)
local TracingModule = require(script.Tracing)
local TracingSubscriptionsModule = require(script.TracingSubscriptions)

if require(script.Parent.ReactGlobals).__ROACT_17_MOCK_SCHEDULER__ then
	return require(script.unstable_mock)
end
local v2 = "unstable_flushAllWithoutAsserting"

local function Unstable_flushAllWithoutAsserting() --[[ Line: 18 ]]
	-- upvalues: v2 (copy)
	error(v2 .. " is only available in tests, not in production")
end

local v3 = "unstable_flushAll"

local function Unstable_flushAll() --[[ Line: 18 ]]
	-- upvalues: v3 (copy)
	error(v3 .. " is only available in tests, not in production")
end

local v4 = "unstable_flushNumberOfYields"

local function Unstable_flushNumberOfYields() --[[ Line: 18 ]]
	-- upvalues: v4 (copy)
	error(v4 .. " is only available in tests, not in production")
end

local v5 = "unstable_clearYields"

local function Unstable_clearYields() --[[ Line: 18 ]]
	-- upvalues: v5 (copy)
	error(v5 .. " is only available in tests, not in production")
end

local v6 = "unstable_clearYields"

local function Unstable_flushUntilNextPaint() --[[ Line: 18 ]]
	-- upvalues: v6 (copy)
	error(v6 .. " is only available in tests, not in production")
end

local v7 = "unstable_advanceTime"

local function Unstable_advanceTime() --[[ Line: 18 ]]
	-- upvalues: v7 (copy)
	error(v7 .. " is only available in tests, not in production")
end

local v8 = "unstable_flushExpired"

local function Unstable_flushExpired() --[[ Line: 18 ]]
	-- upvalues: v8 (copy)
	error(v8 .. " is only available in tests, not in production")
end

local v9 = "unstable_yieldValue"
local v10 = "unstable_wrap"
local SchedulerModule = {
	unstable_ImmediatePriority = v1.unstable_ImmediatePriority,
	unstable_UserBlockingPriority = v1.unstable_UserBlockingPriority,
	unstable_NormalPriority = v1.unstable_NormalPriority,
	unstable_IdlePriority = v1.unstable_IdlePriority,
	unstable_LowPriority = v1.unstable_LowPriority,
	unstable_runWithPriority = v1.unstable_runWithPriority,
	unstable_next = v1.unstable_next,
	unstable_scheduleCallback = v1.unstable_scheduleCallback,
	unstable_cancelCallback = v1.unstable_cancelCallback,
	unstable_wrapCallback = v1.unstable_wrapCallback,
	unstable_getCurrentPriorityLevel = v1.unstable_getCurrentPriorityLevel,
	unstable_shouldYield = v1.unstable_shouldYield,
	unstable_requestPaint = v1.unstable_requestPaint,
	unstable_continueExecution = v1.unstable_continueExecution,
	unstable_pauseExecution = v1.unstable_pauseExecution,
	unstable_getFirstCallbackNode = v1.unstable_getFirstCallbackNode,
	unstable_now = v1.unstable_now,
	unstable_forceFrameRate = v1.unstable_forceFrameRate,
	unstable_setSchedulerFlags = v1.unstable_setSchedulerFlags,
	unstable_getSchedulerFlags = v1.unstable_getSchedulerFlags,
	unstable_flushAllWithoutAsserting = Unstable_flushAllWithoutAsserting,
	unstable_flushAll = Unstable_flushAll,
	unstable_flushNumberOfYields = Unstable_flushNumberOfYields,
	unstable_clearYields = Unstable_clearYields,
	unstable_flushUntilNextPaint = Unstable_flushUntilNextPaint,
	unstable_advanceTime = Unstable_advanceTime,
	unstable_flushExpired = Unstable_flushExpired,
	unstable_yieldValue = function() --[[ Line: 18 ]]
		-- upvalues: v9 (copy)
		error(v9 .. " is only available in tests, not in production")
	end,
	tracing = {
		unstable_wrap = function() --[[ Line: 18 ]]
			-- upvalues: v10 (copy)
			error(v10 .. " is only available in tests, not in production")
		end,
		__interactionsRef = {},
		__subscriberRef = {}
	}
}

for i, value in TracingModule do
	SchedulerModule.tracing[i] = value
end
for i1, value1 in TracingSubscriptionsModule do
	SchedulerModule.tracing[i1] = value1
end
return SchedulerModule