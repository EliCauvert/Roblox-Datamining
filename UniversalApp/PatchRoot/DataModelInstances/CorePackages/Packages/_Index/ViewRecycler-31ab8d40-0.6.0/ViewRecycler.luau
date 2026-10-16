local _ = require(script.Core.PinnedItems)
local _ = require(script.Core.ViewportBehavior.ReachedThreshold)
local _ = require(script.Core.Types)

return table.freeze({
	DataSource = require(script.Core.DataSource),
	Diagnostics = require(script.Core.Diagnostics),
	Layout = require(script.Core.Layout),
	ChatPreset = require(script.Core.ViewportBehavior.ChatPreset),
	Axis = require(script.Core.Enums.Axis),
	AutoScrollPolicy = require(script.Core.Enums.AutoScrollPolicy),
	AutoScrollTarget = require(script.Core.Enums.AutoScrollTarget),
	ScrollAlignment = require(script.Core.Enums.ScrollAlignment),
	ScrollObservationKind = require(script.Core.Enums.ScrollObservationKind),
	PinnedPosition = require(script.Core.Enums.PinnedPosition),
	IdentityKind = require(script.Core.Enums.IdentityKind),
	DataPrefetchEdge = require(script.Core.DataPrefetch).Edge,
	DataSourceChangeType = require(script.Core.Enums.DataSourceChangeType),
	Adapter = table.freeze({
		createRecyclingScope = require(script.Core.Recycling).createScope,
		createVirtualizer = require(script.Core.Virtualizer.Virtualizer),
		createSlotBinder = require(script.Core.Recycling.SlotBinder),
		_Private = table.freeze({ ShallowTable = require(script.Internal.ShallowTable) })
	}),
	["jest.config"] = script["jest.config"]
})