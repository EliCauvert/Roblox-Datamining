local playersService = game:GetService("Players")
local marketplaceService = game:GetService("MarketplaceService")
local parent = script.Parent.Parent
local thunkModule = require(parent.Thunk)
local analyticsModule = require(parent.Services.Analytics)
local constantsModule = require(parent.Constants)
local setItemBeingPurchasedModule = require(parent.Actions.SetItemBeingPurchased)
local sendCounterModule = require(parent.Thunks.SendCounter)
local list = { analyticsModule }

return function(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: thunkModule (ref), list (ref), analyticsModule (ref), setItemBeingPurchasedModule (ref), constantsModule (ref), marketplaceService (ref), playersService (ref), sendCounterModule (ref)
	return thunkModule.new(script.Name, list, function(p8, p9)
		-- upvalues: analyticsModule (copy), setItemBeingPurchasedModule (copy), p1 (ref), p2 (ref), p4 (ref), constantsModule (copy), marketplaceService (copy), playersService (copy), p3 (ref), p5 (ref), p6 (ref), sendCounterModule (copy), p7 (ref)
		local var1 = p9[analyticsModule]
		p8:dispatch(setItemBeingPurchasedModule(p1, p2))
		
		if p4 ~= nil and p2 ~= constantsModule.ItemType.Bundle then
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
		var1.reportPurchaseAttempt(p2, p1)
	end)
end