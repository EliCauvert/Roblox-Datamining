local viewRecyclerModule = require(script:FindFirstAncestor("ViewRecyclerRoblox").Parent.ViewRecycler)

return {
	create = function(p1)
		-- upvalues: viewRecyclerModule (ref)
		local itemViewAdapter = p1.itemViewAdapter
		local maxPoolSize = p1.maxPoolSize
		
		local function _(p2)
			-- upvalues: p1 (ref)
			local var1 = if p1.getInstance ~= nil then p2 else p1.getInstance(p2)
			assert(typeof(var1) == "Instance" and var1:IsA("GuiObject"), "createRecyclingScope: ItemView host must be a GuiObject")
			
			return var1
		end
		
		local var1 = viewRecyclerModule.Adapter.createRecyclingScope({
			onPoolChanged = if p1.diagnostics == nil then nil else function(p2)
				-- upvalues: p1 (ref), viewRecyclerModule (copy)
				p1.diagnostics({
					kind = viewRecyclerModule.Diagnostics.EventKind.PoolChanged,
					action = p2.action,
					itemViewType = p2.viewType,
					occupiedDelta = p2.occupiedDelta,
					vacantDelta = p2.vacantDelta,
					totalDelta = p2.totalDelta
				})
			end,
			adapter = {
				create = function(p2)
					-- upvalues: itemViewAdapter (ref), p1 (ref)
					local var2 = itemViewAdapter.create(p2)
					local var3 = if p1.getInstance ~= nil then var2 else p1.getInstance(var2)
					assert(typeof(var3) == "Instance" and var3:IsA("GuiObject"), "createRecyclingScope: ItemView host must be a GuiObject")
					
					return var2
				end,
				destroy = function(p2)
					-- upvalues: p1 (ref)
					if p1.destroyItemView == nil then
						local var2 = if p1.getInstance ~= nil then p2 else p1.getInstance(p2)
						assert(typeof(var2) == "Instance" and var2:IsA("GuiObject"), "createRecyclingScope: ItemView host must be a GuiObject")
						var2:Destroy()
						
						return
					end
					p1.destroyItemView(p2)
				end,
				onCreated = itemViewAdapter.onCreated,
				onEvicted = itemViewAdapter.onEvicted,
				batch = itemViewAdapter.batch or function(p2)
					p2()
				end
			}
		})
		
		return {
			bind = function(p2)
				-- upvalues: maxPoolSize (ref), var1 (ref)
				local cloned = table.clone(p2)
				
				if cloned.capacity == nil then
					cloned.capacity = maxPoolSize
				end
				return var1.bind(cloned)
			end,
			dispose = var1.dispose
		}
	end
}