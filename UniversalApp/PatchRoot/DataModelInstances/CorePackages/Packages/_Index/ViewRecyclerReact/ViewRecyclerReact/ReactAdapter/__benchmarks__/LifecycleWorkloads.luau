local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local viewRecyclerModule = require(viewRecyclerReact.Parent.ViewRecycler)
local compositionPlacementManagerModule = require(viewRecyclerReact.ReactAdapter.Private.CompositionPlacementManager)
local recyclingRuntimeModule = require(viewRecyclerReact.ReactAdapter.Private.RecyclingRuntime)
local signalsModule = require(viewRecyclerReact.Parent.Signals)
local signalsExperimentalModule = require(viewRecyclerReact.Parent.SignalsExperimental)
local createRecyclableViewModule = require(viewRecyclerReact.ReactAdapter.createRecyclableView)
local recyclableViewRecordModule = require(viewRecyclerReact.ReactAdapter.Private.RecyclableViewRecord)

local function _()
	-- upvalues: createRecyclableViewModule (ref)
	return createRecyclableViewModule(function()
		return nil
	end, { readiness = "ReadyOnAssignment" })
end

return {
	recyclingScopeHighWater = function(p1, p2)
		-- upvalues: recyclingRuntimeModule (ref), createRecyclableViewModule (ref)
		local var1 = 0
		local var2 = recyclingRuntimeModule.new(function()
			-- upvalues: var1 (write)
			var1 += 1
		end)
		local recyclingScope = var2.getRecyclingScope({})
		local var3 = recyclingScope == var2.getRecyclingScope({})
		local var4 = createRecyclableViewModule(function()
			return nil
		end, { readiness = "ReadyOnAssignment" })
		local var5 = createRecyclableViewModule(function()
			return nil
		end, { readiness = "ReadyOnAssignment" })
		local var6 = p2()
		local t = {}
		local list = table.create(p1)
		local list_1 = table.create(p1)
		
		for i = 1, p1 do
			list[i] = { viewType = var4 }
			list_1[i] = {
				key = `item{i}`,
				index = i,
				value = {
					props = {},
					placeholder = Instance.new("Frame"),
					automaticSize = Enum.AutomaticSize.XY
				},
				generation = i
			}
		end
		local acquired = recyclingScope.exchange(t, {}, list).acquired
		
		for i_1, v in acquired do
			v.record.set(list_1[i_1])
		end
		local list_2 = table.create(p1)
		local list_3 = table.create(p1)
		
		for i_2 = 1, p1 do
			list_2[i_2] = { viewType = var5 }
			list_3[i_2] = {
				key = `listItem{i_2}`,
				index = i_2,
				value = i_2,
				generation = p1 + i_2
			}
		end
		local acquired_1 = recyclingScope.exchange(t, acquired, list_2).acquired
		
		for i_3, v_1 in acquired_1 do
			v_1.record.set(list_3[i_3])
		end
		for i_4, v_2 in list_1 do
			v_2.value.placeholder:Destroy()
		end
		local var7 = (p2() - var6) * 1000
		local count = #recyclingScope.getScopeInventory()
		local count_1 = #recyclingScope.getScopeInventory()
		local var8 = 0
		
		for i_5 in var2.getHostChildren(function()
			return nil
		end) do
			var8 += 1
		end
		recyclingScope.exchange(t, acquired_1, {})
		var2.destroy()
		
		return var7, {
			scopeWideHostScans = 0,
			createdHosts = count,
			listItemHosts = count_1,
			publishedHosts = var8,
			sameListRecyclingScope = var3,
			hostChanges = var1,
			completionPhaseCounts = { scopePublication = { synchronousBatch = 1 } }
		}
	end,
	compositionChurn = function(p3)
		-- upvalues: viewRecyclerModule (ref), recyclableViewRecordModule (ref), signalsExperimentalModule (ref), compositionPlacementManagerModule (ref), createRecyclableViewModule (ref), signalsModule (ref)
		local var9 = 1
		local var10 = 0
		local var11 = viewRecyclerModule.Adapter.createRecyclingScope({
			adapter = {
				create = function(p4)
					-- upvalues: recyclableViewRecordModule (copy), var9 (write), var10 (write)
					local var12 = recyclableViewRecordModule(var9, p4, nil)
					var9 += 1
					local set = var12.set
					
					function var36.set(p5)
						-- upvalues: var10 (copy), set (ref)
						var10 += 1
						set(p5)
					end
					
					return var12
				end,
				destroy = function() end,
				batch = signalsExperimentalModule.batch
			}
		})
		local var12 = compositionPlacementManagerModule.new(var11, function() end)
		local var13 = createRecyclableViewModule(function()
			return nil
		end, { readiness = "ReadyOnAssignment" })
		local list = table.create(p3)
		local list_1 = table.create(p3)
		
		for i = 1, p3 do
			local var14 = signalsModule.createSignal({ generation = 1, key = `parent{i}`, index = i, value = i })
			local frame = Instance.new("Frame")
			list_1[i] = frame
			list[i] = var12.register(var13, {}, var14, {}, frame)
		end
		var12.flush()
		var10 = 0
		local var15 = 0
		local var16 = 0
		local var17 = 1
		
		return {
			run = function()
				-- upvalues: var16 (write), p3 (ref), list (ref), var17 (write), var12 (ref), var15 (write)
				var16 += 1
				
				for i = 1, p3 do
					list[var17].setProps({ revision = var16, update = i })
				end
				var12.flush()
				var15 += 1
				var17 = var17 % p3 + 1
			end,
			getAssignmentUpdates = function()
				-- upvalues: var10 (write)
				return var10
			end,
			getFlushes = function()
				-- upvalues: var15 (write)
				return var15
			end,
			destroy = function()
				-- upvalues: var12 (ref), var11 (ref), list_1 (ref)
				var12.destroy()
				var11.destroy()
				
				for i, v in list_1 do
					v:Destroy()
				end
			end
		}
	end
}