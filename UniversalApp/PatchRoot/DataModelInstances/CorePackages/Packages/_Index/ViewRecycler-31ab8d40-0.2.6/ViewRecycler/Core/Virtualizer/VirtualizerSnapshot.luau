local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local _ = require(viewRecycler.Core.DataPrefetch)
local _ = require(viewRecycler.Core.DataSource)
local _ = require(viewRecycler.Core.Diagnostics)
local _ = require(viewRecycler.Core.Layout)
local _ = require(viewRecycler.Core.OverscanPolicy)
local _ = require(viewRecycler.Core.PinnedItems)
local _ = require(viewRecycler.Core.Placement.PlacementTypes)
local _ = require(viewRecycler.Core.Enums.ScrollAlignment)
local _ = require(viewRecycler.Core.Enums.ScrollObservationKind)
local _ = require(viewRecycler.Core.Types)

return table.freeze({
	CommandType = require(viewRecycler.Core.Enums.VirtualizerCommandType).External,
	EffectType = require(viewRecycler.Core.Enums.VirtualizerEffectType),
	QueryType = require(viewRecycler.Core.Enums.VirtualizerQueryType)
})