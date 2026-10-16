local CorePackages = game:GetService("CorePackages")
local PromiseModule = require(CorePackages.Packages.Promise)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local Parent = script.Parent.Parent
local ThunkModule = require(Parent.Thunk)
local NetworkModule = require(Parent.Services.Network)
local AnalyticsModule = require(Parent.Services.Analytics)
local SetFavoriteBundleModule = require(Parent.Actions.SetFavoriteBundle)
local SetBundlesModule = require(Parent.Actions.SetBundles)
local BundleInfoModule = require(Parent.Models.BundleInfo)
local SendCounterModule = require(Parent.Thunks.SendCounter)
local ConstantsModule = require(Parent.Constants)
local list = { NetworkModule, AnalyticsModule }
local DeleteFavoriteForBundle = require(Parent.createInspectAndBuyKeyMapper)("deleteFavoriteForBundle")

return function(p1) --[[ Line: 26 | Named "DeleteFavoriteForBundle" ]]
	-- upvalues: ThunkModule (copy), list (copy), NetworkModule (copy), AnalyticsModule (copy), DeleteFavoriteForBundle (copy), PerformFetch (copy), SetFavoriteBundleModule (copy), BundleInfoModule (copy), SetBundlesModule (copy), SendCounterModule (copy), ConstantsModule (copy), PromiseModule (copy)
	return ThunkModule.new(script.Name, list, function(p2, p3) --[[ Line: 27 ]]
		-- upvalues: NetworkModule (upval), AnalyticsModule (upval), DeleteFavoriteForBundle (upval), p1 (copy), PerformFetch (upval), SetFavoriteBundleModule (upval), BundleInfoModule (upval), SetBundlesModule (upval), SendCounterModule (upval), ConstantsModule (upval), PromiseModule (upval)
		local v1 = p3[NetworkModule]
		local v2 = p3[AnalyticsModule]
		
		return PerformFetch.Single(DeleteFavoriteForBundle(p2:getState().storeId, p1), function() --[[ Line: 33 ]]
			-- upvalues: v1 (copy), p1 (upval), p2 (copy), SetFavoriteBundleModule (upval), BundleInfoModule (upval), SetBundlesModule (upval), v2 (copy), SendCounterModule (upval), ConstantsModule (upval), PromiseModule (upval)
			return v1.deleteFavoriteForBundle(p1):andThen(function() --[[ Line: 34 ]]
				-- upvalues: p2 (upval), SetFavoriteBundleModule (upval), p1 (upval), BundleInfoModule (upval), SetBundlesModule (upval), v2 (upval), SendCounterModule (upval), ConstantsModule (upval), PromiseModule (upval)
				p2:dispatch(SetFavoriteBundleModule(p1, false))
				local NumFavorites: number = p2:getState().bundles[p1].numFavorites
				p2:dispatch(SetBundlesModule({
					(BundleInfoModule.fromGetBundleFavoriteCount(p1, NumFavorites - 1))
				}))
				v2.reportFavoriteItem("Bundle", p1, false, true, "", NumFavorites - 1)
				p2:dispatch(SendCounterModule(ConstantsModule.Counters.DeleteFavoriteForBundle .. ConstantsModule.CounterSuffix.RequestSucceeded))
				
				return PromiseModule.resolve()
			end, function(p4) --[[ Line: 46 ]]
				-- upvalues: p2 (upval), SendCounterModule (upval), ConstantsModule (upval), PromiseModule (upval)
				p2:dispatch(SendCounterModule(ConstantsModule.Counters.DeleteFavoriteForBundle .. ConstantsModule.CounterSuffix.RequestRejected))
				
				return PromiseModule.reject((tostring(p4.StatusMessage)))
			end)
		end)(p2):catch(function(Err) --[[ Line: 52 ]]
			-- upvalues: p2 (copy), p1 (upval), v2 (copy), SendCounterModule (upval), ConstantsModule (upval)
			v2.reportFavoriteItem("Bundle", p1, false, false, Err, p2:getState().bundles[p1].numFavorites)
			p2:dispatch(SendCounterModule(ConstantsModule.Counters.DeleteFavoriteForBundle .. ConstantsModule.CounterSuffix.RequestFailed))
		end)
	end)
end