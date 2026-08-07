local reactGlobalsModule = require(script.Parent.ReactGlobals)

local function _(p0) --[[ line: 17 | named "onlyInTestError" ]]
	return function() --[[ line: 18 ]]
		-- upvalues: p0 (ref)
		error(p0 .. " is only available in tests, not in production")
	end
end

local var1 = require(script.Scheduler)(nil)
local tracingModule = require(script.Tracing)
local tracingSubscriptionsModule = require(script.TracingSubscriptions)

if reactGlobalsModule.__ROACT_17_MOCK_SCHEDULER__ then
	return require(script.unstable_mock)
end
local t = {
	unstable_ImmediatePriority = var1.unstable_ImmediatePriority,
	unstable_UserBlockingPriority = var1.unstable_UserBlockingPriority,
	unstable_NormalPriority = var1.unstable_NormalPriority,
	unstable_IdlePriority = var1.unstable_IdlePriority,
	unstable_LowPriority = var1.unstable_LowPriority,
	unstable_runWithPriority = var1.unstable_runWithPriority,
	unstable_next = var1.unstable_next,
	unstable_scheduleCallback = var1.unstable_scheduleCallback,
	unstable_cancelCallback = var1.unstable_cancelCallback,
	unstable_wrapCallback = var1.unstable_wrapCallback,
	unstable_getCurrentPriorityLevel = var1.unstable_getCurrentPriorityLevel,
	unstable_shouldYield = var1.unstable_shouldYield,
	unstable_requestPaint = var1.unstable_requestPaint,
	unstable_continueExecution = var1.unstable_continueExecution,
	unstable_pauseExecution = var1.unstable_pauseExecution,
	unstable_getFirstCallbackNode = var1.unstable_getFirstCallbackNode,
	unstable_now = var1.unstable_now,
	unstable_forceFrameRate = var1.unstable_forceFrameRate,
	unstable_setSchedulerFlags = var1.unstable_setSchedulerFlags,
	unstable_getSchedulerFlags = var1.unstable_getSchedulerFlags
}
local var5 = "unstable_flushAllWithoutAsserting"

function t.unstable_flushAllWithoutAsserting() --[[ line: 18 ]]
	-- upvalues: var5 (ref)
	error(var5 .. " is only available in tests, not in production")
end

local var6 = "unstable_flushAll"

function t.unstable_flushAll() --[[ line: 18 ]]
	-- upvalues: var6 (ref)
	error(var6 .. " is only available in tests, not in production")
end

local var7 = "unstable_flushNumberOfYields"

function t.unstable_flushNumberOfYields() --[[ line: 18 ]]
	-- upvalues: var7 (ref)
	error(var7 .. " is only available in tests, not in production")
end

local var8 = "unstable_clearYields"

function t.unstable_clearYields() --[[ line: 18 ]]
	-- upvalues: var8 (ref)
	error(var8 .. " is only available in tests, not in production")
end

local var9 = "unstable_clearYields"

function t.unstable_flushUntilNextPaint() --[[ line: 18 ]]
	-- upvalues: var9 (ref)
	error(var9 .. " is only available in tests, not in production")
end

local var10 = "unstable_advanceTime"

function t.unstable_advanceTime() --[[ line: 18 ]]
	-- upvalues: var10 (ref)
	error(var10 .. " is only available in tests, not in production")
end

local var11 = "unstable_flushExpired"

function t.unstable_flushExpired() --[[ line: 18 ]]
	-- upvalues: var11 (ref)
	error(var11 .. " is only available in tests, not in production")
end

local var12 = "unstable_yieldValue"

function t.unstable_yieldValue() --[[ line: 18 ]]
	-- upvalues: var12 (ref)
	error(var12 .. " is only available in tests, not in production")
end

local t_1 = {}
local var14 = "unstable_wrap"

function t_1.unstable_wrap() --[[ line: 18 ]]
	-- upvalues: var14 (ref)
	error(var14 .. " is only available in tests, not in production")
end

t_1.__interactionsRef = {}
t_1.__subscriberRef = {}
t.tracing = t_1

for i, v in tracingModule do
	t.tracing[i] = v
end
for i_1, v_1 in tracingSubscriptionsModule do
	t.tracing[i_1] = v_1
end
return t