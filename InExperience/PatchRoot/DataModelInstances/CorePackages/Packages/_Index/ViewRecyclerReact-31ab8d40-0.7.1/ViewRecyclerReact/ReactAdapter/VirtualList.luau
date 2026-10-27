local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local ViewRecyclerModule = require(ViewRecyclerReact.Parent.ViewRecycler)
local _ = ViewRecyclerModule.Axis
local _ = ViewRecyclerModule.Layout
local ReactModule = require(ViewRecyclerReact.Parent.React)
local RecyclableViewRegistryModule = require(ViewRecyclerReact.ReactAdapter.Private.RecyclableViewRegistry)
local RecyclingScopeContextModule = require(ViewRecyclerReact.ReactAdapter.Private.RecyclingScopeContext)
local RecyclingScopeModule = require(ViewRecyclerReact.ReactAdapter.RecyclingScope)
local _ = require(ViewRecyclerReact.ReactAdapter.createPinnedItem)
local _ = ViewRecyclerModule.ScrollAlignment
local _ = require(ViewRecyclerReact.Parent.Signals)
local _ = ViewRecyclerModule.DataSource
local VirtualListShellModule = require(ViewRecyclerReact.ReactAdapter.Private.VirtualListShell)
local UseReconciledDataSourceModule = require(ViewRecyclerReact.ReactAdapter.Private.useReconciledDataSource)
local UseVirtualListModule = require(ViewRecyclerReact.ReactAdapter.Private.useVirtualList)
local CreateElementFunction = ReactModule.createElement

return {
	create = function(p1)
		-- upvalues: RecyclingScopeModule (copy), UseVirtualListModule (copy), CreateElementFunction (copy), VirtualListShellModule (copy), UseReconciledDataSourceModule (copy), ReactModule (copy), RecyclingScopeContextModule (copy), RecyclableViewRegistryModule (copy)
		local NewRecyclingScope = RecyclingScopeModule.create(p1)
		
		local function VirtualListRenderer(p2)
			-- upvalues: UseVirtualListModule (upval), CreateElementFunction (upval), VirtualListShellModule (upval)
			local UseVirtualListModuleResult = UseVirtualListModule(p2)
			
			return if p2.scrollingFrame == nil then CreateElementFunction(VirtualListShellModule, UseVirtualListModuleResult) else nil
		end
		
		local function DeclarativeVirtualList(Tbl)
			-- upvalues: UseReconciledDataSourceModule (upval), CreateElementFunction (upval), VirtualListRenderer (copy)
			local Copy = table.clone(Tbl)
			Copy.data = nil
			Copy.dataSource = UseReconciledDataSourceModule(Tbl.data.items, Tbl.data.getItemKey)
			
			return CreateElementFunction(VirtualListRenderer, Copy)
		end
		
		local function DataSourceVirtualList(Tbl)
			-- upvalues: CreateElementFunction (upval), VirtualListRenderer (copy)
			local Copy = table.clone(Tbl)
			Copy.dataSource = Tbl.data
			Copy.data = nil
			
			return CreateElementFunction(VirtualListRenderer, Copy)
		end
		
		return function(p2)
			-- upvalues: ReactModule (upval), RecyclingScopeContextModule (upval), RecyclableViewRegistryModule (upval), CreateElementFunction (upval), DataSourceVirtualList (copy), DeclarativeVirtualList (copy), NewRecyclingScope (copy)
			local UseContextResult = ReactModule.useContext(RecyclingScopeContextModule)
			local Data = p2.data
			assert(Data ~= nil, "VirtualList: `data` is required")
			assert(p2.itemType ~= nil, "VirtualList: `itemType` is required")
			
			if not RecyclableViewRegistryModule.isRegistered(p2.itemType) then
				assert(type(p2.itemType) == "function", "VirtualList: `itemType` must be a Recyclable view type or selector")
				local Item = if type(Data.getItemCount) == "function" and Data.getItemCount() > 0 then Data.getItem(1) elseif type(Data.items) == "table" then Data.items[1] else nil
				
				if Item ~= nil then
					assert(RecyclableViewRegistryModule.isRegistered(p2.itemType(Item, 1)), "VirtualList: `itemType` selector must return a Recyclable view type")
				end
			end
			local Element = nil
			if type(Data) == "table" and type(Data.getItemCount) == "function" and type(Data.getItem) == "function" and type(Data.getItemKey) == "function" and type(Data.subscribe) == "function" then
				Element = CreateElementFunction(DataSourceVirtualList, p2)
			else
				assert(type(Data) == "table" and type(Data.items) == "table" and type(Data.getItemKey) == "function", "VirtualList: `data` must be a DataSource or { items, getItemKey }")
				Element = CreateElementFunction(DeclarativeVirtualList, p2)
			end
			if UseContextResult == nil then
				return CreateElementFunction(NewRecyclingScope, {
					maxPoolSize = p2.maxPoolSize,
					diagnostics = p2.diagnostics
				}, { List = Element })
			else
				assert(p2.maxPoolSize == nil, "VirtualList: configure maxPoolSize on RecyclingScope")
				
				return Element
			end
		end
	end
}