local performFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
local parent = script.Parent.Parent
local thunkModule = require(parent.Thunk)
local networkModule = require(parent.Services.Network)
local setFavoriteAssetModule = require(parent.Actions.SetFavoriteAsset)
local createInspectAndBuyKeyMapperModule = require(parent.createInspectAndBuyKeyMapper)
local sendCounterModule = require(parent.Thunks.SendCounter)
local constantsModule = require(parent.Constants)
local list = { networkModule }
local var1 = createInspectAndBuyKeyMapperModule("getFavoriteForAsset")

return function(value)
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), var1 (ref), performFetch (ref), setFavoriteAssetModule (ref), sendCounterModule (ref), constantsModule (ref)
	return thunkModule.new(script.Name, list, function(p1, p2)
		-- upvalues: networkModule (copy), var1 (copy), value (ref), performFetch (copy), setFavoriteAssetModule (copy), sendCounterModule (copy), constantsModule (copy)
		local var2 = p2[networkModule]
		
		return performFetch.Single(var1(p1:getState().storeId, value), function(_)
			-- upvalues: var2 (ref), value (copy), p1 (ref), setFavoriteAssetModule (copy), sendCounterModule (copy), constantsModule (copy)
			return var2.getFavoriteForAsset(value):andThen(function(p3)
				-- upvalues: p1 (copy), setFavoriteAssetModule (copy), value (copy), sendCounterModule (copy), constantsModule (copy)
				if p3 == "null" then
					p1:dispatch(setFavoriteAssetModule(tostring(value), false))
				else
					p1:dispatch(setFavoriteAssetModule(tostring(value), true))
				end
				p1:dispatch(sendCounterModule(constantsModule.Counters.GetFavoriteForAsset .. constantsModule.CounterSuffix.RequestSucceeded))
			end, function(_)
				-- upvalues: p1 (copy), sendCounterModule (copy), constantsModule (copy)
				p1:dispatch(sendCounterModule(constantsModule.Counters.GetFavoriteForAsset .. constantsModule.CounterSuffix.RequestRejected))
			end)
		end)(p1):catch(function(_)
			-- upvalues: p1 (ref), sendCounterModule (copy), constantsModule (copy)
			p1:dispatch(sendCounterModule(constantsModule.Counters.GetFavoriteForAsset .. constantsModule.CounterSuffix.RequestFailed))
		end)
	end)
end