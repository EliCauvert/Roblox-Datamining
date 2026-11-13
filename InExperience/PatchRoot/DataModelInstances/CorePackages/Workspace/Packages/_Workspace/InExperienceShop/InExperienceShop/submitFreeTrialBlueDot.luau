local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local SignalsModule = require(Parent.Signals)
local NotificationsOrchestratorModule = require(Parent.NotificationsOrchestrator)
local InExperienceOffersModule = require(Parent.InExperienceOffers)
local GetInExperienceShopStoreModule = require(InExperienceShop.Stores.getInExperienceShopStore)
local GetShopGlobalIconStoreModule = require(InExperienceShop.Stores.GetShopGlobalIconStore)
local FFlagEnableExperienceShopGlobalIconModule = require(InExperienceShop.Flags.FFlagEnableExperienceShopGlobalIcon)
local FFlagTrialNotificationBlueDotOnStudioModule = require(InExperienceShop.Flags.FFlagTrialNotificationBlueDotOnStudio)
local FFlagEnableActiveFreeTrialBlueDotModule = require(InExperienceShop.Flags.FFlagEnableActiveFreeTrialBlueDot)
local FFlagEnableRedeemedFreeTrialBlueDotModule = require(InExperienceShop.Flags.FFlagEnableRedeemedFreeTrialBlueDot)
local HasRedeemedTrialWithinWindowModule = require(InExperienceShop.Utils.hasRedeemedTrialWithinWindow)
local _ = require(InExperienceShop.Types)
local Active = {
	lifecycleKey = require(InExperienceShop.Flags.FStringRedeemedTrialBlueDotLifecycleKey),
	maxImpressions = require(InExperienceShop.Flags.FIntMaxRedeemedTrialBlueDotImpressions),
	cooldownSeconds = require(InExperienceShop.Flags.FIntRedeemedTrialBlueDotCooldownSeconds)
}
local config = {
	available = {
		lifecycleKey = require(InExperienceShop.Flags.FStringAvailableTrialBlueDotLifecycleKey),
		maxImpressions = require(InExperienceShop.Flags.FIntMaxTrialBlueDotImpressions),
		cooldownSeconds = require(InExperienceShop.Flags.FIntTrialBlueDotCooldownSeconds)
	},
	active = Active,
	redeemed = Active
}

local function _(p1)
	return p1
end

local _ = function(p1)
	return p1
end

local Effect = nil
local v1 = nil
local Signal, Signal2 = SignalsModule.createSignal(nil)
local Handle = nil
local Handle1 = nil

local _ = function(p1)
	-- upvalues: FFlagEnableActiveFreeTrialBlueDotModule (copy), FFlagEnableRedeemedFreeTrialBlueDotModule (copy), HasRedeemedTrialWithinWindowModule (copy)
	return if FFlagEnableActiveFreeTrialBlueDotModule and next(p1.active) ~= nil then "active" elseif FFlagEnableRedeemedFreeTrialBlueDotModule and HasRedeemedTrialWithinWindowModule(p1.redeemed) then "redeemed" elseif next(p1.available) == nil then nil else "available"
end

local function chooseSlot(p1)
	-- upvalues: InExperienceOffersModule (copy), FFlagEnableExperienceShopGlobalIconModule (copy), GetShopGlobalIconStoreModule (copy), GetInExperienceShopStoreModule (copy)
	local IsShopAvailable = InExperienceOffersModule.getOffersStore(false).getIsShopAvailable(p1)
	
	if not FFlagEnableExperienceShopGlobalIconModule then
		return if IsShopAvailable then "HamburgerBlueDot" else nil
	elseif GetShopGlobalIconStoreModule(false).getEnabled(p1) then
		return "ShopIconBlueDot"
	else
		local InExperienceShopStoreModule = GetInExperienceShopStoreModule(false)
		
		return if InExperienceShopStoreModule.getLoading(p1) or InExperienceShopStoreModule.getGlobalIconBackendEnabled(p1) then nil elseif IsShopAvailable then "HamburgerBlueDot" else nil
	end
end

local function submitBlueDot(SlotId, Active)
	-- upvalues: NotificationsOrchestratorModule (copy), config (copy), FFlagTrialNotificationBlueDotOnStudioModule (copy)
	local Lifecycle = NotificationsOrchestratorModule.getSlotConfig(SlotId).lifecycle
	local Entry = config[Active]
	
	return NotificationsOrchestratorModule.submit({
		priority = 0,
		source = "GamePassFreeTrialBlueDot",
		slotId = SlotId,
		lifecycleKey = Entry.lifecycleKey,
		lifecyclePolicy = {
			frequency = {
				window = "forever",
				maxImpressions = Entry.maxImpressions,
				cooldownSeconds = Entry.cooldownSeconds
			},
			visibility = if Lifecycle == nil then nil else Lifecycle.visibility
		},
		slotDisplayPayload = if SlotId == "ShopIconBlueDot" then { slot = "ShopIconBlueDot" } else { slot = "HamburgerBlueDot" },
		enableOnStudio = FFlagTrialNotificationBlueDotOnStudioModule
	})
