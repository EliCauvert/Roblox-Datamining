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
local var8 = createInspectAndBuyKeyMapperModule("getBundleFavoriteCount")

return function(p0) --[[ line: 21 | named "GetBundleFavoriteCount" ]]
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), var8 (ref), performFetch (ref), bundleInfoModule (ref), setBundlesModule (ref), sendCounterModule (ref), constantsModule (ref)
	return thunkModule.new(script.Name, list, function(p1, p2) --[[ line: 22 ]]
		-- upvalues: networkModule (copy), var8 (copy), p0 (ref), performFetch (copy), bundleInfoModule (copy), setBundlesModule (copy), sendCounterModule (copy), constantsModule (copy)
		local var9 = p2[networkModule]
		
		return performFetch.Single(var8(p1:getState().storeId, p0), function(_) --[[ line: 27 ]]
			-- upvalues: var9 (ref), p0 (copy), bundleInfoModule (copy), p1 (ref), setBundlesModule (copy), sendCounterModule (copy), constantsModule (copy)
			return var9.getBundleFavoriteCount(p0):andThen(function(p3) --[[ line: 28 ]]
				-- upvalues: bundleInfoModule (copy), p0 (copy), p1 (copy), setBundlesModule (copy), sendCounterModule (copy), constantsModule (copy)
				if p3 then
					p1:dispatch(setBundlesModule({ bundleInfoModule.fromGetBundleFavoriteCount(p0, p3) }))
				end
				p1:dispatch(sendCounterModule(constantsModule.Counters.GetBundleFavoriteCount .. constantsModule.CounterSuffix.RequestSucceeded))
			end, function(_) --[[ line: 36 ]]
				-- upvalues: p1 (copy), sendCounterModule (copy), constantsModule (copy)
				p1:dispatch(sendCounterModule(constantsModule.Counters.GetBundleFavoriteCount .. constantsModule.CounterSuffix.RequestRejected))
			end)
		end)(p1):catch(function(_) --[[ line: 41 ]]
			-- upvalues: p1 (ref), sendCounterModule (copy), constantsModule (copy)
			p1:dispatch(sendCounterModule(constantsModule.Counters.GetBundleFavoriteCount .. constantsModule.CounterSuffix.RequestFailed))
		end)
	end)
end