local TracingModule = require(script.Parent.Tracing)
local TracingSubscriptionsModule = require(script.Parent.TracingSubscriptions)
local SchedulerHostConfigMockModule = require(script.Parent.forks["SchedulerHostConfig.mock"])
local v1 = require(script.Parent.Scheduler)(SchedulerHostConfigMockModule)
local UnstableMockModule = { tracing = {} }

for i, value in v1 do
	UnstableMockModule[i] = value
end
for i1, value1 in TracingModule do
	UnstableMockModule.tracing[i1] = value1
end
for i2, value2 in TracingSubscriptionsModule do
	UnstableMockModule.tracing[i2] = value2
end
UnstableMockModule.unstable_flushAllWithoutAsserting = SchedulerHostConfigMockModule.unstable_flushAllWithoutAsserting
UnstableMockModule.unstable_flushNumberOfYields = SchedulerHostConfigMockModule.unstable_flushNumberOfYields
UnstableMockModule.unstable_flushExpired = SchedulerHostConfigMockModule.unstable_flushExpired
UnstableMockModule.unstable_clearYields = SchedulerHostConfigMockModule.unstable_clearYields
UnstableMockModule.unstable_flushUntilNextPaint = SchedulerHostConfigMockModule.unstable_flushUntilNextPaint
UnstableMockModule.unstable_flushAll = SchedulerHostConfigMockModule.unstable_flushAll
UnstableMockModule.unstable_yieldValue = SchedulerHostConfigMockModule.unstable_yieldValue
UnstableMockModule.unstable_advanceTime = SchedulerHostConfigMockModule.unstable_advanceTime
UnstableMockModule.unstable_Profiling = v1.unstable_Profiling

return UnstableMockModule