local PerformFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
local Parent = script.Parent.Parent
local ThunkModule = require(Parent.Thunk)
local NetworkModule = require(Parent.Services.Network)
local SetPlayerNameModule = require(Parent.Actions.SetPlayerName)
local SendCounterModule = require(Parent.Thunks.SendCounter)
local ConstantsModule = require(Parent.Constants)
local list = { NetworkModule }
local GetPlayerName = require(Parent.createInspectAndBuyKeyMapper)("getPlayerName")

return function(p1) --[[ Line: 20 | Named "GetPlayerName" ]]
	-- upvalues: ThunkModule (copy), list (copy), NetworkModule (copy), GetPlayerName (copy), PerformFetch (copy), SetPlayerNameModule (copy), SendCounterModule (copy), ConstantsModule (copy)
	return ThunkModule.new(script.Name, list, function(p2, p3) --[[ Line: 21 ]]
		-- upvalues: NetworkModule (upval), GetPlayerName (upval), p1 (copy), PerformFetch (upval), SetPlayerNameModule (upval), SendCounterModule (upval), ConstantsModule (upval)
		local v1 = p3[NetworkModule]
		
		return PerformFetch.Single(GetPlayerName(p2:getState().storeId, p1), function() --[[ Line: 26 ]]
			-- upvalues: v1 (copy), p1 (upval), p2 (copy), SetPlayerNameModule (upval), SendCounterModule (upval), ConstantsModule (upval)
			return v1.getPlayerName(p1):andThen(function(Result) --[[ Line: 27 ]]
				-- upvalues: p2 (upval), SetPlayerNameModule (upval), SendCounterModule (upval), ConstantsModule (upval)
				p2:dispatch(SetPlayerNameModule(Result))
				p2:dispatch(SendCounterModule(ConstantsModule.Counters.GetPlayerName .. ConstantsModule.CounterSuffix.RequestSucceeded))
			end, function(_) --[[ Line: 32 ]]
				-- upvalues: p2 (upval), SendCounterModule (upval), ConstantsModule (upval)
				p2:dispatch(SendCounterModule(ConstantsModule.Counters.GetPlayerName .. ConstantsModule.CounterSuffix.RequestRejected))
			end)
		end)(p2):catch(function(_) --[[ Line: 35 ]]
			-- upvalues: p2 (copy), SendCounterModule (upval), ConstantsModule (upval)
			p2:dispatch(SendCounterModule(ConstantsModule.Counters.GetPlayerName .. ConstantsModule.CounterSuffix.RequestFailed))
		end)
	end)
end