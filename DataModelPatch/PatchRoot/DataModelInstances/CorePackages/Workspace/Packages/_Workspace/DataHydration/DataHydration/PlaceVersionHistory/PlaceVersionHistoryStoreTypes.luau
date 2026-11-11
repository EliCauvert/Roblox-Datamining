local _ = require(script:FindFirstAncestor("DataHydration").DataHydrationTypes)

return {
	SaveType = { Null = 0, AutoSave = 1, ManualSave = 2 },
	PublishStatus = { NotPublished = 0, Live = 1, PreviouslyPublished = 2 }
}