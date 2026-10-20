local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")
local Parent = script.Parent.Parent
local ThunkModule = require(Parent.Thunk)
local AnalyticsModule = require(Parent.Services.Analytics)
local ConstantsModule = require(Parent.Constants)
local SetItemBeingPurchasedModule = require(Parent.Actions.SetItemBeingPurchased)
local SendCounterModule = require(Parent.Thunks.SendCounter)
local ReportPurchaseAttemptUnifiedEventModule = require(Parent.Thunks.ReportPurchaseAttemptUnifiedEvent)
local FFlagAXIaBSinglePurchaseUnifiedEventsModule = require(Parent.Flags.FFlagAXIaBSinglePurchaseUnifiedEvents)
local FixInspectAndBuyThirdPartySales = game:DefineFastFlag("FixInspectAndBuyThirdPartySales", false)
local list = { AnalyticsModule }

return function(AssetId, Bundle, CollectibleItemId, CollectibleProductId, CollectibleItemInstanceId, ExpectedPrice, p1)
	-- upvalues: ThunkModule (copy), list (copy), AnalyticsModule (copy), ConstantsModule (copy), FFlagAXIaBSinglePurchaseUnifiedEventsModule (copy), SetItemBeingPurchasedModule (copy), MarketplaceService (copy), Players (copy), SendCounterModule (copy), FixInspectAndBuyThirdPartySales (copy), ReportPurchaseAttemptUnifiedEventModule (copy)
	return ThunkModule.new(script.Name, list, function(p2, p3)
		-- upvalues: AnalyticsModule (upval), CollectibleProductId (copy), Bundle (copy), ConstantsModule (upval), FFlagAXIaBSinglePurchaseUnifiedEventsModule (upval), ExpectedPrice (copy), SetItemBeingPurchasedModule (upval), AssetId (copy), MarketplaceService (upval), Players (upval), CollectibleItemId (copy), CollectibleItemInstanceId (copy), SendCounterModule (upval), p1 (copy), FixInspectAndBuyThirdPartySales (upval), ReportPurchaseAttemptUnifiedEventModule (upval)
		local v1 = p3[AnalyticsModule]
		local IsNotBundleMatch: boolean = CollectibleProductId ~= nil and Bundle ~= ConstantsModule.ItemType.Bundle
		local ExpectedPrice1 = if FFlagAXIaBSinglePurchaseUnifiedEventsModule and IsNotBundleMatch then ExpectedPrice else nil
		p2:dispatch(SetItemBeingPurchasedModule(AssetId, Bundle, ExpectedPrice1))
		
		if IsNotBundleMatch then
			MarketplaceService:PromptCollectiblesPurchase(Players.LocalPlayer, AssetId, CollectibleItemId, CollectibleItemInstanceId, CollectibleProductId, ExpectedPrice)
			p2:dispatch(SendCounterModule(ConstantsModule.Counters.PromptLimitedCollectiblesPurchase))
		elseif Bundle == ConstantsModule.ItemType.Bundle then
			MarketplaceService:PromptBundlePurchase(Players.LocalPlayer, AssetId)
			p2:dispatch(SendCounterModule(ConstantsModule.Counters.PromptBundlePurchase))
		elseif Bundle == ConstantsModule.ItemType.Asset then
			if FixInspectAndBuyThirdPartySales or CollectibleItemId == nil or not not p1 then
				MarketplaceService:PromptRobloxPurchase(AssetId, false)
				p2:dispatch(SendCounterModule(ConstantsModule.Counters.PromptRobloxPurchase))
			else
				MarketplaceService:PromptPurchase(Players.LocalPlayer, AssetId, false)
				p2:dispatch(SendCounterModule(ConstantsModule.Counters.PromptUnlimitedCollectiblePurchase))
			end
		else
			p2:dispatch(SendCounterModule(ConstantsModule.Counters.PromptPurchaseUnknownItemType))
		end
		if FFlagAXIaBSinglePurchaseUnifiedEventsModule then
			p2:dispatch(ReportPurchaseAttemptUnifiedEventModule(AssetId, Bundle, ExpectedPrice1))
			
			return
		else
			v1.reportPurchaseAttempt(Bundle, AssetId)
		end
	end)
end