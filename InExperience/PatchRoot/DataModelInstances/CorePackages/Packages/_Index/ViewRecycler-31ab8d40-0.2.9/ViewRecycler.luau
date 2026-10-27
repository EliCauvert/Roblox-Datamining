local _ = require(script.Core.ViewportBehavior.ChatPreset)
local _ = require(script.Core.PinnedItems)
local _ = require(script.Core.Types)

return table.freeze({
	DataSource = require(script.Core.DataSource),
	Diagnostics = require(script.Core.Diagnostics),
	Layout = require(script.Core.Layout),
	OverscanPolicy = require(script.Core.OverscanPolicy),
	Axis = require(script.Core.Enums.Axis),
	AutoScrollPolicy = require(script.Core.Enums.AutoScrollPolicy),
	AutoScrollTarget = require(script.Core.Enums.AutoScrollTarget),
	ScrollAlignment = require(script.Core.Enums.ScrollAlignment),
	ScrollDirection = require(script.Core.Enums.ScrollDirection),
	ScrollObservationKind = require(script.Core.Enums.ScrollObservationKind),
	PinnedPosition = require(script.Core.Enums.PinnedPosition),
	IdentityKind = require(script.Core.Enums.IdentityKind),
	DataPrefetchEdge = require(script.Core.DataPrefetch).Edge,
	DataSourceChangeType = require(script.Core.Enums.DataSourceChangeType),
	VirtualizerCommandType = require(script.Core.Enums.VirtualizerCommandType).External,
	VirtualizerEffectType = require(script.Core.Enums.VirtualizerEffectType),
	VirtualizerQueryType = require(script.Core.Enums.VirtualizerQueryType),
	Adapter = table.freeze({
		createRecyclingScope = require(script.Core.RecyclingScope),
		createVirtualizer = require(script.Core.Virtualizer.Virtualizer),
		ScrollPolicy = require(script.Core.ViewportBehavior),
		_Private = table.freeze({
			batch = require(script.Parent.SignalsExperimental).batch,
			ShallowTable = require(script.Internal.ShallowTable)
		})
	}),
	["jest.config"] = script["jest.config"]
})