end

local _ = function(Slot, p1): boolean
	-- upvalues: Signal (copy), NotificationsOrchestratorModule (copy)
	local SignalResult = Signal(p1)
	local v2 = NotificationsOrchestratorModule.getActiveForSlot(Slot)(p1)
	
	return SignalResult ~= nil and (SignalResult.slotId == Slot and (v2 ~= nil and (v2.payload.slot == Slot and v2.handle == SignalResult.handle)))
end

local _ = function()
	-- upvalues: Signal (copy), NotificationsOrchestratorModule (copy)
	local SignalResult = Signal(false)
	
	if SignalResult ~= nil then
		local SlotId = SignalResult.slotId
		local SignalResult1 = Signal(false)
		local v2 = NotificationsOrchestratorModule.getActiveForSlot(SlotId)(false)
		
		if SignalResult1 ~= nil and (SignalResult1.slotId == SlotId and (v2 ~= nil and (v2.payload.slot == SlotId and v2.handle == SignalResult1.handle))) then
			return SignalResult.handle
		end
	end
	return nil
end

local function isTrialBlueDotShowing(p1): boolean
	-- upvalues: Signal (copy), NotificationsOrchestratorModule (copy)
	local SignalResult = Signal(p1)
	
	if SignalResult == nil then
		return false
	else
		local SlotId = SignalResult.slotId
		local SignalResult1 = Signal(p1)
		local v2 = NotificationsOrchestratorModule.getActiveForSlot(SlotId)(p1)
		
		return SignalResult1 ~= nil and (SignalResult1.slotId == SlotId and (v2 ~= nil and (v2.payload.slot == SlotId and v2.handle == SignalResult1.handle)))
	end
end

local _ = function(Slot, p1): boolean
	-- upvalues: Signal (copy), NotificationsOrchestratorModule (copy)
	local SignalResult = Signal(p1)
	local v2 = NotificationsOrchestratorModule.getActiveForSlot(Slot)(p1)
	
	return SignalResult ~= nil and (SignalResult.slotId == Slot and (v2 ~= nil and (v2.payload.slot == Slot and v2.handle == SignalResult.handle)))
end

local function report(p1)
	-- upvalues: Signal (copy), NotificationsOrchestratorModule (copy), Handle (ref), Handle1 (ref)
	local SignalResult = Signal(false)
	local SignalResult1 = Signal(false)
	local Handle2 = nil
	repeat
		if SignalResult1 ~= nil then
			local SlotId = SignalResult1.slotId
			local SignalResult2 = Signal(false)
			local v2 = NotificationsOrchestratorModule.getActiveForSlot(SlotId)(false)
			
			if SignalResult2 ~= nil and (SignalResult2.slotId == SlotId and (v2 ~= nil and (v2.payload.slot == SlotId and v2.handle == SignalResult2.handle))) then
				Handle2 = SignalResult1.handle
				continue
			end
		end
		Handle2 = nil
		break
	until true
	if SignalResult == nil or Handle2 == nil then return end
	if p1.type == "mounted" then
		if Handle == Handle2 then return end
		Handle = Handle2
	elseif p1.type == "viewed" then
		if Handle1 == Handle2 then return end
		Handle1 = Handle2
	end
	NotificationsOrchestratorModule.report(SignalResult.slotId, Handle2, p1)
end

local Flag = false

