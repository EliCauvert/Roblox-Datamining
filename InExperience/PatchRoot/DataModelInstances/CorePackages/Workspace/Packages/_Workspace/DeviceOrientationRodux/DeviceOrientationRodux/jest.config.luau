local jestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "DeviceOrientationRodux",
	setupFilesAfterEnv = {
		jestConfigsModule.setupFiles.LogHandler,
		jestConfigsModule.setupFiles.UIBloxInitializer,
		jestConfigsModule.setupFiles.createPromiseRejectionHandler()
	}
}