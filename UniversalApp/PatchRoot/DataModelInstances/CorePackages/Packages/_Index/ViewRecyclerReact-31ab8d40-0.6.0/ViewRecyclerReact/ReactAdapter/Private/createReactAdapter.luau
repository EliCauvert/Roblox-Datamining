local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local viewRecyclerModule = require(viewRecyclerReact.Parent.ViewRecycler)
local itemHooksModule = require(viewRecyclerReact.ReactAdapter.ItemHooks)
local layoutHooksModule = require(viewRecyclerReact.ReactAdapter.LayoutHooks)
local recyclableViewReadinessModule = require(viewRecyclerReact.ReactAdapter.RecyclableViewReadiness)
local recyclingScopeModule = require(viewRecyclerReact.ReactAdapter.RecyclingScope)
local recyclingViewportModule = require(viewRecyclerReact.ReactAdapter.RecyclingViewport)
local virtualListModule = require(viewRecyclerReact.ReactAdapter.VirtualList)
local createPinnedItemModule = require(viewRecyclerReact.ReactAdapter.createPinnedItem)
local createRecyclableComponentModule = require(viewRecyclerReact.ReactAdapter.createRecyclableComponent)
local createRecyclableViewModule = require(viewRecyclerReact.ReactAdapter.createRecyclableView)
local createVirtualListModule = require(viewRecyclerReact.ReactAdapter.createVirtualList)

return function(p1)
	-- upvalues: virtualListModule (ref), recyclingScopeModule (ref), recyclingViewportModule (ref), createVirtualListModule (ref), createPinnedItemModule (ref), createRecyclableComponentModule (ref), createRecyclableViewModule (ref), itemHooksModule (ref), layoutHooksModule (ref), recyclableViewReadinessModule (ref), viewRecyclerModule (ref), viewRecyclerReact (ref)
	local var1 = virtualListModule.create(p1)
	
	return table.freeze({
		VirtualList = var1,
		RecyclingScope = recyclingScopeModule.create(p1),
		RecyclingViewport = recyclingViewportModule.create(p1),
		createPinnedItem = createPinnedItemModule,
		createRecyclableComponent = createRecyclableComponentModule,
		createRecyclableView = createRecyclableViewModule,
		createVirtualList = createVirtualListModule.create(var1),
		useRecyclingState = itemHooksModule.useRecyclingState,
		useRecyclingSignal = itemHooksModule.useRecyclingSignal,
		useRecyclingItem = itemHooksModule.useRecyclingItem,
		useRecyclingAssignment = itemHooksModule.useRecyclingAssignment,
		useRecyclingIndex = itemHooksModule.useRecyclingIndex,
		useMeasuredLayout = layoutHooksModule.useMeasuredLayout,
		useUniformLayout = layoutHooksModule.useUniformLayout,
		RecyclableViewReadiness = recyclableViewReadinessModule,
		DataSource = viewRecyclerModule.DataSource,
		Diagnostics = viewRecyclerModule.Diagnostics,
		Layout = viewRecyclerModule.Layout,
		ChatPreset = viewRecyclerModule.ChatPreset,
		Axis = viewRecyclerModule.Axis,
		AutoScrollPolicy = viewRecyclerModule.AutoScrollPolicy,
		AutoScrollTarget = viewRecyclerModule.AutoScrollTarget,
		ScrollAlignment = viewRecyclerModule.ScrollAlignment,
		ScrollObservationKind = viewRecyclerModule.ScrollObservationKind,
		PinnedPosition = viewRecyclerModule.PinnedPosition,
		IdentityKind = viewRecyclerModule.IdentityKind,
		DataPrefetchEdge = viewRecyclerModule.DataPrefetchEdge,
		DataSourceChangeType = viewRecyclerModule.DataSourceChangeType,
		["jest.config"] = viewRecyclerReact["jest.config"]
	})
end