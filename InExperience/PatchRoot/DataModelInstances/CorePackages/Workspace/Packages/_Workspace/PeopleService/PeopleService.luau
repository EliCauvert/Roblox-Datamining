local ServiceLocatorModule = require(script.ServiceLocator)

return {
	ServiceLocator = ServiceLocatorModule,
	getService = function(p1)
		-- upvalues: ServiceLocatorModule (copy)
		return ServiceLocatorModule.get(p1)
	end,
	setupMockServices = function(List)
		-- upvalues: ServiceLocatorModule (copy)
		ServiceLocatorModule.clear()
		
		for i, value in pairs(List) do
			ServiceLocatorModule.register(i, value)
		end
	end,
	["jest.config"] = script["jest.config"]
}