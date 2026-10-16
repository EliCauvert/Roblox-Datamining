local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local ViewRecyclerModule = require(ViewRecyclerReact.Parent.ViewRecycler)
local CompositionPlacementModule = require(ViewRecyclerReact.ReactAdapter.Private.CompositionPlacement)
local RecyclingRootModule = require(ViewRecyclerReact.ReactAdapter.Private.RecyclingRoot)
local SignalsModule = require(ViewRecyclerReact.Parent.Signals)
local SignalsExperimentalModule = require(ViewRecyclerReact.Parent.SignalsExperimental)
local CreateRecyclableViewModule = require(ViewRecyclerReact.ReactAdapter.createRecyclableView)
local RecyclableViewModule = require(ViewRecyclerReact.ReactAdapter.Private.RecyclableView)

local function _() --[[ Line: 13 | Named "viewType" ]]
	-- upvalues: CreateRecyclableViewModule (copy)
	return CreateRecyclableViewModule(function() --[[ Line: 14 ]]
		return nil
	end, { readiness = "ReadyOnAssignment" })
end

return {
	recyclingScopeHighWater = function(p1: number, Callback) --[[ Line: 21 ]]
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
		local t = {}
		local Buffer = table.create(p1)
		local Buffer1 = table.create(p1)
		
		for i = 1, p1 do
			Buffer[i] = { viewType = RecyclableViewModule }
			Buffer1[i] = {
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
		local Acquired = Scope.exchange(t, {}, Buffer).acquired
		
		for i1, value in Acquired do
			value.view.set(Buffer1[i1])
		end
		local Buffer2 = table.create(p1)
		local Buffer21 = table.create(p1)
		
		for i2 = 1, p1 do
			Buffer2[i2] = { viewType = RecyclableViewModule1 }
			Buffer21[i2] = {
				key = `listItem{i2}`,
				index = i2,
				value = i2,
				generation = p1 + i2
			}
		end
		local Acquired1 = Scope.exchange(t, Acquired, Buffer2).acquired
		
		for i3, value1 in Acquired1 do
			value1.view.set(Buffer21[i3])
		end
		for _, value2 in Buffer1 do
			value2.value.placeholder:Destroy()
		end
		local ScaledCallbackResult = (Callback() - CallbackResult) * 1000
		local Count = #Scope.getScopeInventory()
		local Count1 = #Scope.getScopeInventory()
		local PublishedHosts = 0
		
		for _ in NewRecyclingRoot.getPortalChildren(function() --[[ Line: 78 ]]
			return nil
		end) do
			PublishedHosts += 1
		end
		Scope.exchange(t, Acquired1, {})
		NewRecyclingRoot.destroy()
		
		return ScaledCallbackResult, {
			scopeWideHostScans = 0,
			createdHosts = Count,
			listItemHosts = Count1,
			publishedHosts = PublishedHosts,
			sameListRecyclingScope = IsScopeMatch,
			hostChanges = HostChanges,
			completionPhaseCounts = { scopePublication = { synchronousBatch = 1 } }
		}
	end,
	compositionChurn = function(p2) --[[ Line: 102 ]]
		-- upvalues: ViewRecyclerModule (copy), RecyclableViewModule (copy), SignalsExperimentalModule (copy), CompositionPlacementModule (copy), CreateRecyclableViewModule (copy), SignalsModule (copy)
		local Count = 1
		local Count1 = 0
		local RecyclingScope = ViewRecyclerModule.Adapter.createRecyclingScope({
			adapter = {
				create = function(p3) --[[ Line: 107 ]]
					-- upvalues: RecyclableViewModule (upval), Count (ref), Count1 (ref)
					local RecyclableViewModuleResult = RecyclableViewModule(Count, p3, nil)
					Count += 1
					local SetFunction = RecyclableViewModuleResult.set
					
					function RecyclableViewModuleResult.set(p4) --[[ Line: 111 ]]
						-- upvalues: Count1 (upval), SetFunction (copy)
						Count1 += 1
						SetFunction(p4)
					end
					
					return RecyclableViewModuleResult
				end,
				destroy = function() --[[ Line: 117 ]] end,
				batch = SignalsExperimentalModule.batch
			}
		})
		local NewCompositionPlacement = CompositionPlacementModule.new(RecyclingScope, function() --[[ Line: 121 ]] end)
		local RecyclableViewModule1 = CreateRecyclableViewModule(function() --[[ Line: 14 ]]
			return nil
		end, { readiness = "ReadyOnAssignment" })
		local Buffer = table.create(p2)
		local Buffer1 = table.create(p2)
		
		for i = 1, p2 do
			local Frame = Instance.new("Frame")
			Buffer1[i] = Frame
			Buffer[i] = NewCompositionPlacement.register(RecyclableViewModule1, {}, SignalsModule.createSignal({ generation = 1, key = `parent{i}`, index = i, value = i }), {}, Frame)
		end
		NewCompositionPlacement.flush()
		Count1 = 0
		local Count2 = 0
		local Revision = 0
		local v1 = 1
		
		return {
			run = function() --[[ Line: 142 ]]
				-- upvalues: Revision (ref), p2 (copy), Buffer (copy), v1 (ref), NewCompositionPlacement (copy), Count2 (ref)
				Revision += 1
				
				for i = 1, p2 do
					Buffer[v1].setProps({ revision = Revision, update = i })
				end
				NewCompositionPlacement.flush()
				Count2 += 1
				v1 = v1 % p2 + 1
			end,
			getAssignmentUpdates = function() --[[ Line: 154 ]]
				-- upvalues: Count1 (ref)
				return Count1
			end,
			getFlushes = function() --[[ Line: 157 ]]
				-- upvalues: Count2 (ref)
				return Count2
			end,
			destroy = function() --[[ Line: 160 ]]
				-- upvalues: NewCompositionPlacement (copy), RecyclingScope (copy), Buffer1 (copy)
				NewCompositionPlacement.destroy()
				RecyclingScope.destroy()
				
				for _, value in Buffer1 do
					value:Destroy()
				end
			end
		}
	end
}