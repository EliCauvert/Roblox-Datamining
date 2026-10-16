local MockableProxyServicesModule = {
	["jest.config"] = script["jest.config"],
	game = game,
	waitProxy = function(p1) --[[ Line: 4 ]]
		wait(p1)
	end,
	settingsProxy = function() --[[ Line: 7 ]]
		return settings()
	end
}
setmetatable(MockableProxyServicesModule, {
	__index = function(_, ServiceName) --[[ Line: 13 ]]
		return game:GetService(ServiceName)
	end
})

return MockableProxyServicesModule