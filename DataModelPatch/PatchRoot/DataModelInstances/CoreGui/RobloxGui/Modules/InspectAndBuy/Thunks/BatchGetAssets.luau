local PerformFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
local Parent = script.Parent.Parent
local ThunkModule = require(Parent.Thunk)
local NetworkModule = require(Parent.Services.Network)
local SendCounterModule = require(Parent.Thunks.SendCounter)
local ConstantsModule = require(Parent.Constants)
local SetAssetsModule = require(Parent.Actions.SetAssets)
local GetProductInfoModule = require(Parent.Thunks.GetProductInfo)
local GetAssetBundlesModule = require(Parent.Thunks.GetAssetBundles)
local GetVersionInfoModule = require(Parent.Thunks.GetVersionInfo)
local list = { NetworkModule }

return function(p1)
	-- upvalues: ThunkModule (copy), list (copy), NetworkModule (copy), PerformFetch (copy), GetProductInfoModule (copy), GetAssetBundlesModule (copy), GetVersionInfoModule (copy), SetAssetsModule (copy), SendCounterModule (copy), ConstantsModule (copy)
	return ThunkModule.new(script.Name, list, function(p2, p3)
		-- upvalues: NetworkModule (upval), p1 (copy), PerformFetch (upval), GetProductInfoModule (upval), GetAssetBundlesModule (upval), GetVersionInfoModule (upval), SetAssetsModule (upval), SendCounterModule (upval), ConstantsModule (upval)
		local v1 = p3[NetworkModule]
		local List = {}
		
		if p1 then
			for _, value in p1 do
				table.insert(List, (tonumber(value.assetId)))
			end
		end
		return PerformFetch.Single("BatchGetAssets", function()
			-- upvalues: v1 (copy), List (copy), p2 (copy), GetProductInfoModule (upval), GetAssetBundlesModule (upval), GetVersionInfoModule (upval), SetAssetsModule (upval), SendCounterModule (upval), ConstantsModule (upval)
			return v1.getBatchItemDetails(List, Enum.AvatarItemType.Asset):andThen(function(Result)
				-- upvalues: p2 (upval), GetProductInfoModule (upval), GetAssetBundlesModule (upval), GetVersionInfoModule (upval), SetAssetsModule (upval), SendCounterModule (upval), ConstantsModule (upval)
				local List = {}
				
				for _, value in Result do
					table.insert(List, { assetId = tostring(value.Id) })
				end
				for _, value1 in List do
					coroutine.wrap(function()
						-- upvalues: p2 (upval), GetProductInfoModule (upval), value1 (copy), GetAssetBundlesModule (upval), GetVersionInfoModule (upval)
						p2:dispatch(GetProductInfoModule(value1.assetId))
						
						if value1.parentBundleId == nil then
							p2:dispatch(GetAssetBundlesModule(value1.assetId))
						end
						p2:dispatch(GetVersionInfoModule(value1.assetId))
					end)()
				end
				p2:dispatch(SetAssetsModule(List))
				p2:dispatch(SendCounterModule(ConstantsModule.Counters.BatchGetAssets .. ConstantsModule.CounterSuffix.RequestSucceeded))
			end, function(_)
				-- upvalues: p2 (upval), SendCounterModule (upval), ConstantsModule (upval)
				p2:dispatch(SendCounterModule(ConstantsModule.Counters.BatchGetAssets .. ConstantsModule.CounterSuffix.RequestRejected))
			end)
		end)(p2):catch(function(_)
			-- upvalues: p2 (copy), SendCounterModule (upval), ConstantsModule (upval)
			p2:dispatch(SendCounterModule(ConstantsModule.Counters.BatchGetAssets .. ConstantsModule.CounterSuffix.RequestFailed))
		end)
	end)
end