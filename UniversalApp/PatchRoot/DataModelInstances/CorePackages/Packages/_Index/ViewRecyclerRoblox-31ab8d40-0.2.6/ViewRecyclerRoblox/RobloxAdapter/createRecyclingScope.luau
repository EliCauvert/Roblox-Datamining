local ViewRecyclerModule = require(script:FindFirstAncestor("ViewRecyclerRoblox").Parent.ViewRecycler)

return {
	create = function(p1) --[[ Line: 24 ]]
		-- upvalues: ViewRecyclerModule (copy)
		local ItemViewAdapter = p1.itemViewAdapter
		local Count = 0
		local CreateResults = {}
		local Tbl = {}
		
		local function _(p2) --[[ Line: 32 | Named "getInstance" ]]
			-- upvalues: p1 (copy)
			local _Instance = if p1.getInstance == nil then p2 else p1.getInstance(p2)
			assert(typeof(_Instance) == "Instance" and _Instance:IsA("GuiObject"), "createRecyclingScope: ItemView host must be a GuiObject")
			
			return _Instance
		end
		
		local function flushLifecycle() --[[ Line: 41 ]]
			-- upvalues: Tbl (copy), ItemViewAdapter (copy), p1 (copy), CreateResults (copy)
			local t = {}
			
			for _, value in Tbl do
				t[value] = true
			end
			if #Tbl > 0 and ItemViewAdapter.onEvicted ~= nil then
				ItemViewAdapter.onEvicted(table.clone(Tbl))
			end
			for _, value1 in Tbl do
				if p1.destroyItemView == nil then
					local Value = if p1.getInstance == nil then value1 else p1.getInstance(value1)
					assert(typeof(Value) == "Instance" and Value:IsA("GuiObject"), "createRecyclingScope: ItemView host must be a GuiObject")
					Value:Destroy()
				else
					p1.destroyItemView(value1)
				end
			end
			if #CreateResults > 0 and ItemViewAdapter.onCreated ~= nil then
				local List = {}
				
				for _, createResult in CreateResults do
					if not t[createResult] then
						table.insert(List, createResult)
					end
				end
				if #List > 0 then
					ItemViewAdapter.onCreated(List)
				end
			end
			table.clear(CreateResults)
			table.clear(Tbl)
		end
		
		local Batch = ItemViewAdapter.batch or function(Callback: () -> ()) --[[ Line: 71 ]]
			Callback()
		end
		local RecyclingScope = ViewRecyclerModule.Adapter.createRecyclingScope({
			maxPoolSize = p1.maxPoolSize,
			onPoolChanged = if p1.diagnostics == nil then nil else function(p2) --[[ Line: 90 ]]
				-- upvalues: p1 (copy), ViewRecyclerModule (upval)
				p1.diagnostics({
					kind = ViewRecyclerModule.Diagnostics.EventKind.PoolChanged,
					action = p2.action,
					itemViewType = p2.viewType,
					occupiedDelta = p2.occupiedDelta,
					vacantDelta = p2.vacantDelta,
					totalDelta = p2.totalDelta
				})
			end,
			adapter = {
				create = function(p2) --[[ Line: 101 ]]
					-- upvalues: ItemViewAdapter (copy), p1 (copy), CreateResults (copy)
					local NewItemViewAdapter = ItemViewAdapter.create(p2)
					local NewItemViewAdapter1 = if p1.getInstance == nil then NewItemViewAdapter else p1.getInstance(NewItemViewAdapter)
					assert(typeof(NewItemViewAdapter1) == "Instance" and NewItemViewAdapter1:IsA("GuiObject"), "createRecyclingScope: ItemView host must be a GuiObject")
					table.insert(CreateResults, NewItemViewAdapter)
					
					return NewItemViewAdapter
				end,
				destroy = function(p2) --[[ Line: 107 ]]
					-- upvalues: Tbl (copy)
					table.insert(Tbl, p2)
				end,
				batch = function(p2) --[[ Line: 74 ]]
					-- upvalues: Count (ref), Batch (copy), flushLifecycle (copy)
					Count += 1
					local Success, Result = pcall(Batch, p2)
					Count -= 1
					
					if Count == 0 then
						flushLifecycle()
					end
					if not Success then
						error(Result, 0)
					end
				end
			}
		})
		
		return {
			exchange = function(p2, p3, p4) --[[ Line: 115 ]]
				-- upvalues: RecyclingScope (copy), Count (ref), flushLifecycle (copy)
				local ExchangeResult = RecyclingScope.exchange(p2, p3, p4)
				
				if Count == 0 then
					flushLifecycle()
				end
				return ExchangeResult
			end,
			batch = RecyclingScope.batch,
			isLeaseCurrent = RecyclingScope.isLeaseCurrent,
			setMaxPoolSize = RecyclingScope.setMaxPoolSize,
			getScopeInventory = RecyclingScope.getScopeInventory,
			getVacantViews = RecyclingScope.getVacantViews,
			getItemViews = RecyclingScope.getScopeInventory,
			updateItemView = ItemViewAdapter.update,
			destroy = function() --[[ Line: 129 ]]
				-- upvalues: RecyclingScope (copy)
				RecyclingScope.destroy()
			end
		}
	end
}