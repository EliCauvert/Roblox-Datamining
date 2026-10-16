local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local _ = require(ViewRecycler.Core.DataPrefetch)
local _ = require(ViewRecycler.Core.DataSource)
local _ = require(ViewRecycler.Core.Diagnostics)
local _ = require(ViewRecycler.Core.Layout)
local _ = require(ViewRecycler.Core.OverscanPolicy)
local _ = require(ViewRecycler.Core.PinnedItems)
local _ = require(ViewRecycler.Core.Placement.PlacementTypes)
local _ = require(ViewRecycler.Core.Enums.ScrollAlignment)
local _ = require(ViewRecycler.Core.Enums.ScrollObservationKind)
local _ = require(ViewRecycler.Core.Types)

return table.freeze({
	CommandType = require(ViewRecycler.Core.Enums.VirtualizerCommandType).External,
	EffectType = require(ViewRecycler.Core.Enums.VirtualizerEffectType),
	QueryType = require(ViewRecycler.Core.Enums.VirtualizerQueryType)
})