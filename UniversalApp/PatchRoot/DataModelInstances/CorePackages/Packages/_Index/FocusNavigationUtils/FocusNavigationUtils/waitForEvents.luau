return function() --[[ line: 6 | named "waitForEvents" ]]
	task.defer(coroutine.running())
	coroutine.yield()
end