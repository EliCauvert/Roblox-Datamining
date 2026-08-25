local corePackagesService = game:GetService("CorePackages")
local promiseModule = require(corePackagesService.Packages.Promise)
local performFetch = require(corePackagesService.Workspace.Packages.Http).PerformFetch
local parent = script.Parent.Parent
local thunkModule = require(parent.Thunk)
local networkModule = require(parent.Services.Network)
local analyticsModule = require(parent.Services.Analytics)
local setFavoriteBundleModule = require(parent.Actions.SetFavoriteBundle)
local setBundlesModule = require(parent.Actions.SetBundles)
local bundleInfoModule = require(parent.Models.BundleInfo)
local createInspectAndBuyKeyMapperModule = require(parent.createInspectAndBuyKeyMapper)
local sendCounterModule = require(parent.Thunks.SendCounter)
local constantsModule = require(parent.Constants)
local list = { networkModule, analyticsModule }
local var12 = createInspectAndBuyKeyMapperModule("deleteFavoriteForBundle")

return function(p0)
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), analyticsModule (ref), var12 (ref), performFetch (ref), setFavoriteBundleModule (ref), bundleInfoModule (ref), setBundlesModule (ref), sendCounterModule (ref), constantsModule (ref), promiseModule (ref)
	return thunkModule.new(script.Name, list, function(p1, p2)
		-- upvalues: networkModule (copy), analyticsModule (copy), var12 (copy), p0 (ref), performFetch (copy), setFavoriteBundleModule (copy), bundleInfoModule (copy), setBundlesModule (copy), sendCounterModule (copy), constantsModule (copy), promiseModule (copy)
		local var13 = p2[networkModule]
		local var14 = p2[analyticsModule]
		
		return performFetch.Single(var12(p1:getState().storeId, p0), function()
			-- upvalues: var13 (ref), p0 (copy), p1 (ref), setFavoriteBundleModule (copy), bundleInfoModule (copy), setBundlesModule (copy), var14 (ref), sendCounterModule (copy), constantsModule (copy), promiseModule (copy)
			return var13.deleteFavoriteForBundle(p0):andThen(function()
				-- upvalues: p1 (copy), setFavoriteBundleModule (copy), p0 (copy), bundleInfoModule (copy), setBundlesModule (copy), var14 (copy), sendCounterModule (copy), constantsModule (copy), promiseModule (copy)
				p1:dispatch(setFavoriteBundleModule(p0, false))
				local numFavorites = p1:getState().bundles[p0].numFavorites
				p1:dispatch(setBundlesModule({
					bundleInfoModule.fromGetBundleFavoriteCount(p0, numFavorites - 1)
				}))
				var14.reportFavoriteItem("Bundle", p0, false, true, "", numFavorites - 1)
				p1:dispatch(sendCounterModule(constantsModule.Counters.DeleteFavoriteForBundle .. constantsModule.CounterSuffix.RequestSucceeded))
				
				return promiseModule.resolve()
			end, function(p4)
				-- upvalues: p1 (copy), sendCounterModule (copy), constantsModule (copy), promiseModule (copy)
				p1:dispatch(sendCounterModule(constantsModule.Counters.DeleteFavoriteForBundle .. constantsModule.CounterSuffix.RequestRejected))
				
				return promiseModule.reject(tostring(p4.StatusMessage))
			end)
		end)(p1):catch(function(p3)
			-- upvalues: p1 (ref), p0 (copy), var14 (ref), sendCounterModule (copy), constantsModule (copy)
			var14.reportFavoriteItem("Bundle", p0, false, false, p3, p1:getState().bundles[p0].numFavorites)
			p1:dispatch(sendCounterModule(constantsModule.Counters.DeleteFavoriteForBundle .. constantsModule.CounterSuffix.RequestFailed))
		end)
	end)
end