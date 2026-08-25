local performFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
local parent = script.Parent.Parent
local thunkModule = require(parent.Thunk)
local networkModule = require(parent.Services.Network)
local createInspectAndBuyKeyMapperModule = require(parent.createInspectAndBuyKeyMapper)
local sendCounterModule = require(parent.Thunks.SendCounter)
local constantsModule = require(parent.Constants)
local list = { networkModule }
local var6 = createInspectAndBuyKeyMapperModule("getHumanoidDescriptionFromCostumeId")

return function(p0, p1)
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), var6 (ref), performFetch (ref), sendCounterModule (ref), constantsModule (ref)
	return thunkModule.new(script.Name, list, function(p2, p3)
		-- upvalues: networkModule (copy), var6 (copy), p0 (ref), performFetch (copy), p1 (ref), sendCounterModule (copy), constantsModule (copy)
		local var7 = p3[networkModule]
		
		return performFetch.Single(var6(p2:getState().storeId, p0), function()
			-- upvalues: var7 (ref), p0 (copy), p1 (copy), p2 (ref), sendCounterModule (copy), constantsModule (copy)
			return var7.getHumanoidDescriptionFromCostumeId(p0):andThen(function(p4)
				-- upvalues: p1 (copy), p2 (copy), sendCounterModule (copy), constantsModule (copy)
				p1(p4)
				p2:dispatch(sendCounterModule(constantsModule.Counters.GetHumanoidDescriptionFromCostumeId .. constantsModule.CounterSuffix.RequestSucceeded))
			end, function(_)
				-- upvalues: p2 (copy), sendCounterModule (copy), constantsModule (copy)
				p2:dispatch(sendCounterModule(constantsModule.Counters.GetHumanoidDescriptionFromCostumeId .. constantsModule.CounterSuffix.RequestRejected))
			end)
		end)(p2):catch(function(_)
			-- upvalues: p2 (ref), sendCounterModule (copy), constantsModule (copy)
			p2:dispatch(sendCounterModule(constantsModule.Counters.GetHumanoidDescriptionFromCostumeId .. constantsModule.CounterSuffix.RequestFailed))
		end)
	end)
end