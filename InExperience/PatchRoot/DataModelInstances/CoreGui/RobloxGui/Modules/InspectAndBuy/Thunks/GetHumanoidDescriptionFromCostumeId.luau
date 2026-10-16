local PerformFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
local Parent = script.Parent.Parent
local ThunkModule = require(Parent.Thunk)
local NetworkModule = require(Parent.Services.Network)
local SendCounterModule = require(Parent.Thunks.SendCounter)
local ConstantsModule = require(Parent.Constants)
local list = { NetworkModule }
local GetHumanoidDescriptionFromCostumeId = require(Parent.createInspectAndBuyKeyMapper)("getHumanoidDescriptionFromCostumeId")

return function(p1, Callback) --[[ Line: 19 | Named "GetHumanoidDescriptionFromCostumeId" ]]
	-- upvalues: ThunkModule (copy), list (copy), NetworkModule (copy), GetHumanoidDescriptionFromCostumeId (copy), PerformFetch (copy), SendCounterModule (copy), ConstantsModule (copy)
	return ThunkModule.new(script.Name, list, function(p2, p3) --[[ Line: 20 ]]
		-- upvalues: NetworkModule (upval), GetHumanoidDescriptionFromCostumeId (upval), p1 (copy), PerformFetch (upval), Callback (copy), SendCounterModule (upval), ConstantsModule (upval)
		local v1 = p3[NetworkModule]
		
		return PerformFetch.Single(GetHumanoidDescriptionFromCostumeId(p2:getState().storeId, p1), function() --[[ Line: 25 ]]
			-- upvalues: v1 (copy), p1 (upval), Callback (upval), p2 (copy), SendCounterModule (upval), ConstantsModule (upval)
			return v1.getHumanoidDescriptionFromCostumeId(p1):andThen(function(Result) --[[ Line: 26 ]]
				-- upvalues: Callback (upval), p2 (upval), SendCounterModule (upval), ConstantsModule (upval)
				Callback(Result)
				p2:dispatch(SendCounterModule(ConstantsModule.Counters.GetHumanoidDescriptionFromCostumeId .. ConstantsModule.CounterSuffix.RequestSucceeded))
			end, function(_) --[[ Line: 34 ]]
				-- upvalues: p2 (upval), SendCounterModule (upval), ConstantsModule (upval)
				p2:dispatch(SendCounterModule(ConstantsModule.Counters.GetHumanoidDescriptionFromCostumeId .. ConstantsModule.CounterSuffix.RequestRejected))
			end)
		end)(p2):catch(function(_) --[[ Line: 42 ]]
			-- upvalues: p2 (copy), SendCounterModule (upval), ConstantsModule (upval)
			p2:dispatch(SendCounterModule(ConstantsModule.Counters.GetHumanoidDescriptionFromCostumeId .. ConstantsModule.CounterSuffix.RequestFailed))
		end)
	end)
end