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
local var10 = createInspectAndBuyKeyMapperModule("getAssetBundles")

return function(value)
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), var10 (ref), performFetch (ref), bundleInfoModule (ref), getProductInfoModule (ref), setBundlesModule (ref), setAssetToBundlesMappingModule (ref), sendCounterModule (ref), constantsModule (ref)
	return thunkModule.new(script.Name, list, function(p0, p1)
		-- upvalues: networkModule (copy), var10 (copy), value (ref), performFetch (copy), bundleInfoModule (copy), getProductInfoModule (copy), setBundlesModule (copy), setAssetToBundlesMappingModule (copy), sendCounterModule (copy), constantsModule (copy)
		local var11 = p1[networkModule]
		
		return performFetch.Single(var10(p0:getState().storeId, value), function(_)
			-- upvalues: var11 (ref), value (copy), bundleInfoModule (copy), p0 (ref), getProductInfoModule (copy), setBundlesModule (copy), setAssetToBundlesMappingModule (copy), sendCounterModule (copy), constantsModule (copy)
			return var11.getAssetBundles(value):andThen(function(p2)
				-- upvalues: bundleInfoModule (copy), p0 (copy), getProductInfoModule (copy), setBundlesModule (copy), setAssetToBundlesMappingModule (copy), value (copy), sendCounterModule (copy), constantsModule (copy)
				local var15
				local t = {}
				local t_1 = {}
				
				for i, v in pairs(p2.data) do
					local var14 = bundleInfoModule.fromGetAssetBundles(v)
					table.insert(t_1, var14)
					table.insert(t, tostring(var14.bundleId))
					var15 = false
					
					for i_1, v_1 in pairs(v.items) do
						if v_1.type == "UserOutfit" then
							var15 = true
							break
						end
					end
					if not var15 then
						for i_1, v_1 in pairs(v.items) do
							if not p0:getState().assets[v_1.id] then
								coroutine.wrap(function()
									-- upvalues: p0 (copy), getProductInfoModule (copy), v_1 (ref)
									p0:dispatch(getProductInfoModule(v_1.id))
								end)()
							end
						end
					end
				end
				p0:dispatch(setBundlesModule(t_1))
				p0:dispatch(setAssetToBundlesMappingModule(tostring(value), t))
				p0:dispatch(sendCounterModule(constantsModule.Counters.GetAssetBundles .. constantsModule.CounterSuffix.RequestSucceeded))
			end, function(_)
				-- upvalues: p0 (copy), sendCounterModule (copy), constantsModule (copy)
				p0:dispatch(sendCounterModule(constantsModule.Counters.GetAssetBundles .. constantsModule.CounterSuffix.RequestRejected))
			end)
		end)(p0):catch(function(_)
			-- upvalues: p0 (ref), sendCounterModule (copy), constantsModule (copy)
			p0:dispatch(sendCounterModule(constantsModule.Counters.GetAssetBundles .. constantsModule.CounterSuffix.RequestFailed))
		end)
	end)
end