local Parent = script:FindFirstAncestor("BuildExperience").Parent
local DeveloperSubscriptionModule = require(Parent.DataHydration.DeveloperSubscription)
local HttpClientModule = require(Parent.HttpClient)
local CreateManageDevProductNetworkModule = require(script.Parent.createManageDevProductNetwork)

return function()
	-- upvalues: DeveloperSubscriptionModule (copy), CreateManageDevProductNetworkModule (copy), HttpClientModule (copy)
	return DeveloperSubscriptionModule.createDeveloperSubscriptionStore({
		network = CreateManageDevProductNetworkModule(HttpClientModule.createRequestInternalNetwork(), { label = "DeveloperSubscription" })
	})
end