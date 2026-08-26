local performFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
local parent = script.Parent.Parent
local thunkModule = require(parent.Thunk)
local networkModule = require(parent.Services.Network)
local createInspectAndBuyKeyMapperModule = require(parent.createInspectAndBuyKeyMapper)
local sendCounterModule = require(parent.Thunks.SendCounter)
local constantsModule = require(parent.Constants)
local list = { networkModule }
local var1 = createInspectAndBuyKeyMapperModule("getHumanoidDescriptionFromCostumeId")

return function(p1, p2)
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), var1 (ref), performFetch (ref), sendCounterModule (ref), constantsModule (ref)
	return thunkModule.new(script.Name, list, function(p3, p4)
		-- upvalues: networkModule (copy), var1 (copy), p1 (ref), performFetch (copy), p2 (ref), sendCounterModule (copy), constantsModule (copy)
		local var2 = p4[networkModule]
		
		return performFetch.Single(var1(p3:getState().storeId, p1), function()
			-- upvalues: var2 (ref), p1 (copy), p2 (copy), p3 (ref), sendCounterModule (copy), constantsModule (copy)
			return var2.getHumanoidDescriptionFromCostumeId(p1):andThen(function(p5)
				-- upvalues: p2 (copy), p3 (copy), sendCounterModule (copy), constantsModule (copy)
				p2(p5)
				p3:dispatch(sendCounterModule(constantsModule.Counters.GetHumanoidDescriptionFromCostumeId .. constantsModule.CounterSuffix.RequestSucceeded))
			end, function(_)
				-- upvalues: p3 (copy), sendCounterModule (copy), constantsModule (copy)
				p3:dispatch(sendCounterModule(constantsModule.Counters.GetHumanoidDescriptionFromCostumeId .. constantsModule.CounterSuffix.RequestRejected))
			end)
		end)(p3):catch(function(_)
			-- upvalues: p3 (ref), sendCounterModule (copy), constantsModule (copy)
			p3:dispatch(sendCounterModule(constantsModule.Counters.GetHumanoidDescriptionFromCostumeId .. constantsModule.CounterSuffix.RequestFailed))
		end)
	end)
end