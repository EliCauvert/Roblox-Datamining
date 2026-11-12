local FFlagViewRecyclerReact084 = require(script:FindFirstAncestor("ViewRecyclerRoblox").Flags).FFlagViewRecyclerReact084
local FFlagViewRecyclerReact08 = require(script:FindFirstAncestor("ViewRecyclerRoblox").Flags).FFlagViewRecyclerReact08
local ViewRecyclerRoblox = script:FindFirstAncestor("ViewRecyclerRoblox")
local ViewRecyclerModule = require(ViewRecyclerRoblox.Parent.ViewRecycler)
local VacantHostsModule = require(ViewRecyclerRoblox.RobloxAdapter.VacantHosts)

return {
	create = function(p1)
		-- upvalues: FFlagViewRecyclerReact084 (copy), FFlagViewRecyclerReact08 (copy), ViewRecyclerModule (copy), VacantHostsModule (copy)
		if FFlagViewRecyclerReact084 then
			assert(typeof(p1.vacantHostParent) == "Instance", "createRecyclingScope: vacantHostParent must be an Instance")
		end
		local ItemViewAdapter = p1.itemViewAdapter
		local MaxPoolSize = p1.maxPoolSize
		
		local function _(p2)
			-- upvalues: p1 (copy)
			local _Instance = if p1.getInstance == nil then p2 else p1.getInstance(p2)
			assert(typeof(_Instance) == "Instance" and _Instance:IsA("GuiObject"), "createRecyclingScope: ItemView host must be a GuiObject")
			
			return _Instance
		end
		
		local T = nil
		T = if FFlagViewRecyclerReact084 then {} elseif FFlagViewRecyclerReact08 then {} else nil
		local RecyclingScope = ViewRecyclerModule.Adapter.createRecyclingScope({
			onPoolChanged = if p1.diagnostics == nil then nil else function(p2)
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
				create = function(p2)
					-- upvalues: ItemViewAdapter (copy), FFlagViewRecyclerReact084 (upval), T (ref), p1 (copy), FFlagViewRecyclerReact08 (upval)
					local NewItemViewAdapter = ItemViewAdapter.create(p2)
					
					if FFlagViewRecyclerReact084 then
						local DestroyingConnections = T
						local NewItemViewAdapter1 = if p1.getInstance == nil then NewItemViewAdapter else p1.getInstance(NewItemViewAdapter)
						assert(typeof(NewItemViewAdapter1) == "Instance" and NewItemViewAdapter1:IsA("GuiObject"), "createRecyclingScope: ItemView host must be a GuiObject")
						DestroyingConnections[NewItemViewAdapter] = NewItemViewAdapter1.Destroying:Connect(function() end)
						
						return NewItemViewAdapter
					elseif FFlagViewRecyclerReact08 then
						local DestroyingConnections = T
						local NewItemViewAdapter2 = if p1.getInstance == nil then NewItemViewAdapter else p1.getInstance(NewItemViewAdapter)
						assert(typeof(NewItemViewAdapter2) == "Instance" and NewItemViewAdapter2:IsA("GuiObject"), "createRecyclingScope: ItemView host must be a GuiObject")
						DestroyingConnections[NewItemViewAdapter] = NewItemViewAdapter2.Destroying:Connect(function() end)
						
						return NewItemViewAdapter
					else
						local NewItemViewAdapter3 = if p1.getInstance == nil then NewItemViewAdapter else p1.getInstance(NewItemViewAdapter)
						assert(typeof(NewItemViewAdapter3) == "Instance" and NewItemViewAdapter3:IsA("GuiObject"), "createRecyclingScope: ItemView host must be a GuiObject")
						
						return NewItemViewAdapter
					end
				end,
				destroy = function(Key)
					-- upvalues: FFlagViewRecyclerReact084 (upval), T (ref), FFlagViewRecyclerReact08 (upval), p1 (copy)
					local Entry = if FFlagViewRecyclerReact084 then T[Key] else nil
					
					if if FFlagViewRecyclerReact084 then Entry ~= nil else FFlagViewRecyclerReact08 then
						if FFlagViewRecyclerReact084 then
							Entry:Disconnect()
							T[Key] = nil
						else
							local Entry1 = T[Key]
							
							if Entry1 ~= nil then
								Entry1:Disconnect()
								T[Key] = nil
							end
						end
					end
					if p1.destroyItemView == nil then
						local Key1 = if p1.getInstance == nil then Key else p1.getInstance(Key)
						assert(typeof(Key1) == "Instance" and Key1:IsA("GuiObject"), "createRecyclingScope: ItemView host must be a GuiObject")
						Key1:Destroy()
						
						return
					else
						p1.destroyItemView(Key)
					end
				end,
				onCreated = ItemViewAdapter.onCreated,
				onEvicted = ItemViewAdapter.onEvicted,
				batch = ItemViewAdapter.batch or function(Callback: () -> ())
					Callback()
				end,
				isDestroyed = if FFlagViewRecyclerReact084 then function(p2): boolean
					-- upvalues: T (ref)
					local Entry = T[p2]
					
					return Entry ~= nil and not Entry.Connected
				end elseif FFlagViewRecyclerReact08 then function(p2): boolean
					-- upvalues: T (ref)
					local Entry = T[p2]
					
					return Entry ~= nil and not Entry.Connected
				end else nil
			}
		})
		local NewVacantHosts = nil
		local v1 = nil
		
		if FFlagViewRecyclerReact084 then
			NewVacantHosts = VacantHostsModule.new()
			NewVacantHosts.setParent(p1.vacantHostParent)
			v1 = {
				bind = function(Tbl)
					-- upvalues: MaxPoolSize (copy), RecyclingScope (copy)
					local Copy = table.clone(Tbl)
					
					if Copy.capacity == nil then
						Copy.capacity = MaxPoolSize
					end
					return RecyclingScope.bind(Copy)
				end,
				dispose = function()
					-- upvalues: RecyclingScope (copy), NewVacantHosts (ref)
					RecyclingScope.dispose()
					NewVacantHosts.destroy()
				end
			}
			VacantHostsModule.register(v1, NewVacantHosts)
		end
		return if FFlagViewRecyclerReact084 then v1 else {
			bind = function(Tbl)
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