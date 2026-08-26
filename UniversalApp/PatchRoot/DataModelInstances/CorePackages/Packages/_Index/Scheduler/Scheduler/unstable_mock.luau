local tracingModule = require(script.Parent.Tracing)
local tracingSubscriptionsModule = require(script.Parent.TracingSubscriptions)
local unknownModule = require(script.Parent.forks["SchedulerHostConfig.mock"])
local var1 = require(script.Parent.Scheduler)(unknownModule)
local t = { tracing = {} }

for i, v in var1 do
	t[i] = v
end
for i_1, v_1 in tracingModule do
	t.tracing[i_1] = v_1
end
for i_2, v_2 in tracingSubscriptionsModule do
	t.tracing[i_2] = v_2
end
t.unstable_flushAllWithoutAsserting = unknownModule.unstable_flushAllWithoutAsserting
t.unstable_flushNumberOfYields = unknownModule.unstable_flushNumberOfYields
t.unstable_flushExpired = unknownModule.unstable_flushExpired
t.unstable_clearYields = unknownModule.unstable_clearYields
t.unstable_flushUntilNextPaint = unknownModule.unstable_flushUntilNextPaint
t.unstable_flushAll = unknownModule.unstable_flushAll
t.unstable_yieldValue = unknownModule.unstable_yieldValue
t.unstable_advanceTime = unknownModule.unstable_advanceTime
t.unstable_Profiling = var1.unstable_Profiling

return t