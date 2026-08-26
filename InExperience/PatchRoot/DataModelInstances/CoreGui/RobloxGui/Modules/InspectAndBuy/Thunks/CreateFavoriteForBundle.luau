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
local var1 = createInspectAndBuyKeyMapperModule("createFavoriteForBundle")

return function(p1)
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), analyticsModule (ref), var1 (ref), performFetch (ref), setFavoriteBundleModule (ref), bundleInfoModule (ref), setBundlesModule (ref), sendCounterModule (ref), constantsModule (ref), promiseModule (ref)
	return thunkModule.new(script.Name, list, function(p2, p3)
		-- upvalues: networkModule (copy), analyticsModule (copy), var1 (copy), p1 (ref), performFetch (copy), setFavoriteBundleModule (copy), bundleInfoModule (copy), setBundlesModule (copy), sendCounterModule (copy), constantsModule (copy), promiseModule (copy)
		local var2 = p3[networkModule]
		local var3 = p3[analyticsModule]
		
		return performFetch.Single(var1(p2:getState().storeId, p1), function()
			-- upvalues: var2 (ref), p1 (copy), p2 (ref), setFavoriteBundleModule (copy), bundleInfoModule (copy), setBundlesModule (copy), var3 (ref), sendCounterModule (copy), constantsModule (copy), promiseModule (copy)
			return var2.createFavoriteForBundle(p1):andThen(function()
				-- upvalues: p2 (copy), setFavoriteBundleModule (copy), p1 (copy), bundleInfoModule (copy), setBundlesModule (copy), var3 (copy), sendCounterModule (copy), constantsModule (copy), promiseModule (copy)
				p2:dispatch(setFavoriteBundleModule(p1, true))
				local numFavorites = p2:getState().bundles[p1].numFavorites
				p2:dispatch(setBundlesModule({
					bundleInfoModule.fromGetBundleFavoriteCount(p1, numFavorites + 1)
				}))
				var3.reportFavoriteItem("Bundle", p1, true, true, "", numFavorites + 1)
				p2:dispatch(sendCounterModule(constantsModule.Counters.CreateFavoriteForBundle .. constantsModule.CounterSuffix.RequestSucceeded))
				
				return promiseModule.resolve()
			end, function(p4)
				-- upvalues: p2 (copy), sendCounterModule (copy), constantsModule (copy), promiseModule (copy)
				p2:dispatch(sendCounterModule(constantsModule.Counters.CreateFavoriteForBundle .. constantsModule.CounterSuffix.RequestRejected))
				
				return promiseModule.reject(tostring(p4.StatusMessage))
			end)
		end)(p2):catch(function(p4)
			-- upvalues: p2 (ref), p1 (copy), var3 (ref), sendCounterModule (copy), constantsModule (copy)
			var3.reportFavoriteItem("Bundle", p1, true, false, p4, p2:getState().bundles[p1].numFavorites)
			p2:dispatch(sendCounterModule(constantsModule.Counters.CreateFavoriteForBundle .. constantsModule.CounterSuffix.RequestFailed))
		end)
	end)
end