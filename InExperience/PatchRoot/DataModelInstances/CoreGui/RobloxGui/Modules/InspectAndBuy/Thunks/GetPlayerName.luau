local performFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
local parent = script.Parent.Parent
local thunkModule = require(parent.Thunk)
local networkModule = require(parent.Services.Network)
local setPlayerNameModule = require(parent.Actions.SetPlayerName)
local createInspectAndBuyKeyMapperModule = require(parent.createInspectAndBuyKeyMapper)
local sendCounterModule = require(parent.Thunks.SendCounter)
local constantsModule = require(parent.Constants)
local list = { networkModule }
local var1 = createInspectAndBuyKeyMapperModule("getPlayerName")

return function(p1)
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), var1 (ref), performFetch (ref), setPlayerNameModule (ref), sendCounterModule (ref), constantsModule (ref)
	return thunkModule.new(script.Name, list, function(p2, p3)
		-- upvalues: networkModule (copy), var1 (copy), p1 (ref), performFetch (copy), setPlayerNameModule (copy), sendCounterModule (copy), constantsModule (copy)
		local var2 = p3[networkModule]
		
		return performFetch.Single(var1(p2:getState().storeId, p1), function()
			-- upvalues: var2 (ref), p1 (copy), p2 (ref), setPlayerNameModule (copy), sendCounterModule (copy), constantsModule (copy)
			return var2.getPlayerName(p1):andThen(function(p4)
				-- upvalues: p2 (copy), setPlayerNameModule (copy), sendCounterModule (copy), constantsModule (copy)
				p2:dispatch(setPlayerNameModule(p4))
				p2:dispatch(sendCounterModule(constantsModule.Counters.GetPlayerName .. constantsModule.CounterSuffix.RequestSucceeded))
			end, function(_)
				-- upvalues: p2 (copy), sendCounterModule (copy), constantsModule (copy)
				p2:dispatch(sendCounterModule(constantsModule.Counters.GetPlayerName .. constantsModule.CounterSuffix.RequestRejected))
			end)
		end)(p2):catch(function(_)
			-- upvalues: p2 (ref), sendCounterModule (copy), constantsModule (copy)
			p2:dispatch(sendCounterModule(constantsModule.Counters.GetPlayerName .. constantsModule.CounterSuffix.RequestFailed))
		end)
	end)
end