local autoScrollPolicyModule = require(script.Core.Enums.AutoScrollPolicy)
local autoScrollTargetModule = require(script.Core.Enums.AutoScrollTarget)
local axisModule = require(script.Core.Enums.Axis)
local chatPresetModule = require(script.Core.ViewportBehavior.ChatPreset)
local dataPrefetchModule = require(script.Core.DataPrefetch)
local dataSourceModule = require(script.Core.DataSource)
local dataSourceChangeTypeModule = require(script.Core.Enums.DataSourceChangeType)
local diagnosticsModule = require(script.Core.Diagnostics)
local identityKindModule = require(script.Core.Enums.IdentityKind)
local layoutModule = require(script.Core.Layout)
local _ = require(script.Core.PinnedItems)
local pinnedPositionModule = require(script.Core.Enums.PinnedPosition)
local _ = require(script.Core.ViewportBehavior.ReachedThreshold)
local _ = require(script.Core.Types)

return table.freeze({
	DataSource = dataSourceModule,
	Diagnostics = diagnosticsModule,
	Layout = layoutModule,
	ChatPreset = chatPresetModule,
	Axis = axisModule,
	AutoScrollPolicy = autoScrollPolicyModule,
	AutoScrollTarget = autoScrollTargetModule,
	ScrollAlignment = require(script.Core.Enums.ScrollAlignment),
	ScrollObservationKind = require(script.Core.Enums.ScrollObservationKind),
	PinnedPosition = pinnedPositionModule,
	IdentityKind = identityKindModule,
	DataPrefetchEdge = dataPrefetchModule.Edge,
	DataSourceChangeType = dataSourceChangeTypeModule,
	Adapter = table.freeze({
		createRecyclingScope = require(script.Core.Recycling).createScope,
		createVirtualizer = require(script.Core.Virtualizer.Virtualizer),
		createSlotBinder = require(script.Core.Recycling.SlotBinder),
		_Private = table.freeze({ ShallowTable = require(script.Internal.ShallowTable) })
	}),
	["jest.config"] = script["jest.config"]
})