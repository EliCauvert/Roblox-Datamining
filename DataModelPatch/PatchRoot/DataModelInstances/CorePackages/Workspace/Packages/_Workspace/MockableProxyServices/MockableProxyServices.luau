local MockableProxyServicesModule = {
	["jest.config"] = script["jest.config"],
	game = game,
	waitProxy = function(p1)
		wait(p1)
	end,
	settingsProxy = function()
		return settings()
	end
}
setmetatable(MockableProxyServicesModule, {
	__index = function(_, ServiceName)
		return game:GetService(ServiceName)
	end
})

return MockableProxyServicesModule