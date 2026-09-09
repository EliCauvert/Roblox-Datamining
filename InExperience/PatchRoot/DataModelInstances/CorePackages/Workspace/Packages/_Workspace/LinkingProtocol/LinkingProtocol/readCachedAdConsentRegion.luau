local mockableProxyServicesModule = require(script.Parent.Parent.MockableProxyServices)

return function()
	-- upvalues: mockableProxyServicesModule (ref)
	return mockableProxyServicesModule.AppStorageService:GetItem("CountryCode")
end