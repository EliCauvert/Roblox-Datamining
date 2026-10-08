local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local viewRecyclerModule = require(viewRecyclerReact.Parent.ViewRecycler)
local reactModule = require(viewRecyclerReact.Parent.React)
local recyclableViewModule = require(script.Parent.RecyclableView)
local recyclableViewHostModule = require(viewRecyclerReact.ReactAdapter.RecyclableViewHost)
local recyclableViewRegistryModule = require(script.Parent.RecyclableViewRegistry)
local signalsExperimentalModule = require(viewRecyclerReact.Parent.SignalsExperimental)
local createElement = reactModule.createElement

return {
	new = function(p1)
		-- upvalues: viewRecyclerModule (ref), recyclableViewRegistryModule (ref), recyclableViewModule (ref), createElement (ref), recyclableViewHostModule (ref), signalsExperimentalModule (ref)
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
				assert(not var2, "RecyclingRoot: cannot allocate after destroy")
				var1 += 1
				
				return var1
			end,
			addHosts = function(p2, p3, p4)
				-- upvalues: var2 (write), t (ref), p1 (ref)
				assert(not var2, "RecyclingRoot: cannot add hosts after destroy")
				local var4 = false
				
				for i, v in p2 do
					assert(t[v] == nil, "RecyclingRoot: resource host is already registered")
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
			getScope = function(p6)
				-- upvalues: var2 (write), var3 (write), viewRecyclerModule (copy), recyclableViewRegistryModule (copy), recyclableViewModule (copy), t_1 (write), createElement (copy), recyclableViewHostModule (copy), signalsExperimentalModule (copy)
				assert(not var2, "RecyclingRoot: cannot get a Recycling scope after destroy")
				
				if var3 == nil then
					local maxPoolSize = p6.maxPoolSize
					local var6 = viewRecyclerModule.Adapter.createRecyclingScope({
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
								-- upvalues: recyclableViewRegistryModule (copy), recyclableViewModule (copy), t_1 (copy)
								local metadata = recyclableViewRegistryModule.getMetadata(p7)
								assert(metadata ~= nil, "RecyclingScope: cannot create an unregistered Recyclable view type")
								
								return recyclableViewModule(t_1.allocateId(), p7, nil, metadata.readiness, metadata.hideWhilePending)
							end,
							destroy = function(p7)
								p7.destroy()
							end,
							onCreated = function(p7)
								-- upvalues: t_1 (copy), createElement (copy), recyclableViewHostModule (copy)
								t_1.addHosts(p7, function(p8)
									return `RecyclableView{p8.id}`
								end, function(p8)
									-- upvalues: createElement (copy), recyclableViewHostModule (copy)
									return function(p9)
										-- upvalues: createElement (copy), recyclableViewHostModule (copy), p8 (ref)
										return createElement(recyclableViewHostModule, { itemView = p8, createPortal = p9 })
									end
								end)
							end,
							onEvicted = function(p7)
								-- upvalues: t_1 (copy)
								t_1.removeHosts(p7)
							end,
							batch = signalsExperimentalModule.batch
						}
					})
					var3 = {
						bind = function(p7)
							-- upvalues: maxPoolSize (write), var6 (ref)
							local cloned = table.clone(p7)
							
							if cloned.updateCapacity then
								maxPoolSize = cloned.capacity
								cloned.updateCapacity = nil
							elseif cloned.capacity == nil then
								cloned.capacity = maxPoolSize
							else
								maxPoolSize = cloned.capacity
							end
							return var6.bind(cloned)
						end,
						dispose = var6.dispose
					}
					
					return var3
				end
				return var3
			end,
			getPortalChildren = function(p6)
				-- upvalues: t (ref)
				local t_1 = {}
				
				for i, v in t do
					t_1[v.key] = v.render(p6)
				end
				return t_1
			end,
			destroy = function()
				-- upvalues: var2 (write), var3 (write), t (ref)
				if var2 then return end
				var2 = true
				
				if var3 ~= nil then
					var3.dispose()
				end
				var3 = nil
				table.clear(t)
			end
		}
	end
}