local PerformFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
local Parent = script.Parent.Parent
local ThunkModule = require(Parent.Thunk)
local NetworkModule = require(Parent.Services.Network)
local SetCollectibleResellableInstancesModule = require(Parent.Actions.SetCollectibleResellableInstances)
local SendCounterModule = require(Parent.Thunks.SendCounter)
local ConstantsModule = require(Parent.Constants)
local list = { NetworkModule }
local GetCollectibleResellableInstances = require(Parent.createInspectAndBuyKeyMapper)("getCollectibleResellableInstances")

return function(p1, p2) --[[ Line: 17 | Named "GetCollectibleResellableInstances" ]]
	-- upvalues: ThunkModule (copy), list (copy), NetworkModule (copy), GetCollectibleResellableInstances (copy), PerformFetch (copy), SetCollectibleResellableInstancesModule (copy), SendCounterModule (copy), ConstantsModule (copy)
	return ThunkModule.new(script.Name, list, function(p3, p4) --[[ Line: 18 ]]
		-- upvalues: NetworkModule (upval), GetCollectibleResellableInstances (upval), p1 (copy), p2 (copy), PerformFetch (upval), SetCollectibleResellableInstancesModule (upval), SendCounterModule (upval), ConstantsModule (upval)
		local v1 = p4[NetworkModule]
		
		return PerformFetch.Single(GetCollectibleResellableInstances(p3:getState().storeId, p1, p2), function() --[[ Line: 23 ]]
			-- upvalues: v1 (copy), p1 (upval), p2 (upval), p3 (copy), SetCollectibleResellableInstancesModule (upval), SendCounterModule (upval), ConstantsModule (upval)
			return v1.getCollectibleResellableInstances(p1, p2):andThen(function(Result) --[[ Line: 24 ]]
				-- upvalues: p3 (upval), SetCollectibleResellableInstancesModule (upval), p1 (upval), SendCounterModule (upval), ConstantsModule (upval)
				local ItemInstances = Result and Result.itemInstances
				
				if ItemInstances then
					p3:dispatch(SetCollectibleResellableInstancesModule(p1, ItemInstances))
				end
				if ItemInstances then
					p3:dispatch(SendCounterModule(ConstantsModule.Counters.GetCollectibleResellableInstances .. ConstantsModule.CounterSuffix.RequestSucceeded))
					
					return
				else
					p3:dispatch(SendCounterModule(ConstantsModule.Counters.GetCollectibleResellableInstancesRequestSucceededWithoutResult))
				end
			end, function(_) --[[ Line: 42 ]]
				-- upvalues: p3 (upval), SendCounterModule (upval), ConstantsModule (upval)
				p3:dispatch(SendCounterModule(ConstantsModule.Counters.GetCollectibleResellableInstances .. ConstantsModule.CounterSuffix.RequestRejected))
			end)
		end)(p3):catch(function(_) --[[ Line: 49 ]]
			-- upvalues: p3 (copy), SendCounterModule (upval), ConstantsModule (upval)
			p3:dispatch(SendCounterModule(ConstantsModule.Counters.GetCollectibleResellableInstances .. ConstantsModule.CounterSuffix.RequestFailed))
		end)
	end)
end