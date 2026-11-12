local FFlagViewRecyclerReact084 = require(script:FindFirstAncestor("ViewRecyclerReact").Flags).FFlagViewRecyclerReact084
local FFlagViewRecyclerReact08 = require(script:FindFirstAncestor("ViewRecyclerReact").Flags).FFlagViewRecyclerReact08
local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local _ = require(ViewRecyclerReact.Parent.ViewRecycler)
local _ = require(ViewRecyclerReact.Parent.ViewRecyclerRoblox)
local ReactModule = require(ViewRecyclerReact.Parent.React)
local RecyclableViewRegistryModule = require(ViewRecyclerReact.ReactAdapter.Private.RecyclableViewRegistry)
local RecyclingScopeContextModule = require(ViewRecyclerReact.ReactAdapter.Private.RecyclingScopeContext)
local RecyclingScopeModule = require(ViewRecyclerReact.ReactAdapter.RecyclingScope)
local _ = require(ViewRecyclerReact.Parent.Signals)
local VirtualListShellModule = require(ViewRecyclerReact.ReactAdapter.Private.VirtualListShell)
local _ = require(ViewRecyclerReact.ReactAdapter.createPinnedItem)
local UseReconciledDataSourceModule = require(ViewRecyclerReact.ReactAdapter.Private.useReconciledDataSource)
local UseVirtualListModule = require(ViewRecyclerReact.ReactAdapter.Private.useVirtualList)
local CreateElementFunction = ReactModule.createElement

return {
	create = function(p1)
		-- upvalues: RecyclingScopeModule (copy), UseVirtualListModule (copy), CreateElementFunction (copy), VirtualListShellModule (copy), FFlagViewRecyclerReact084 (copy), ReactModule (copy), UseReconciledDataSourceModule (copy), FFlagViewRecyclerReact08 (copy), RecyclingScopeContextModule (copy), RecyclableViewRegistryModule (copy)
		local NewRecyclingScope = RecyclingScopeModule.create(p1)
		
		local function VirtualListRenderer(p2)
			-- upvalues: UseVirtualListModule (upval), CreateElementFunction (upval), VirtualListShellModule (upval)
			local UseVirtualListModuleResult = UseVirtualListModule(p2)
			
			return if p2.scrollingFrame == nil then CreateElementFunction(VirtualListShellModule, UseVirtualListModuleResult) else nil
		end
		
		local MemoResult = nil
		local DeclarativeVirtualList: ((any) -> any)? = nil
		local DataSourceVirtualList: ((any) -> any)? = nil
		
		if FFlagViewRecyclerReact084 then
			MemoResult = ReactModule.memo(function(p2)
				-- upvalues: CreateElementFunction (upval), NewRecyclingScope (copy), VirtualListRenderer (copy)
				return CreateElementFunction(NewRecyclingScope, {
					maxPoolSize = p2.maxPoolSize,
					diagnostics = p2.diagnostics
				}, { List = CreateElementFunction(VirtualListRenderer, p2) })
			end)
		else
			DeclarativeVirtualList = function(Tbl)
				-- upvalues: UseReconciledDataSourceModule (upval), CreateElementFunction (upval), VirtualListRenderer (copy)
				local Copy = table.clone(Tbl)
				Copy.data = nil
				Copy.dataSource = UseReconciledDataSourceModule(Tbl.data.items, Tbl.data.getItemKey)
				
				return CreateElementFunction(VirtualListRenderer, Copy)
			end
			
			DataSourceVirtualList = function(Tbl)
				-- upvalues: CreateElementFunction (upval), VirtualListRenderer (copy)
				local Copy = table.clone(Tbl)
				Copy.dataSource = Tbl.data
				Copy.data = nil
				
				return CreateElementFunction(VirtualListRenderer, Copy)
			end
		end
		return function(Tbl)
			-- upvalues: FFlagViewRecyclerReact084 (upval), FFlagViewRecyclerReact08 (upval), ReactModule (upval), RecyclingScopeContextModule (upval), RecyclableViewRegistryModule (upval), CreateElementFunction (upval), DataSourceVirtualList (ref), DeclarativeVirtualList (ref), UseReconciledDataSourceModule (upval), MemoResult (ref), NewRecyclingScope (copy)
			local UseContextResult = if FFlagViewRecyclerReact084 then nil elseif FFlagViewRecyclerReact08 then nil else ReactModule.useContext(RecyclingScopeContextModule)
			local Data = Tbl.data
			assert(Data ~= nil, "VirtualList: `data` is required")
			assert(Tbl.itemType ~= nil, "VirtualList: `itemType` is required")
			
			if not RecyclableViewRegistryModule.isRegistered(Tbl.itemType) then
				assert(type(Tbl.itemType) == "function", "VirtualList: `itemType` must be a Recyclable view type or selector")
				local Item = if type(Data.getItemCount) == "function" and Data.getItemCount() > 0 then Data.getItem(1) elseif type(Data.items) == "table" then Data.items[1] else nil
				
				if Item ~= nil then
					assert(RecyclableViewRegistryModule.isRegistered(Tbl.itemType(Item, 1)), "VirtualList: `itemType` selector must return a Recyclable view type")
				end
			end
			local IsFunction: boolean? = nil
			local List = nil
			
			if FFlagViewRecyclerReact084 then
				IsFunction = type(Data) == "table" and (type(Data.getItemCount) == "function" and (type(Data.getItem) == "function" and type(Data.getItemKey) == "function")) and type(Data.subscribe) == "function"
			elseif type(Data) == "table" and type(Data.getItemCount) == "function" and type(Data.getItem) == "function" and type(Data.getItemKey) == "function" and type(Data.subscribe) == "function" then
				List = CreateElementFunction(DataSourceVirtualList, Tbl)
			else
				assert(type(Data) == "table" and type(Data.items) == "table" and type(Data.getItemKey) == "function", "VirtualList: `data` must be a DataSource or { items, getItemKey }")
				List = CreateElementFunction(DeclarativeVirtualList, Tbl)
			end
			if not (if FFlagViewRecyclerReact084 then IsFunction else FFlagViewRecyclerReact08) then
				if FFlagViewRecyclerReact084 then
					assert(type(Data) == "table" and type(Data.items) == "table" and type(Data.getItemKey) == "function", "VirtualList: `data` must be a DataSource or { items, getItemKey }")
				elseif UseContextResult ~= nil then
					assert(Tbl.maxPoolSize == nil, "VirtualList: configure maxPoolSize on RecyclingScope")
					
					return List
				end
			end
			if FFlagViewRecyclerReact084 then
				local UseReconciledDataSourceModuleResult = UseReconciledDataSourceModule(if IsFunction then nil else Data.items, if IsFunction then nil else Data.getItemKey)
				local Copy = table.clone(Tbl)
				Copy.data = nil
				Copy.dataSource = if IsFunction then Data else UseReconciledDataSourceModuleResult
				
				return CreateElementFunction(MemoResult, Copy)
			else
				return CreateElementFunction(NewRecyclingScope, {
					maxPoolSize = Tbl.maxPoolSize,
					diagnostics = Tbl.diagnostics
				}, { List = List })
			end
		end
	end
}