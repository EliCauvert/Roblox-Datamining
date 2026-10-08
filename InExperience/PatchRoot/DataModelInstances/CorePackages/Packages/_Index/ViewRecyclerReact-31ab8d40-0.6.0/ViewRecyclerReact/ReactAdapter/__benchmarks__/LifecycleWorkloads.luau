local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local viewRecyclerModule = require(viewRecyclerReact.Parent.ViewRecycler)
local compositionPlacementModule = require(viewRecyclerReact.ReactAdapter.Private.CompositionPlacement)
local recyclableViewModule = require(viewRecyclerReact.ReactAdapter.Private.RecyclableView)
local recyclingRootModule = require(viewRecyclerReact.ReactAdapter.Private.RecyclingRoot)
local signalsModule = require(viewRecyclerReact.Parent.Signals)
local signalsExperimentalModule = require(viewRecyclerReact.Parent.SignalsExperimental)
local createRecyclableViewModule = require(viewRecyclerReact.ReactAdapter.createRecyclableView)

local function _()
	-- upvalues: createRecyclableViewModule (ref)
	return createRecyclableViewModule(function()
		return nil
	end, { readiness = "ReadyOnAssignment" })
end

return {
	recyclingScopeHighWater = function(p1, p2)
		-- upvalues: recyclingRootModule (ref), createRecyclableViewModule (ref)
		local var1 = 0
		local var2 = recyclingRootModule.new(function()
			-- upvalues: var1 (write)
			var1 += 1
		end)
		local scope = var2.getScope({})
		local var3 = scope == var2.getScope({})
		local var4 = createRecyclableViewModule(function()
			return nil
		end, { readiness = "ReadyOnAssignment" })
		local var5 = createRecyclableViewModule(function()
			return nil
		end, { readiness = "ReadyOnAssignment" })
		local var6 = p2()
		local list = table.create(p1)
		
		for i = 1, p1 do
			list[i] = { viewType = var4 }
		end
		local acquired = scope.bind({ releases = {}, requests = list }).acquired
		local list_1 = table.create(p1)
		
		for i_1 = 1, p1 do
			list_1[i_1] = { viewType = var5 }
		end
		local acquired_1 = scope.bind({ releases = acquired, requests = list_1 }).acquired
		local var7 = (p2() - var6) * 1000
		local var8 = #acquired + #acquired_1
		local var9 = 0
		
		for i_2 in var2.getPortalChildren(function()
			return nil
		end) do
			var9 += 1
		end
		scope.bind({ releases = acquired_1, requests = {} })
		var2.destroy()
		
		return var7, {
			scopeWideHostScans = 0,
			createdHosts = var8,
			listItemHosts = var8,
			publishedHosts = var9,
			sameListRecyclingScope = var3,
			hostChanges = var1,
			completionPhaseCounts = { scopePublication = { synchronousBatch = 1 } }
		}
	end,
	compositionChurn = function(p3)
		-- upvalues: viewRecyclerModule (ref), recyclableViewModule (ref), signalsExperimentalModule (ref), compositionPlacementModule (ref), createRecyclableViewModule (ref), signalsModule (ref)
		local var10 = 1
		local var11 = 0
		local var12 = viewRecyclerModule.Adapter.createRecyclingScope({
			adapter = {
				create = function(p4)
					-- upvalues: recyclableViewModule (copy), var10 (write), var11 (write)
					local var13 = recyclableViewModule(var10, p4, nil)
					var10 += 1
					local transition = var13.transition
					
					function var35.transition(p5)
						-- upvalues: var11 (copy), transition (ref)
						var11 += 1
						transition(p5)
					end
					
					return var13
				end,
				destroy = function() end,
				batch = signalsExperimentalModule.batch
			}
		})
		local var13 = compositionPlacementModule.new(var12)
		local var14 = createRecyclableViewModule(function()
			return nil
		end, { readiness = "ReadyOnAssignment" })
		local list = table.create(p3)
		local list_1 = table.create(p3)
		local list_2 = table.create(p3)
		local list_3 = table.create(p3)
		
		for i = 1, p3 do
			local var15, var16 = signalsModule.createSignal({ key = `parent{i}`, value = i })
			list_1[i] = var16
			list_3[i] = signalsModule.createSignal({ update = i })
			local frame = Instance.new("Frame")
			list_2[i] = frame
			list[i] = var13.register(var14, {}, var15, signalsModule.createSignal({}), frame)
		end
		var13.flush()
		var11 = 0
		local var17 = 0
		local var18 = 0
		local var19 = 1
		
		return {
			run = function()
				-- upvalues: signalsExperimentalModule (copy), p3 (ref), list (ref), var19 (write), list_3 (ref), var13 (ref), var17 (write)
				signalsExperimentalModule.batch(function()
					-- upvalues: p3 (copy), list (copy), var19 (copy), list_3 (copy)
					for i = 1, p3 do
						list[var19].setItemSignal(list_3[i])
					end
				end)
				var13.flush()
				var17 += 1
				var19 = var19 % p3 + 1
			end,
			runBatchSettlement = function()
				-- upvalues: var18 (write), signalsExperimentalModule (copy), p3 (ref), list_1 (ref), var13 (ref), var17 (write)
				var18 += 1
				signalsExperimentalModule.batch(function()
					-- upvalues: p3 (copy), list_1 (copy), var18 (copy)
					for i = 1, p3 do
						list_1[i]({ key = `parent{i}-revision{var18}`, value = i })
					end
				end)
				var13.flush()
				var17 += 1
			end,
			getAssignmentUpdates = function()
				-- upvalues: var11 (write)
				return var11
			end,
			getFlushes = function()
				-- upvalues: var17 (write)
				return var17
			end,
			getReactInvalidations = function()
				return 0
			end,
			destroy = function()
				-- upvalues: var13 (ref), var12 (ref), list_2 (ref)
				var13.destroy()
				var12.dispose()
				
				for i, v in list_2 do
					v:Destroy()
				end
			end
		}
	end
}