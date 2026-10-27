local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local ViewRecyclerModule = require(ViewRecyclerReact.Parent.ViewRecycler)
local ItemHooksModule = require(ViewRecyclerReact.ReactAdapter.ItemHooks)
local LayoutHooksModule = require(ViewRecyclerReact.ReactAdapter.LayoutHooks)
local RecyclableViewReadinessModule = require(ViewRecyclerReact.ReactAdapter.RecyclableViewReadiness)
local RecyclableViewSwitchModule = require(ViewRecyclerReact.ReactAdapter.RecyclableViewSwitch)
local RecyclingScopeModule = require(ViewRecyclerReact.ReactAdapter.RecyclingScope)
local RecyclingViewportModule = require(ViewRecyclerReact.ReactAdapter.RecyclingViewport)
local VirtualListModule = require(ViewRecyclerReact.ReactAdapter.VirtualList)
local CreatePinnedItemModule = require(ViewRecyclerReact.ReactAdapter.createPinnedItem)
local CreateRecyclableComponentModule = require(ViewRecyclerReact.ReactAdapter.createRecyclableComponent)
local CreateRecyclableViewModule = require(ViewRecyclerReact.ReactAdapter.createRecyclableView)
local CreateVirtualListModule = require(ViewRecyclerReact.ReactAdapter.createVirtualList)

return function(p1)
	-- upvalues: VirtualListModule (copy), RecyclingScopeModule (copy), RecyclingViewportModule (copy), CreateVirtualListModule (copy), RecyclableViewSwitchModule (copy), CreatePinnedItemModule (copy), CreateRecyclableComponentModule (copy), CreateRecyclableViewModule (copy), ItemHooksModule (copy), LayoutHooksModule (copy), RecyclableViewReadinessModule (copy), ViewRecyclerModule (copy), ViewRecyclerReact (copy)
	local NewVirtualList = VirtualListModule.create(p1)
	
	return table.freeze({
		VirtualList = NewVirtualList,
		RecyclingScope = RecyclingScopeModule.create(p1),
		RecyclingViewport = RecyclingViewportModule.create(p1),
		RecyclableViewSwitch = RecyclableViewSwitchModule,
		createPinnedItem = CreatePinnedItemModule,
		createRecyclableComponent = CreateRecyclableComponentModule,
		createRecyclableView = CreateRecyclableViewModule,
		createVirtualList = CreateVirtualListModule.create(NewVirtualList),
		useRecyclingState = ItemHooksModule.useRecyclingState,
		useRecyclingSignal = ItemHooksModule.useRecyclingSignal,
		useRecyclingItem = ItemHooksModule.useRecyclingItem,
		useRecyclingAssignment = ItemHooksModule.useRecyclingAssignment,
		useRecyclingIndex = ItemHooksModule.useRecyclingIndex,
		useMeasuredLayout = LayoutHooksModule.useMeasuredLayout,
		useUniformLayout = LayoutHooksModule.useUniformLayout,
		RecyclableViewReadiness = RecyclableViewReadinessModule,
		DataSource = ViewRecyclerModule.DataSource,
		Diagnostics = ViewRecyclerModule.Diagnostics,
		Layout = ViewRecyclerModule.Layout,
		ChatPreset = ViewRecyclerModule.ChatPreset,
		Axis = ViewRecyclerModule.Axis,
		AutoScrollPolicy = ViewRecyclerModule.AutoScrollPolicy,
		ScrollAlignment = ViewRecyclerModule.ScrollAlignment,
		ScrollObservationKind = ViewRecyclerModule.ScrollObservationKind,
		PinnedPosition = ViewRecyclerModule.PinnedPosition,
		IdentityKind = ViewRecyclerModule.IdentityKind,
		DataPrefetchEdge = ViewRecyclerModule.DataPrefetchEdge,
		DataSourceChangeType = ViewRecyclerModule.DataSourceChangeType,
		["jest.config"] = ViewRecyclerReact["jest.config"]
	})
end