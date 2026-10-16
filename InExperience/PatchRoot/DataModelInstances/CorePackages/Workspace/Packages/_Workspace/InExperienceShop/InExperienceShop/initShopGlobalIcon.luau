local StarterGui = game:GetService("StarterGui")
local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local SignalsModule = require(Parent.Signals)
local InExperienceOffersModule = require(Parent.InExperienceOffers)
local FFlagEnableExperienceShopGlobalIconModule = require(InExperienceShop.Flags.FFlagEnableExperienceShopGlobalIcon)
local FFlagExperienceShopGlobalIconSkipCoreGuiCheckModule = require(InExperienceShop.Flags.FFlagExperienceShopGlobalIconSkipCoreGuiCheck)
local FFlagOfferNotifyOnGlobalIcon = require(Parent.SharedFlags).FFlagOfferNotifyOnGlobalIcon
local GetInExperienceShopStoreModule = require(InExperienceShop.Stores.getInExperienceShopStore)
local GetShopGlobalIconStoreModule = require(InExperienceShop.Stores.GetShopGlobalIconStore)

return function() --[[ Line: 23 | Named "initShopGlobalIcon" ]]
	-- upvalues: FFlagEnableExperienceShopGlobalIconModule (copy), GetShopGlobalIconStoreModule (copy), FFlagExperienceShopGlobalIconSkipCoreGuiCheckModule (copy), StarterGui (copy), FFlagOfferNotifyOnGlobalIcon (copy), InExperienceOffersModule (copy), SignalsModule (copy), GetInExperienceShopStoreModule (copy)
	if FFlagEnableExperienceShopGlobalIconModule then
		local ShopGlobalIconStoreModule = GetShopGlobalIconStoreModule(false)
		local CoreGuiEnabled = if FFlagExperienceShopGlobalIconSkipCoreGuiCheckModule then true else StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.All) or StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.ExperienceShop)
		local Flag = false
		
		local function _() --[[ Line: 40 | Named "updateEnabled" ]]
			-- upvalues: CoreGuiEnabled (ref), Flag (ref), ShopGlobalIconStoreModule (copy), FFlagOfferNotifyOnGlobalIcon (upval), InExperienceOffersModule (upval)
			local Flag1 = CoreGuiEnabled and Flag
			ShopGlobalIconStoreModule.setEnabled(Flag1)
			
			if FFlagOfferNotifyOnGlobalIcon then
				InExperienceOffersModule.getOffersStore(false).setInExperienceShopGlobalIconAvailable(Flag1)
			end
		end
		
		local CoreGuiChangedSignalConnection = if FFlagExperienceShopGlobalIconSkipCoreGuiCheckModule then nil else StarterGui.CoreGuiChangedSignal:Connect(function(CoreGuiType, Enabled) --[[ Line: 50 ]]
			-- upvalues: CoreGuiEnabled (ref), Flag (ref), ShopGlobalIconStoreModule (copy), FFlagOfferNotifyOnGlobalIcon (upval), InExperienceOffersModule (upval)
			if CoreGuiType == Enum.CoreGuiType.ExperienceShop or CoreGuiType == Enum.CoreGuiType.All then
				CoreGuiEnabled = Enabled
				local Flag1 = CoreGuiEnabled and Flag
				ShopGlobalIconStoreModule.setEnabled(Flag1)
				
				if FFlagOfferNotifyOnGlobalIcon then
					InExperienceOffersModule.getOffersStore(false).setInExperienceShopGlobalIconAvailable(Flag1)
				end
			end
		end)
		local Callback = nil
		Callback = SignalsModule.createEffect(function(p1) --[[ Line: 60 ]]
			-- upvalues: GetInExperienceShopStoreModule (upval), Flag (ref), CoreGuiEnabled (ref), ShopGlobalIconStoreModule (copy), FFlagOfferNotifyOnGlobalIcon (upval), InExperienceOffersModule (upval), Callback (ref)
			local InExperienceShopStoreModule = GetInExperienceShopStoreModule(false)
			
			if InExperienceShopStoreModule.getLoading(p1) then return end
			if not InExperienceShopStoreModule.getGlobalIconBackendEnabled(p1) then return end
			Flag = true
			local Flag1: boolean = CoreGuiEnabled and Flag
			ShopGlobalIconStoreModule.setEnabled(Flag1)
			
			if FFlagOfferNotifyOnGlobalIcon then
				InExperienceOffersModule.getOffersStore(false).setInExperienceShopGlobalIconAvailable(Flag1)
			end
			if not FFlagOfferNotifyOnGlobalIcon then
				ShopGlobalIconStoreModule.setStatusIndicatorEnabled(InExperienceShopStoreModule.getGlobalIconHasNewOffers(p1))
			end
			task.defer(function() --[[ Line: 73 ]]
				-- upvalues: Callback (upval)
				if Callback then
					Callback()
					Callback = nil
				end
			end)
		end)
		local Effect = if FFlagOfferNotifyOnGlobalIcon then SignalsModule.createEffect(function(p1) --[[ Line: 88 ]]
			-- upvalues: InExperienceOffersModule (upval), ShopGlobalIconStoreModule (copy)
			ShopGlobalIconStoreModule.setStatusIndicatorEnabled(InExperienceOffersModule.getOffersStore(p1).getOfferNotificationShownWithEnum(p1) == InExperienceOffersModule.NotificationLocation.GlobalIcon)
		end) else nil
		
		return function() --[[ Line: 97 ]]
			-- upvalues: FFlagExperienceShopGlobalIconSkipCoreGuiCheckModule (upval), CoreGuiChangedSignalConnection (copy), Callback (ref), Effect (ref), FFlagOfferNotifyOnGlobalIcon (upval), InExperienceOffersModule (upval)
			if not FFlagExperienceShopGlobalIconSkipCoreGuiCheckModule and CoreGuiChangedSignalConnection then
				CoreGuiChangedSignalConnection:Disconnect()
			end
			if Callback then
				Callback()
				Callback = nil
			end
			if Effect then
				Effect()
				Effect = nil
			end
			if FFlagOfferNotifyOnGlobalIcon then
				InExperienceOffersModule.getOffersStore(false).setInExperienceShopGlobalIconAvailable(false)
			end
		end
	else
		return nil
	end
end