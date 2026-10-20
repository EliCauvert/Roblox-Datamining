local PerformFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
local Parent = script.Parent.Parent
local ThunkModule = require(Parent.Thunk)
local NetworkModule = require(Parent.Services.Network)
local BundleInfoModule = require(Parent.Models.BundleInfo)
local SetBundlesModule = require(Parent.Actions.SetBundles)
local GetProductInfoModule = require(Parent.Thunks.GetProductInfo)
local SetAssetToBundlesMappingModule = require(Parent.Actions.SetAssetToBundlesMapping)
local SendCounterModule = require(Parent.Thunks.SendCounter)
local ConstantsModule = require(Parent.Constants)
local list = { NetworkModule }
local GetAssetBundles = require(Parent.createInspectAndBuyKeyMapper)("getAssetBundles")

return function(p1)
	-- upvalues: ThunkModule (copy), list (copy), NetworkModule (copy), GetAssetBundles (copy), PerformFetch (copy), BundleInfoModule (copy), GetProductInfoModule (copy), SetBundlesModule (copy), SetAssetToBundlesMappingModule (copy), SendCounterModule (copy), ConstantsModule (copy)
	return ThunkModule.new(script.Name, list, function(p2, p3)
		-- upvalues: NetworkModule (upval), GetAssetBundles (upval), p1 (copy), PerformFetch (upval), BundleInfoModule (upval), GetProductInfoModule (upval), SetBundlesModule (upval), SetAssetToBundlesMappingModule (upval), SendCounterModule (upval), ConstantsModule (upval)
		local v1 = p3[NetworkModule]
		
		return PerformFetch.Single(GetAssetBundles(p2:getState().storeId, p1), function(_)
			-- upvalues: v1 (copy), p1 (upval), BundleInfoModule (upval), p2 (copy), GetProductInfoModule (upval), SetBundlesModule (upval), SetAssetToBundlesMappingModule (upval), SendCounterModule (upval), ConstantsModule (upval)
			return v1.getAssetBundles(p1):andThen(function(Result)
				-- upvalues: BundleInfoModule (upval), p2 (upval), GetProductInfoModule (upval), SetBundlesModule (upval), SetAssetToBundlesMappingModule (upval), p1 (upval), SendCounterModule (upval), ConstantsModule (upval)
				local List = {}
				local FromGetAssetBundlesResults = {}
				local Flag = nil
				
				for _, entry in pairs(Result.data) do
					local FromGetAssetBundlesResult = BundleInfoModule.fromGetAssetBundles(entry)
					table.insert(FromGetAssetBundlesResults, FromGetAssetBundlesResult)
					table.insert(List, (tostring(FromGetAssetBundlesResult.bundleId)))
					Flag = false
					
					for _, item in pairs(entry.items) do
						if item.type == "UserOutfit" then
							Flag = true
							break
						end
					end
					if not Flag then
						for _, item1 in pairs(entry.items) do
							if not p2:getState().assets[item1.id] then
								coroutine.wrap(function()
									-- upvalues: p2 (upval), GetProductInfoModule (upval), item1 (copy)
									p2:dispatch(GetProductInfoModule(item1.id))
								end)()
							end
						end
					end
				end
				p2:dispatch(SetBundlesModule(FromGetAssetBundlesResults))
				p2:dispatch(SetAssetToBundlesMappingModule(tostring(p1), List))
				p2:dispatch(SendCounterModule(ConstantsModule.Counters.GetAssetBundles .. ConstantsModule.CounterSuffix.RequestSucceeded))
			end, function(_)
				-- upvalues: p2 (upval), SendCounterModule (upval), ConstantsModule (upval)
				p2:dispatch(SendCounterModule(ConstantsModule.Counters.GetAssetBundles .. ConstantsModule.CounterSuffix.RequestRejected))
			end)
		end)(p2):catch(function(_)
			-- upvalues: p2 (copy), SendCounterModule (upval), ConstantsModule (upval)
			p2:dispatch(SendCounterModule(ConstantsModule.Counters.GetAssetBundles .. ConstantsModule.CounterSuffix.RequestFailed))
		end)
	end)
end