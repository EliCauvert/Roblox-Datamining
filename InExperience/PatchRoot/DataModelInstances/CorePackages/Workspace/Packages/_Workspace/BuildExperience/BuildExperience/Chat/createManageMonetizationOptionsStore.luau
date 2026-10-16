local Parent = script:FindFirstAncestor("BuildExperience").Parent
local HttpClientModule = require(Parent.HttpClient)
local MonetizationOptionsModule = require(Parent.DataHydration.MonetizationOptions)
local CreateManageDevProductNetworkModule = require(script.Parent.createManageDevProductNetwork)

return function() --[[ Line: 10 | Named "createManageMonetizationOptionsStore" ]]
	-- upvalues: MonetizationOptionsModule (copy), CreateManageDevProductNetworkModule (copy), HttpClientModule (copy)
	return MonetizationOptionsModule.createMonetizationOptionsStore({
		network = CreateManageDevProductNetworkModule(HttpClientModule.createRequestInternalNetwork(), { label = "MonetizationOptions" })
	})
end