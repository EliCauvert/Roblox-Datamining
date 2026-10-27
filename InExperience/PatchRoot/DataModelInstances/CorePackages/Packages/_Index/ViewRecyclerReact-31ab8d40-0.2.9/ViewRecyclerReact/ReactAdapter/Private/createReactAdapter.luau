local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local ViewRecyclerModule = require(ViewRecyclerReact.Parent.ViewRecycler)
local ItemHooksModule = require(ViewRecyclerReact.ReactAdapter.ItemHooks)
local RecyclableViewReadinessModule = require(ViewRecyclerReact.ReactAdapter.RecyclableViewReadiness)
local RecyclingScopeModule = require(ViewRecyclerReact.ReactAdapter.RecyclingScope)
local RecyclingViewportModule = require(ViewRecyclerReact.ReactAdapter.RecyclingViewport)
local VirtualListModule = require(ViewRecyclerReact.ReactAdapter.VirtualList)
local CreatePinnedItemModule = require(ViewRecyclerReact.ReactAdapter.createPinnedItem)
local CreateRecyclableComponentModule = require(ViewRecyclerReact.ReactAdapter.createRecyclableComponent)
local CreateRecyclableViewModule = require(ViewRecyclerReact.ReactAdapter.createRecyclableView)

return function(p1)
	-- upvalues: VirtualListModule (copy), RecyclingScopeModule (copy), RecyclingViewportModule (copy), CreatePinnedItemModule (copy), CreateRecyclableComponentModule (copy), CreateRecyclableViewModule (copy), ItemHooksModule (copy), RecyclableViewReadinessModule (copy), ViewRecyclerModule (copy), ViewRecyclerReact (copy)
	return table.freeze({
		VirtualList = VirtualListModule.create(p1),
		RecyclingScope = RecyclingScopeModule.create(p1),
		RecyclingViewport = RecyclingViewportModule.create(p1),
		createPinnedItem = CreatePinnedItemModule,
		createRecyclableComponent = CreateRecyclableComponentModule,
		createRecyclableView = CreateRecyclableViewModule,
		useRecyclingState = ItemHooksModule.useRecyclingState,
		useRecyclingSignal = ItemHooksModule.useRecyclingSignal,
		useRecyclingItem = ItemHooksModule.useRecyclingItem,
		useRecyclingAssignment = ItemHooksModule.useRecyclingAssignment,
		RecyclableViewReadiness = RecyclableViewReadinessModule,
		DataSource = ViewRecyclerModule.DataSource,
		Diagnostics = ViewRecyclerModule.Diagnostics,
		Layout = ViewRecyclerModule.Layout,
		OverscanPolicy = ViewRecyclerModule.OverscanPolicy,
		ChatPreset = ViewRecyclerModule.Adapter.ScrollPolicy.ChatPreset,
		Axis = ViewRecyclerModule.Axis,
		AutoScrollPolicy = ViewRecyclerModule.AutoScrollPolicy,
		AutoScrollTarget = ViewRecyclerModule.AutoScrollTarget,
		ScrollAlignment = ViewRecyclerModule.ScrollAlignment,
		ScrollDirection = ViewRecyclerModule.ScrollDirection,
		ScrollObservationKind = ViewRecyclerModule.ScrollObservationKind,
		PinnedPosition = ViewRecyclerModule.PinnedPosition,
		IdentityKind = ViewRecyclerModule.IdentityKind,
		DataPrefetchEdge = ViewRecyclerModule.DataPrefetchEdge,
		DataSourceChangeType = ViewRecyclerModule.DataSourceChangeType,
		VirtualizerCommandType = ViewRecyclerModule.VirtualizerCommandType,
		VirtualizerEffectType = ViewRecyclerModule.VirtualizerEffectType,
		VirtualizerQueryType = ViewRecyclerModule.VirtualizerQueryType,
		["jest.config"] = ViewRecyclerReact["jest.config"]
	})
end