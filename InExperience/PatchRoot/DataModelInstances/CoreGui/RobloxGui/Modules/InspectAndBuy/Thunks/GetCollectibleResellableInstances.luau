local performFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
local parent = script.Parent.Parent
local thunkModule = require(parent.Thunk)
local networkModule = require(parent.Services.Network)
local setCollectibleResellableInstancesModule = require(parent.Actions.SetCollectibleResellableInstances)
local createInspectAndBuyKeyMapperModule = require(parent.createInspectAndBuyKeyMapper)
local sendCounterModule = require(parent.Thunks.SendCounter)
local constantsModule = require(parent.Constants)
local list = { networkModule }
local var7 = createInspectAndBuyKeyMapperModule("getCollectibleResellableInstances")

return function(p0, p1)
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), var7 (ref), performFetch (ref), setCollectibleResellableInstancesModule (ref), sendCounterModule (ref), constantsModule (ref)
	return thunkModule.new(script.Name, list, function(p2, p3)
		-- upvalues: networkModule (copy), var7 (copy), p0 (ref), p1 (ref), performFetch (copy), setCollectibleResellableInstancesModule (copy), sendCounterModule (copy), constantsModule (copy)
		local var8 = p3[networkModule]
		
		return performFetch.Single(var7(p2:getState().storeId, p0, p1), function()
			-- upvalues: var8 (ref), p0 (copy), p1 (copy), p2 (ref), setCollectibleResellableInstancesModule (copy), sendCounterModule (copy), constantsModule (copy)
			return var8.getCollectibleResellableInstances(p0, p1):andThen(function(p4)
				-- upvalues: p2 (copy), setCollectibleResellableInstancesModule (copy), p0 (copy), sendCounterModule (copy), constantsModule (copy)
				local itemInstances = p4 and p4.itemInstances
				
				if itemInstances then
					p2:dispatch(setCollectibleResellableInstancesModule(p0, itemInstances))
				end
				if itemInstances then
					p2:dispatch(sendCounterModule(constantsModule.Counters.GetCollectibleResellableInstances .. constantsModule.CounterSuffix.RequestSucceeded))
					
					return
				end
				p2:dispatch(sendCounterModule(constantsModule.Counters.GetCollectibleResellableInstancesRequestSucceededWithoutResult))
			end, function(_)
				-- upvalues: p2 (copy), sendCounterModule (copy), constantsModule (copy)
				p2:dispatch(sendCounterModule(constantsModule.Counters.GetCollectibleResellableInstances .. constantsModule.CounterSuffix.RequestRejected))
			end)
		end)(p2):catch(function(_)
			-- upvalues: p2 (ref), sendCounterModule (copy), constantsModule (copy)
			p2:dispatch(sendCounterModule(constantsModule.Counters.GetCollectibleResellableInstances .. constantsModule.CounterSuffix.RequestFailed))
		end)
	end)
end