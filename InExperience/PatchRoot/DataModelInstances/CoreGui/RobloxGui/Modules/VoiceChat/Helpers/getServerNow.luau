local MockableProxyServicesModule = require(game:GetService("CorePackages").Workspace.Packages.MockableProxyServices)

return function()
	-- upvalues: MockableProxyServicesModule (copy)
	local Success, Result = pcall(function()
		-- upvalues: MockableProxyServicesModule (upval)
		return MockableProxyServicesModule.Workspace:GetServerTimeNow()
	end)
	
	return if Success then Result else DateTime.now().UnixTimestamp
end