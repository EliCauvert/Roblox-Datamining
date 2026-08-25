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
	recyclingScopeHighWater = function(p0, p1)
		-- upvalues: recyclingRuntimeModule (ref), createRecyclableViewModule (ref)
		local var8 = 0
		local var9 = recyclingRuntimeModule.new(function()
			-- upvalues: var8 (write)
			var8 += 1
		end)
		local recyclingScope = var9.getRecyclingScope({})
		local var11 = recyclingScope == var9.getRecyclingScope({})
		local var12 = createRecyclableViewModule(function()
			return nil
		end, { readiness = "ReadyOnAssignment" })
		local var13 = createRecyclableViewModule(function()
			return nil
		end, { readiness = "ReadyOnAssignment" })
		local var14 = p1()
		local t = {}
		local list = table.create(p0)
		local list_1 = table.create(p0)
		
		for i = 1, p0 do
			list[i] = { viewType = var12 }
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
		local list_2 = table.create(p0)
		local list_3 = table.create(p0)
		
		for i_2 = 1, p0 do
			list_2[i_2] = { viewType = var13 }
			list_3[i_2] = {
				key = `listItem{i_2}`,
				index = i_2,
				value = i_2,
				generation = p0 + i_2
			}
		end
		local acquired_1 = recyclingScope.exchange(t, acquired, list_2).acquired
		
		for i_3, v_1 in acquired_1 do
			v_1.record.set(list_3[i_3])
		end
		for i_4, v_2 in list_1 do
			v_2.value.placeholder:Destroy()
		end
		local var20 = (p1() - var14) * 1000
		local count = #recyclingScope.getScopeInventory()
		local count_1 = #recyclingScope.getScopeInventory()
		local var23 = 0
		
		for i_5 in var9.getHostChildren(function()
			return nil
		end) do
			var23 += 1
		end
		recyclingScope.exchange(t, acquired_1, {})
		var9.destroy()
		
		return var20, {
			scopeWideHostScans = 0,
			createdHosts = count,
			listItemHosts = count_1,
			publishedHosts = var23,
			sameListRecyclingScope = var11,
			hostChanges = var8,
			completionPhaseCounts = { scopePublication = { synchronousBatch = 1 } }
		}
	end,
	compositionChurn = function(p2)
		-- upvalues: viewRecyclerModule (ref), recyclableViewRecordModule (ref), signalsExperimentalModule (ref), compositionPlacementManagerModule (ref), createRecyclableViewModule (ref), signalsModule (ref)
		local var24 = 1
		local var25 = 0
		local var26 = viewRecyclerModule.Adapter.createRecyclingScope({
			adapter = {
				create = function(p3)
					-- upvalues: recyclableViewRecordModule (copy), var24 (write), var25 (write)
					local var36 = recyclableViewRecordModule(var24, p3, nil)
					var24 += 1
					local set = var36.set
					
					function var36.set(p4)
						-- upvalues: var25 (copy), set (ref)
						var25 += 1
						set(p4)
					end
					
					return var36
				end,
				destroy = function() end,
				batch = signalsExperimentalModule.batch
			}
		})
		local var27 = compositionPlacementManagerModule.new(var26, function() end)
		local var28 = createRecyclableViewModule(function()
			return nil
		end, { readiness = "ReadyOnAssignment" })
		local list = table.create(p2)
		local list_1 = table.create(p2)
		
		for i = 1, p2 do
			local var31 = signalsModule.createSignal({ generation = 1, key = `parent{i}`, index = i, value = i })
			local frame = Instance.new("Frame")
			list_1[i] = frame
			list[i] = var27.register(var28, {}, var31, {}, frame)
		end
		var27.flush()
		var25 = 0
		local var33 = 0
		local var34 = 0
		local var35 = 1
		
		return {
			run = function()
				-- upvalues: var34 (write), p2 (ref), list (ref), var35 (write), var27 (ref), var33 (write)
				var34 += 1
				
				for i = 1, p2 do
					list[var35].setProps({ revision = var34, update = i })
				end
				var27.flush()
				var33 += 1
				var35 = var35 % p2 + 1
			end,
			getAssignmentUpdates = function()
				-- upvalues: var25 (write)
				return var25
			end,
			getFlushes = function()
				-- upvalues: var33 (write)
				return var33
			end,
			destroy = function()
				-- upvalues: var27 (ref), var26 (ref), list_1 (ref)
				var27.destroy()
				var26.destroy()
				
				for i, v in list_1 do
					v:Destroy()
				end
			end
		}
	end
}