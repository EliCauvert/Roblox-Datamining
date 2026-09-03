local starterGuiService = game:GetService("StarterGui")
local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local signalsModule = require(parent.Signals)
local sharedFlagsModule = require(parent.SharedFlags)
local inExperienceOffersModule = require(parent.InExperienceOffers)
local fFlagEnableExperienceShopGlobalIconModule = require(inExperienceShop.Flags.FFlagEnableExperienceShopGlobalIcon)
local fFlagExperienceShopGlobalIconSkipCoreGuiCheckModule = require(inExperienceShop.Flags.FFlagExperienceShopGlobalIconSkipCoreGuiCheck)
local fFlagOfferNotifyOnGlobalIcon = sharedFlagsModule.FFlagOfferNotifyOnGlobalIcon
local getInExperienceShopStoreModule = require(inExperienceShop.Stores.getInExperienceShopStore)
local getShopGlobalIconStoreModule = require(inExperienceShop.Stores.GetShopGlobalIconStore)

return function()
	-- upvalues: fFlagEnableExperienceShopGlobalIconModule (ref), getShopGlobalIconStoreModule (ref), fFlagExperienceShopGlobalIconSkipCoreGuiCheckModule (ref), starterGuiService (ref), fFlagOfferNotifyOnGlobalIcon (ref), inExperienceOffersModule (ref), signalsModule (ref), getInExperienceShopStoreModule (ref)
	if fFlagEnableExperienceShopGlobalIconModule then
		local var1 = getShopGlobalIconStoreModule(false)
		local var2 = if fFlagExperienceShopGlobalIconSkipCoreGuiCheckModule then true else starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.All) or starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.ExperienceShop)
		local var3 = false
		
		local function _()
			-- upvalues: var2 (write), var3 (write), var1 (ref), fFlagOfferNotifyOnGlobalIcon (copy), inExperienceOffersModule (copy)
			local var4 = var2 and var3
			var1.setEnabled(var4)
			
			if fFlagOfferNotifyOnGlobalIcon then
				inExperienceOffersModule.getOffersStore(false).setInExperienceShopGlobalIconAvailable(var4)
			end
		end
		
		local var4 = if fFlagExperienceShopGlobalIconSkipCoreGuiCheckModule then nil else starterGuiService.CoreGuiChangedSignal:Connect(function(p1, p2)
			-- upvalues: var2 (write), var3 (write), var1 (ref), fFlagOfferNotifyOnGlobalIcon (copy), inExperienceOffersModule (copy)
			if p1 == Enum.CoreGuiType.ExperienceShop or p1 == Enum.CoreGuiType.All then
				var2 = p2
				local var5 = var2 and var3
				var1.setEnabled(var5)
				
				if fFlagOfferNotifyOnGlobalIcon then
					inExperienceOffersModule.getOffersStore(false).setInExperienceShopGlobalIconAvailable(var5)
				end
			end
		end)
		local var5 = nil
		var5 = signalsModule.createEffect(function(p1)
			-- upvalues: getInExperienceShopStoreModule (copy), var3 (write), var2 (write), var1 (ref), fFlagOfferNotifyOnGlobalIcon (copy), inExperienceOffersModule (copy), var5 (write)
			local var6 = getInExperienceShopStoreModule(false)
			
			if var6.getLoading(p1) then return end
			if not var6.getGlobalIconBackendEnabled(p1) then return end
			var3 = true
			local var7 = var2 and var3
			var1.setEnabled(var7)
			
			if fFlagOfferNotifyOnGlobalIcon then
				inExperienceOffersModule.getOffersStore(false).setInExperienceShopGlobalIconAvailable(var7)
			end
			if not fFlagOfferNotifyOnGlobalIcon then
				var1.setStatusIndicatorEnabled(var6.getGlobalIconHasNewOffers(p1))
			end
			task.defer(function()
				-- upvalues: var5 (copy)
				if var5 then
					var5()
					var5 = nil
				end
			end)
		end)
		local var6 = if fFlagOfferNotifyOnGlobalIcon then signalsModule.createEffect(function(p1)
			-- upvalues: inExperienceOffersModule (copy), var1 (ref)
			var1.setStatusIndicatorEnabled(inExperienceOffersModule.getOffersStore(p1).getOfferNotificationShownWithEnum(p1) == inExperienceOffersModule.NotificationLocation.GlobalIcon)
		end) else nil
		
		return function()
			-- upvalues: fFlagExperienceShopGlobalIconSkipCoreGuiCheckModule (copy), var4 (ref), var5 (write), var6 (write), fFlagOfferNotifyOnGlobalIcon (copy), inExperienceOffersModule (copy)
			if not fFlagExperienceShopGlobalIconSkipCoreGuiCheckModule and var4 then
				var4:Disconnect()
			end
			if var5 then
				var5()
				var5 = nil
			end
			if var6 then
				var6()
				var6 = nil
			end
			if fFlagOfferNotifyOnGlobalIcon then
				inExperienceOffersModule.getOffersStore(false).setInExperienceShopGlobalIconAvailable(false)
			end
		end
	end
	return nil
end