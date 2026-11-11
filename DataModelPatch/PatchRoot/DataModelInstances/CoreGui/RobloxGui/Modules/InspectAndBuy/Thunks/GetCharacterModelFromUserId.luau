local PerformFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
local Parent = script.Parent.Parent
local ThunkModule = require(Parent.Thunk)
local NetworkModule = require(Parent.Services.Network)
local SendCounterModule = require(Parent.Thunks.SendCounter)
local ConstantsModule = require(Parent.Constants)
local list = { NetworkModule }
local GetPlayerModel = require(Parent.createInspectAndBuyKeyMapper)("getPlayerModel")

return function(p1, p2, Callback)
	-- upvalues: ThunkModule (copy), list (copy), NetworkModule (copy), GetPlayerModel (copy), PerformFetch (copy), SendCounterModule (copy), ConstantsModule (copy)
	return ThunkModule.new(script.Name, list, function(p3, p4)
		-- upvalues: NetworkModule (upval), GetPlayerModel (upval), p1 (copy), p2 (copy), PerformFetch (upval), Callback (copy), SendCounterModule (upval), ConstantsModule (upval)
		local v1 = p4[NetworkModule]
		
		return PerformFetch.Single(GetPlayerModel(p3:getState().storeId, p1, p2), function()
			-- upvalues: v1 (copy), p1 (upval), Callback (upval), p3 (copy), SendCounterModule (upval), ConstantsModule (upval)
			return v1.getModelFromUserId(p1):andThen(function(Result)
				-- upvalues: Callback (upval), p3 (upval), SendCounterModule (upval), ConstantsModule (upval)
				Callback(Result)
				p3:dispatch(SendCounterModule(ConstantsModule.Counters.GetCharacterModelFromUserId .. ConstantsModule.CounterSuffix.RequestSucceeded))
			end, function(_)
				-- upvalues: p3 (upval), SendCounterModule (upval), ConstantsModule (upval)
				p3:dispatch(SendCounterModule(ConstantsModule.Counters.GetCharacterModelFromUserId .. ConstantsModule.CounterSuffix.RequestRejected))
			end)
		end)(p3):catch(function(_)
			-- upvalues: p3 (copy), SendCounterModule (upval), ConstantsModule (upval)
			p3:dispatch(SendCounterModule(ConstantsModule.Counters.GetCharacterModelFromUserId .. ConstantsModule.CounterSuffix.RequestFailed))
		end)
	end)
end