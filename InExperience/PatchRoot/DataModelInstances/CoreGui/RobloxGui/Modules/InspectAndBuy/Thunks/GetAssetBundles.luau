local performFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
local parent = script.Parent.Parent
local thunkModule = require(parent.Thunk)
local networkModule = require(parent.Services.Network)
local bundleInfoModule = require(parent.Models.BundleInfo)
local setBundlesModule = require(parent.Actions.SetBundles)
local getProductInfoModule = require(parent.Thunks.GetProductInfo)
local createInspectAndBuyKeyMapperModule = require(parent.createInspectAndBuyKeyMapper)
local setAssetToBundlesMappingModule = require(parent.Actions.SetAssetToBundlesMapping)
local sendCounterModule = require(parent.Thunks.SendCounter)
local constantsModule = require(parent.Constants)
local list = { networkModule }
local var1 = createInspectAndBuyKeyMapperModule("getAssetBundles")

return function(value)
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), var1 (ref), performFetch (ref), bundleInfoModule (ref), getProductInfoModule (ref), setBundlesModule (ref), setAssetToBundlesMappingModule (ref), sendCounterModule (ref), constantsModule (ref)
	return thunkModule.new(script.Name, list, function(p1, p2)
		-- upvalues: networkModule (copy), var1 (copy), value (ref), performFetch (copy), bundleInfoModule (copy), getProductInfoModule (copy), setBundlesModule (copy), setAssetToBundlesMappingModule (copy), sendCounterModule (copy), constantsModule (copy)
		local var2 = p2[networkModule]
		
		return performFetch.Single(var1(p1:getState().storeId, value), function(_)
			-- upvalues: var2 (ref), value (copy), bundleInfoModule (copy), p1 (ref), getProductInfoModule (copy), setBundlesModule (copy), setAssetToBundlesMappingModule (copy), sendCounterModule (copy), constantsModule (copy)
			return var2.getAssetBundles(value):andThen(function(p3)
				-- upvalues: bundleInfoModule (copy), p1 (copy), getProductInfoModule (copy), setBundlesModule (copy), setAssetToBundlesMappingModule (copy), value (copy), sendCounterModule (copy), constantsModule (copy)
				local var3
				local t = {}
				local t_1 = {}
				
				for i, v in pairs(p3.data) do
					local var4 = bundleInfoModule.fromGetAssetBundles(v)
					table.insert(t_1, var4)
					table.insert(t, tostring(var4.bundleId))
					var3 = false
					
					for i_1, v_1 in pairs(v.items) do
						if v_1.type == "UserOutfit" then
							var3 = true
							break
						end
					end
					if not var3 then
						for i_1, v_1 in pairs(v.items) do
							if not p1:getState().assets[v_1.id] then
								coroutine.wrap(function()
									-- upvalues: p1 (copy), getProductInfoModule (copy), v_1 (ref)
									p1:dispatch(getProductInfoModule(v_1.id))
								end)()
							end
						end
					end
				end
				p1:dispatch(setBundlesModule(t_1))
				p1:dispatch(setAssetToBundlesMappingModule(tostring(value), t))
				p1:dispatch(sendCounterModule(constantsModule.Counters.GetAssetBundles .. constantsModule.CounterSuffix.RequestSucceeded))
			end, function(_)
				-- upvalues: p1 (copy), sendCounterModule (copy), constantsModule (copy)
				p1:dispatch(sendCounterModule(constantsModule.Counters.GetAssetBundles .. constantsModule.CounterSuffix.RequestRejected))
			end)
		end)(p1):catch(function(_)
			-- upvalues: p1 (ref), sendCounterModule (copy), constantsModule (copy)
			p1:dispatch(sendCounterModule(constantsModule.Counters.GetAssetBundles .. constantsModule.CounterSuffix.RequestFailed))
		end)
	end)
end