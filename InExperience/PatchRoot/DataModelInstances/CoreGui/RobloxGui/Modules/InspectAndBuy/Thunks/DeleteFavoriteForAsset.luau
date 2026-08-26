local corePackagesService = game:GetService("CorePackages")
local promiseModule = require(corePackagesService.Packages.Promise)
local performFetch = require(corePackagesService.Workspace.Packages.Http).PerformFetch
local parent = script.Parent.Parent
local thunkModule = require(parent.Thunk)
local networkModule = require(parent.Services.Network)
local analyticsModule = require(parent.Services.Analytics)
local setFavoriteAssetModule = require(parent.Actions.SetFavoriteAsset)
local setAssetsModule = require(parent.Actions.SetAssets)
local assetInfoModule = require(parent.Models.AssetInfo)
local createInspectAndBuyKeyMapperModule = require(parent.createInspectAndBuyKeyMapper)
local sendCounterModule = require(parent.Thunks.SendCounter)
local constantsModule = require(parent.Constants)
local list = { networkModule, analyticsModule }
local var1 = createInspectAndBuyKeyMapperModule("deleteFavoriteForAsset")

return function(value)
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), analyticsModule (ref), var1 (ref), performFetch (ref), setFavoriteAssetModule (ref), assetInfoModule (ref), setAssetsModule (ref), sendCounterModule (ref), constantsModule (ref), promiseModule (ref)
	return thunkModule.new(script.Name, list, function(p1, p2)
		-- upvalues: networkModule (copy), analyticsModule (copy), var1 (copy), value (ref), performFetch (copy), setFavoriteAssetModule (copy), assetInfoModule (copy), setAssetsModule (copy), sendCounterModule (copy), constantsModule (copy), promiseModule (copy)
		local var2 = p2[networkModule]
		local var3 = p2[analyticsModule]
		
		return performFetch.Single(var1(p1:getState().storeId, value), function(_)
			-- upvalues: var2 (ref), value (copy), p1 (ref), setFavoriteAssetModule (copy), assetInfoModule (copy), setAssetsModule (copy), var3 (ref), sendCounterModule (copy), constantsModule (copy), promiseModule (copy)
			return var2.deleteFavoriteForAsset(value):andThen(function()
				-- upvalues: p1 (copy), setFavoriteAssetModule (copy), value (copy), assetInfoModule (copy), setAssetsModule (copy), var3 (copy), sendCounterModule (copy), constantsModule (copy), promiseModule (copy)
				p1:dispatch(setFavoriteAssetModule(value, false))
				local numFavorites = p1:getState().assets[value].numFavorites
				p1:dispatch(setAssetsModule({
					assetInfoModule.fromGetAssetFavoriteCount(value, numFavorites - 1)
				}))
				var3.reportFavoriteItem("Asset", value, false, true, "", numFavorites - 1)
				p1:dispatch(sendCounterModule(constantsModule.Counters.DeleteFavoriteForAsset .. constantsModule.CounterSuffix.RequestSucceeded))
				
				return promiseModule.resolve()
			end, function(p3)
				-- upvalues: p1 (copy), sendCounterModule (copy), constantsModule (copy), promiseModule (copy)
				p1:dispatch(sendCounterModule(constantsModule.Counters.DeleteFavoriteForAsset .. constantsModule.CounterSuffix.RequestRejected))
				
				return promiseModule.reject(tostring(p3.StatusMessage))
			end)
		end)(p1):catch(function(p3)
			-- upvalues: p1 (ref), value (copy), var3 (ref), sendCounterModule (copy), constantsModule (copy)
			var3.reportFavoriteItem("Asset", value, false, false, p3, p1:getState().assets[value].numFavorites)
			p1:dispatch(sendCounterModule(constantsModule.Counters.DeleteFavoriteForAsset .. constantsModule.CounterSuffix.RequestFailed))
		end)
	end)
end