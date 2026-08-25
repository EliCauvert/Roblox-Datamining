local performFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
local parent = script.Parent.Parent
local thunkModule = require(parent.Thunk)
local networkModule = require(parent.Services.Network)
local assetInfoModule = require(parent.Models.AssetInfo)
local setAssetsModule = require(parent.Actions.SetAssets)
local createInspectAndBuyKeyMapperModule = require(parent.createInspectAndBuyKeyMapper)
local sendCounterModule = require(parent.Thunks.SendCounter)
local constantsModule = require(parent.Constants)
local list = { networkModule }
local var8 = createInspectAndBuyKeyMapperModule("getProductInfo")

return function(p0)
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), var8 (ref), performFetch (ref), assetInfoModule (ref), setAssetsModule (ref), sendCounterModule (ref), constantsModule (ref)
	return thunkModule.new(script.Name, list, function(p1, p2)
		-- upvalues: networkModule (copy), var8 (copy), p0 (ref), performFetch (copy), assetInfoModule (copy), setAssetsModule (copy), sendCounterModule (copy), constantsModule (copy)
		local var9 = p2[networkModule]
		
		return performFetch.Single(var8(p1:getState().storeId, p0), function()
			-- upvalues: var9 (ref), p0 (copy), assetInfoModule (copy), p1 (ref), setAssetsModule (copy), sendCounterModule (copy), constantsModule (copy)
			return var9.getProductInfo(p0):andThen(function(p3)
				-- upvalues: assetInfoModule (copy), p1 (copy), setAssetsModule (copy), sendCounterModule (copy), constantsModule (copy)
				p1:dispatch(setAssetsModule({ assetInfoModule.fromGetProductInfo(p3) }))
				p1:dispatch(sendCounterModule(constantsModule.Counters.GetProductInfo .. constantsModule.CounterSuffix.RequestSucceeded))
			end, function(_)
				-- upvalues: p1 (copy), sendCounterModule (copy), constantsModule (copy)
				p1:dispatch(sendCounterModule(constantsModule.Counters.GetProductInfo .. constantsModule.CounterSuffix.RequestRejected))
			end)
		end)(p1):catch(function(_)
			-- upvalues: p1 (ref), sendCounterModule (copy), constantsModule (copy)
			p1:dispatch(sendCounterModule(constantsModule.Counters.GetProductInfo .. constantsModule.CounterSuffix.RequestFailed))
		end)
	end)
end