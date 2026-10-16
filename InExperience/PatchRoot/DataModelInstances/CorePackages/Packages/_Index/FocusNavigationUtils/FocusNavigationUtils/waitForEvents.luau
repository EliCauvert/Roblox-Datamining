return function() --[[ Line: 6 | Named "waitForEvents" ]]
	task.defer(coroutine.running())
	coroutine.yield()
end