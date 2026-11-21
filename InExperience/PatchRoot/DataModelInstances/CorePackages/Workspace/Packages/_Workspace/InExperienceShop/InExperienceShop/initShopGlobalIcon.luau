local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local SignalsModule = require(Parent.Signals)
local SharedFlagsModule = require(Parent.SharedFlags)
local InExperienceOffersModule = require(Parent.InExperienceOffers)
local FFlagEnableExperienceShopGlobalIconModule = require(InExperienceShop.Flags.FFlagEnableExperienceShopGlobalIcon)
local FFlagOfferNotifyOnGlobalIcon = SharedFlagsModule.FFlagOfferNotifyOnGlobalIcon
local FFlagEnableFreeTrialBlueDotModule = require(InExperienceShop.Flags.FFlagEnableFreeTrialBlueDot)
local GetInExperienceShopStoreModule = require(InExperienceShop.Stores.getInExperienceShopStore)
local GetShopGlobalIconStoreModule = require(InExperienceShop.Stores.GetShopGlobalIconStore)

return function()
	-- upvalues: FFlagEnableExperienceShopGlobalIconModule (copy), GetShopGlobalIconStoreModule (copy), SignalsModule (copy), GetInExperienceShopStoreModule (copy), FFlagOfferNotifyOnGlobalIcon (copy), InExperienceOffersModule (copy), FFlagEnableFreeTrialBlueDotModule (copy), InExperienceShop (copy)
	if not FFlagEnableExperienceShopGlobalIconModule then
		return nil
	end
	local ShopGlobalIconStoreModule = GetShopGlobalIconStoreModule(false)
	local Callback = nil
	Callback = SignalsModule.createEffect(function(p1)
		-- upvalues: GetInExperienceShopStoreModule (upval), ShopGlobalIconStoreModule (copy), FFlagOfferNotifyOnGlobalIcon (upval), InExperienceOffersModule (upval), Callback (ref)
		local InExperienceShopStoreModule = GetInExperienceShopStoreModule(false)
		
		if InExperienceShopStoreModule.getLoading(p1) then return end
		if not InExperienceShopStoreModule.getGlobalIconBackendEnabled(p1) then return end
		ShopGlobalIconStoreModule.setEnabled(true)
		
		if FFlagOfferNotifyOnGlobalIcon then
			InExperienceOffersModule.getOffersStore(false).setInExperienceShopGlobalIconAvailable(true)
		end
		if not FFlagOfferNotifyOnGlobalIcon then
			ShopGlobalIconStoreModule.setStatusIndicatorEnabled(InExperienceShopStoreModule.getGlobalIconHasNewOffers(p1))
		end
		task.defer(function()
			-- upvalues: Callback (upval)
			if Callback then
				Callback()
				Callback = nil
			end
		end)
	end)
	local Effect = if FFlagOfferNotifyOnGlobalIcon then SignalsModule.createEffect(function(p1)
		-- upvalues: InExperienceOffersModule (upval), ShopGlobalIconStoreModule (copy)
		ShopGlobalIconStoreModule.setStatusIndicatorEnabled(InExperienceOffersModule.getOffersStore(p1).getOfferNotificationShownWithEnum(p1) == InExperienceOffersModule.NotificationLocation.GlobalIcon)
	end) else nil
	local Callback1 = nil
	
	if FFlagEnableFreeTrialBlueDotModule then
		local SubmitFreeTrialBlueDotModule = require(InExperienceShop.submitFreeTrialBlueDot)
		Callback1 = SignalsModule.createEffect(function(p1)
			-- upvalues: SubmitFreeTrialBlueDotModule (copy), ShopGlobalIconStoreModule (copy)
			local IsShopIconBlueDotShowing = SubmitFreeTrialBlueDotModule.isShopIconBlueDotShowing(p1)
			ShopGlobalIconStoreModule.setFreeTrialStatusIndicatorEnabled(IsShopIconBlueDotShowing)
			
			if IsShopIconBlueDotShowing then
				SubmitFreeTrialBlueDotModule.reportMounted()
				SubmitFreeTrialBlueDotModule.reportViewed()
			end
		end)
	end
	return function()
		-- upvalues: Callback (ref), Effect (ref), Callback1 (ref), ShopGlobalIconStoreModule (copy), FFlagOfferNotifyOnGlobalIcon (upval), InExperienceOffersModule (upval)
		if Callback then
			Callback()
			Callback = nil
		end
		if Effect then
			Effect()
			Effect = nil
		end
		if Callback1 then
			Callback1()
			Callback1 = nil
			ShopGlobalIconStoreModule.setFreeTrialStatusIndicatorEnabled(false)
		end
		if FFlagOfferNotifyOnGlobalIcon then
			InExperienceOffersModule.getOffersStore(false).setInExperienceShopGlobalIconAvailable(false)
		end
	end
end