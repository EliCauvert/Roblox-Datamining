local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local SignalsModule = require(Parent.Signals)
local NotificationsOrchestratorModule = require(Parent.NotificationsOrchestrator)
local InExperienceOffersModule = require(Parent.InExperienceOffers)
local GetInExperienceShopStoreModule = require(InExperienceShop.Stores.getInExperienceShopStore)
local GetShopGlobalIconStoreModule = require(InExperienceShop.Stores.GetShopGlobalIconStore)
local FFlagEnableExperienceShopGlobalIconModule = require(InExperienceShop.Flags.FFlagEnableExperienceShopGlobalIcon)
local FFlagTrialNotificationBlueDotOnStudioModule = require(InExperienceShop.Flags.FFlagTrialNotificationBlueDotOnStudio)
local _ = require(InExperienceShop.Types)
local MaxTrialBlueDotImpressions = game:DefineFastInt("MaxTrialBlueDotImpressions", 5)
local TrialBlueDotLifecycleKey = game:DefineFastString("TrialBlueDotLifecycleKey", "free-trial-blue-dot")
local TrialBlueDotCooldownSeconds = game:DefineFastInt("TrialBlueDotCooldownSeconds", 86400)

local function _(p1)
	return p1
end

local Effect = nil
local v1 = nil
local Signal, Signal2 = SignalsModule.createSignal(nil)
local Handle = nil
local Handle1 = nil

local _ = function(p1): boolean
	for _, value in p1.available do
		if value then
			return true
		end
	end
	for _, value1 in p1.active do
		if value1 then
			return true
		end
	end
	return false
end

local function chooseSlot(p2)
	-- upvalues: InExperienceOffersModule (copy), FFlagEnableExperienceShopGlobalIconModule (copy), GetShopGlobalIconStoreModule (copy), GetInExperienceShopStoreModule (copy)
	local IsShopAvailable = InExperienceOffersModule.getOffersStore(false).getIsShopAvailable(p2)
	
	if not FFlagEnableExperienceShopGlobalIconModule then
		return if IsShopAvailable then "HamburgerBlueDot" else nil
	elseif GetShopGlobalIconStoreModule(false).getEnabled(p2) then
		return "ShopIconBlueDot"
	else
		local InExperienceShopStoreModule = GetInExperienceShopStoreModule(false)
		
		return if InExperienceShopStoreModule.getLoading(p2) or InExperienceShopStoreModule.getGlobalIconBackendEnabled(p2) then nil elseif IsShopAvailable then "HamburgerBlueDot" else nil
	end
end

local function submitBlueDot(SlotId)
	-- upvalues: NotificationsOrchestratorModule (copy), TrialBlueDotLifecycleKey (copy), MaxTrialBlueDotImpressions (copy), TrialBlueDotCooldownSeconds (copy), FFlagTrialNotificationBlueDotOnStudioModule (copy)
	local Lifecycle = NotificationsOrchestratorModule.getSlotConfig(SlotId).lifecycle
	
	return NotificationsOrchestratorModule.submit({
		priority = 0,
		source = "GamePassFreeTrialBlueDot",
		slotId = SlotId,
		lifecycleKey = TrialBlueDotLifecycleKey,
		lifecyclePolicy = {
			frequency = {
				window = "forever",
				maxImpressions = MaxTrialBlueDotImpressions,
				cooldownSeconds = TrialBlueDotCooldownSeconds
			},
			visibility = if Lifecycle == nil then nil else Lifecycle.visibility
		},
		slotDisplayPayload = if SlotId == "ShopIconBlueDot" then { slot = "ShopIconBlueDot" } else { slot = "HamburgerBlueDot" },
		enableOnStudio = FFlagTrialNotificationBlueDotOnStudioModule
	})
end

local _ = function(Slot, p2): boolean
	-- upvalues: Signal (copy), NotificationsOrchestratorModule (copy)
	local SignalResult = Signal(p2)
	local v2 = NotificationsOrchestratorModule.getActiveForSlot(Slot)(p2)
	
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

local function isTrialBlueDotShowing(p2): boolean
	-- upvalues: Signal (copy), NotificationsOrchestratorModule (copy)
	local SignalResult = Signal(p2)
	
	if SignalResult == nil then
		return false
	else
		local SlotId = SignalResult.slotId
		local SignalResult1 = Signal(p2)
		local v2 = NotificationsOrchestratorModule.getActiveForSlot(SlotId)(p2)
		
		return SignalResult1 ~= nil and (SignalResult1.slotId == SlotId and (v2 ~= nil and (v2.payload.slot == SlotId and v2.handle == SignalResult1.handle)))
	end
end

