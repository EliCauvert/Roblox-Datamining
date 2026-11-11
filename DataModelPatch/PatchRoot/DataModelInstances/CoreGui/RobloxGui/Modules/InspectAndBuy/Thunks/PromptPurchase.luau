local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")
local Parent = script.Parent.Parent
local ThunkModule = require(Parent.Thunk)
local AnalyticsModule = require(Parent.Services.Analytics)
local ConstantsModule = require(Parent.Constants)
local SetItemBeingPurchasedModule = require(Parent.Actions.SetItemBeingPurchased)
local SendCounterModule = require(Parent.Thunks.SendCounter)
local list = { AnalyticsModule }

return function(AssetId, Bundle, CollectibleItemId, CollectibleProductId, CollectibleItemInstanceId, ExpectedPrice, p1)
	-- upvalues: ThunkModule (copy), list (copy), AnalyticsModule (copy), SetItemBeingPurchasedModule (copy), ConstantsModule (copy), MarketplaceService (copy), Players (copy), SendCounterModule (copy)
	return ThunkModule.new(script.Name, list, function(p2, p3)
		-- upvalues: AnalyticsModule (upval), SetItemBeingPurchasedModule (upval), AssetId (copy), Bundle (copy), CollectibleProductId (copy), ConstantsModule (upval), MarketplaceService (upval), Players (upval), CollectibleItemId (copy), CollectibleItemInstanceId (copy), ExpectedPrice (copy), SendCounterModule (upval), p1 (copy)
		local v1 = p3[AnalyticsModule]
		p2:dispatch(SetItemBeingPurchasedModule(AssetId, Bundle))
		
		if CollectibleProductId ~= nil and Bundle ~= ConstantsModule.ItemType.Bundle then
			MarketplaceService:PromptCollectiblesPurchase(Players.LocalPlayer, AssetId, CollectibleItemId, CollectibleItemInstanceId, CollectibleProductId, ExpectedPrice)
			p2:dispatch(SendCounterModule(ConstantsModule.Counters.PromptLimitedCollectiblesPurchase))
		elseif Bundle == ConstantsModule.ItemType.Bundle then
			MarketplaceService:PromptBundlePurchase(Players.LocalPlayer, AssetId)
			p2:dispatch(SendCounterModule(ConstantsModule.Counters.PromptBundlePurchase))
		elseif Bundle == ConstantsModule.ItemType.Asset then
			if CollectibleItemId == nil or not not p1 then
				MarketplaceService:PromptRobloxPurchase(AssetId, false)
				p2:dispatch(SendCounterModule(ConstantsModule.Counters.PromptRobloxPurchase))
			else
				MarketplaceService:PromptPurchase(Players.LocalPlayer, AssetId, false)
				p2:dispatch(SendCounterModule(ConstantsModule.Counters.PromptUnlimitedCollectiblePurchase))
			end
		else
			p2:dispatch(SendCounterModule(ConstantsModule.Counters.PromptPurchaseUnknownItemType))
		end
		v1.reportPurchaseAttempt(Bundle, AssetId)
	end)
end