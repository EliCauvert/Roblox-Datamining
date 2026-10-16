local PerformFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
local Parent = script.Parent.Parent
local ThunkModule = require(Parent.Thunk)
local NetworkModule = require(Parent.Services.Network)
local SetFavoriteBundleModule = require(Parent.Actions.SetFavoriteBundle)
local SendCounterModule = require(Parent.Thunks.SendCounter)
local ConstantsModule = require(Parent.Constants)
local list = { NetworkModule }
local GetFavoriteForBundle = require(Parent.createInspectAndBuyKeyMapper)("getFavoriteForBundle")

return function(p1) --[[ Line: 20 | Named "GetFavoriteForBundle" ]]
	-- upvalues: ThunkModule (copy), list (copy), NetworkModule (copy), GetFavoriteForBundle (copy), PerformFetch (copy), SetFavoriteBundleModule (copy), SendCounterModule (copy), ConstantsModule (copy)
	return ThunkModule.new(script.Name, list, function(p2, p3) --[[ Line: 21 ]]
		-- upvalues: NetworkModule (upval), GetFavoriteForBundle (upval), p1 (copy), PerformFetch (upval), SetFavoriteBundleModule (upval), SendCounterModule (upval), ConstantsModule (upval)
		local v1 = p3[NetworkModule]
		
		return PerformFetch.Single(GetFavoriteForBundle(p2:getState().storeId, p1), function(_) --[[ Line: 26 ]]
			-- upvalues: v1 (copy), p1 (upval), p2 (copy), SetFavoriteBundleModule (upval), SendCounterModule (upval), ConstantsModule (upval)
			return v1.getFavoriteForBundle(p1):andThen(function(Result) --[[ Line: 27 ]]
				-- upvalues: p2 (upval), SetFavoriteBundleModule (upval), p1 (upval), SendCounterModule (upval), ConstantsModule (upval)
				if Result == "null" then
					p2:dispatch(SetFavoriteBundleModule(tostring(p1), false))
				else
					p2:dispatch(SetFavoriteBundleModule(tostring(p1), true))
				end
				p2:dispatch(SendCounterModule(ConstantsModule.Counters.GetFavoriteForBundle .. ConstantsModule.CounterSuffix.RequestSucceeded))
			end, function(_) --[[ Line: 37 ]]
				-- upvalues: p2 (upval), SendCounterModule (upval), ConstantsModule (upval)
				p2:dispatch(SendCounterModule(ConstantsModule.Counters.GetFavoriteForBundle .. ConstantsModule.CounterSuffix.RequestRejected))
			end)
		end)(p2):catch(function(_) --[[ Line: 42 ]]
			-- upvalues: p2 (copy), SendCounterModule (upval), ConstantsModule (upval)
			p2:dispatch(SendCounterModule(ConstantsModule.Counters.GetFavoriteForBundle .. ConstantsModule.CounterSuffix.RequestFailed))
		end)
	end)
end