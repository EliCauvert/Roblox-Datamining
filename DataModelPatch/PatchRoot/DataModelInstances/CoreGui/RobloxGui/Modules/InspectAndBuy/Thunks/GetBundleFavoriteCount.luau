local PerformFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
local Parent = script.Parent.Parent
local ThunkModule = require(Parent.Thunk)
local NetworkModule = require(Parent.Services.Network)
local SetBundlesModule = require(Parent.Actions.SetBundles)
local BundleInfoModule = require(Parent.Models.BundleInfo)
local SendCounterModule = require(Parent.Thunks.SendCounter)
local ConstantsModule = require(Parent.Constants)
local list = { NetworkModule }
local GetBundleFavoriteCount = require(Parent.createInspectAndBuyKeyMapper)("getBundleFavoriteCount")

return function(p1)
	-- upvalues: ThunkModule (copy), list (copy), NetworkModule (copy), GetBundleFavoriteCount (copy), PerformFetch (copy), BundleInfoModule (copy), SetBundlesModule (copy), SendCounterModule (copy), ConstantsModule (copy)
	return ThunkModule.new(script.Name, list, function(p2, p3)
		-- upvalues: NetworkModule (upval), GetBundleFavoriteCount (upval), p1 (copy), PerformFetch (upval), BundleInfoModule (upval), SetBundlesModule (upval), SendCounterModule (upval), ConstantsModule (upval)
		local v1 = p3[NetworkModule]
		
		return PerformFetch.Single(GetBundleFavoriteCount(p2:getState().storeId, p1), function(_)
			-- upvalues: v1 (copy), p1 (upval), BundleInfoModule (upval), p2 (copy), SetBundlesModule (upval), SendCounterModule (upval), ConstantsModule (upval)
			return v1.getBundleFavoriteCount(p1):andThen(function(Result)
				-- upvalues: BundleInfoModule (upval), p1 (upval), p2 (upval), SetBundlesModule (upval), SendCounterModule (upval), ConstantsModule (upval)
				if Result then
					p2:dispatch(SetBundlesModule({
						(BundleInfoModule.fromGetBundleFavoriteCount(p1, Result))
					}))
				end
				p2:dispatch(SendCounterModule(ConstantsModule.Counters.GetBundleFavoriteCount .. ConstantsModule.CounterSuffix.RequestSucceeded))
			end, function(_)
				-- upvalues: p2 (upval), SendCounterModule (upval), ConstantsModule (upval)
				p2:dispatch(SendCounterModule(ConstantsModule.Counters.GetBundleFavoriteCount .. ConstantsModule.CounterSuffix.RequestRejected))
			end)
		end)(p2):catch(function(_)
			-- upvalues: p2 (copy), SendCounterModule (upval), ConstantsModule (upval)
			p2:dispatch(SendCounterModule(ConstantsModule.Counters.GetBundleFavoriteCount .. ConstantsModule.CounterSuffix.RequestFailed))
		end)
	end)
end