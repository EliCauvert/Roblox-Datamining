local MockableProxyServicesModule = require(script.Parent.Parent.MockableProxyServices)

return function()
	-- upvalues: MockableProxyServicesModule (copy)
	return MockableProxyServicesModule.AppStorageService:GetItem("CountryCode")
end