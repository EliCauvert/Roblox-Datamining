local ViewRecyclerModule = require(script:FindFirstAncestor("ViewRecyclerRoblox").Parent.ViewRecycler)

return {
	create = function(p1) --[[ Line: 19 ]]
		-- upvalues: ViewRecyclerModule (copy)
		local ItemViewAdapter = p1.itemViewAdapter
		local MaxPoolSize = p1.maxPoolSize
		
		local function _(p2) --[[ Line: 23 | Named "getInstance" ]]
			-- upvalues: p1 (copy)
			local _Instance = if p1.getInstance == nil then p2 else p1.getInstance(p2)
			assert(typeof(_Instance) == "Instance" and _Instance:IsA("GuiObject"), "createRecyclingScope: ItemView host must be a GuiObject")
			
			return _Instance
		end
		
		local RecyclingScope = ViewRecyclerModule.Adapter.createRecyclingScope({
			onPoolChanged = if p1.diagnostics == nil then nil else function(p2) --[[ Line: 38 ]]
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
				create = function(p2) --[[ Line: 49 ]]
					-- upvalues: ItemViewAdapter (copy), p1 (copy)
					local NewItemViewAdapter = ItemViewAdapter.create(p2)
					local NewItemViewAdapter1 = if p1.getInstance == nil then NewItemViewAdapter else p1.getInstance(NewItemViewAdapter)
					assert(typeof(NewItemViewAdapter1) == "Instance" and NewItemViewAdapter1:IsA("GuiObject"), "createRecyclingScope: ItemView host must be a GuiObject")
					
					return NewItemViewAdapter
				end,
				destroy = function(p2) --[[ Line: 54 ]]
					-- upvalues: p1 (copy)
					if p1.destroyItemView == nil then
						local _Instance = if p1.getInstance == nil then p2 else p1.getInstance(p2)
						assert(typeof(_Instance) == "Instance" and _Instance:IsA("GuiObject"), "createRecyclingScope: ItemView host must be a GuiObject")
						_Instance:Destroy()
						
						return
					else
						p1.destroyItemView(p2)
					end
				end,
				onCreated = ItemViewAdapter.onCreated,
				onEvicted = ItemViewAdapter.onEvicted,
				batch = ItemViewAdapter.batch or function(Callback: () -> ()) --[[ Line: 32 ]]
					Callback()
				end
			}
		})
		
		return {
			bind = function(Tbl) --[[ Line: 68 ]]
				-- upvalues: MaxPoolSize (copy), RecyclingScope (copy)
				local Copy = table.clone(Tbl)
				
				if Copy.capacity == nil then
					Copy.capacity = MaxPoolSize
				end
				return RecyclingScope.bind(Copy)
			end,
			dispose = RecyclingScope.dispose
		}
	end
}