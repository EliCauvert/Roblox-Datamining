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
	create = function(p1)
		-- upvalues: recyclingScopeModule (ref), createElement (ref), virtualListShellModule (ref), useVirtualListRuntimeModule (ref), useReconciledDataSourceModule (ref), reactModule (ref), recyclingScopeContextModule (ref), recyclableViewRegistryModule (ref)
		local var1 = recyclingScopeModule.create(p1)
		
		local function VirtualListRenderer(p2)
			-- upvalues: createElement (copy), virtualListShellModule (copy), useVirtualListRuntimeModule (copy)
			return createElement(virtualListShellModule, useVirtualListRuntimeModule(p2))
		end
		
		local function DeclarativeVirtualList(p2)
			-- upvalues: useReconciledDataSourceModule (copy), createElement (copy), VirtualListRenderer (ref)
			local var2 = useReconciledDataSourceModule(p2.data.items, p2.data.getItemKey)
			local cloned = table.clone(p2)
			cloned.data = nil
			cloned.dataSource = var2
			
			return createElement(VirtualListRenderer, cloned)
		end
		
		local function DataSourceVirtualList(p2)
			-- upvalues: createElement (copy), VirtualListRenderer (ref)
			local cloned = table.clone(p2)
			cloned.dataSource = p2.data
			cloned.data = nil
			
			return createElement(VirtualListRenderer, cloned)
		end
		
		return function(p2)
			-- upvalues: reactModule (copy), recyclingScopeContextModule (copy), recyclableViewRegistryModule (copy), createElement (copy), DataSourceVirtualList (ref), DeclarativeVirtualList (ref), var1 (ref)
			local var2 = reactModule.useContext(recyclingScopeContextModule)
			local data = p2.data
			assert(data ~= nil, "VirtualList: `data` is required")
			assert(p2.itemType ~= nil, "VirtualList: `itemType` is required")
			
			if not recyclableViewRegistryModule.isRegistered(p2.itemType) then
				assert(type(p2.itemType) == "function", "VirtualList: `itemType` must be a Recyclable view type or selector")
				local var3 = if type(data.getItemCount) == "function" and data.getItemCount() > 0 then data.getItem(1) elseif type(data.items) == "table" then data.items[1] else nil
				
				if var3 ~= nil then
					assert(recyclableViewRegistryModule.isRegistered(p2.itemType(var3, 1)), "VirtualList: `itemType` selector must return a Recyclable view type")
				end
			end
			local var4
			local _ = nil
			
			if type(data) == "table" and type(data.getItemCount) == "function" and (type(data.getItem) == "function" and type(data.getItemKey) == "function") and type(data.subscribe) == "function" then
				var4 = createElement(DataSourceVirtualList, p2)
			else
				assert(type(data) == "table" and (type(data.items) == "table" and type(data.getItemKey) == "function"), "VirtualList: `data` must be a DataSource or { items, getItemKey }")
				var4 = createElement(DeclarativeVirtualList, p2)
			end
			if var2 == nil then
				return createElement(var1, {
					maxPoolSize = p2.maxPoolSize,
					diagnostics = p2.diagnostics
				}, { List = var4 })
			end
			assert(p2.maxPoolSize == nil, "VirtualList: configure maxPoolSize on RecyclingScope")
			
			return var4
		end
	end
}