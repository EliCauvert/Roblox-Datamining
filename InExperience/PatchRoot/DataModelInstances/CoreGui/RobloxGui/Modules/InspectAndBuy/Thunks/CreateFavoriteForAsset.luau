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
local var12 = createInspectAndBuyKeyMapperModule("createFavoriteForAsset")

return function(value)
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), analyticsModule (ref), var12 (ref), performFetch (ref), setFavoriteAssetModule (ref), assetInfoModule (ref), setAssetsModule (ref), sendCounterModule (ref), constantsModule (ref), promiseModule (ref)
	return thunkModule.new(script.Name, list, function(p0, p1)
		-- upvalues: networkModule (copy), analyticsModule (copy), var12 (copy), value (ref), performFetch (copy), setFavoriteAssetModule (copy), assetInfoModule (copy), setAssetsModule (copy), sendCounterModule (copy), constantsModule (copy), promiseModule (copy)
		local var13 = p1[networkModule]
		local var14 = p1[analyticsModule]
		
		return performFetch.Single(var12(p0:getState().storeId, value), function(_)
			-- upvalues: var13 (ref), value (copy), p0 (ref), setFavoriteAssetModule (copy), assetInfoModule (copy), setAssetsModule (copy), var14 (ref), sendCounterModule (copy), constantsModule (copy), promiseModule (copy)
			return var13.createFavoriteForAsset(value):andThen(function()
				-- upvalues: p0 (copy), setFavoriteAssetModule (copy), value (copy), assetInfoModule (copy), setAssetsModule (copy), var14 (copy), sendCounterModule (copy), constantsModule (copy), promiseModule (copy)
				p0:dispatch(setFavoriteAssetModule(value, true))
				local numFavorites = p0:getState().assets[value].numFavorites
				p0:dispatch(setAssetsModule({
					assetInfoModule.fromGetAssetFavoriteCount(value, numFavorites + 1)
				}))
				var14.reportFavoriteItem("Asset", value, true, true, "", numFavorites + 1)
				p0:dispatch(sendCounterModule(constantsModule.Counters.CreateFavoriteForAsset .. constantsModule.CounterSuffix.RequestSucceeded))
				
				return promiseModule.resolve()
			end, function(p3)
				-- upvalues: p0 (copy), sendCounterModule (copy), constantsModule (copy), promiseModule (copy)
				p0:dispatch(sendCounterModule(constantsModule.Counters.CreateFavoriteForAsset .. constantsModule.CounterSuffix.RequestRejected))
				
				return promiseModule.reject(tostring(p3.StatusMessage))
			end)
		end)(p0):catch(function(p2)
			-- upvalues: p0 (ref), value (copy), var14 (ref), sendCounterModule (copy), constantsModule (copy)
			var14.reportFavoriteItem("Asset", value, true, false, p2, p0:getState().assets[value].numFavorites)
			p0:dispatch(sendCounterModule(constantsModule.Counters.CreateFavoriteForAsset .. constantsModule.CounterSuffix.RequestFailed))
		end)
	end)
end