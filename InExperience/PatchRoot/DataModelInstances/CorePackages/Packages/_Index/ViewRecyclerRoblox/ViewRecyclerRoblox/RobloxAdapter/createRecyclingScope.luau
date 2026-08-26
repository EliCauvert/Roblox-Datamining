local viewRecyclerModule = require(script:FindFirstAncestor("ViewRecyclerRoblox").Parent.ViewRecycler)

return {
	create = function(p1)
		-- upvalues: viewRecyclerModule (ref)
		local itemViewAdapter = p1.itemViewAdapter
		local var1 = 0
		local t = {}
		local t_1 = {}
		
		local function _(p2)
			-- upvalues: p1 (ref)
			local var2 = if p1.getInstance ~= nil then p2 else p1.getInstance(p2)
			assert(typeof(var2) == "Instance" and var2:IsA("GuiObject"), "createRecyclingScope: ItemView host must be a GuiObject")
			
			return var2
		end
		
		local function flushLifecycle()
			-- upvalues: t_1 (ref), itemViewAdapter (ref), p1 (ref), t (ref)
			local t_2 = {}
			
			for i, v in t_1 do
				t_2[v] = true
			end
			if #t_1 > 0 and itemViewAdapter.onEvicted ~= nil then
				itemViewAdapter.onEvicted(table.clone(t_1))
			end
			for i, v_1 in t_1 do
				if p1.destroyItemView == nil then
					local var2 = if p1.getInstance ~= nil then v_1 else p1.getInstance(v_1)
					assert(typeof(var2) == "Instance" and var2:IsA("GuiObject"), "createRecyclingScope: ItemView host must be a GuiObject")
					var2:Destroy()
				else
					p1.destroyItemView(v_1)
				end
			end
			if #t > 0 and itemViewAdapter.onCreated ~= nil then
				local t_3 = {}
				
				for i_2, v_2 in t do
					if not t_2[v_2] then
						table.insert(t_3, v_2)
					end
				end
				if #t_3 > 0 then
					itemViewAdapter.onCreated(t_3)
				end
			end
			table.clear(t)
			table.clear(t_1)
		end
		
		local batch = itemViewAdapter.batch or function(p2)
			p2()
		end
		local var3 = viewRecyclerModule.Adapter.createRecyclingScope({
			maxPoolSize = p1.maxPoolSize,
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
					-- upvalues: itemViewAdapter (ref), p1 (ref), t (ref)
					local var4 = itemViewAdapter.create(p2)
					local var5 = if p1.getInstance ~= nil then var4 else p1.getInstance(var4)
					assert(typeof(var5) == "Instance" and var5:IsA("GuiObject"), "createRecyclingScope: ItemView host must be a GuiObject")
					table.insert(t, var4)
					
					return var4
				end,
				destroy = function(p2)
					-- upvalues: t_1 (ref)
					table.insert(t_1, p2)
				end,
				batch = function(p2)
					-- upvalues: var1 (write), batch (ref), flushLifecycle (ref)
					var1 += 1
					local ok, status = pcall(batch, p2)
					var1 -= 1
					
					if var1 == 0 then
						flushLifecycle()
					end
					if not ok then
						error(status, 0)
					end
				end
			}
		})
		
		return {
			exchange = function(p2, p3, p4)
				-- upvalues: var3 (ref), var1 (write), flushLifecycle (ref)
				local var4 = var3.exchange(p2, p3, p4)
				
				if var1 == 0 then
					flushLifecycle()
				end
				return var4
			end,
			batch = var3.batch,
			isLeaseCurrent = var3.isLeaseCurrent,
			setMaxPoolSize = var3.setMaxPoolSize,
			getScopeInventory = var3.getScopeInventory,
			getVacantRecords = var3.getVacantRecords,
			getItemViews = var3.getScopeInventory,
			getVacantItemViews = var3.getVacantRecords,
			updateItemView = itemViewAdapter.update,
			destroy = function()
				-- upvalues: var3 (ref)
				var3.destroy()
			end
		}
	end
}