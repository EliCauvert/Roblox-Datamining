local PerformFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
local Parent = script.Parent.Parent
local ThunkModule = require(Parent.Thunk)
local NetworkModule = require(Parent.Services.Network)
local SetAssetsModule = require(Parent.Actions.SetAssets)
local AssetInfoModule = require(Parent.Models.AssetInfo)
local SendCounterModule = require(Parent.Thunks.SendCounter)
local ConstantsModule = require(Parent.Constants)
local list = { NetworkModule }
local GetAssetFavoriteCount = require(Parent.createInspectAndBuyKeyMapper)("getAssetFavoriteCount")

return function(p1)
	-- upvalues: ThunkModule (copy), list (copy), NetworkModule (copy), GetAssetFavoriteCount (copy), PerformFetch (copy), AssetInfoModule (copy), SetAssetsModule (copy), SendCounterModule (copy), ConstantsModule (copy)
	return ThunkModule.new(script.Name, list, function(p2, p3)
		-- upvalues: NetworkModule (upval), GetAssetFavoriteCount (upval), p1 (copy), PerformFetch (upval), AssetInfoModule (upval), SetAssetsModule (upval), SendCounterModule (upval), ConstantsModule (upval)
		local v1 = p3[NetworkModule]
		
		return PerformFetch.Single(GetAssetFavoriteCount(p2:getState().storeId, p1), function(_)
			-- upvalues: v1 (copy), p1 (upval), AssetInfoModule (upval), p2 (copy), SetAssetsModule (upval), SendCounterModule (upval), ConstantsModule (upval)
			return v1.getAssetFavoriteCount(p1):andThen(function(Result)
				-- upvalues: AssetInfoModule (upval), p1 (upval), p2 (upval), SetAssetsModule (upval), SendCounterModule (upval), ConstantsModule (upval)
				if Result then
					p2:dispatch(SetAssetsModule({ (AssetInfoModule.fromGetAssetFavoriteCount(p1, Result)) }))
				end
				p2:dispatch(SendCounterModule(ConstantsModule.Counters.GetAssetFavoriteCount .. ConstantsModule.CounterSuffix.RequestSucceeded))
			end, function(_)
				-- upvalues: p2 (upval), SendCounterModule (upval), ConstantsModule (upval)
				p2:dispatch(SendCounterModule(ConstantsModule.Counters.GetAssetFavoriteCount .. ConstantsModule.CounterSuffix.RequestRejected))
			end)
		end)(p2):catch(function(_)
			-- upvalues: p2 (copy), SendCounterModule (upval), ConstantsModule (upval)
			p2:dispatch(SendCounterModule(ConstantsModule.Counters.GetAssetFavoriteCount .. ConstantsModule.CounterSuffix.RequestFailed))
		end)
	end)
end