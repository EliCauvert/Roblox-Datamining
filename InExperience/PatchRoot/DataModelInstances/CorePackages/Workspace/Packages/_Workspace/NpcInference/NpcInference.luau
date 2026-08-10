local inferenceRunnerModule = require(script.InferenceRunner)

return {
	InferenceRunner = inferenceRunnerModule,
	initialize = function() --[[ line: 8 ]]
		-- upvalues: inferenceRunnerModule (ref)
		inferenceRunnerModule.start()
	end,
	["jest.config"] = script["jest.config"]
}