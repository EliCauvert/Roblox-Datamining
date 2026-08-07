local performFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
local parent = script.Parent.Parent
local thunkModule = require(parent.Thunk)
local networkModule = require(parent.Services.Network)
local setFavoriteAssetModule = require(parent.Actions.SetFavoriteAsset)
local createInspectAndBuyKeyMapperModule = require(parent.createInspectAndBuyKeyMapper)
local sendCounterModule = require(parent.Thunks.SendCounter)
local constantsModule = require(parent.Constants)
local list = { networkModule }
local var7 = createInspectAndBuyKeyMapperModule("getFavoriteForAsset")

return function(value) --[[ line: 20 | named "GetFavoriteForAsset" ]]
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), var7 (ref), performFetch (ref), setFavoriteAssetModule (ref), sendCounterModule (ref), constantsModule (ref)
	return thunkModule.new(script.Name, list, function(p0, p1) --[[ line: 21 ]]
		-- upvalues: networkModule (copy), var7 (copy), value (ref), performFetch (copy), setFavoriteAssetModule (copy), sendCounterModule (copy), constantsModule (copy)
		local var8 = p1[networkModule]
		
		return performFetch.Single(var7(p0:getState().storeId, value), function(_) --[[ line: 26 ]]
			-- upvalues: var8 (ref), value (copy), p0 (ref), setFavoriteAssetModule (copy), sendCounterModule (copy), constantsModule (copy)
			return var8.getFavoriteForAsset(value):andThen(function(p2) --[[ line: 27 ]]
				-- upvalues: p0 (copy), setFavoriteAssetModule (copy), value (copy), sendCounterModule (copy), constantsModule (copy)
				if p2 == "null" then
					p0:dispatch(setFavoriteAssetModule(tostring(value), false))
				else
					p0:dispatch(setFavoriteAssetModule(tostring(value), true))
				end
				p0:dispatch(sendCounterModule(constantsModule.Counters.GetFavoriteForAsset .. constantsModule.CounterSuffix.RequestSucceeded))
			end, function(_) --[[ line: 37 ]]
				-- upvalues: p0 (copy), sendCounterModule (copy), constantsModule (copy)
				p0:dispatch(sendCounterModule(constantsModule.Counters.GetFavoriteForAsset .. constantsModule.CounterSuffix.RequestRejected))
			end)
		end)(p0):catch(function(_) --[[ line: 42 ]]
			-- upvalues: p0 (ref), sendCounterModule (copy), constantsModule (copy)
			p0:dispatch(sendCounterModule(constantsModule.Counters.GetFavoriteForAsset .. constantsModule.CounterSuffix.RequestFailed))
		end)
	end)
end