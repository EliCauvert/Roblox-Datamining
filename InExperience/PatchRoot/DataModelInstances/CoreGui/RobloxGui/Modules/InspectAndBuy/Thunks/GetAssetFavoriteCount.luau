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
local var8 = createInspectAndBuyKeyMapperModule("getAssetFavoriteCount")

return function(value)
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), var8 (ref), performFetch (ref), assetInfoModule (ref), setAssetsModule (ref), sendCounterModule (ref), constantsModule (ref)
	return thunkModule.new(script.Name, list, function(p0, p1)
		-- upvalues: networkModule (copy), var8 (copy), value (ref), performFetch (copy), assetInfoModule (copy), setAssetsModule (copy), sendCounterModule (copy), constantsModule (copy)
		local var9 = p1[networkModule]
		
		return performFetch.Single(var8(p0:getState().storeId, value), function(_)
			-- upvalues: var9 (ref), value (copy), assetInfoModule (copy), p0 (ref), setAssetsModule (copy), sendCounterModule (copy), constantsModule (copy)
			return var9.getAssetFavoriteCount(value):andThen(function(p2)
				-- upvalues: assetInfoModule (copy), value (copy), p0 (copy), setAssetsModule (copy), sendCounterModule (copy), constantsModule (copy)
				if p2 then
					p0:dispatch(setAssetsModule({ assetInfoModule.fromGetAssetFavoriteCount(value, p2) }))
				end
				p0:dispatch(sendCounterModule(constantsModule.Counters.GetAssetFavoriteCount .. constantsModule.CounterSuffix.RequestSucceeded))
			end, function(_)
				-- upvalues: p0 (copy), sendCounterModule (copy), constantsModule (copy)
				p0:dispatch(sendCounterModule(constantsModule.Counters.GetAssetFavoriteCount .. constantsModule.CounterSuffix.RequestRejected))
			end)
		end)(p0):catch(function(_)
			-- upvalues: p0 (ref), sendCounterModule (copy), constantsModule (copy)
			p0:dispatch(sendCounterModule(constantsModule.Counters.GetAssetFavoriteCount .. constantsModule.CounterSuffix.RequestFailed))
		end)
	end)
end