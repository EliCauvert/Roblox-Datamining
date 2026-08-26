local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local viewRecyclerModule = require(viewRecyclerReact.Parent.ViewRecycler)
local _ = require(viewRecyclerReact.Parent.React)
local _ = require(script.Parent.RecyclableViewRegistry)
local _ = require(viewRecyclerReact.Parent.Signals)
local reparentableHost = require(viewRecyclerReact.Parent.ViewRecyclerRoblox).ReparentableHost
local record = viewRecyclerModule.Adapter._Private.Record
local frozen = table.freeze({ "key", "generation" })

local function _(p1, p2)
	return `{#p1}:{p1}:{p2}`
end

return {
	new = function(p1, p2)
		-- upvalues: reparentableHost (ref), record (ref), frozen (ref)
		local t = {}
		local tbl = setmetatable({}, { __mode = "k" })
		local var1 = 1
		local t_1 = {}
		local t_2 = {}
		local var2 = false
		local var3 = false
		local var4 = nil
		local tbl_1 = setmetatable({}, { __mode = "k" })
		
		local function getPortState(p3)
			-- upvalues: tbl_1 (ref), t (ref), reparentableHost (copy), record (copy), frozen (copy)
			local var5 = tbl_1[p3]
			
			if var5 == nil then
				local _ = nil
				local t_1 = {
					pendingAssignment = nil,
					pendingPlacementId = nil,
					currentPlacementId = nil,
					currentPlaceholder = nil,
					currentAutomaticSize = nil,
					port = nil,
					record = p3
				}
				t_1.port = {
					apply = function(p4)
						-- upvalues: t_1 (write), t (copy), p3 (ref), reparentableHost (copy), record (copy), frozen (copy)
						if p4 == nil then
							t_1.pendingAssignment = nil
							t_1.pendingPlacementId = nil
							local currentPlacementId = t_1.currentPlacementId
							t_1.currentPlacementId = nil
							t_1.currentPlaceholder = nil
							t_1.currentAutomaticSize = nil
							local var6 = if currentPlacementId == nil then nil else t[currentPlacementId]
							
							if var6 ~= nil and var6.record == p3 then
								var6.record = nil
							end
							local var7 = p3.portalFrame(false)
							
							if var7 ~= nil then
								reparentableHost.detach(var7)
								var7.AnchorPoint = Vector2.zero
								var7.Position = UDim2.new()
								var7.Size = UDim2.new()
								var7.AutomaticSize = Enum.AutomaticSize.None
							end
							return
						else
							local pendingAssignment = t_1.pendingAssignment or p3.signal(false)
							local pendingPlacementId = t_1.pendingPlacementId or t_1.currentPlacementId
							assert(pendingAssignment ~= nil, "CompositionPlacementManager: placement attach or update requires an Assignment")
							assert(pendingPlacementId ~= nil, "CompositionPlacementManager: placement requires a destination")
							
							if p4.assignment == nil or not record.containsEqual(p4.assignment, pendingAssignment, frozen) then return end
							t_1.pendingAssignment = nil
							t_1.pendingPlacementId = nil
							local currentPlacementId = t_1.currentPlacementId
							
							if currentPlacementId ~= nil and currentPlacementId ~= pendingPlacementId then
								local var8 = t[currentPlacementId]
								
								if var8 ~= nil and var8.record == p3 then
									var8.record = nil
								end
							end
							t_1.currentPlacementId = pendingPlacementId
							local var9 = t[pendingPlacementId]
							
							if var9 ~= nil then
								var9.record = p3
							end
							local host = p4.host
							assert(host ~= nil, "CompositionPlacementManager: cannot place a destroyed Recyclable view")
							local value = pendingAssignment.value
							
							if t_1.currentPlaceholder ~= value.placeholder or t_1.currentAutomaticSize ~= value.automaticSize or host.Parent ~= value.placeholder then
								reparentableHost.place(host, value)
								t_1.currentPlaceholder = value.placeholder
								t_1.currentAutomaticSize = value.automaticSize
							end
							host.Visible = p4.visible
						end
					end
				}
				tbl_1[p3] = t_1
				
				return t_1
			end
			return var5
		end
		
		local function _(p3, p4)
			-- upvalues: getPortState (ref)
			if p4 == nil then
				p3.bindPlacement(nil, nil)
				
				return
			end
			local var5 = getPortState(p3)
			var5.pendingAssignment = p4
			var5.pendingPlacementId = p4.adapterData.placementId
			p3.bindPlacement("composition", var5.port)
		end
		
		local _ = function(p3)
			-- upvalues: t_2 (ref), var2 (write), var3 (write), p2 (ref)
			t_2[p3] = true
			
			if var2 or var3 then
				return
			end
			var2 = true
			p2()
		end
		
		local function ensureReconciler()
			-- upvalues: var4 (write), p1 (ref), getPortState (ref)
			if var4 == nil then
				local t = {}
				local t_1 = {}
				local var5 = 1
				
				local function assignmentFor(value, p3)
					-- upvalues: var5 (write)
					local var6 = p3
					
					if var6 == nil then
						var6 = var5
						var5 += 1
					end
					return {
						key = value.key,
						index = value.index,
						value = value.value,
						generation = var6,
						adapterData = { placementId = value.placementId }
					}
				end
				
				local t_2 = {
					update = function(p3)
						-- upvalues: t (write), assignmentFor (ref), p1 (copy), t_1 (ref), getPortState (copy)
						local t_2 = {}
						
						for i, v in t do
							t_2[v.desired.key] = v
						end
						local t_3 = {}
						local t_4 = {}
						local t_5 = {}
						local t_6 = {}
						local t_7 = {}
						
						for i_1, v_1 in p3 do
							assert(t_3[v_1.key] == nil, `CompositionPlacementManager: duplicate key "{v_1.key}"`)
							t_3[v_1.key] = true
							local key = t_2[v_1.key]
							
							if key == nil or key.viewType ~= v_1.viewType then
								table.insert(t_5, { viewType = v_1.viewType })
								table.insert(t_6, { desired = v_1, viewType = v_1.viewType })
							else
								t_2[v_1.key] = nil
								
								if key.desired ~= v_1 then
									key.assignment = assignmentFor(v_1, key.assignment.generation)
									table.insert(t_7, { record = key.record, assignment = key.assignment })
								end
								key.desired = v_1
								table.insert(t_6, key)
							end
						end
						for i_1, v_2 in t do
							if t_2[v_2.desired.key] == v_2 then
								table.insert(t_4, { record = v_2.record, leaseToken = v_2.leaseToken })
							end
						end
						local var6 = p1.exchange(t_1, t_4, t_5)
						local var7 = 1
						local t_8 = {}
						
						for i_3, v_3 in t_6 do
							if v_3.record == nil then
								local var8 = var6.acquired[var7]
								var7 += 1
								v_3.record = var8.record
								v_3.leaseToken = var8.leaseToken
								v_3.assignment = assignmentFor(v_3.desired)
								table.insert(t_7, { record = var8.record, assignment = v_3.assignment })
							end
							t_8[v_3.record] = true
						end
						for i_3, v_4 in t_4 do
							if not t_8[v_4.record] then
								table.insert(t_7, { assignment = nil, record = v_4.record })
							end
						end
						t = t_6
						
						for i_3, v_5 in t_7 do
							local record = v_5.record
							local assignment = v_5.assignment
							
							if assignment == nil then
								record.bindPlacement(nil, nil)
							else
								local var9 = getPortState(record)
								var9.pendingAssignment = assignment
								var9.pendingPlacementId = assignment.adapterData.placementId
								record.bindPlacement("composition", var9.port)
							end
						end
						for i_3, v_6 in t_7 do
							v_6.record.set(v_6.assignment)
						end
					end,
					getRecords = function()
						-- upvalues: t (write)
						local t_1 = {}
						
						for i, v in t do
							table.insert(t_1, v.record)
						end
						return t_1
					end
				}
				var4 = t_2
				
				return t_2
			end
			return var4
		end
		
		return {
			register = function(p4, p5, p6, p7, p8)
				-- upvalues: var3 (write), tbl (ref), var1 (write), t (ref), t_2 (ref), var2 (write), p2 (ref), getPortState (ref), t_1 (ref)
				assert(not var3, "CompositionPlacementManager: cannot register after destroy")
				local var10 = tbl[p5]
				
				if var10 == nil then
					var10 = var1
					var1 += 1
					tbl[p5] = var10
				end
				assert(t[var10] == nil, "CompositionPlacementManager: placement is already registered")
				t[var10] = {
					record = nil,
					viewType = p4,
					parentSignal = p6,
					props = p7,
					placeholder = p8
				}
				t_2[var10] = true
				
				if not var2 and not var3 then
					var2 = true
					p2()
				end
				local var11 = true
				
				return {
					setPlaceholder = function(value)
						-- upvalues: var11 (write), var3 (copy), t (copy), var10 (write), getPortState (copy), t_2 (copy), var2 (copy), p2 (copy)
						if not var11 or var3 then return end
						local var12 = t[var10]
						
						if var12 == nil then return end
						local placeholder = var12.placeholder
						
						if placeholder == value then return end
						if placeholder ~= nil and var12.record ~= nil then
							getPortState(var12.record).port.apply(nil)
						end
						var12.placeholder = value
						t_2[var10] = true
						
						if not var2 then
							if var3 then return end
							var2 = true
							p2()
						end
					end,
					setProps = function(value)
						-- upvalues: var11 (write), var3 (copy), t (copy), var10 (write), t_2 (copy), var2 (copy), p2 (copy)
						if not var11 or var3 then return end
						local var12 = t[var10]
						
						if var12 == nil then return end
						var12.props = value
						t_2[var10] = true
						
						if not var2 then
							if var3 then return end
							var2 = true
							p2()
						end
					end,
					unregister = function()
						-- upvalues: var11 (write), var3 (copy), t (copy), var10 (write), getPortState (copy), t_1 (copy), t_2 (copy), var2 (copy), p2 (copy)
						if not var11 then return end
						var11 = false
						
						if var3 then return end
						local var12 = t[var10]
						
						if var12 == nil then return end
						if var12.record ~= nil then
							getPortState(var12.record).port.apply(nil)
						end
						t[var10] = nil
						t_1[var10] = nil
						t_2[var10] = true
						
						if not var2 then
							if var3 then return end
							var2 = true
							p2()
						end
					end
				}
			end,
			flush = function()
				-- upvalues: var2 (write), var3 (write), t (ref), t_1 (ref), t_2 (ref), var4 (write), ensureReconciler (ref)
				if not var2 or var3 then return end
				var2 = false
				local t_3 = {}
				
				for i, v in t do
					local var10 = t_1[i]
					
					if t_2[i] or var10 == nil then
						local var11 = v.parentSignal(false)
						local placeholder = v.placeholder
						var10 = nil
						
						if var11 ~= nil and placeholder ~= nil then
							local t_4 = {}
							local key = var11.key
							t_4.key = `{#key}:{key}:{i}`
							t_4.viewType = v.viewType
							t_4.index = var11.index
							t_4.placementId = i
							t_4.value = {
								props = v.props,
								placeholder = placeholder,
								automaticSize = Enum.AutomaticSize.XY
							}
							var10 = t_4
						end
						t_1[i] = var10
					end
					if var10 ~= nil then
						table.insert(t_3, var10)
					end
				end
				table.clear(t_2)
				
				if #t_3 > 0 or var4 ~= nil then
					ensureReconciler().update(t_3)
				end
			end,
			destroy = function()
				-- upvalues: var3 (write), var2 (write), var4 (write), t (ref), t_1 (ref), t_2 (ref), tbl_1 (ref)
				if var3 then return end
				var3 = true
				var2 = false
				
				if var4 ~= nil then
					var4.update({})
				end
				table.clear(t)
				table.clear(t_1)
				table.clear(t_2)
				table.clear(tbl_1)
			end
		}
	end
}