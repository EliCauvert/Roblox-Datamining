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
local var10 = createInspectAndBuyKeyMapperModule("getEconomyProductInfo")

return function(p0, p1, p2) --[[ line: 26 | named "GetEconomyProductInfo" ]]
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), var10 (ref), performFetch (ref), assetInfoModule (ref), setAssetsModule (ref), bundleInfoModule (ref), setBundlesModule (ref), sendCounterModule (ref), constantsModule (ref)
	return thunkModule.new(script.Name, list, function(p3, p4) --[[ line: 27 ]]
		-- upvalues: networkModule (copy), var10 (copy), p0 (ref), performFetch (copy), p1 (ref), assetInfoModule (copy), setAssetsModule (copy), bundleInfoModule (copy), p2 (ref), setBundlesModule (copy), sendCounterModule (copy), constantsModule (copy)
		local var11 = p4[networkModule]
		
		return performFetch.Single(var10(p3:getState().storeId, p0), function() --[[ line: 32 ]]
			-- upvalues: var11 (ref), p0 (copy), p1 (copy), assetInfoModule (copy), p3 (ref), setAssetsModule (copy), bundleInfoModule (copy), p2 (copy), setBundlesModule (copy), sendCounterModule (copy), constantsModule (copy)
			return var11.getEconomyProductInfo(p0):andThen(function(p5) --[[ line: 33 ]]
				-- upvalues: p1 (copy), assetInfoModule (copy), p3 (copy), setAssetsModule (copy), bundleInfoModule (copy), p2 (copy), setBundlesModule (copy), sendCounterModule (copy), constantsModule (copy)
				local var12 = not p5.purchasable and true
				local price = p5.price or 0
				local purchasable = p5.purchasable
				local premiumPricing = p5.premiumPricing
				
				if not p5.purchasable and p5.reason == "InsufficientFunds" then
					purchasable = true
				end
				if p1 then
					p3:dispatch(setBundlesModule({
						bundleInfoModule.fromGetEconomyProductInfo(var12, p2, price, purchasable)
					}))
				else
					p3:dispatch(setAssetsModule({
						assetInfoModule.fromGetEconomyProductInfo(p5, var12, price, purchasable, premiumPricing)
					}))
				end
				p3:dispatch(sendCounterModule(constantsModule.Counters.GetEconomyProductInfo .. constantsModule.CounterSuffix.RequestSucceeded))
			end, function(_) --[[ line: 54 ]]
				-- upvalues: p3 (copy), sendCounterModule (copy), constantsModule (copy)
				p3:dispatch(sendCounterModule(constantsModule.Counters.GetEconomyProductInfo .. constantsModule.CounterSuffix.RequestRejected))
			end)
		end)(p3):catch(function(_) --[[ line: 59 ]]
			-- upvalues: p3 (ref), sendCounterModule (copy), constantsModule (copy)
			p3:dispatch(sendCounterModule(constantsModule.Counters.GetEconomyProductInfo .. constantsModule.CounterSuffix.RequestFailed))
		end)
	end)
end