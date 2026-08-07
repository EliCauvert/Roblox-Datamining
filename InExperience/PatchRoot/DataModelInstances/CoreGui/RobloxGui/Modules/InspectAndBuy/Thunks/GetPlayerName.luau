local performFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
local parent = script.Parent.Parent
local thunkModule = require(parent.Thunk)
local networkModule = require(parent.Services.Network)
local setPlayerNameModule = require(parent.Actions.SetPlayerName)
local createInspectAndBuyKeyMapperModule = require(parent.createInspectAndBuyKeyMapper)
local sendCounterModule = require(parent.Thunks.SendCounter)
local constantsModule = require(parent.Constants)
local list = { networkModule }
local var7 = createInspectAndBuyKeyMapperModule("getPlayerName")

return function(p0) --[[ line: 20 | named "GetPlayerName" ]]
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), var7 (ref), performFetch (ref), setPlayerNameModule (ref), sendCounterModule (ref), constantsModule (ref)
	return thunkModule.new(script.Name, list, function(p1, p2) --[[ line: 21 ]]
		-- upvalues: networkModule (copy), var7 (copy), p0 (ref), performFetch (copy), setPlayerNameModule (copy), sendCounterModule (copy), constantsModule (copy)
		local var8 = p2[networkModule]
		
		return performFetch.Single(var7(p1:getState().storeId, p0), function() --[[ line: 26 ]]
			-- upvalues: var8 (ref), p0 (copy), p1 (ref), setPlayerNameModule (copy), sendCounterModule (copy), constantsModule (copy)
			return var8.getPlayerName(p0):andThen(function(p3) --[[ line: 27 ]]
				-- upvalues: p1 (copy), setPlayerNameModule (copy), sendCounterModule (copy), constantsModule (copy)
				p1:dispatch(setPlayerNameModule(p3))
				p1:dispatch(sendCounterModule(constantsModule.Counters.GetPlayerName .. constantsModule.CounterSuffix.RequestSucceeded))
			end, function(_) --[[ line: 32 ]]
				-- upvalues: p1 (copy), sendCounterModule (copy), constantsModule (copy)
				p1:dispatch(sendCounterModule(constantsModule.Counters.GetPlayerName .. constantsModule.CounterSuffix.RequestRejected))
			end)
		end)(p1):catch(function(_) --[[ line: 35 ]]
			-- upvalues: p1 (ref), sendCounterModule (copy), constantsModule (copy)
			p1:dispatch(sendCounterModule(constantsModule.Counters.GetPlayerName .. constantsModule.CounterSuffix.RequestFailed))
		end)
	end)
end