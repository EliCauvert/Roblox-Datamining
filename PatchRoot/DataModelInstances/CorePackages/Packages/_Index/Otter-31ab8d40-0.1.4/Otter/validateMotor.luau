-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:55 2026 Pacific Standard Time.

return function(p0) --[[ line: 1 | named "validateMotor" ]]
	assert(typeof(p0) == "table")
	assert(typeof(p0.start) == "function")
	assert(typeof(p0.stop) == "function")
	assert(typeof(p0.step) == "function")
	assert(typeof(p0.setGoal) == "function")
	assert(typeof(p0.onStep) == "function")
	assert(typeof(p0.onComplete) == "function")
	assert(typeof(p0.destroy) == "function")
end