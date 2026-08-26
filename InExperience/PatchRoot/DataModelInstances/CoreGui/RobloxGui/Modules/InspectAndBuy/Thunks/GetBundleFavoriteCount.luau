local performFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
local parent = script.Parent.Parent
local thunkModule = require(parent.Thunk)
local networkModule = require(parent.Services.Network)
local setBundlesModule = require(parent.Actions.SetBundles)
local bundleInfoModule = require(parent.Models.BundleInfo)
local createInspectAndBuyKeyMapperModule = require(parent.createInspectAndBuyKeyMapper)
local sendCounterModule = require(parent.Thunks.SendCounter)
local constantsModule = require(parent.Constants)
local list = { networkModule }
local var1 = createInspectAndBuyKeyMapperModule("getBundleFavoriteCount")

return function(p1)
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), var1 (ref), performFetch (ref), bundleInfoModule (ref), setBundlesModule (ref), sendCounterModule (ref), constantsModule (ref)
	return thunkModule.new(script.Name, list, function(p2, p3)
		-- upvalues: networkModule (copy), var1 (copy), p1 (ref), performFetch (copy), bundleInfoModule (copy), setBundlesModule (copy), sendCounterModule (copy), constantsModule (copy)
		local var2 = p3[networkModule]
		
		return performFetch.Single(var1(p2:getState().storeId, p1), function(_)
			-- upvalues: var2 (ref), p1 (copy), bundleInfoModule (copy), p2 (ref), setBundlesModule (copy), sendCounterModule (copy), constantsModule (copy)
			return var2.getBundleFavoriteCount(p1):andThen(function(p4)
				-- upvalues: bundleInfoModule (copy), p1 (copy), p2 (copy), setBundlesModule (copy), sendCounterModule (copy), constantsModule (copy)
				if p4 then
					p2:dispatch(setBundlesModule({ bundleInfoModule.fromGetBundleFavoriteCount(p1, p4) }))
				end
				p2:dispatch(sendCounterModule(constantsModule.Counters.GetBundleFavoriteCount .. constantsModule.CounterSuffix.RequestSucceeded))
			end, function(_)
				-- upvalues: p2 (copy), sendCounterModule (copy), constantsModule (copy)
				p2:dispatch(sendCounterModule(constantsModule.Counters.GetBundleFavoriteCount .. constantsModule.CounterSuffix.RequestRejected))
			end)
		end)(p2):catch(function(_)
			-- upvalues: p2 (ref), sendCounterModule (copy), constantsModule (copy)
			p2:dispatch(sendCounterModule(constantsModule.Counters.GetBundleFavoriteCount .. constantsModule.CounterSuffix.RequestFailed))
		end)
	end)
end