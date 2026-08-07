return function() --[[ line: 1 | named "isRunningInStudio" ]]
	return game:GetService("RunService"):IsStudio() and not _G.__TESTEZ_RUNNING_TEST__
end