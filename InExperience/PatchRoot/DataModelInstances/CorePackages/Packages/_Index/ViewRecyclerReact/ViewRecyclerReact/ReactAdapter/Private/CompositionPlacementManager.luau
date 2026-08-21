local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local viewRecyclerModule = require(viewRecyclerReact.Parent.ViewRecycler)
local _ = require(viewRecyclerReact.Parent.React)
local _ = require(script.Parent.RecyclableViewRegistry)
local _ = require(viewRecyclerReact.Parent.Signals)
local reparentableHost = require(viewRecyclerReact.Parent.ViewRecyclerRoblox).ReparentableHost
local record = viewRecyclerModule.Adapter._Private.Record
local frozen = table.freeze({ "key", "generation" })

local function _(p0, p1) --[[ line: 128 | named "compositeKey" ]]
	return `{#p0}:{p0}:{p1}`
end

return {
	new = function(p2, p3) --[[ line: 132 ]]
		-- upvalues: reparentableHost (ref), record (ref), frozen (ref)
		local t = {}
		local tbl = setmetatable({}, { __mode = "k" })
		local var5 = 1
		local t_1 = {}
		local t_2 = {}
		local var8 = false
		local var9 = false
		local var10 = nil
		local tbl_1 = setmetatable({}, { __mode = "k" })
		
		local function getPortState(p4) --[[ line: 143 ]]
			-- upvalues: tbl_1 (ref), t (ref), reparentableHost (copy), record (copy), frozen (copy)
			local var14 = tbl_1[p4]
			
			if var14 == nil then
				local _ = nil
				local t_1 = {
					pendingAssignment = nil,
					pendingPlacementId = nil,
					currentPlacementId = nil,
					currentPlaceholder = nil,
					currentAutomaticSize = nil,
					port = nil,
					record = p4
				}
				t_1.port = {
					apply = function(p5) --[[ line: 158 ]]
						-- upvalues: t_1 (write), t (copy), p4 (ref), reparentableHost (copy), record (copy), frozen (copy)
						if p5 == nil then
							t_1.pendingAssignment = nil
							t_1.pendingPlacementId = nil
							local currentPlacementId = t_1.currentPlacementId
							t_1.currentPlacementId = nil
							t_1.currentPlaceholder = nil
							t_1.currentAutomaticSize = nil
							local var16 = if currentPlacementId == nil then nil else t[currentPlacementId]
							
							if var16 ~= nil and var16.record == p4 then
								var16.record = nil
							end
							local var17 = p4.portalFrame(false)
							
							if var17 ~= nil then
								reparentableHost.detach(var17)
								var17.AnchorPoint = Vector2.zero
								var17.Position = UDim2.new()
								var17.Size = UDim2.new()
								var17.AutomaticSize = Enum.AutomaticSize.None
							end
							return
						else
							local pendingAssignment = t_1.pendingAssignment or p4.signal(false)
							local pendingPlacementId = t_1.pendingPlacementId or t_1.currentPlacementId
							assert(pendingAssignment ~= nil, "CompositionPlacementManager: placement attach or update requires an Assignment")
							assert(pendingPlacementId ~= nil, "CompositionPlacementManager: placement requires a destination")
							
							if p5.assignment == nil or not record.containsEqual(p5.assignment, pendingAssignment, frozen) then return end
							t_1.pendingAssignment = nil
							t_1.pendingPlacementId = nil
							local currentPlacementId = t_1.currentPlacementId
							
							if currentPlacementId ~= nil and currentPlacementId ~= pendingPlacementId then
								local var20 = t[currentPlacementId]
								
								if var20 ~= nil and var20.record == p4 then
									var20.record = nil
								end
							end
							t_1.currentPlacementId = pendingPlacementId
							local var21 = t[pendingPlacementId]
							
							if var21 ~= nil then
								var21.record = p4
							end
							local host = p5.host
							assert(host ~= nil, "CompositionPlacementManager: cannot place a destroyed Recyclable view")
							local value = pendingAssignment.value
							
							if t_1.currentPlaceholder ~= value.placeholder or t_1.currentAutomaticSize ~= value.automaticSize or host.Parent ~= value.placeholder then
								reparentableHost.place(host, value)
								t_1.currentPlaceholder = value.placeholder
								t_1.currentAutomaticSize = value.automaticSize
							end
							host.Visible = p5.visible
						end
					end
				}
				tbl_1[p4] = t_1
				
				return t_1
			end
			return var14
		end
		
		local function _(p6, p7) --[[ line: 226 | named "preparePlacement" ]]
			-- upvalues: getPortState (ref)
			if p7 == nil then
				p6.bindPlacement(nil, nil)
				
				return
			end
			local var22 = getPortState(p6)
			var22.pendingAssignment = p7
			var22.pendingPlacementId = p7.adapterData.placementId
			p6.bindPlacement("composition", var22.port)
		end
		
		local _ = function(p8) --[[ line: 237 | named "markDirty" ]]
			-- upvalues: t_2 (ref), var8 (write), var9 (write), p3 (ref)
			t_2[p8] = true
			
			if var8 or var9 then
				return
			end
			var8 = true
			p3()
		end
		
		local function ensureReconciler() --[[ line: 246 ]]
			-- upvalues: var10 (write), p2 (ref), getPortState (ref)
			if var10 == nil then
				local t = {}
				local t_1 = {}
				local var25 = 1
				
				local function assignmentFor(value, p9) --[[ line: 255 ]]
					-- upvalues: var25 (write)
					local var28 = p9
					
					if var28 == nil then
						var28 = var25
						var25 += 1
					end
					return {
						key = value.key,
						index = value.index,
						value = value.value,
						generation = var28,
						adapterData = { placementId = value.placementId }
					}
				end
				
				local t_2 = {
					update = function(p10) --[[ line: 270 ]]
						-- upvalues: t (write), assignmentFor (ref), p2 (copy), t_1 (ref), getPortState (copy)
						local t_2 = {}
						
						for i, v in t do
							t_2[v.desired.key] = v
						end
						local t_3 = {}
						local t_4 = {}
						local t_5 = {}
						local t_6 = {}
						local t_7 = {}
						
						for i_1, v_1 in p10 do
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
						local var35 = p2.exchange(t_1, t_4, t_5)
						local var36 = 1
						local t_8 = {}
						
						for i_3, v_3 in t_6 do
							if v_3.record == nil then
								local var39 = var35.acquired[var36]
								var36 += 1
								v_3.record = var39.record
								v_3.leaseToken = var39.leaseToken
								v_3.assignment = assignmentFor(v_3.desired)
								table.insert(t_7, { record = var39.record, assignment = v_3.assignment })
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
								local var38 = getPortState(record)
								var38.pendingAssignment = assignment
								var38.pendingPlacementId = assignment.adapterData.placementId
								record.bindPlacement("composition", var38.port)
							end
						end
						for i_3, v_6 in t_7 do
							v_6.record.set(v_6.assignment)
						end
					end,
					getRecords = function() --[[ line: 338 ]]
						-- upvalues: t (write)
						local t_1 = {}
						
						for i, v in t do
							table.insert(t_1, v.record)
						end
						return t_1
					end
				}
				var10 = t_2
				
				return t_2
			end
			return var10
		end
		
		return {
			register = function(p11, p12, p13, p14, p15) --[[ line: 390 ]]
				-- upvalues: var9 (write), tbl (ref), var5 (write), t (ref), t_2 (ref), var8 (write), p3 (ref), getPortState (ref), t_1 (ref)
				assert(not var9, "CompositionPlacementManager: cannot register after destroy")
				local var41 = tbl[p12]
				
				if var41 == nil then
					var41 = var5
					var5 += 1
					tbl[p12] = var41
				end
				assert(t[var41] == nil, "CompositionPlacementManager: placement is already registered")
				t[var41] = {
					record = nil,
					viewType = p11,
					parentSignal = p13,
					props = p14,
					placeholder = p15
				}
				t_2[var41] = true
				
				if not var8 and not var9 then
					var8 = true
					p3()
				end
				local var42 = true
				
				return {
					setPlaceholder = function(value) --[[ line: 411 ]]
						-- upvalues: var42 (write), var9 (copy), t (copy), var41 (write), getPortState (copy), t_2 (copy), var8 (copy), p3 (copy)
						if not var42 or var9 then return end
						local var43 = t[var41]
						
						if var43 == nil then return end
						local placeholder = var43.placeholder
						
						if placeholder == value then return end
						if placeholder ~= nil and var43.record ~= nil then
							getPortState(var43.record).port.apply(nil)
						end
						var43.placeholder = value
						t_2[var41] = true
						
						if not var8 then
							if var9 then return end
							var8 = true
							p3()
						end
					end,
					setProps = function(value) --[[ line: 429 ]]
						-- upvalues: var42 (write), var9 (copy), t (copy), var41 (write), t_2 (copy), var8 (copy), p3 (copy)
						if not var42 or var9 then return end
						local var44 = t[var41]
						
						if var44 == nil then return end
						var44.props = value
						t_2[var41] = true
						
						if not var8 then
							if var9 then return end
							var8 = true
							p3()
						end
					end,
					unregister = function() --[[ line: 440 ]]
						-- upvalues: var42 (write), var9 (copy), t (copy), var41 (write), getPortState (copy), t_1 (copy), t_2 (copy), var8 (copy), p3 (copy)
						if not var42 then return end
						var42 = false
						
						if var9 then return end
						local var45 = t[var41]
						
						if var45 == nil then return end
						if var45.record ~= nil then
							getPortState(var45.record).port.apply(nil)
						end
						t[var41] = nil
						t_1[var41] = nil
						t_2[var41] = true
						
						if not var8 then
							if var9 then return end
							var8 = true
							p3()
						end
					end
				}
			end,
			flush = function() --[[ line: 350 ]]
				-- upvalues: var8 (write), var9 (write), t (ref), t_1 (ref), t_2 (ref), var10 (write), ensureReconciler (ref)
				if not var8 or var9 then return end
				var8 = false
				local t_3 = {}
				
				for i, v in t do
					local var47 = t_1[i]
					
					if t_2[i] or var47 == nil then
						local var48 = v.parentSignal(false)
						local placeholder = v.placeholder
						var47 = nil
						
						if var48 ~= nil and placeholder ~= nil then
							local t_4 = {}
							local key = var48.key
							t_4.key = `{#key}:{key}:{i}`
							t_4.viewType = v.viewType
							t_4.index = var48.index
							t_4.placementId = i
							t_4.value = {
								props = v.props,
								placeholder = placeholder,
								automaticSize = Enum.AutomaticSize.XY
							}
							var47 = t_4
						end
						t_1[i] = var47
					end
					if var47 ~= nil then
						table.insert(t_3, var47)
					end
				end
				table.clear(t_2)
				
				if #t_3 > 0 or var10 ~= nil then
					ensureReconciler().update(t_3)
				end
			end,
			destroy = function() --[[ line: 462 ]]
				-- upvalues: var9 (write), var8 (write), var10 (write), t (ref), t_1 (ref), t_2 (ref), tbl_1 (ref)
				if var9 then return end
				var9 = true
				var8 = false
				
				if var10 ~= nil then
					var10.update({})
				end
				table.clear(t)
				table.clear(t_1)
				table.clear(t_2)
				table.clear(tbl_1)
			end
		}
	end
}