local _ = function()
	-- upvalues: v1 (ref), GetInExperienceShopStoreModule (copy), Effect (ref), SignalsModule (copy), Flag (ref), FFlagEnableActiveFreeTrialBlueDotModule (copy), FFlagEnableRedeemedFreeTrialBlueDotModule (copy), HasRedeemedTrialWithinWindowModule (copy), chooseSlot (copy), Signal2 (copy), submitBlueDot (copy), isTrialBlueDotShowing (copy)
	local v2 = v1
	
	if v2 == nil then
		local v3 = false
		local InExperienceShopStoreModule = GetInExperienceShopStoreModule(false)
		Effect = SignalsModule.createEffect(function(p1)
			-- upvalues: InExperienceShopStoreModule (copy), Flag (upval), v3 (ref), FFlagEnableActiveFreeTrialBlueDotModule (upval), FFlagEnableRedeemedFreeTrialBlueDotModule (upval), HasRedeemedTrialWithinWindowModule (upval), chooseSlot (upval), Signal2 (upval), submitBlueDot (upval)
			local TrialAvailabilities = InExperienceShopStoreModule.getTrialAvailabilities(p1)
			
			if Flag or v3 then return end
			local Active = if FFlagEnableActiveFreeTrialBlueDotModule and next(TrialAvailabilities.active) ~= nil then "active" elseif FFlagEnableRedeemedFreeTrialBlueDotModule and HasRedeemedTrialWithinWindowModule(TrialAvailabilities.redeemed) then "redeemed" elseif next(TrialAvailabilities.available) == nil then nil else "available"
			
			if Active == nil then return end
			local SlotId = chooseSlot(p1)
			
			if SlotId ~= nil then
				v3 = true
				Signal2({ slotId = SlotId, handle = submitBlueDot(SlotId, Active) })
				
				return
			end
		end)
		v1 = isTrialBlueDotShowing
		
		return isTrialBlueDotShowing
	else
		return v2
	end
end

return (setmetatable({
	reportMounted = function()
		-- upvalues: report (copy)
		report({ type = "mounted" })
	end,
	reportViewed = function()
		-- upvalues: report (copy)
		report({ type = "viewed" })
	end,
	reportActivated = function()
		-- upvalues: NotificationsOrchestratorModule (copy), report (copy)
		if NotificationsOrchestratorModule.Flags.FFlagEnableNotificationsOrchestratorUnifiedLogging then
			report({ type = "activated" })
			
			return
		end
	end,
	dismiss = function()
		-- upvalues: Flag (ref), report (copy)
		Flag = true
		report({ type = "dismissed", reason = "activated" })
	end,
	isHamburgerBlueDotShowing = function(p1): boolean
		-- upvalues: Signal (copy), NotificationsOrchestratorModule (copy)
		local SignalResult = Signal(p1)
		local v2 = NotificationsOrchestratorModule.getActiveForSlot("HamburgerBlueDot")(p1)
		
		return SignalResult ~= nil and (SignalResult.slotId == "HamburgerBlueDot" and (v2 ~= nil and (v2.payload.slot == "HamburgerBlueDot" and v2.handle == SignalResult.handle)))
	end,
	isShopIconBlueDotShowing = function(p1): boolean
		-- upvalues: Signal (copy), NotificationsOrchestratorModule (copy)
		local SignalResult = Signal(p1)
		local v2 = NotificationsOrchestratorModule.getActiveForSlot("ShopIconBlueDot")(p1)
		
		return SignalResult ~= nil and (SignalResult.slotId == "ShopIconBlueDot" and (v2 ~= nil and (v2.payload.slot == "ShopIconBlueDot" and v2.handle == SignalResult.handle)))
	end
}, {
	__call = function(_)
		-- upvalues: v1 (ref), GetInExperienceShopStoreModule (copy), Effect (ref), SignalsModule (copy), Flag (ref), FFlagEnableActiveFreeTrialBlueDotModule (copy), FFlagEnableRedeemedFreeTrialBlueDotModule (copy), HasRedeemedTrialWithinWindowModule (copy), chooseSlot (copy), Signal2 (copy), submitBlueDot (copy), isTrialBlueDotShowing (copy)
		local v2 = v1
		
		if v2 == nil then
			local v3 = false
			local InExperienceShopStoreModule = GetInExperienceShopStoreModule(false)
			Effect = SignalsModule.createEffect(function(p1)
				-- upvalues: InExperienceShopStoreModule (copy), Flag (upval), v3 (ref), FFlagEnableActiveFreeTrialBlueDotModule (upval), FFlagEnableRedeemedFreeTrialBlueDotModule (upval), HasRedeemedTrialWithinWindowModule (upval), chooseSlot (upval), Signal2 (upval), submitBlueDot (upval)
				local TrialAvailabilities = InExperienceShopStoreModule.getTrialAvailabilities(p1)
				
				if Flag or v3 then return end
				local Active = if FFlagEnableActiveFreeTrialBlueDotModule and next(TrialAvailabilities.active) ~= nil then "active" elseif FFlagEnableRedeemedFreeTrialBlueDotModule and HasRedeemedTrialWithinWindowModule(TrialAvailabilities.redeemed) then "redeemed" elseif next(TrialAvailabilities.available) == nil then nil else "available"
				
				if Active == nil then return end
				local SlotId = chooseSlot(p1)
				
				if SlotId ~= nil then
					v3 = true
					Signal2({ slotId = SlotId, handle = submitBlueDot(SlotId, Active) })
					
					return
				end
			end)
			v1 = isTrialBlueDotShowing
			
			return isTrialBlueDotShowing
		else
			return v2
		end
	end
}))