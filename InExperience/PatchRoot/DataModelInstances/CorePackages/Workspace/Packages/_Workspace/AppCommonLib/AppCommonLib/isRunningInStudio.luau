return function(): boolean --[[ Line: 1 | Named "isRunningInStudio" ]]
	return game:GetService("RunService"):IsStudio() and not _G.__TESTEZ_RUNNING_TEST__
end