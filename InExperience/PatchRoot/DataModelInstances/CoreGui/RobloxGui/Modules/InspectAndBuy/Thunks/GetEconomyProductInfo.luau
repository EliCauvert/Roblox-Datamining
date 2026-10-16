local PerformFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
local Parent = script.Parent.Parent
local ThunkModule = require(Parent.Thunk)
local AssetInfoModule = require(Parent.Models.AssetInfo)
local BundleInfoModule = require(Parent.Models.BundleInfo)
local NetworkModule = require(Parent.Services.Network)
local SetAssetsModule = require(Parent.Actions.SetAssets)
local SetBundlesModule = require(Parent.Actions.SetBundles)
local SendCounterModule = require(Parent.Thunks.SendCounter)
local ConstantsModule = require(Parent.Constants)
local list = { NetworkModule }
local GetEconomyProductInfo = require(Parent.createInspectAndBuyKeyMapper)("getEconomyProductInfo")

return function(p1, p2, p3) --[[ Line: 26 | Named "GetEconomyProductInfo" ]]
	-- upvalues: ThunkModule (copy), list (copy), NetworkModule (copy), GetEconomyProductInfo (copy), PerformFetch (copy), AssetInfoModule (copy), SetAssetsModule (copy), BundleInfoModule (copy), SetBundlesModule (copy), SendCounterModule (copy), ConstantsModule (copy)
	return ThunkModule.new(script.Name, list, function(p4, p5) --[[ Line: 27 ]]
		-- upvalues: NetworkModule (upval), GetEconomyProductInfo (upval), p1 (copy), PerformFetch (upval), p2 (copy), AssetInfoModule (upval), SetAssetsModule (upval), BundleInfoModule (upval), p3 (copy), SetBundlesModule (upval), SendCounterModule (upval), ConstantsModule (upval)
		local v1 = p5[NetworkModule]
		
		return PerformFetch.Single(GetEconomyProductInfo(p4:getState().storeId, p1), function() --[[ Line: 32 ]]
			-- upvalues: v1 (copy), p1 (upval), p2 (upval), AssetInfoModule (upval), p4 (copy), SetAssetsModule (upval), BundleInfoModule (upval), p3 (upval), SetBundlesModule (upval), SendCounterModule (upval), ConstantsModule (upval)
			return v1.getEconomyProductInfo(p1):andThen(function(Result) --[[ Line: 33 ]]
				-- upvalues: p2 (upval), AssetInfoModule (upval), p4 (upval), SetAssetsModule (upval), BundleInfoModule (upval), p3 (upval), SetBundlesModule (upval), SendCounterModule (upval), ConstantsModule (upval)
				local IsAlreadyOwned: boolean = not Result.purchasable and Result.reason == "AlreadyOwned"
				local Price = Result.price or 0
				local Purchasable = Result.purchasable
				local PremiumPricing = Result.premiumPricing
				
				if not Result.purchasable and Result.reason == "InsufficientFunds" then
					Purchasable = true
				end
				if p2 then
					p4:dispatch(SetBundlesModule({
						(BundleInfoModule.fromGetEconomyProductInfo(IsAlreadyOwned, p3, Price, Purchasable))
					}))
				else
					p4:dispatch(SetAssetsModule({
						(AssetInfoModule.fromGetEconomyProductInfo(Result, IsAlreadyOwned, Price, Purchasable, PremiumPricing))
					}))
				end
				p4:dispatch(SendCounterModule(ConstantsModule.Counters.GetEconomyProductInfo .. ConstantsModule.CounterSuffix.RequestSucceeded))
			end, function(_) --[[ Line: 54 ]]
				-- upvalues: p4 (upval), SendCounterModule (upval), ConstantsModule (upval)
				p4:dispatch(SendCounterModule(ConstantsModule.Counters.GetEconomyProductInfo .. ConstantsModule.CounterSuffix.RequestRejected))
			end)
		end)(p4):catch(function(_) --[[ Line: 59 ]]
			-- upvalues: p4 (copy), SendCounterModule (upval), ConstantsModule (upval)
			p4:dispatch(SendCounterModule(ConstantsModule.Counters.GetEconomyProductInfo .. ConstantsModule.CounterSuffix.RequestFailed))
		end)
	end)
end