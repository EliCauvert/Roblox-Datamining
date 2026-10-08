local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local viewRecyclerModule = require(viewRecyclerReact.Parent.ViewRecycler)
local placementKindModule = require(script.Parent.PlacementKind)
local _ = require(viewRecyclerReact.Parent.React)
local recyclableViewRegistryModule = require(script.Parent.RecyclableViewRegistry)
local signalsModule = require(viewRecyclerReact.Parent.Signals)
local frozen = table.freeze({})

local function _(p1, p2)
	return `{#p1}:{p1}:{p2}`
end

return {
	new = function(p1)
		-- upvalues: viewRecyclerModule (ref), recyclableViewRegistryModule (ref), placementKindModule (ref), signalsModule (ref), frozen (ref)
		local var1 = viewRecyclerModule.Adapter.createSlotBinder({
			recyclingScope = p1,
			prepareDesiredAssignment = function(value)
				local value_1 = value.value
				local t = {}
				local key = value_1.parentAssignment.key
				t.key = `{#key}:{key}:{tonumber(value.key)}`
				t.value = value_1.itemSignal
				
				return t
			end
		})
		local t = {}
		local t_1 = {}
		local tbl = setmetatable({}, { __mode = "k" })
		local var2 = 1
		local t_2 = {}
		local var3 = false
		local var4 = 0
		local var5 = false
		local var6 = false
		local t_3 = {}
		local t_4 = {}
		local tbl_1 = setmetatable({}, { __mode = "k" })
		local _ = nil
		local _ = nil
		local _ = nil
		local var7 = nil
		
		local function _(p2)
			-- upvalues: t_4 (ref)
			local var8 = t_4[p2]
			
			if var8 ~= nil then
				for i in var8 do
					i()
				end
			end
		end
		
		local function detachDependency(p3)
			-- upvalues: tbl_1 (ref), t_3 (ref), t_4 (ref)
			local var9 = tbl_1[p3]
			
			if var9 == nil then return end
			tbl_1[p3] = nil
			local var10 = t_3[var9]
			
			if var10 ~= nil then
				var10[p3] = nil
				
				if next(var10) == nil then
					t_3[var9] = nil
				end
			end
			local var11 = t_4[var9]
			
			if var11 ~= nil then
				for i in var11 do
					i()
				end
			end
		end
		
		local function attachDependency(p4, p5, p6)
			-- upvalues: recyclableViewRegistryModule (copy), tbl_1 (ref), t_3 (ref), t_4 (ref)
			local metadata = recyclableViewRegistryModule.getMetadata(p5.viewType)
			
			if metadata == nil or not metadata.contributesToParentMeasurement then
				local var12 = tbl_1[p6]
				
				if var12 == nil then return end
				tbl_1[p6] = nil
				local var13 = t_3[var12]
				
				if var13 ~= nil then
					var13[p6] = nil
					
					if next(var13) == nil then
						t_3[var12] = nil
					end
				end
				local var14 = t_4[var12]
				
				if var14 ~= nil then
					for i in var14 do
						i()
					end
				end
				return
			elseif tbl_1[p6] == p4 then return end
			local var15 = tbl_1[p6]
			
			if var15 ~= nil then
				tbl_1[p6] = nil
				local var16 = t_3[var15]
				
				if var16 ~= nil then
					var16[p6] = nil
					
					if next(var16) == nil then
						t_3[var15] = nil
					end
				end
				local var17 = t_4[var15]
				
				if var17 ~= nil then
					for i in var17 do
						i()
					end
				end
			end
			local var18 = t_3[p4]
			
			if var18 == nil then
				var18 = {}
				t_3[p4] = var18
			end
			var18[p6] = true
			tbl_1[p6] = p4
			local var19 = t_4[p4]
			
			if var19 ~= nil then
				for i in var19 do
					i()
				end
			end
		end
		
		local function desiredFor(p7)
			-- upvalues: t (ref)
			local var20 = t[p7]
			
			if var20 == nil then
				return nil
			end
			local var21 = var20.parentSignal(false)
			local active = var20.active
			
			return if (if active ~= nil then if type(active) == "function" then active(false) else active else true) and var21 ~= nil and var20.placeholder ~= nil then {
				placementId = p7,
				placement = var20,
				parentAssignment = var21,
				placeholder = var20.placeholder
			} else nil
		end
		
		local function makeState(p7, p8)
			-- upvalues: placementKindModule (copy), var7 (write), attachDependency (ref), detachDependency (ref)
			local parentAssignment = p7.parentAssignment
			local placement = p7.placement
			
			return table.freeze({
				index = nil,
				assignment = p8,
				destination = table.freeze({
					kind = placementKindModule.Composition,
					placementId = p7.placementId,
					placeholder = p7.placeholder,
					automaticSize = Enum.AutomaticSize.XY,
					compositionPlacement = var7,
					attachMeasurementDependency = function(p9)
						-- upvalues: attachDependency (copy), parentAssignment (ref), placement (ref)
						attachDependency(parentAssignment, placement, p9)
					end,
					detachMeasurementDependency = detachDependency
				})
			})
		end
		
		local function reconcileDirty()
			-- upvalues: t_2 (ref), desiredFor (ref), t_1 (ref), var1 (ref), var5 (write), makeState (ref)
			local t = {}
			
			for i in t_2 do
				table.insert(t, i)
			end
			local v_1
			table.sort(t)
			local t_3 = {}
			local t_4 = {}
			local t_5 = {}
			
			for i_1, v in t do
				local i_2 = desiredFor(v)
				v_1 = t_1[v]
				
				if i_2 == nil then
					if v_1 ~= nil then
						table.insert(t_4, tostring(v))
					end
				end
				t_3[v] = i_2
				table.insert(t_5, {
					key = tostring(v),
					value = if v_1 == nil or v_1.source.parentAssignment ~= i_2.parentAssignment or v_1.source.itemSignal ~= i_2.placement.itemSignal then table.freeze({
						parentAssignment = i_2.parentAssignment,
						itemSignal = i_2.placement.itemSignal
					}) else v_1.source,
					viewType = i_2.placement.viewType,
					placementId = v
				})
			end
			table.clear(t_2)
			local ok, status = pcall(var1.apply, t_4, t_5)
			
			if not ok then
				for i_2, v_1 in t do
					t_2[v_1] = true
				end
				error(status, 0)
			end
			for i_2, v_1 in t do
				if t_3[v_1] == nil then
					t_1[v_1] = nil
				end
			end
			local t_6 = {}
			
			for v_1, v_3 in status.entered do
				t_1[v_3.placementId] = { state = nil, view = v_3.view, source = v_3.value }
				t_6[v_3.view] = true
			end
			for v_1, v_4 in status.updated do
				t_1[v_4.placementId].source = v_4.value
			end
			var5 = true
			
			for v_1, v_5 in status.departed do
				v_5.transition(nil)
			end
			for v_1, v_6 in t do
				local var20 = t_3[v_6]
				local var21 = t_1[v_6]
				
				if var20 ~= nil and var21 ~= nil then
					local assignment = var1.get(tostring(v_6)).assignment
					local state = var21.state
					
					if t_6[var21.view] or state == nil or (state.assignment ~= assignment or state.destination.placeholder ~= var20.placeholder) then
						local var22 = makeState(var20, assignment)
						var21.state = var22
						var21.view.transition(var22)
					end
				end
			end
			var5 = false
		end
		
		local var23 = function()
			-- upvalues: var6 (write), var3 (write), var5 (write), t_2 (ref), reconcileDirty (ref)
			if var6 or var3 then return end
			assert(not var5, "CompositionPlacement: cannot flush after a publication failure")
			var3 = true
			local ok, status = pcall(function()
				-- upvalues: t_2 (copy), reconcileDirty (copy)
				while next(t_2) ~= nil do
					reconcileDirty()
				end
			end)
			var3 = false
			
			if not ok then
				error(status, 0)
			end
		end
		
		local var24 = function()
			-- upvalues: var6 (write), t_2 (ref), var4 (write), var3 (write), var23 (write)
			if not var6 and next(t_2) ~= nil and (var4 == 0 and not var3) then
				var23()
			end
		end
		
		local _ = function(p7)
			-- upvalues: var6 (write), t_2 (ref), var24 (write)
			if not var6 then
				t_2[p7] = true
				var24()
			end
		end
		
		local var25 = function(p7)
			-- upvalues: var4 (write), var24 (write)
			var4 += 1
			local packed = table.pack(pcall(p7))
			var4 -= 1
			
			if not packed[1] then
				error(packed[2], 0)
			end
			var24()
			
			return table.unpack(packed, 2, packed.n)
		end
		
		return {
			register = function(p7, p8, p9, p10, p11, p12)
				-- upvalues: var25 (write), var6 (write), tbl (ref), var2 (write), t (ref), signalsModule (copy), t_2 (ref), var24 (write)
				return var25(function()
					-- upvalues: var6 (copy), tbl (copy), p8 (ref), var2 (copy), t (copy), p7 (ref), p9 (ref), p10 (ref), p11 (ref), p12 (ref), signalsModule (copy), t_2 (copy), var24 (copy), var25 (copy)
					assert(not var6, "CompositionPlacement: cannot register after destroy")
					local var26 = tbl[p8]
					
					if var26 == nil then
						var26 = var2
						var2 += 1
						tbl[p8] = var26
					end
					assert(t[var26] == nil, "CompositionPlacement: placement is already registered")
					local t_1 = {
						disposeActiveEffect = nil,
						disposeParentAssignmentEffect = nil,
						viewType = p7,
						parentSignal = p9,
						itemSignal = p10,
						placeholder = p11,
						active = p12
					}
					t[var26] = t_1
					
					local function _()
						-- upvalues: t_1 (ref), signalsModule (copy), var26 (write), var6 (copy), t_2 (copy), var24 (copy)
						if type(t_1.active) == "function" then
							t_1.disposeActiveEffect = signalsModule.createEffect(function(p13)
								-- upvalues: t_1 (copy), var26 (copy), var6 (copy), t_2 (copy), var24 (copy)
								t_1.active(p13)
								
								if not var6 then
									t_2[var26] = true
									var24()
								end
							end)
						end
					end
					
					if type(t_1.active) == "function" then
						t_1.disposeActiveEffect = signalsModule.createEffect(function(p13)
							-- upvalues: t_1 (ref), var26 (write), var6 (copy), t_2 (copy), var24 (copy)
							t_1.active(p13)
							
							if not var6 then
								t_2[var26] = true
								var24()
							end
						end)
					end
					local var27 = nil
					local var28 = false
					t_1.disposeParentAssignmentEffect = signalsModule.createEffect(function(p13)
						-- upvalues: p9 (copy), var28 (write), var27 (write), var26 (write), var6 (copy), t_2 (copy), var24 (copy)
						local var29 = p9(p13)
						
						if not var28 or var27 ~= var29 then
							var28 = true
							var27 = var29
							local var30 = var26
							
							if not var6 then
								t_2[var30] = true
								var24()
							end
						end
					end)
					local var29 = var26
					
					if not var6 then
						t_2[var29] = true
						var24()
					end
					local var30 = true
					
					return {
						setActive = function(value)
							-- upvalues: var25 (copy), var30 (write), var6 (copy), t_1 (ref), signalsModule (copy), var26 (write), t_2 (copy), var24 (copy)
							var25(function()
								-- upvalues: var30 (copy), var6 (copy), t_1 (copy), value (ref), signalsModule (copy), var26 (copy), t_2 (copy), var24 (copy)
								if not var30 or var6 or t_1.active == value then return end
								if t_1.disposeActiveEffect ~= nil then
									t_1.disposeActiveEffect()
									t_1.disposeActiveEffect = nil
								end
								t_1.active = value
								
								if type(t_1.active) == "function" then
									t_1.disposeActiveEffect = signalsModule.createEffect(function(p13)
										-- upvalues: t_1 (copy), var26 (copy), var6 (copy), t_2 (copy), var24 (copy)
										t_1.active(p13)
										
										if not var6 then
											t_2[var26] = true
											var24()
										end
									end)
								end
								if not var6 then
									t_2[var26] = true
									var24()
								end
							end)
						end,
						setPlaceholder = function(value)
							-- upvalues: var25 (copy), var30 (write), var6 (copy), t_1 (ref), var26 (write), t_2 (copy), var24 (copy)
							var25(function()
								-- upvalues: var30 (copy), var6 (copy), t_1 (copy), value (ref), var26 (copy), t_2 (copy), var24 (copy)
								if var30 and not var6 and t_1.placeholder ~= value then
									t_1.placeholder = value
									local var31 = var26
									
									if not var6 then
										t_2[var31] = true
										var24()
									end
								end
							end)
						end,
						setItemSignal = function(value)
							-- upvalues: var25 (copy), var30 (write), var6 (copy), t_1 (ref), var26 (write), t_2 (copy), var24 (copy)
							var25(function()
								-- upvalues: var30 (copy), var6 (copy), t_1 (copy), value (ref), var26 (copy), t_2 (copy), var24 (copy)
								if var30 and not var6 and t_1.itemSignal ~= value then
									t_1.itemSignal = value
									local var31 = var26
									
									if not var6 then
										t_2[var31] = true
										var24()
									end
								end
							end)
						end,
						unregister = function()
							-- upvalues: var25 (copy), var30 (write), var6 (copy), t_1 (ref), t (copy), var26 (write), t_2 (copy), var24 (copy)
							var25(function()
								-- upvalues: var30 (copy), var6 (copy), t_1 (copy), t (copy), var26 (copy), t_2 (copy), var24 (copy)
								if not var30 then return end
								var30 = false
								
								if var6 then return end
								if t_1.disposeActiveEffect ~= nil then
									t_1.disposeActiveEffect()
								end
								if t_1.disposeParentAssignmentEffect ~= nil then
									t_1.disposeParentAssignmentEffect()
								end
								t[var26] = nil
								
								if not var6 then
									t_2[var26] = true
									var24()
								end
							end)
						end
					}
				end)
			end,
			getMeasurementDependencies = function(p7)
				-- upvalues: t_3 (ref), frozen (copy)
				local var26 = t_3[p7]
				
				if var26 == nil then
					return frozen
				end
				local t = {}
				
				for i in var26 do
					table.insert(t, i)
				end
				return t
			end,
			subscribeMeasurementDependencies = function(p8, p9)
				-- upvalues: var6 (write), t_4 (ref)
				assert(not var6, "CompositionPlacement: cannot subscribe after destroy")
				local var27 = t_4[p8]
				
				if var27 == nil then
					var27 = {}
					t_4[p8] = var27
				end
				var27[p9] = true
				local var28 = true
				
				return function()
					-- upvalues: var28 (write), var27 (write), p9 (ref), t_4 (copy), p8 (ref)
					if var28 then
						var28 = false
						var27[p9] = nil
						
						if next(var27) == nil then
							t_4[p8] = nil
						end
					end
				end
			end,
			flush = var23,
			destroy = function()
				-- upvalues: var6 (write), t_2 (ref), t (ref), t_1 (ref), var1 (ref), t_3 (ref), t_4 (ref), tbl_1 (ref)
				if var6 then return end
				var6 = true
				table.clear(t_2)
				
				for i, v in t do
					if v.disposeActiveEffect ~= nil then
						v.disposeActiveEffect()
					end
					if v.disposeParentAssignmentEffect ~= nil then
						v.disposeParentAssignmentEffect()
					end
				end
				for i, v_1 in t_1 do
					v_1.view.transition(nil)
				end
				var1.destroy()
				table.clear(t)
				table.clear(t_1)
				table.clear(t_3)
				table.clear(t_4)
				table.clear(tbl_1)
			end
		}
	end
}