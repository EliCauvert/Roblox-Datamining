local Parent = script:FindFirstAncestor("BuildExperience").Parent
local GamePassConfigModule = require(Parent.DataHydration.GamePassConfig)
local HttpClientModule = require(Parent.HttpClient)
local CreateManageDevProductNetworkModule = require(script.Parent.createManageDevProductNetwork)

return function()
	-- upvalues: GamePassConfigModule (copy), CreateManageDevProductNetworkModule (copy), HttpClientModule (copy)
	return GamePassConfigModule.createGamePassConfigStore({
		network = CreateManageDevProductNetworkModule(HttpClientModule.createRequestInternalNetwork(), { label = "GamePassConfig" })
	})
end