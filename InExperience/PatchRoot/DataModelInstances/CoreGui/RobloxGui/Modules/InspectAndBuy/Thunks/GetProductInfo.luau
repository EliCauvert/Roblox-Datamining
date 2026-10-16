local PerformFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
local Parent = script.Parent.Parent
local ThunkModule = require(Parent.Thunk)
local NetworkModule = require(Parent.Services.Network)
local AssetInfoModule = require(Parent.Models.AssetInfo)
local SetAssetsModule = require(Parent.Actions.SetAssets)
local SendCounterModule = require(Parent.Thunks.SendCounter)
local ConstantsModule = require(Parent.Constants)
local list = { NetworkModule }
local GetProductInfo = require(Parent.createInspectAndBuyKeyMapper)("getProductInfo")

return function(p1) --[[ Line: 21 | Named "GetProductInfo" ]]
	-- upvalues: ThunkModule (copy), list (copy), NetworkModule (copy), GetProductInfo (copy), PerformFetch (copy), AssetInfoModule (copy), SetAssetsModule (copy), SendCounterModule (copy), ConstantsModule (copy)
	return ThunkModule.new(script.Name, list, function(p2, p3) --[[ Line: 22 ]]
		-- upvalues: NetworkModule (upval), GetProductInfo (upval), p1 (copy), PerformFetch (upval), AssetInfoModule (upval), SetAssetsModule (upval), SendCounterModule (upval), ConstantsModule (upval)
		local v1 = p3[NetworkModule]
		
		return PerformFetch.Single(GetProductInfo(p2:getState().storeId, p1), function() --[[ Line: 27 ]]
			-- upvalues: v1 (copy), p1 (upval), AssetInfoModule (upval), p2 (copy), SetAssetsModule (upval), SendCounterModule (upval), ConstantsModule (upval)
			return v1.getProductInfo(p1):andThen(function(Result) --[[ Line: 28 ]]
				-- upvalues: AssetInfoModule (upval), p2 (upval), SetAssetsModule (upval), SendCounterModule (upval), ConstantsModule (upval)
				p2:dispatch(SetAssetsModule({ (AssetInfoModule.fromGetProductInfo(Result)) }))
				p2:dispatch(SendCounterModule(ConstantsModule.Counters.GetProductInfo .. ConstantsModule.CounterSuffix.RequestSucceeded))
			end, function(_) --[[ Line: 34 ]]
				-- upvalues: p2 (upval), SendCounterModule (upval), ConstantsModule (upval)
				p2:dispatch(SendCounterModule(ConstantsModule.Counters.GetProductInfo .. ConstantsModule.CounterSuffix.RequestRejected))
			end)
		end)(p2):catch(function(_) --[[ Line: 39 ]]
			-- upvalues: p2 (copy), SendCounterModule (upval), ConstantsModule (upval)
			p2:dispatch(SendCounterModule(ConstantsModule.Counters.GetProductInfo .. ConstantsModule.CounterSuffix.RequestFailed))
		end)
	end)
end