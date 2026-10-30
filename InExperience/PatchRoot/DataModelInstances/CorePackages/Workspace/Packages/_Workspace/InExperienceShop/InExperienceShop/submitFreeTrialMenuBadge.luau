local LocalizationService = game:GetService("LocalizationService")
local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local SignalsModule = require(Parent.Signals)
local Localization = require(Parent.AppLocales).Localization
local NotificationsOrchestratorModule = require(Parent.NotificationsOrchestrator)
local GetInExperienceShopStoreModule = require(InExperienceShop.Stores.getInExperienceShopStore)
local FIntMaxTrialBadgeImpressionsModule = require(InExperienceShop.Flags.FIntMaxTrialBadgeImpressions)
local FStringTrialBadgeLifecycleKeyModule = require(InExperienceShop.Flags.FStringTrialBadgeLifecycleKey)
local FIntTrialBadgeCooldownSecondsModule = require(InExperienceShop.Flags.FIntTrialBadgeCooldownSeconds)
local FFlagTrialNotificationBadgeOnStudioModule = require(InExperienceShop.Flags.FFlagTrialNotificationBadgeOnStudio)
local _ = require(InExperienceShop.Types)
local Effect = nil
local v1 = nil
local Signal, Signal2 = SignalsModule.createSignal(nil)

local function _(p1): boolean
	return next(p1.available) ~= nil or next(p1.active) ~= nil
end

local _ = function()
	-- upvalues: Localization (copy), LocalizationService (copy)
	return Localization.new(LocalizationService.RobloxLocaleId):Format("Feature.InExperienceShop.Label.FreeTrial")
end

local function shopMenuBadgeText(p1)
	-- upvalues: NotificationsOrchestratorModule (copy), Signal (copy)
	local v2 = NotificationsOrchestratorModule.getActiveForSlot(NotificationsOrchestratorModule.SlotId.ShopMenuBadge)(p1)
	local SignalResult = Signal(p1)
	
	return if v2 == nil or v2.payload.slot ~= "ShopMenuBadge" or v2.handle ~= SignalResult then nil else v2.payload.text
end

local _ = function()
	-- upvalues: NotificationsOrchestratorModule (copy), Signal (copy)
	local v2 = NotificationsOrchestratorModule.getActiveForSlot(NotificationsOrchestratorModule.SlotId.ShopMenuBadge)(false)
	
	return if v2 == nil or v2.payload.slot ~= "ShopMenuBadge" or v2.handle ~= Signal(false) then nil else v2.handle
end

local _ = function(p1)
	-- upvalues: NotificationsOrchestratorModule (copy), Signal (copy)
	local v2 = NotificationsOrchestratorModule.getActiveForSlot(NotificationsOrchestratorModule.SlotId.ShopMenuBadge)(false)
	local Handle = if v2 == nil or v2.payload.slot ~= "ShopMenuBadge" or v2.handle ~= Signal(false) then nil else v2.handle
	
	if Handle ~= nil then
		NotificationsOrchestratorModule.report(NotificationsOrchestratorModule.SlotId.ShopMenuBadge, Handle, p1)
		
		return
	end
end

local _ = function()
	-- upvalues: v1 (ref), GetInExperienceShopStoreModule (copy), Effect (ref), SignalsModule (copy), Localization (copy), LocalizationService (copy), Signal2 (copy), NotificationsOrchestratorModule (copy), FFlagTrialNotificationBadgeOnStudioModule (copy), FStringTrialBadgeLifecycleKeyModule (copy), FIntMaxTrialBadgeImpressionsModule (copy), FIntTrialBadgeCooldownSecondsModule (copy), shopMenuBadgeText (copy)
	local v2 = v1
	
	if v2 == nil then
		local v3 = false
		local InExperienceShopStoreModule = GetInExperienceShopStoreModule(false)
		Effect = SignalsModule.createEffect(function(p1)
			-- upvalues: InExperienceShopStoreModule (copy), v3 (ref), Localization (upval), LocalizationService (upval), Signal2 (upval), NotificationsOrchestratorModule (upval), FFlagTrialNotificationBadgeOnStudioModule (upval), FStringTrialBadgeLifecycleKeyModule (upval), FIntMaxTrialBadgeImpressionsModule (upval), FIntTrialBadgeCooldownSecondsModule (upval)
			local TrialAvailabilities = InExperienceShopStoreModule.getTrialAvailabilities(p1)
			
			if not v3 and (next(TrialAvailabilities.available) ~= nil or next(TrialAvailabilities.active) ~= nil) then
				v3 = true
				Signal2(NotificationsOrchestratorModule.submit({
					priority = 0,
					source = "GamePassFreeTrial",
					slotId = NotificationsOrchestratorModule.SlotId.ShopMenuBadge,
					enableOnStudio = FFlagTrialNotificationBadgeOnStudioModule,
					lifecycleKey = FStringTrialBadgeLifecycleKeyModule,
					lifecyclePolicy = {
						frequency = {
							window = "forever",
							maxImpressions = FIntMaxTrialBadgeImpressionsModule,
							cooldownSeconds = FIntTrialBadgeCooldownSecondsModule
						}
					},
					slotDisplayPayload = {
						slot = "ShopMenuBadge",
						text = Localization.new(LocalizationService.RobloxLocaleId):Format("Feature.InExperienceShop.Label.FreeTrial")
					}
				}))
				
				return
			end
		end)
		v1 = shopMenuBadgeText
		
		return shopMenuBadgeText
	else
		return v2
	end
