local CorePackages = game:GetService("CorePackages")
local PromiseModule = require(CorePackages.Packages.Promise)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local Parent = script.Parent.Parent
local ThunkModule = require(Parent.Thunk)
local NetworkModule = require(Parent.Services.Network)
local AnalyticsModule = require(Parent.Services.Analytics)
local SetFavoriteAssetModule = require(Parent.Actions.SetFavoriteAsset)
local SetAssetsModule = require(Parent.Actions.SetAssets)
local AssetInfoModule = require(Parent.Models.AssetInfo)
local SendCounterModule = require(Parent.Thunks.SendCounter)
local ConstantsModule = require(Parent.Constants)
local list = { NetworkModule, AnalyticsModule }
local DeleteFavoriteForAsset = require(Parent.createInspectAndBuyKeyMapper)("deleteFavoriteForAsset")

return function(p1) --[[ Line: 26 | Named "DeleteFavoriteForAsset" ]]
	-- upvalues: ThunkModule (copy), list (copy), NetworkModule (copy), AnalyticsModule (copy), DeleteFavoriteForAsset (copy), PerformFetch (copy), SetFavoriteAssetModule (copy), AssetInfoModule (copy), SetAssetsModule (copy), SendCounterModule (copy), ConstantsModule (copy), PromiseModule (copy)
	return ThunkModule.new(script.Name, list, function(p2, p3) --[[ Line: 27 ]]
		-- upvalues: NetworkModule (upval), AnalyticsModule (upval), DeleteFavoriteForAsset (upval), p1 (copy), PerformFetch (upval), SetFavoriteAssetModule (upval), AssetInfoModule (upval), SetAssetsModule (upval), SendCounterModule (upval), ConstantsModule (upval), PromiseModule (upval)
		local v1 = p3[NetworkModule]
		local v2 = p3[AnalyticsModule]
		
		return PerformFetch.Single(DeleteFavoriteForAsset(p2:getState().storeId, p1), function(_) --[[ Line: 33 ]]
			-- upvalues: v1 (copy), p1 (upval), p2 (copy), SetFavoriteAssetModule (upval), AssetInfoModule (upval), SetAssetsModule (upval), v2 (copy), SendCounterModule (upval), ConstantsModule (upval), PromiseModule (upval)
			return v1.deleteFavoriteForAsset(p1):andThen(function() --[[ Line: 34 ]]
				-- upvalues: p2 (upval), SetFavoriteAssetModule (upval), p1 (upval), AssetInfoModule (upval), SetAssetsModule (upval), v2 (upval), SendCounterModule (upval), ConstantsModule (upval), PromiseModule (upval)
				p2:dispatch(SetFavoriteAssetModule(p1, false))
				local NumFavorites: number = p2:getState().assets[p1].numFavorites
				p2:dispatch(SetAssetsModule({
					(AssetInfoModule.fromGetAssetFavoriteCount(p1, NumFavorites - 1))
				}))
				v2.reportFavoriteItem("Asset", p1, false, true, "", NumFavorites - 1)
				p2:dispatch(SendCounterModule(ConstantsModule.Counters.DeleteFavoriteForAsset .. ConstantsModule.CounterSuffix.RequestSucceeded))
				
				return PromiseModule.resolve()
			end, function(p4) --[[ Line: 45 ]]
				-- upvalues: p2 (upval), SendCounterModule (upval), ConstantsModule (upval), PromiseModule (upval)
				p2:dispatch(SendCounterModule(ConstantsModule.Counters.DeleteFavoriteForAsset .. ConstantsModule.CounterSuffix.RequestRejected))
				
				return PromiseModule.reject((tostring(p4.StatusMessage)))
			end)
		end)(p2):catch(function(Err) --[[ Line: 51 ]]
			-- upvalues: p2 (copy), p1 (upval), v2 (copy), SendCounterModule (upval), ConstantsModule (upval)
			v2.reportFavoriteItem("Asset", p1, false, false, Err, p2:getState().assets[p1].numFavorites)
			p2:dispatch(SendCounterModule(ConstantsModule.Counters.DeleteFavoriteForAsset .. ConstantsModule.CounterSuffix.RequestFailed))
		end)
	end)
end