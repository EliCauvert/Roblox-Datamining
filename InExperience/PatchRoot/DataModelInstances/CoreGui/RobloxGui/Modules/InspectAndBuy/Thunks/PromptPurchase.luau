local playersService = game:GetService("Players")
local marketplaceService = game:GetService("MarketplaceService")
local parent = script.Parent.Parent
local thunkModule = require(parent.Thunk)
local analyticsModule = require(parent.Services.Analytics)
local constantsModule = require(parent.Constants)
local setItemBeingPurchasedModule = require(parent.Actions.SetItemBeingPurchased)
local sendCounterModule = require(parent.Thunks.SendCounter)
local reportPurchaseAttemptUnifiedEventModule = require(parent.Thunks.ReportPurchaseAttemptUnifiedEvent)
local fFlagAXIaBSinglePurchaseUnifiedEventsModule = require(parent.Flags.FFlagAXIaBSinglePurchaseUnifiedEvents)
local list = { analyticsModule }

return function(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: thunkModule (ref), list (ref), analyticsModule (ref), constantsModule (ref), fFlagAXIaBSinglePurchaseUnifiedEventsModule (ref), setItemBeingPurchasedModule (ref), marketplaceService (ref), playersService (ref), sendCounterModule (ref), reportPurchaseAttemptUnifiedEventModule (ref)
	return thunkModule.new(script.Name, list, function(p8, p9)
		-- upvalues: analyticsModule (copy), p4 (ref), p2 (ref), constantsModule (copy), fFlagAXIaBSinglePurchaseUnifiedEventsModule (copy), p6 (ref), setItemBeingPurchasedModule (copy), p1 (ref), marketplaceService (copy), playersService (copy), p3 (ref), p5 (ref), sendCounterModule (copy), p7 (ref), reportPurchaseAttemptUnifiedEventModule (copy)
		local var1 = p9[analyticsModule]
		local var2 = p4 ~= nil and p2 ~= constantsModule.ItemType.Bundle
		local var3 = if fFlagAXIaBSinglePurchaseUnifiedEventsModule and var2 then p6 else nil
		p8:dispatch(setItemBeingPurchasedModule(p1, p2, var3))
		
		if var2 then
			marketplaceService:PromptCollectiblesPurchase(playersService.LocalPlayer, p1, p3, p5, p4, p6)
			p8:dispatch(sendCounterModule(constantsModule.Counters.PromptLimitedCollectiblesPurchase))
		elseif p2 == constantsModule.ItemType.Bundle then
			marketplaceService:PromptBundlePurchase(playersService.LocalPlayer, p1)
			p8:dispatch(sendCounterModule(constantsModule.Counters.PromptBundlePurchase))
		elseif p2 == constantsModule.ItemType.Asset then
			if p3 == nil or not not p7 then
				marketplaceService:PromptRobloxPurchase(p1, false)
				p8:dispatch(sendCounterModule(constantsModule.Counters.PromptRobloxPurchase))
			else
				marketplaceService:PromptPurchase(playersService.LocalPlayer, p1, false)
				p8:dispatch(sendCounterModule(constantsModule.Counters.PromptUnlimitedCollectiblePurchase))
			end
		else
			p8:dispatch(sendCounterModule(constantsModule.Counters.PromptPurchaseUnknownItemType))
		end
		if fFlagAXIaBSinglePurchaseUnifiedEventsModule then
			p8:dispatch(reportPurchaseAttemptUnifiedEventModule(p1, p2, var3))
			
			return
		end
		var1.reportPurchaseAttempt(p2, p1)
	end)
end