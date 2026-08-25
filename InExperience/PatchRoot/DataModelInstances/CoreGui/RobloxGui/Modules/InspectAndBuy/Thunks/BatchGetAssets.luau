local performFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
local parent = script.Parent.Parent
local thunkModule = require(parent.Thunk)
local networkModule = require(parent.Services.Network)
local sendCounterModule = require(parent.Thunks.SendCounter)
local constantsModule = require(parent.Constants)
local setAssetsModule = require(parent.Actions.SetAssets)
local getProductInfoModule = require(parent.Thunks.GetProductInfo)
local getAssetBundlesModule = require(parent.Thunks.GetAssetBundles)
local getVersionInfoModule = require(parent.Thunks.GetVersionInfo)
local list = { networkModule }

return function(value)
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), performFetch (ref), getProductInfoModule (ref), getAssetBundlesModule (ref), getVersionInfoModule (ref), setAssetsModule (ref), sendCounterModule (ref), constantsModule (ref)
	return thunkModule.new(script.Name, list, function(p0, p1)
		-- upvalues: networkModule (copy), value (ref), performFetch (copy), getProductInfoModule (copy), getAssetBundlesModule (copy), getVersionInfoModule (copy), setAssetsModule (copy), sendCounterModule (copy), constantsModule (copy)
		local var9 = p1[networkModule]
		local t = {}
		
		if value then
			for i, v in value do
				table.insert(t, tonumber(v.assetId))
			end
		end
		return performFetch.Single("BatchGetAssets", function()
			-- upvalues: var9 (ref), t (ref), p0 (ref), getProductInfoModule (copy), getAssetBundlesModule (copy), getVersionInfoModule (copy), setAssetsModule (copy), sendCounterModule (copy), constantsModule (copy)
			return var9.getBatchItemDetails(t, Enum.AvatarItemType.Asset):andThen(function(p2)
				-- upvalues: p0 (copy), getProductInfoModule (copy), getAssetBundlesModule (copy), getVersionInfoModule (copy), setAssetsModule (copy), sendCounterModule (copy), constantsModule (copy)
				local t = {}
				
				for i, v in p2 do
					table.insert(t, { assetId = tostring(v.Id) })
				end
				for i, v_1 in t do
					coroutine.wrap(function()
						-- upvalues: p0 (copy), getProductInfoModule (copy), v_1 (ref), getAssetBundlesModule (copy), getVersionInfoModule (copy)
						p0:dispatch(getProductInfoModule(v_1.assetId))
						
						if v_1.parentBundleId == nil then
							p0:dispatch(getAssetBundlesModule(v_1.assetId))
						end
						p0:dispatch(getVersionInfoModule(v_1.assetId))
					end)()
				end
				p0:dispatch(setAssetsModule(t))
				p0:dispatch(sendCounterModule(constantsModule.Counters.BatchGetAssets .. constantsModule.CounterSuffix.RequestSucceeded))
			end, function(_)
				-- upvalues: p0 (copy), sendCounterModule (copy), constantsModule (copy)
				p0:dispatch(sendCounterModule(constantsModule.Counters.BatchGetAssets .. constantsModule.CounterSuffix.RequestRejected))
			end)
		end)(p0):catch(function(_)
			-- upvalues: p0 (ref), sendCounterModule (copy), constantsModule (copy)
			p0:dispatch(sendCounterModule(constantsModule.Counters.BatchGetAssets .. constantsModule.CounterSuffix.RequestFailed))
		end)
	end)
end