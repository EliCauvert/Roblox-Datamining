local Parent = script:FindFirstAncestor("BuildExperience").Parent
local DeveloperProductModule = require(Parent.DataHydration.DeveloperProduct)
local HttpClientModule = require(Parent.HttpClient)
local CreateManageDevProductNetworkModule = require(script.Parent.createManageDevProductNetwork)

return function() --[[ Line: 10 | Named "createManageDevProductStore" ]]
	-- upvalues: DeveloperProductModule (copy), CreateManageDevProductNetworkModule (copy), HttpClientModule (copy)
	return DeveloperProductModule.createDeveloperProductStore({
		network = CreateManageDevProductNetworkModule(HttpClientModule.createRequestInternalNetwork())
	})
end