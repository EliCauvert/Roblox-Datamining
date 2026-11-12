local FFlagEnableMemoryShellModule = require(script.Flags.FFlagEnableMemoryShell)
local v1 = require(script.createShell)({
	host = game:DefineFastString("DevShellHost", "ws://localhost:5013"),
	enabled = require(script.Flags.FFlagEnableDevShell) or FFlagEnableMemoryShellModule
})

return {
	["jest.config"] = script["jest.config"],
	start = v1.start,
	stop = v1.stop,
	isConnected = v1.isConnected,
	registerMethods = v1.registerMethods,
	FFlagEnableMemoryShell = FFlagEnableMemoryShellModule
}