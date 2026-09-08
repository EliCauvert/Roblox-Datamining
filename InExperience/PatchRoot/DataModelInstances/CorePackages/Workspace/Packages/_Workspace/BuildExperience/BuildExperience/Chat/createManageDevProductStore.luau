local parent = script:FindFirstAncestor("BuildExperience").Parent
local developerProductModule = require(parent.DataHydration.DeveloperProduct)
local httpClientModule = require(parent.HttpClient)
local createManageDevProductNetworkModule = require(script.Parent.createManageDevProductNetwork)

return function()
	-- upvalues: developerProductModule (ref), createManageDevProductNetworkModule (ref), httpClientModule (ref)
	return developerProductModule.createDeveloperProductStore({
		network = createManageDevProductNetworkModule(httpClientModule.createRequestInternalNetwork())
	})
end