local performFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
local parent = script.Parent.Parent
local thunkModule = require(parent.Thunk)
local networkModule = require(parent.Services.Network)
local setFavoriteBundleModule = require(parent.Actions.SetFavoriteBundle)
local createInspectAndBuyKeyMapperModule = require(parent.createInspectAndBuyKeyMapper)
local sendCounterModule = require(parent.Thunks.SendCounter)
local constantsModule = require(parent.Constants)
local list = { networkModule }
local var7 = createInspectAndBuyKeyMapperModule("getFavoriteForBundle")

return function(p0)
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), var7 (ref), performFetch (ref), setFavoriteBundleModule (ref), sendCounterModule (ref), constantsModule (ref)
	return thunkModule.new(script.Name, list, function(p1, p2)
		-- upvalues: networkModule (copy), var7 (copy), p0 (ref), performFetch (copy), setFavoriteBundleModule (copy), sendCounterModule (copy), constantsModule (copy)
		local var8 = p2[networkModule]
		
		return performFetch.Single(var7(p1:getState().storeId, p0), function(_)
			-- upvalues: var8 (ref), p0 (copy), p1 (ref), setFavoriteBundleModule (copy), sendCounterModule (copy), constantsModule (copy)
			return var8.getFavoriteForBundle(p0):andThen(function(p3)
				-- upvalues: p1 (copy), setFavoriteBundleModule (copy), p0 (copy), sendCounterModule (copy), constantsModule (copy)
				if p3 == "null" then
					p1:dispatch(setFavoriteBundleModule(tostring(p0), false))
				else
					p1:dispatch(setFavoriteBundleModule(tostring(p0), true))
				end
				p1:dispatch(sendCounterModule(constantsModule.Counters.GetFavoriteForBundle .. constantsModule.CounterSuffix.RequestSucceeded))
			end, function(_)
				-- upvalues: p1 (copy), sendCounterModule (copy), constantsModule (copy)
				p1:dispatch(sendCounterModule(constantsModule.Counters.GetFavoriteForBundle .. constantsModule.CounterSuffix.RequestRejected))
			end)
		end)(p1):catch(function(_)
			-- upvalues: p1 (ref), sendCounterModule (copy), constantsModule (copy)
			p1:dispatch(sendCounterModule(constantsModule.Counters.GetFavoriteForBundle .. constantsModule.CounterSuffix.RequestFailed))
		end)
	end)
end