end

return (setmetatable({
	reportMounted = function()
		-- upvalues: NotificationsOrchestratorModule (copy), Signal (copy)
		local config = { type = "mounted" }
		local v2 = NotificationsOrchestratorModule.getActiveForSlot(NotificationsOrchestratorModule.SlotId.ShopMenuBadge)(false)
		local Handle = if v2 == nil or v2.payload.slot ~= "ShopMenuBadge" or v2.handle ~= Signal(false) then nil else v2.handle
		
		if Handle ~= nil then
			NotificationsOrchestratorModule.report(NotificationsOrchestratorModule.SlotId.ShopMenuBadge, Handle, config)
			
			return
		end
	end,
	reportViewed = function()
		-- upvalues: NotificationsOrchestratorModule (copy), Signal (copy)
		local config = { type = "viewed" }
		local v2 = NotificationsOrchestratorModule.getActiveForSlot(NotificationsOrchestratorModule.SlotId.ShopMenuBadge)(false)
		local Handle = if v2 == nil or v2.payload.slot ~= "ShopMenuBadge" or v2.handle ~= Signal(false) then nil else v2.handle
		
		if Handle ~= nil then
			NotificationsOrchestratorModule.report(NotificationsOrchestratorModule.SlotId.ShopMenuBadge, Handle, config)
			
			return
		end
	end,
	dismiss = function()
		-- upvalues: NotificationsOrchestratorModule (copy), Signal (copy)
		local config = { type = "dismissed", reason = "activated" }
		local v2 = NotificationsOrchestratorModule.getActiveForSlot(NotificationsOrchestratorModule.SlotId.ShopMenuBadge)(false)
		local Handle = if v2 == nil or v2.payload.slot ~= "ShopMenuBadge" or v2.handle ~= Signal(false) then nil else v2.handle
		
		if Handle ~= nil then
			NotificationsOrchestratorModule.report(NotificationsOrchestratorModule.SlotId.ShopMenuBadge, Handle, config)
			
			return
		end
	end
}, {
	__call = function(_)
		-- upvalues: v1 (ref), GetInExperienceShopStoreModule (copy), Effect (ref), SignalsModule (copy), Localization (copy), LocalizationService (copy), Signal2 (copy), NotificationsOrchestratorModule (copy), FFlagTrialNotificationBadgeOnStudioModule (copy), FStringTrialBadgeLifecycleKeyModule (copy), FIntMaxTrialBadgeImpressionsModule (copy), FIntTrialBadgeCooldownSecondsModule (copy), shopMenuBadgeText (copy)
		local v2 = v1
		
		if v2 == nil then
			local v3 = false
			local InExperienceShopStoreModule = GetInExperienceShopStoreModule(false)
			Effect = SignalsModule.createEffect(function(p1)
				-- upvalues: InExperienceShopStoreModule (copy), v3 (ref), Localization (upval), LocalizationService (upval), Signal2 (upval), NotificationsOrchestratorModule (upval), FFlagTrialNotificationBadgeOnStudioModule (upval), FStringTrialBadgeLifecycleKeyModule (upval), FIntMaxTrialBadgeImpressionsModule (upval), FIntTrialBadgeCooldownSecondsModule (upval)
				local TrialAvailabilities = InExperienceShopStoreModule.getTrialAvailabilities(p1)
				
				if not v3 and (next(TrialAvailabilities.available) ~= nil or next(TrialAvailabilities.active) ~= nil) then
					v3 = true
					Signal2(NotificationsOrchestratorModule.submit({
						priority = 0,
						source = "GamePassFreeTrial",
						slotId = NotificationsOrchestratorModule.SlotId.ShopMenuBadge,
						enableOnStudio = FFlagTrialNotificationBadgeOnStudioModule,
						lifecycleKey = FStringTrialBadgeLifecycleKeyModule,
						lifecyclePolicy = {
							frequency = {
								window = "forever",
								maxImpressions = FIntMaxTrialBadgeImpressionsModule,
								cooldownSeconds = FIntTrialBadgeCooldownSecondsModule
							}
						},
						slotDisplayPayload = {
							slot = "ShopMenuBadge",
							text = Localization.new(LocalizationService.RobloxLocaleId):Format("Feature.InExperienceShop.Label.FreeTrial")
						}
					}))
					
					return
				end
			end)
			v1 = shopMenuBadgeText
			
			return shopMenuBadgeText
		else
			return v2
		end
	end
}))