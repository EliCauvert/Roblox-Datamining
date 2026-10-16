local MockableProxyServicesModule = require(script.Parent.Parent.MockableProxyServices)

return function() --[[ Line: 12 | Named "readCachedAdConsentRegion" ]]
	-- upvalues: MockableProxyServicesModule (copy)
	return MockableProxyServicesModule.AppStorageService:GetItem("CountryCode")
end