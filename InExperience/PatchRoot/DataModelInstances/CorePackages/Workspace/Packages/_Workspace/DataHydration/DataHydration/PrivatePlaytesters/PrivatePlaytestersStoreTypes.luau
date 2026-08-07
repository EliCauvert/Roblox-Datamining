local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local _ = require(dataHydration.DataHydrationTypes)
local _ = require(parent.HttpClient)
local _ = require(parent.Signals)

return {}