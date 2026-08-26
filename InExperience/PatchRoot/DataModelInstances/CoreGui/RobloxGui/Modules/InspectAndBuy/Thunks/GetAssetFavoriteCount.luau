local performFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
local parent = script.Parent.Parent
local thunkModule = require(parent.Thunk)
local networkModule = require(parent.Services.Network)
local setAssetsModule = require(parent.Actions.SetAssets)
local assetInfoModule = require(parent.Models.AssetInfo)
local createInspectAndBuyKeyMapperModule = require(parent.createInspectAndBuyKeyMapper)
local sendCounterModule = require(parent.Thunks.SendCounter)
local constantsModule = require(parent.Constants)
local list = { networkModule }
local var1 = createInspectAndBuyKeyMapperModule("getAssetFavoriteCount")

return function(value)
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), var1 (ref), performFetch (ref), assetInfoModule (ref), setAssetsModule (ref), sendCounterModule (ref), constantsModule (ref)
	return thunkModule.new(script.Name, list, function(p1, p2)
		-- upvalues: networkModule (copy), var1 (copy), value (ref), performFetch (copy), assetInfoModule (copy), setAssetsModule (copy), sendCounterModule (copy), constantsModule (copy)
		local var2 = p2[networkModule]
		
		return performFetch.Single(var1(p1:getState().storeId, value), function(_)
			-- upvalues: var2 (ref), value (copy), assetInfoModule (copy), p1 (ref), setAssetsModule (copy), sendCounterModule (copy), constantsModule (copy)
			return var2.getAssetFavoriteCount(value):andThen(function(p3)
				-- upvalues: assetInfoModule (copy), value (copy), p1 (copy), setAssetsModule (copy), sendCounterModule (copy), constantsModule (copy)
				if p3 then
					p1:dispatch(setAssetsModule({ assetInfoModule.fromGetAssetFavoriteCount(value, p3) }))
				end
				p1:dispatch(sendCounterModule(constantsModule.Counters.GetAssetFavoriteCount .. constantsModule.CounterSuffix.RequestSucceeded))
			end, function(_)
				-- upvalues: p1 (copy), sendCounterModule (copy), constantsModule (copy)
				p1:dispatch(sendCounterModule(constantsModule.Counters.GetAssetFavoriteCount .. constantsModule.CounterSuffix.RequestRejected))
			end)
		end)(p1):catch(function(_)
			-- upvalues: p1 (ref), sendCounterModule (copy), constantsModule (copy)
			p1:dispatch(sendCounterModule(constantsModule.Counters.GetAssetFavoriteCount .. constantsModule.CounterSuffix.RequestFailed))
		end)
	end)
end