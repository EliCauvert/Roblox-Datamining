local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local viewRecyclerModule = require(viewRecyclerReact.Parent.ViewRecycler)
local listItemViewHostModule = require(viewRecyclerReact.ReactAdapter.ListItemViewHost)
local reactModule = require(viewRecyclerReact.Parent.React)
local recyclableViewRegistryModule = require(script.Parent.RecyclableViewRegistry)
local signalsExperimentalModule = require(viewRecyclerReact.Parent.SignalsExperimental)
local recyclableViewRecordModule = require(script.Parent.RecyclableViewRecord)
local createElement = reactModule.createElement

return {
	new = function(p0) --[[ line: 41 ]]
		-- upvalues: createElement (ref), listItemViewHostModule (ref), signalsExperimentalModule (ref), viewRecyclerModule (ref), recyclableViewRegistryModule (ref), recyclableViewRecordModule (ref)
		local t = {}
		local var8 = 1
		local var9 = false
		local var10 = nil
		
		local function _() --[[ line: 47 | named "notifyChanged" ]]
			-- upvalues: var9 (write), p0 (ref)
			if not var9 then
				p0()
			end
		end
		
		local _ = nil
		local t_1 = {
			allocateId = function() --[[ line: 55 ]]
				-- upvalues: var9 (write), var8 (write)
				assert(not var9, "RecyclingRuntime: cannot allocate after destroy")
				var8 += 1
				
				return var8
			end,
			addHosts = function(p1, p2, p3) --[[ line: 61 ]]
				-- upvalues: var9 (write), t (ref), p0 (ref)
				assert(not var9, "RecyclingRuntime: cannot add hosts after destroy")
				local var12 = false
				
				for i, v in p1 do
					assert(t[v] == nil, "RecyclingRuntime: resource host is already registered")
					t[v] = { key = p2(v), render = p3(v) }
					var12 = true
				end
				if var12 and not var9 then
					p0()
				end
			end,
			removeHosts = function(p4) --[[ line: 76 ]]
				-- upvalues: t (ref), var9 (write), p0 (ref)
				local var13 = false
				
				for i, v in p4 do
					if t[v] ~= nil then
						t[v] = nil
						var13 = true
					end
				end
				if var13 and not var9 then
					p0()
				end
			end
		}
		
		return {
			getRecyclingScope = function(p5) --[[ line: 90 ]]
				-- upvalues: var9 (write), var10 (write), t_1 (write), createElement (copy), listItemViewHostModule (copy), signalsExperimentalModule (copy), viewRecyclerModule (copy), recyclableViewRegistryModule (copy), recyclableViewRecordModule (copy)
				assert(not var9, "RecyclingRuntime: cannot get a Recycling scope after destroy")
				
				if var10 == nil then
					local var14 = 0
					local t = {}
					local t_2 = {}
					
					local function flushHosts() --[[ line: 100 ]]
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
								t_1.addHosts(t_3, function(p6) --[[ line: 119 ]]
									return `RecyclableViewRecord{p6.id}`
								end, function(p7) --[[ line: 121 ]]
									-- upvalues: createElement (copy), listItemViewHostModule (copy)
									return function(p8) --[[ line: 122 ]]
										-- upvalues: createElement (copy), listItemViewHostModule (copy), p7 (ref)
										return createElement(listItemViewHostModule, { itemView = p7, createPortal = p8 })
									end
								end)
							end
						end
						table.clear(t)
						table.clear(t_2)
					end
					
					local var18 = viewRecyclerModule.Adapter.createRecyclingScope({
						maxPoolSize = p5.maxPoolSize,
						onPoolChanged = if p5.diagnostics == nil then nil else function(p9) --[[ line: 151 ]]
							-- upvalues: p5 (ref), viewRecyclerModule (copy)
							p5.diagnostics({
								kind = viewRecyclerModule.Diagnostics.EventKind.PoolChanged,
								action = p9.action,
								itemViewType = p9.viewType,
								occupiedDelta = p9.occupiedDelta,
								vacantDelta = p9.vacantDelta,
								totalDelta = p9.totalDelta
							})
						end,
						adapter = {
							create = function(p10) --[[ line: 162 ]]
								-- upvalues: recyclableViewRegistryModule (copy), recyclableViewRecordModule (copy), t_1 (copy), t (ref)
								local metadata = recyclableViewRegistryModule.getMetadata(p10)
								assert(metadata ~= nil, "RecyclingScope: cannot create an unregistered Recyclable view type")
								local var22 = recyclableViewRecordModule(t_1.allocateId(), p10, nil, metadata.readiness, metadata.hideWhilePending)
								table.insert(t, var22)
								
								return var22
							end,
							destroy = function(p11) --[[ line: 175 ]]
								-- upvalues: t_2 (ref)
								table.insert(t_2, p11)
							end,
							batch = function(p12) --[[ line: 135 ]]
								-- upvalues: var14 (write), signalsExperimentalModule (copy), flushHosts (ref)
								var14 += 1
								local ok, status = pcall(signalsExperimentalModule.batch, p12)
								var14 -= 1
								
								if var14 == 0 then
									flushHosts()
								end
								if not ok then
									error(status, 0)
								end
							end
						}
					})
					var10 = {
						exchange = function(p13, p14, p15) --[[ line: 183 ]]
							-- upvalues: var18 (ref), var14 (write), flushHosts (ref)
							local var23 = var18.exchange(p13, p14, p15)
							
							if var14 == 0 then
								flushHosts()
							end
							return var23
						end,
						batch = var18.batch,
						isLeaseCurrent = var18.isLeaseCurrent,
						setMaxPoolSize = function(a) --[[ line: 192 ]]
							-- upvalues: var18 (ref), var14 (write), flushHosts (ref)
							var18.setMaxPoolSize(a)
							
							if var14 == 0 then
								flushHosts()
							end
						end,
						getScopeInventory = var18.getScopeInventory,
						getVacantRecords = var18.getVacantRecords,
						destroy = function() --[[ line: 200 ]]
							-- upvalues: var18 (ref), var14 (write), flushHosts (ref)
							var18.destroy()
							
							if var14 == 0 then
								flushHosts()
							end
						end
					}
					
					return var10
				end
				return var10
			end,
			getHostChildren = function(p16) --[[ line: 212 ]]
				-- upvalues: t (ref)
				local t_1 = {}
				
				for i, v in t do
					t_1[v.key] = v.render(p16)
				end
				return t_1
			end,
			destroy = function() --[[ line: 219 ]]
				-- upvalues: var9 (write), var10 (write), t (ref)
				if var9 then return end
				var9 = true
				
				if var10 ~= nil then
					var10.destroy()
				end
				var10 = nil
				table.clear(t)
			end
		}
	end
}