local _ = function(Slot, p2): boolean
	-- upvalues: Signal (copy), NotificationsOrchestratorModule (copy)
	local SignalResult = Signal(p2)
	local v2 = NotificationsOrchestratorModule.getActiveForSlot(Slot)(p2)
	
	return SignalResult ~= nil and (SignalResult.slotId == Slot and (v2 ~= nil and (v2.payload.slot == Slot and v2.handle == SignalResult.handle)))
end

local function report(p2)
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
	if p2.type == "mounted" then
		if Handle == Handle2 then return end
		Handle = Handle2
	elseif p2.type == "viewed" then
		if Handle1 == Handle2 then return end
		Handle1 = Handle2
	end
	NotificationsOrchestratorModule.report(SignalResult.slotId, Handle2, p2)
end

local Flag = false

local _ = function()
	-- upvalues: v1 (ref), GetInExperienceShopStoreModule (copy), Effect (ref), SignalsModule (copy), Flag (ref), chooseSlot (copy), Signal2 (copy), submitBlueDot (copy), isTrialBlueDotShowing (copy)
	local v2 = v1
	
	if v2 == nil then
		local v3 = false
		local InExperienceShopStoreModule = GetInExperienceShopStoreModule(false)
		Effect = SignalsModule.createEffect(function(p2)
			-- upvalues: InExperienceShopStoreModule (copy), Flag (upval), v3 (ref), chooseSlot (upval), Signal2 (upval), submitBlueDot (upval)
			local TrialAvailabilities = InExperienceShopStoreModule.getTrialAvailabilities(p2)
			
			if not Flag and not v3 then
				local Flag = nil
				for _, value in TrialAvailabilities.available do
					if value then
						Flag = true
						if Flag then
							local SlotId = chooseSlot(p2)
							
							if SlotId ~= nil then
								v3 = true
								Signal2({ slotId = SlotId, handle = submitBlueDot(SlotId) })
								
								return
							end
							return
						end
					else
						continue
					end
				end
				Flag = false
				
				for _, value1 in TrialAvailabilities.active do
					if value1 then
						Flag = true
						break
					end
				end
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
	dismiss = function()
		-- upvalues: Flag (ref), report (copy)
		Flag = true
		report({ type = "dismissed", reason = "activated" })
	end,
	isHamburgerBlueDotShowing = function(p2): boolean
		-- upvalues: Signal (copy), NotificationsOrchestratorModule (copy)
		local SignalResult = Signal(p2)
		local v4 = NotificationsOrchestratorModule.getActiveForSlot("HamburgerBlueDot")(p2)
		
		return SignalResult ~= nil and (SignalResult.slotId == "HamburgerBlueDot" and (v4 ~= nil and (v4.payload.slot == "HamburgerBlueDot" and v4.handle == SignalResult.handle)))
	end,
	isShopIconBlueDotShowing = function(p2): boolean
		-- upvalues: Signal (copy), NotificationsOrchestratorModule (copy)
		local SignalResult = Signal(p2)
		local v4 = NotificationsOrchestratorModule.getActiveForSlot("ShopIconBlueDot")(p2)
		
		return SignalResult ~= nil and (SignalResult.slotId == "ShopIconBlueDot" and (v4 ~= nil and (v4.payload.slot == "ShopIconBlueDot" and v4.handle == SignalResult.handle)))
	end
}, {
	__call = function(_)
		-- upvalues: v1 (ref), GetInExperienceShopStoreModule (copy), Effect (ref), SignalsModule (copy), Flag (ref), chooseSlot (copy), Signal2 (copy), submitBlueDot (copy), isTrialBlueDotShowing (copy)
		local v4 = v1
		
		if v4 == nil then
			local v5 = false
			local InExperienceShopStoreModule = GetInExperienceShopStoreModule(false)
			Effect = SignalsModule.createEffect(function(p2)
				-- upvalues: InExperienceShopStoreModule (copy), Flag (upval), v5 (ref), chooseSlot (upval), Signal2 (upval), submitBlueDot (upval)
				local TrialAvailabilities = InExperienceShopStoreModule.getTrialAvailabilities(p2)
				
				if not Flag and not v5 then
					local Flag = nil
					for _, value in TrialAvailabilities.available do
						if value then
							Flag = true
							if Flag then
								local SlotId = chooseSlot(p2)
								
								if SlotId ~= nil then
									v5 = true
									Signal2({ slotId = SlotId, handle = submitBlueDot(SlotId) })
									
									return
								end
								return
							end
						else
							continue
						end
					end
					Flag = false
					
					for _, value1 in TrialAvailabilities.active do
						if value1 then
							Flag = true
							break
						end
					end
				end
			end)
			v1 = isTrialBlueDotShowing
			
			return isTrialBlueDotShowing
		else
			return v4
		end
	end
}))