local performFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
local parent = script.Parent.Parent
local thunkModule = require(parent.Thunk)
local assetInfoModule = require(parent.Models.AssetInfo)
local bundleInfoModule = require(parent.Models.BundleInfo)
local networkModule = require(parent.Services.Network)
local setAssetsModule = require(parent.Actions.SetAssets)
local setBundlesModule = require(parent.Actions.SetBundles)
local createInspectAndBuyKeyMapperModule = require(parent.createInspectAndBuyKeyMapper)
local sendCounterModule = require(parent.Thunks.SendCounter)
local constantsModule = require(parent.Constants)
local list = { networkModule }
local var1 = createInspectAndBuyKeyMapperModule("getEconomyProductInfo")

return function(p1, p2, p3)
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), var1 (ref), performFetch (ref), assetInfoModule (ref), setAssetsModule (ref), bundleInfoModule (ref), setBundlesModule (ref), sendCounterModule (ref), constantsModule (ref)
	return thunkModule.new(script.Name, list, function(p4, p5)
		-- upvalues: networkModule (copy), var1 (copy), p1 (ref), performFetch (copy), p2 (ref), assetInfoModule (copy), setAssetsModule (copy), bundleInfoModule (copy), p3 (ref), setBundlesModule (copy), sendCounterModule (copy), constantsModule (copy)
		local var2 = p5[networkModule]
		
		return performFetch.Single(var1(p4:getState().storeId, p1), function()
			-- upvalues: var2 (ref), p1 (copy), p2 (copy), assetInfoModule (copy), p4 (ref), setAssetsModule (copy), bundleInfoModule (copy), p3 (copy), setBundlesModule (copy), sendCounterModule (copy), constantsModule (copy)
			return var2.getEconomyProductInfo(p1):andThen(function(p6)
				-- upvalues: p2 (copy), assetInfoModule (copy), p4 (copy), setAssetsModule (copy), bundleInfoModule (copy), p3 (copy), setBundlesModule (copy), sendCounterModule (copy), constantsModule (copy)
				local var3 = not p6.purchasable and true
				local price = p6.price or 0
				local purchasable = p6.purchasable
				local premiumPricing = p6.premiumPricing
				
				if not p6.purchasable and p6.reason == "InsufficientFunds" then
					purchasable = true
				end
				if p2 then
					p4:dispatch(setBundlesModule({
						bundleInfoModule.fromGetEconomyProductInfo(var3, p3, price, purchasable)
					}))
				else
					p4:dispatch(setAssetsModule({
						assetInfoModule.fromGetEconomyProductInfo(p6, var3, price, purchasable, premiumPricing)
					}))
				end
				p4:dispatch(sendCounterModule(constantsModule.Counters.GetEconomyProductInfo .. constantsModule.CounterSuffix.RequestSucceeded))
			end, function(_)
				-- upvalues: p4 (copy), sendCounterModule (copy), constantsModule (copy)
				p4:dispatch(sendCounterModule(constantsModule.Counters.GetEconomyProductInfo .. constantsModule.CounterSuffix.RequestRejected))
			end)
		end)(p4):catch(function(_)
			-- upvalues: p4 (ref), sendCounterModule (copy), constantsModule (copy)
			p4:dispatch(sendCounterModule(constantsModule.Counters.GetEconomyProductInfo .. constantsModule.CounterSuffix.RequestFailed))
		end)
	end)
end