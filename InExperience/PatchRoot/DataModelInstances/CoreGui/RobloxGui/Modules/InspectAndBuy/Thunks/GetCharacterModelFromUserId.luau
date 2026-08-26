local performFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
local parent = script.Parent.Parent
local thunkModule = require(parent.Thunk)
local networkModule = require(parent.Services.Network)
local createInspectAndBuyKeyMapperModule = require(parent.createInspectAndBuyKeyMapper)
local sendCounterModule = require(parent.Thunks.SendCounter)
local constantsModule = require(parent.Constants)
local list = { networkModule }
local var1 = createInspectAndBuyKeyMapperModule("getPlayerModel")

return function(p1, p2, p3)
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), var1 (ref), performFetch (ref), sendCounterModule (ref), constantsModule (ref)
	return thunkModule.new(script.Name, list, function(p4, p5)
		-- upvalues: networkModule (copy), var1 (copy), p1 (ref), p2 (ref), performFetch (copy), p3 (ref), sendCounterModule (copy), constantsModule (copy)
		local var2 = p5[networkModule]
		
		return performFetch.Single(var1(p4:getState().storeId, p1, p2), function()
			-- upvalues: var2 (ref), p1 (copy), p3 (copy), p4 (ref), sendCounterModule (copy), constantsModule (copy)
			return var2.getModelFromUserId(p1):andThen(function(p6)
				-- upvalues: p3 (copy), p4 (copy), sendCounterModule (copy), constantsModule (copy)
				p3(p6)
				p4:dispatch(sendCounterModule(constantsModule.Counters.GetCharacterModelFromUserId .. constantsModule.CounterSuffix.RequestSucceeded))
			end, function(_)
				-- upvalues: p4 (copy), sendCounterModule (copy), constantsModule (copy)
				p4:dispatch(sendCounterModule(constantsModule.Counters.GetCharacterModelFromUserId .. constantsModule.CounterSuffix.RequestRejected))
			end)
		end)(p4):catch(function(_)
			-- upvalues: p4 (ref), sendCounterModule (copy), constantsModule (copy)
			p4:dispatch(sendCounterModule(constantsModule.Counters.GetCharacterModelFromUserId .. constantsModule.CounterSuffix.RequestFailed))
		end)
	end)
end