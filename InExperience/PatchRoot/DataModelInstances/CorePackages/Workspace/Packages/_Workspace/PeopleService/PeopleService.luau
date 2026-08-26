local serviceLocatorModule = require(script.ServiceLocator)

return {
	ServiceLocator = serviceLocatorModule,
	getService = function(p1)
		-- upvalues: serviceLocatorModule (ref)
		return serviceLocatorModule.get(p1)
	end,
	setupMockServices = function(value)
		-- upvalues: serviceLocatorModule (ref)
		serviceLocatorModule.clear()
		
		for i, v in pairs(value) do
			serviceLocatorModule.register(i, v)
		end
	end,
	["jest.config"] = script["jest.config"]
}