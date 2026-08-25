local viewRecyclerModule = require(script:FindFirstAncestor("ViewRecyclerRoblox").Parent.ViewRecycler)

return {
	create = function(p0)
		-- upvalues: viewRecyclerModule (ref)
		local itemViewAdapter = p0.itemViewAdapter
		local var1 = 0
		local t = {}
		local t_1 = {}
		
		local function _(p1)
			-- upvalues: p0 (ref)
			local var7 = if p0.getInstance ~= nil then p1 else p0.getInstance(p1)
			assert(typeof(var7) == "Instance" and var7:IsA("GuiObject"), "createRecyclingScope: ItemView host must be a GuiObject")
			
			return var7
		end
		
		local function flushLifecycle()
			-- upvalues: t_1 (ref), itemViewAdapter (ref), p0 (ref), t (ref)
			local t_2 = {}
			
			for i, v in t_1 do
				t_2[v] = true
			end
			if #t_1 > 0 and itemViewAdapter.onEvicted ~= nil then
				itemViewAdapter.onEvicted(table.clone(t_1))
			end
			for i, v_1 in t_1 do
				if p0.destroyItemView == nil then
					local var10 = if p0.getInstance ~= nil then v_1 else p0.getInstance(v_1)
					assert(typeof(var10) == "Instance" and var10:IsA("GuiObject"), "createRecyclingScope: ItemView host must be a GuiObject")
					var10:Destroy()
				else
					p0.destroyItemView(v_1)
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
		local var6 = viewRecyclerModule.Adapter.createRecyclingScope({
			maxPoolSize = p0.maxPoolSize,
			onPoolChanged = if p0.diagnostics == nil then nil else function(p3)
				-- upvalues: p0 (ref), viewRecyclerModule (copy)
				p0.diagnostics({
					kind = viewRecyclerModule.Diagnostics.EventKind.PoolChanged,
					action = p3.action,
					itemViewType = p3.viewType,
					occupiedDelta = p3.occupiedDelta,
					vacantDelta = p3.vacantDelta,
					totalDelta = p3.totalDelta
				})
			end,
			adapter = {
				create = function(p4)
					-- upvalues: itemViewAdapter (ref), p0 (ref), t (ref)
					local var11 = itemViewAdapter.create(p4)
					local var12 = if p0.getInstance ~= nil then var11 else p0.getInstance(var11)
					assert(typeof(var12) == "Instance" and var12:IsA("GuiObject"), "createRecyclingScope: ItemView host must be a GuiObject")
					table.insert(t, var11)
					
					return var11
				end,
				destroy = function(p5)
					-- upvalues: t_1 (ref)
					table.insert(t_1, p5)
				end,
				batch = function(p6)
					-- upvalues: var1 (write), batch (ref), flushLifecycle (ref)
					var1 += 1
					local ok, status = pcall(batch, p6)
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
			exchange = function(p7, p8, p9)
				-- upvalues: var6 (ref), var1 (write), flushLifecycle (ref)
				local var13 = var6.exchange(p7, p8, p9)
				
				if var1 == 0 then
					flushLifecycle()
				end
				return var13
			end,
			batch = var6.batch,
			isLeaseCurrent = var6.isLeaseCurrent,
			setMaxPoolSize = var6.setMaxPoolSize,
			getScopeInventory = var6.getScopeInventory,
			getVacantRecords = var6.getVacantRecords,
			getItemViews = var6.getScopeInventory,
			getVacantItemViews = var6.getVacantRecords,
			updateItemView = itemViewAdapter.update,
			destroy = function()
				-- upvalues: var6 (ref)
				var6.destroy()
			end
		}
	end
}