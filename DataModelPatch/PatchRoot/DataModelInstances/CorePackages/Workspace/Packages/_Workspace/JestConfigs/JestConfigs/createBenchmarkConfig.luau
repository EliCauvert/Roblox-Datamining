local SetupFilesModule = require(script.Parent.setupFiles)
local Frozen = table.freeze({
	testTimeout = 30000,
	testMatch = table.freeze({ "**/*.bench" }),
	setupFilesAfterEnv = table.freeze({
		SetupFilesModule.UIBloxInitializer,
		SetupFilesModule.createPromiseRejectionHandler()
	})
})

return function(DisplayName, List)
	-- upvalues: Frozen (copy)
	assert(type(DisplayName) == "string" and #DisplayName > 0, "displayName is required")
	local config = { displayName = DisplayName }
	
	for i, value in Frozen do
		config[i] = if type(value) == "table" then table.clone(value) else value
	end
	if List then
		for i1, value1 in List do
			config[i1] = value1
		end
	end
	return config
end