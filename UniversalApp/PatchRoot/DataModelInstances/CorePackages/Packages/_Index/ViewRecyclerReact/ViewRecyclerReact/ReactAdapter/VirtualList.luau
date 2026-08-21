local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local viewRecyclerModule = require(viewRecyclerReact.Parent.ViewRecycler)
local _ = viewRecyclerModule.Adapter.ScrollPolicy.AutoScroll
local _ = viewRecyclerModule.Axis
local _ = viewRecyclerModule.Layout
local reactModule = require(viewRecyclerReact.Parent.React)
local recyclableViewRegistryModule = require(viewRecyclerReact.ReactAdapter.Private.RecyclableViewRegistry)
local recyclingScopeContextModule = require(viewRecyclerReact.ReactAdapter.Private.RecyclingScopeContext)
local recyclingScopeModule = require(viewRecyclerReact.ReactAdapter.RecyclingScope)
local _ = require(viewRecyclerReact.ReactAdapter.createPinnedItem)
local _ = viewRecyclerModule.ScrollAlignment
local _ = require(viewRecyclerReact.Parent.Signals)
local _ = viewRecyclerModule.DataSource
local virtualListShellModule = require(viewRecyclerReact.ReactAdapter.Private.VirtualListShell)
local useReconciledDataSourceModule = require(viewRecyclerReact.ReactAdapter.Private.useReconciledDataSource)
local useVirtualListRuntimeModule = require(viewRecyclerReact.ReactAdapter.Private.useVirtualListRuntime)
local createElement = reactModule.createElement

return {
	create = function(p0) --[[ line: 113 ]]
		-- upvalues: recyclingScopeModule (ref), createElement (ref), virtualListShellModule (ref), useVirtualListRuntimeModule (ref), useReconciledDataSourceModule (ref), reactModule (ref), recyclingScopeContextModule (ref), recyclableViewRegistryModule (ref)
		local var9 = recyclingScopeModule.create(p0)
		
		local function VirtualListRenderer(p1) --[[ line: 116 ]]
			-- upvalues: createElement (copy), virtualListShellModule (copy), useVirtualListRuntimeModule (copy)
			return createElement(virtualListShellModule, useVirtualListRuntimeModule(p1))
		end
		
		local function DeclarativeVirtualList(p2) --[[ line: 120 ]]
			-- upvalues: useReconciledDataSourceModule (copy), createElement (copy), VirtualListRenderer (ref)
			local var13 = useReconciledDataSourceModule(p2.data.items, p2.data.getItemKey)
			local cloned = table.clone(p2)
			cloned.data = nil
			cloned.dataSource = var13
			
			return createElement(VirtualListRenderer, cloned)
		end
		
		local function DataSourceVirtualList(p3) --[[ line: 128 ]]
			-- upvalues: createElement (copy), VirtualListRenderer (ref)
			local cloned = table.clone(p3)
			cloned.dataSource = p3.data
			cloned.data = nil
			
			return createElement(VirtualListRenderer, cloned)
		end
		
		return function(p4) --[[ line: 135 | named "VirtualList" ]]
			-- upvalues: reactModule (copy), recyclingScopeContextModule (copy), recyclableViewRegistryModule (copy), createElement (copy), DataSourceVirtualList (ref), DeclarativeVirtualList (ref), var9 (ref)
			local var16 = reactModule.useContext(recyclingScopeContextModule)
			local data = p4.data
			assert(data ~= nil, "VirtualList: `data` is required")
			assert(p4.itemType ~= nil, "VirtualList: `itemType` is required")
			
			if not recyclableViewRegistryModule.isRegistered(p4.itemType) then
				assert(type(p4.itemType) == "function", "VirtualList: `itemType` must be a Recyclable view type or selector")
				local var17 = if type(data.getItemCount) == "function" and data.getItemCount() > 0 then data.getItem(1) elseif type(data.items) == "table" then data.items[1] else nil
				
				if var17 ~= nil then
					assert(recyclableViewRegistryModule.isRegistered(p4.itemType(var17, 1)), "VirtualList: `itemType` selector must return a Recyclable view type")
				end
			end
			local var18
			local _ = nil
			
			if type(data) == "table" and type(data.getItemCount) == "function" and (type(data.getItem) == "function" and type(data.getItemKey) == "function") and type(data.subscribe) == "function" then
				var18 = createElement(DataSourceVirtualList, p4)
			else
				assert(type(data) == "table" and (type(data.items) == "table" and type(data.getItemKey) == "function"), "VirtualList: `data` must be a DataSource or { items, getItemKey }")
				var18 = createElement(DeclarativeVirtualList, p4)
			end
			if var16 == nil then
				return createElement(var9, {
					maxPoolSize = p4.maxPoolSize,
					diagnostics = p4.diagnostics
				}, { List = var18 })
			end
			assert(p4.maxPoolSize == nil, "VirtualList: configure maxPoolSize on RecyclingScope")
			
			return var18
		end
	end
}