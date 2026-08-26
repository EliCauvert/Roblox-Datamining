local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local viewRecyclerModule = require(viewRecyclerReact.Parent.ViewRecycler)
local listItemViewHostModule = require(viewRecyclerReact.ReactAdapter.ListItemViewHost)
local reactModule = require(viewRecyclerReact.Parent.React)
local recyclableViewRegistryModule = require(script.Parent.RecyclableViewRegistry)
local signalsExperimentalModule = require(viewRecyclerReact.Parent.SignalsExperimental)
local recyclableViewRecordModule = require(script.Parent.RecyclableViewRecord)
local createElement = reactModule.createElement

return {
	new = function(p1)
		-- upvalues: createElement (ref), listItemViewHostModule (ref), signalsExperimentalModule (ref), viewRecyclerModule (ref), recyclableViewRegistryModule (ref), recyclableViewRecordModule (ref)
		local t = {}
		local var1 = 1
		local var2 = false
		local var3 = nil
		
		local function _()
			-- upvalues: var2 (write), p1 (ref)
			if not var2 then
				p1()
			end
		end
		
		local _ = nil
		local t_1 = {
			allocateId = function()
				-- upvalues: var2 (write), var1 (write)
				assert(not var2, "RecyclingRuntime: cannot allocate after destroy")
				var1 += 1
				
				return var1
			end,
			addHosts = function(p2, p3, p4)
				-- upvalues: var2 (write), t (ref), p1 (ref)
				assert(not var2, "RecyclingRuntime: cannot add hosts after destroy")
				local var4 = false
				
				for i, v in p2 do
					assert(t[v] == nil, "RecyclingRuntime: resource host is already registered")
					t[v] = { key = p3(v), render = p4(v) }
					var4 = true
				end
				if var4 and not var2 then
					p1()
				end
			end,
			removeHosts = function(p5)
				-- upvalues: t (ref), var2 (write), p1 (ref)
				local var5 = false
				
				for i, v in p5 do
					if t[v] ~= nil then
						t[v] = nil
						var5 = true
					end
				end
				if var5 and not var2 then
					p1()
				end
			end
		}
		
		return {
			getRecyclingScope = function(p6)
				-- upvalues: var2 (write), var3 (write), t_1 (write), createElement (copy), listItemViewHostModule (copy), signalsExperimentalModule (copy), viewRecyclerModule (copy), recyclableViewRegistryModule (copy), recyclableViewRecordModule (copy)
				assert(not var2, "RecyclingRuntime: cannot get a Recycling scope after destroy")
				
				if var3 == nil then
					local var6 = 0
					local t = {}
					local t_2 = {}
					
					local function flushHosts()
						-- upvalues: t_2 (ref), t_1 (copy), t (ref), createElement (copy), listItemViewHostModule (copy)
						if #t_2 > 0 then
							t_1.removeHosts(t_2)
							
							for i, v in t_2 do
								v.destroy()
							end
						end
						if #t > 0 then
							local t_3 = {}
							local t_4 = {}
							
							for i, v in t_2 do
								t_4[v] = true
							end
							for i, v_1 in t do
								if not t_4[v_1] then
									table.insert(t_3, v_1)
								end
							end
							if #t_3 > 0 then
								t_1.addHosts(t_3, function(p7)
									return `RecyclableViewRecord{p7.id}`
								end, function(p7)
									-- upvalues: createElement (copy), listItemViewHostModule (copy)
									return function(p8)
										-- upvalues: createElement (copy), listItemViewHostModule (copy), p7 (ref)
										return createElement(listItemViewHostModule, { itemView = p7, createPortal = p8 })
									end
								end)
							end
						end
						table.clear(t)
						table.clear(t_2)
					end
					
					local var7 = viewRecyclerModule.Adapter.createRecyclingScope({
						maxPoolSize = p6.maxPoolSize,
						onPoolChanged = if p6.diagnostics == nil then nil else function(p7)
							-- upvalues: p6 (ref), viewRecyclerModule (copy)
							p6.diagnostics({
								kind = viewRecyclerModule.Diagnostics.EventKind.PoolChanged,
								action = p7.action,
								itemViewType = p7.viewType,
								occupiedDelta = p7.occupiedDelta,
								vacantDelta = p7.vacantDelta,
								totalDelta = p7.totalDelta
							})
						end,
						adapter = {
							create = function(p7)
								-- upvalues: recyclableViewRegistryModule (copy), recyclableViewRecordModule (copy), t_1 (copy), t (ref)
								local metadata = recyclableViewRegistryModule.getMetadata(p7)
								assert(metadata ~= nil, "RecyclingScope: cannot create an unregistered Recyclable view type")
								local var8 = recyclableViewRecordModule(t_1.allocateId(), p7, nil, metadata.readiness, metadata.hideWhilePending)
								table.insert(t, var8)
								
								return var8
							end,
							destroy = function(p7)
								-- upvalues: t_2 (ref)
								table.insert(t_2, p7)
							end,
							batch = function(p7)
								-- upvalues: var6 (write), signalsExperimentalModule (copy), flushHosts (ref)
								var6 += 1
								local ok, status = pcall(signalsExperimentalModule.batch, p7)
								var6 -= 1
								
								if var6 == 0 then
									flushHosts()
								end
								if not ok then
									error(status, 0)
								end
							end
						}
					})
					var3 = {
						exchange = function(p7, p8, p9)
							-- upvalues: var7 (ref), var6 (write), flushHosts (ref)
							local var8 = var7.exchange(p7, p8, p9)
							
							if var6 == 0 then
								flushHosts()
							end
							return var8
						end,
						batch = var7.batch,
						isLeaseCurrent = var7.isLeaseCurrent,
						setMaxPoolSize = function(a)
							-- upvalues: var7 (ref), var6 (write), flushHosts (ref)
							var7.setMaxPoolSize(a)
							
							if var6 == 0 then
								flushHosts()
							end
						end,
						getScopeInventory = var7.getScopeInventory,
						getVacantRecords = var7.getVacantRecords,
						destroy = function()
							-- upvalues: var7 (ref), var6 (write), flushHosts (ref)
							var7.destroy()
							
							if var6 == 0 then
								flushHosts()
							end
						end
					}
					
					return var3
				end
				return var3
			end,
			getHostChildren = function(p7)
				-- upvalues: t (ref)
				local t_1 = {}
				
				for i, v in t do
					t_1[v.key] = v.render(p7)
				end
				return t_1
			end,
			destroy = function()
				-- upvalues: var2 (write), var3 (write), t (ref)
				if var2 then return end
				var2 = true
				
				if var3 ~= nil then
					var3.destroy()
				end
				var3 = nil
				table.clear(t)
			end
		}
	end
}