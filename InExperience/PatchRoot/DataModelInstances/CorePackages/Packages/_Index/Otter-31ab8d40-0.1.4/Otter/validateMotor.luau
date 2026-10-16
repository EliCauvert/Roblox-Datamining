return function(p1) --[[ Line: 1 | Named "validateMotor" ]]
	assert(typeof(p1) == "table")
	assert(typeof(p1.start) == "function")
	assert(typeof(p1.stop) == "function")
	assert(typeof(p1.step) == "function")
	assert(typeof(p1.setGoal) == "function")
	assert(typeof(p1.onStep) == "function")
	assert(typeof(p1.onComplete) == "function")
	assert(typeof(p1.destroy) == "function")
end