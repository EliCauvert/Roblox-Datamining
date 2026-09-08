local parent = script:FindFirstAncestor("BuildExperience").Parent
local httpClientModule = require(parent.HttpClient)
local monetizationOptionsModule = require(parent.DataHydration.MonetizationOptions)
local createManageDevProductNetworkModule = require(script.Parent.createManageDevProductNetwork)

return function()
	-- upvalues: monetizationOptionsModule (ref), createManageDevProductNetworkModule (ref), httpClientModule (ref)
	return monetizationOptionsModule.createMonetizationOptionsStore({
		network = createManageDevProductNetworkModule(httpClientModule.createRequestInternalNetwork(), { label = "MonetizationOptions" })
	})
end