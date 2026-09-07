local autoScrollPolicyModule = require(script.Core.Enums.AutoScrollPolicy)
local autoScrollTargetModule = require(script.Core.Enums.AutoScrollTarget)
local axisModule = require(script.Core.Enums.Axis)
local _ = require(script.Core.ViewportBehavior.ChatPreset)
local dataPrefetchModule = require(script.Core.DataPrefetch)
local dataSourceModule = require(script.Core.DataSource)
local dataSourceChangeTypeModule = require(script.Core.Enums.DataSourceChangeType)
local diagnosticsModule = require(script.Core.Diagnostics)
local layoutModule = require(script.Core.Layout)
local overscanPolicyModule = require(script.Core.OverscanPolicy)
local _ = require(script.Core.PinnedItems)
local _ = require(script.Core.Types)

return table.freeze({
	DataSource = dataSourceModule,
	Diagnostics = diagnosticsModule,
	Layout = layoutModule,
	OverscanPolicy = overscanPolicyModule,
	Axis = axisModule,
	AutoScrollPolicy = autoScrollPolicyModule,
	AutoScrollTarget = autoScrollTargetModule,
	ScrollAlignment = require(script.Core.Enums.ScrollAlignment),
	ScrollObservationKind = require(script.Core.Enums.ScrollObservationKind),
	DataPrefetchEdge = dataPrefetchModule.Edge,
	DataSourceChangeType = dataSourceChangeTypeModule,
	VirtualizerCommandType = require(script.Core.Enums.VirtualizerCommandType).External,
	VirtualizerEffectType = require(script.Core.Enums.VirtualizerEffectType),
	VirtualizerQueryType = require(script.Core.Enums.VirtualizerQueryType),
	Adapter = table.freeze({
		createRecyclingScope = require(script.Core.RecyclingScope),
		createVirtualizer = require(script.Core.Virtualizer.Virtualizer),
		ScrollPolicy = require(script.Core.ViewportBehavior),
		_Private = table.freeze({
			batch = require(script.Parent.SignalsExperimental).batch,
			Record = require(script.Internal.Record)
		})
	}),
	["jest.config"] = script["jest.config"]
})