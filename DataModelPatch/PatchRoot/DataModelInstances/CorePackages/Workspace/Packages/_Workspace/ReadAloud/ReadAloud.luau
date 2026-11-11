local ReadAloudManagerModule = require(script.ReadAloudManager)
local ConnectReadAloudToSettingsModule = require(script.ConnectReadAloudToSettings)

return {
	ReadAloudManager = ReadAloudManagerModule,
	ConnectReadAloudToSettings = function()
		-- upvalues: ConnectReadAloudToSettingsModule (copy), ReadAloudManagerModule (copy)
		return ConnectReadAloudToSettingsModule(ReadAloudManagerModule)
	end,
	["jest.config"] = script["jest.config"]
}