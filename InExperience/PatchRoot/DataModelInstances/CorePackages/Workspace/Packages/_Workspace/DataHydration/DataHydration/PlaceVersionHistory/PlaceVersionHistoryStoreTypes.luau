local dataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(dataHydration.DataHydrationTypes)
local _ = require(dataHydration.Parent.Signals)

return {
	SaveType = { Null = 0, AutoSave = 1, ManualSave = 2 },
	PublishStatus = { NotPublished = 0, Live = 1, PreviouslyPublished = 2 }
}