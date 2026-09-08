local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local viewRecyclerModule = require(viewRecyclerReact.Parent.ViewRecycler)
local itemHooksModule = require(viewRecyclerReact.ReactAdapter.ItemHooks)
local recyclableViewReadinessModule = require(viewRecyclerReact.ReactAdapter.RecyclableViewReadiness)
local recyclingScopeModule = require(viewRecyclerReact.ReactAdapter.RecyclingScope)
local recyclingViewportModule = require(viewRecyclerReact.ReactAdapter.RecyclingViewport)
local virtualListModule = require(viewRecyclerReact.ReactAdapter.VirtualList)
local createPinnedItemModule = require(viewRecyclerReact.ReactAdapter.createPinnedItem)
local createRecyclableComponentModule = require(viewRecyclerReact.ReactAdapter.createRecyclableComponent)
local createRecyclableViewModule = require(viewRecyclerReact.ReactAdapter.createRecyclableView)

return function(p1)
	-- upvalues: virtualListModule (ref), recyclingScopeModule (ref), recyclingViewportModule (ref), createPinnedItemModule (ref), createRecyclableComponentModule (ref), createRecyclableViewModule (ref), itemHooksModule (ref), recyclableViewReadinessModule (ref), viewRecyclerModule (ref), viewRecyclerReact (ref)
	return table.freeze({
		VirtualList = virtualListModule.create(p1),
		RecyclingScope = recyclingScopeModule.create(p1),
		RecyclingViewport = recyclingViewportModule.create(p1),
		createPinnedItem = createPinnedItemModule,
		createRecyclableComponent = createRecyclableComponentModule,
		createRecyclableView = createRecyclableViewModule,
		useRecyclingState = itemHooksModule.useRecyclingState,
		useRecyclingSignal = itemHooksModule.useRecyclingSignal,
		useRecyclingItem = itemHooksModule.useRecyclingItem,
		useRecyclingAssignment = itemHooksModule.useRecyclingAssignment,
		RecyclableViewReadiness = recyclableViewReadinessModule,
		DataSource = viewRecyclerModule.DataSource,
		Diagnostics = viewRecyclerModule.Diagnostics,
		Layout = viewRecyclerModule.Layout,
		OverscanPolicy = viewRecyclerModule.OverscanPolicy,
		ChatPreset = viewRecyclerModule.Adapter.ScrollPolicy.ChatPreset,
		Axis = viewRecyclerModule.Axis,
		AutoScrollPolicy = viewRecyclerModule.AutoScrollPolicy,
		AutoScrollTarget = viewRecyclerModule.AutoScrollTarget,
		ScrollAlignment = viewRecyclerModule.ScrollAlignment,
		ScrollDirection = viewRecyclerModule.ScrollDirection,
		ScrollObservationKind = viewRecyclerModule.ScrollObservationKind,
		PinnedPosition = viewRecyclerModule.PinnedPosition,
		IdentityKind = viewRecyclerModule.IdentityKind,
		DataPrefetchEdge = viewRecyclerModule.DataPrefetchEdge,
		DataSourceChangeType = viewRecyclerModule.DataSourceChangeType,
		VirtualizerCommandType = viewRecyclerModule.VirtualizerCommandType,
		VirtualizerEffectType = viewRecyclerModule.VirtualizerEffectType,
		VirtualizerQueryType = viewRecyclerModule.VirtualizerQueryType,
		["jest.config"] = viewRecyclerReact["jest.config"]
	})
end