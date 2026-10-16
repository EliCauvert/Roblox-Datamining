local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local ViewRecyclerModule = require(ViewRecyclerReact.Parent.ViewRecycler)
local CompositionPlacementModule = require(ViewRecyclerReact.ReactAdapter.Private.CompositionPlacement)
local RecyclableViewModule = require(ViewRecyclerReact.ReactAdapter.Private.RecyclableView)
local RecyclingRootModule = require(ViewRecyclerReact.ReactAdapter.Private.RecyclingRoot)
local SignalsModule = require(ViewRecyclerReact.Parent.Signals)
local SignalsExperimentalModule = require(ViewRecyclerReact.Parent.SignalsExperimental)
local CreateRecyclableViewModule = require(ViewRecyclerReact.ReactAdapter.createRecyclableView)

local function _() --[[ Line: 13 | Named "viewType" ]]
	-- upvalues: CreateRecyclableViewModule (copy)
	return CreateRecyclableViewModule(function() --[[ Line: 14 ]]
		return nil
	end, { readiness = "ReadyOnAssignment" })
end

return {
	recyclingScopeHighWater = function(p1, Callback) --[[ Line: 21 ]]
		-- upvalues: RecyclingRootModule (copy), CreateRecyclableViewModule (copy)
		local HostChanges = 0
		local NewRecyclingRoot = RecyclingRootModule.new(function() --[[ Line: 23 ]]
			-- upvalues: HostChanges (ref)
			HostChanges += 1
		end)
		local Scope = NewRecyclingRoot.getScope({})
		local IsScopeMatch = Scope == NewRecyclingRoot.getScope({})
		local RecyclableViewModule = CreateRecyclableViewModule(function() --[[ Line: 14 ]]
			return nil
		end, { readiness = "ReadyOnAssignment" })
		local RecyclableViewModule1 = CreateRecyclableViewModule(function() --[[ Line: 29 ]]
			return nil
		end, { readiness = "ReadyOnAssignment" })
		local CallbackResult = Callback()
		local Buffer = table.create(p1)
		
		for i = 1, p1 do
			Buffer[i] = { viewType = RecyclableViewModule }
		end
		local Acquired = Scope.bind({ releases = {}, requests = Buffer }).acquired
		local Buffer1 = table.create(p1)
		
		for i1 = 1, p1 do
			Buffer1[i1] = { viewType = RecyclableViewModule1 }
		end
		local Acquired1 = Scope.bind({ releases = Acquired, requests = Buffer1 }).acquired
		local ScaledCallbackResult = (Callback() - CallbackResult) * 1000
		local CreatedHosts = #Acquired + #Acquired1
		local PublishedHosts = 0
		
		for _ in NewRecyclingRoot.getPortalChildren(function() --[[ Line: 56 ]]
			return nil
		end) do
			PublishedHosts += 1
		end
		Scope.bind({ releases = Acquired1, requests = {} })
		NewRecyclingRoot.destroy()
		
		return ScaledCallbackResult, {
			scopeWideHostScans = 0,
			createdHosts = CreatedHosts,
			listItemHosts = CreatedHosts,
			publishedHosts = PublishedHosts,
			sameListRecyclingScope = IsScopeMatch,
			hostChanges = HostChanges,
			completionPhaseCounts = { scopePublication = { synchronousBatch = 1 } }
		}
	end,
	compositionChurn = function(p2) --[[ Line: 80 ]]
		-- upvalues: ViewRecyclerModule (copy), RecyclableViewModule (copy), SignalsExperimentalModule (copy), CompositionPlacementModule (copy), CreateRecyclableViewModule (copy), SignalsModule (copy)
		local Count = 1
		local Count1 = 0
		local RecyclingScope = ViewRecyclerModule.Adapter.createRecyclingScope({
			adapter = {
				create = function(p3) --[[ Line: 85 ]]
					-- upvalues: RecyclableViewModule (upval), Count (ref), Count1 (ref)
					local RecyclableViewModuleResult = RecyclableViewModule(Count, p3, nil)
					Count += 1
					local TransitionFunction = RecyclableViewModuleResult.transition
					
					function RecyclableViewModuleResult.transition(p4) --[[ Line: 89 ]]
						-- upvalues: Count1 (upval), TransitionFunction (copy)
						Count1 += 1
						TransitionFunction(p4)
					end
					
					return RecyclableViewModuleResult
				end,
				destroy = function() --[[ Line: 95 ]] end,
				batch = SignalsExperimentalModule.batch
			}
		})
		local NewCompositionPlacement = CompositionPlacementModule.new(RecyclingScope)
		local RecyclableViewModule1 = CreateRecyclableViewModule(function() --[[ Line: 14 ]]
			return nil
		end, { readiness = "ReadyOnAssignment" })
		local Buffer = table.create(p2)
		local Buffer1 = table.create(p2)
		local Buffer2 = table.create(p2)
		local Buffer3 = table.create(p2)
		
		for i = 1, p2 do
			local Signal, Signal2 = SignalsModule.createSignal({ key = `parent{i}`, value = i })
			Buffer1[i] = Signal2
			Buffer3[i] = SignalsModule.createSignal({ update = i })
			local Frame = Instance.new("Frame")
			Buffer2[i] = Frame
			Buffer[i] = NewCompositionPlacement.register(RecyclableViewModule1, {}, Signal, SignalsModule.createSignal({}), Frame)
		end
		NewCompositionPlacement.flush()
		Count1 = 0
		local Count2 = 0
		local Count3 = 0
		local v1 = 1
		
		return {
			run = function() --[[ Line: 124 ]]
				-- upvalues: SignalsExperimentalModule (upval), p2 (copy), Buffer (copy), v1 (ref), Buffer3 (copy), NewCompositionPlacement (copy), Count2 (ref)
				SignalsExperimentalModule.batch(function() --[[ Line: 125 ]]
					-- upvalues: p2 (upval), Buffer (upval), v1 (upval), Buffer3 (upval)
					for i = 1, p2 do
						Buffer[v1].setItemSignal(Buffer3[i])
					end
				end)
				NewCompositionPlacement.flush()
				Count2 += 1
				v1 = v1 % p2 + 1
			end,
			runBatchSettlement = function() --[[ Line: 134 ]]
				-- upvalues: Count3 (ref), SignalsExperimentalModule (upval), p2 (copy), Buffer1 (copy), NewCompositionPlacement (copy), Count2 (ref)
				Count3 += 1
				SignalsExperimentalModule.batch(function() --[[ Line: 136 ]]
					-- upvalues: p2 (upval), Buffer1 (upval), Count3 (upval)
					for i = 1, p2 do
						Buffer1[i]({ key = `parent{i}-revision{Count3}`, value = i })
					end
				end)
				NewCompositionPlacement.flush()
				Count2 += 1
			end,
			getAssignmentUpdates = function() --[[ Line: 147 ]]
				-- upvalues: Count1 (ref)
				return Count1
			end,
			getFlushes = function() --[[ Line: 150 ]]
				-- upvalues: Count2 (ref)
				return Count2
			end,
			getReactInvalidations = function(): number --[[ Line: 153 ]]
				return 0
			end,
			destroy = function() --[[ Line: 156 ]]
				-- upvalues: NewCompositionPlacement (copy), RecyclingScope (copy), Buffer2 (copy)
				NewCompositionPlacement.destroy()
				RecyclingScope.dispose()
				
				for _, value in Buffer2 do
					value:Destroy()
				end
			end
		}
	end
}