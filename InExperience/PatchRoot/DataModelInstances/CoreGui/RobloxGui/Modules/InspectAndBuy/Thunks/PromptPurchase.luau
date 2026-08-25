local playersService = game:GetService("Players")
local marketplaceService = game:GetService("MarketplaceService")
local parent = script.Parent.Parent
local thunkModule = require(parent.Thunk)
local analyticsModule = require(parent.Services.Analytics)
local constantsModule = require(parent.Constants)
local setItemBeingPurchasedModule = require(parent.Actions.SetItemBeingPurchased)
local sendCounterModule = require(parent.Thunks.SendCounter)
local list = { analyticsModule }

return function(p0, p1, p2, p3, p4, p5, p6)
	-- upvalues: thunkModule (ref), list (ref), analyticsModule (ref), setItemBeingPurchasedModule (ref), constantsModule (ref), marketplaceService (ref), playersService (ref), sendCounterModule (ref)
	return thunkModule.new(script.Name, list, function(p7, p8)
		-- upvalues: analyticsModule (copy), setItemBeingPurchasedModule (copy), p0 (ref), p1 (ref), p3 (ref), constantsModule (copy), marketplaceService (copy), playersService (copy), p2 (ref), p4 (ref), p5 (ref), sendCounterModule (copy), p6 (ref)
		local var8 = p8[analyticsModule]
		p7:dispatch(setItemBeingPurchasedModule(p0, p1))
		
		if p3 ~= nil and p1 ~= constantsModule.ItemType.Bundle then
			marketplaceService:PromptCollectiblesPurchase(playersService.LocalPlayer, p0, p2, p4, p3, p5)
			p7:dispatch(sendCounterModule(constantsModule.Counters.PromptLimitedCollectiblesPurchase))
		elseif p1 == constantsModule.ItemType.Bundle then
			marketplaceService:PromptBundlePurchase(playersService.LocalPlayer, p0)
			p7:dispatch(sendCounterModule(constantsModule.Counters.PromptBundlePurchase))
		elseif p1 == constantsModule.ItemType.Asset then
			if p2 == nil or not not p6 then
				marketplaceService:PromptRobloxPurchase(p0, false)
				p7:dispatch(sendCounterModule(constantsModule.Counters.PromptRobloxPurchase))
			else
				marketplaceService:PromptPurchase(playersService.LocalPlayer, p0, false)
				p7:dispatch(sendCounterModule(constantsModule.Counters.PromptUnlimitedCollectiblePurchase))
			end
		else
			p7:dispatch(sendCounterModule(constantsModule.Counters.PromptPurchaseUnknownItemType))
		end
		var8.reportPurchaseAttempt(p1, p0)
	end)
end