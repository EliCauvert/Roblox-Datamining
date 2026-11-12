local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local SignalsModule = require(Parent.Signals)
local NotificationsOrchestratorModule = require(Parent.NotificationsOrchestrator)
local InExperienceOffersModule = require(Parent.InExperienceOffers)
local GetInExperienceShopStoreModule = require(InExperienceShop.Stores.getInExperienceShopStore)
local GetShopGlobalIconStoreModule = require(InExperienceShop.Stores.GetShopGlobalIconStore)
local FFlagEnableExperienceShopGlobalIconModule = require(InExperienceShop.Flags.FFlagEnableExperienceShopGlobalIcon)
local HasRedeemedTrialWithinWindowModule = require(InExperienceShop.Utils.hasRedeemedTrialWithinWindow)
local _ = require(InExperienceShop.Types)
local FFlagEnableRedeemedFreeTrialTooltipModule = require(InExperienceShop.Flags.FFlagEnableRedeemedFreeTrialTooltip)
local FFlagEnableActiveFreeTrialTooltipModule = require(InExperienceShop.Flags.FFlagEnableActiveFreeTrialTooltip)
local TrialNotificationTooltipOnStudio = game:DefineFastFlag("TrialNotificationTooltipOnStudio", false)
local config = {
	titleKey = "Feature.InExperienceShop.Label.HaveTrial",
	actionTextKey = "Feature.InExperienceShop.Label.TryNow",
	source = "GamePassTrialAvailableTooltip",
	action = "openShop",
	lifecycleKey = game:DefineFastString("TrialAvailableTooltipLifecycleKey", "trial-available-tooltip"),
	maxImpressions = game:DefineFastInt("MaxTrialAvailableTooltipImpressions", 5),
	cooldownSeconds = game:DefineFastInt("TrialAvailableTooltipCooldownSeconds", 86400),
	delayMs = game:DefineFastInt("TrialAvailableTooltipDelayMs", 500),
	durationMs = game:DefineFastInt("TrialAvailableTooltipDurationMs", 7000)
}
local config1 = {
	titleKey = "Feature.InExperienceShop.Tooltip.RecentlyRedeemed",
	actionTextKey = "Feature.InExperienceShop.Label.BuyGamePass",
	source = "GamePassTrialRecentlyRedeemedTooltip",
	action = "promptGamePassPurchase",
	lifecycleKey = game:DefineFastString("TrialRecentlyRedeemedTooltipLifecycleKey", "trial-recently-redeemed-tooltip"),
	maxImpressions = game:DefineFastInt("MaxRecentlyRedeemedTooltipImpressions", 5),
	cooldownSeconds = game:DefineFastInt("RecentlyRedeemedTooltipCooldownSeconds", 86400),
	delayMs = game:DefineFastInt("TrialRecentlyRedeemedTooltipDelayMs", 500),
	durationMs = game:DefineFastInt("TrialRecentlyRedeemedTooltipDurationMs", 7000)
}

local function _(p1)
	return p1
end

local Effect = nil
local v1 = nil
local v2 = nil
local Signal, Signal2 = SignalsModule.createSignal(nil)
local v3 = nil
local v4 = nil
local DelayMs = 0
local DurationMs = 0
local Action = "openShop"
local GamePassId = nil

local _ = function(p1): boolean
	local _, Value = next(p1.available)
	
	return Value == true
end

local _ = function(p1): boolean
	local _, Value = next(p1.active)
	
	return Value == true
end

local function firstRedeemedGamePassId(TrialAvailabilities)
	-- upvalues: HasRedeemedTrialWithinWindowModule (copy)
	for i, value in TrialAvailabilities.redeemed do
		if HasRedeemedTrialWithinWindowModule({ [i] = value }) then
			return value.gamePassId
		end
	end
	return nil
end

local _ = function(p1)
	local Key, Value = next(p1.active)
	
	return if Value == true then Key else nil
end

local _ = function(p1)
	-- upvalues: FFlagEnableRedeemedFreeTrialTooltipModule (copy), HasRedeemedTrialWithinWindowModule (copy), config1 (copy), FFlagEnableActiveFreeTrialTooltipModule (copy), config (copy)
	if FFlagEnableRedeemedFreeTrialTooltipModule and HasRedeemedTrialWithinWindowModule(p1.redeemed) then
		return config1
	end
	if FFlagEnableActiveFreeTrialTooltipModule then
		local _, Value = next(p1.active)
		
		if Value == true then
			return config1
		end
	end
	local _, Value1 = next(p1.available)
	
	return if Value1 == true then config else nil
end

local function chooseSlot(p1)
	-- upvalues: InExperienceOffersModule (copy), FFlagEnableExperienceShopGlobalIconModule (copy), GetShopGlobalIconStoreModule (copy), GetInExperienceShopStoreModule (copy)
	local IsShopAvailable = InExperienceOffersModule.getOffersStore(false).getIsShopAvailable(p1)
	
	if not FFlagEnableExperienceShopGlobalIconModule then
		return if IsShopAvailable then "EducationTooltipOnHamburger" else nil
	elseif GetShopGlobalIconStoreModule(false).getEnabled(p1) then
		return "EducationTooltipOnShopIcon"
	else
		local InExperienceShopStoreModule = GetInExperienceShopStoreModule(false)
		
		return if InExperienceShopStoreModule.getLoading(p1) or InExperienceShopStoreModule.getGlobalIconBackendEnabled(p1) then nil elseif IsShopAvailable then "EducationTooltipOnHamburger" else nil
	end
end

local function submitTooltip(SlotId, p1)
	-- upvalues: TrialNotificationTooltipOnStudio (copy), NotificationsOrchestratorModule (copy)
	local config = {
		priority = 0,
		slotId = SlotId,
		lifecycleKey = p1.lifecycleKey,
		lifecyclePolicy = {
			frequency = {
				window = "forever",
				maxImpressions = p1.maxImpressions,
				cooldownSeconds = p1.cooldownSeconds
			},
			visibility = { delayMs = p1.delayMs, autoDismissAfterMs = p1.durationMs }
		},
		source = p1.source,
		slotDisplayPayload = if SlotId == "EducationTooltipOnShopIcon" then {
			slot = "EducationTooltipOnShopIcon",
			title = p1.titleKey,
			actionText = p1.actionTextKey
		} else {
			slot = "EducationTooltipOnHamburger",
			title = p1.titleKey,
			actionText = p1.actionTextKey
		}
	}
	
	if TrialNotificationTooltipOnStudio then
		config.enableOnStudio = true
	end
	return NotificationsOrchestratorModule.submit(config)
end

local function readActiveTooltip(Slot, p1)
	-- upvalues: NotificationsOrchestratorModule (copy), Signal (copy), DelayMs (ref), DurationMs (ref), Action (ref), GamePassId (ref)
	local v5 = NotificationsOrchestratorModule.getActiveForSlot(Slot)(p1)
	local SignalResult = Signal(p1)
	
	if v5 == nil or v5.handle ~= SignalResult or v5.payload.slot ~= Slot then
		return nil
	else
		local Payload = v5.payload
		
		return {
			slot = Slot,
			title = Payload.title or "",
			actionText = Payload.actionText or "",
			delayMs = DelayMs,
			durationMs = DurationMs,
			action = Action,
			gamePassId = GamePassId
		}
	end
end

local _ = function()
	-- upvalues: v2 (ref), readActiveTooltip (copy), Signal (copy)
	local Slot = v2
	
	return if Slot == nil or readActiveTooltip(Slot, false) == nil then nil else Signal(false)
end

local function isTrialTooltipShowing(p1): boolean
	-- upvalues: v2 (ref), Signal (copy), readActiveTooltip (copy)
	local Slot = v2
	
	if Slot == nil then
		Signal(p1)
		
		return false
	else
		return readActiveTooltip(Slot, p1) ~= nil
	end
end

local _ = function(Slot, p1): boolean
	-- upvalues: readActiveTooltip (copy), v2 (ref)
	local HasActiveTooltip = readActiveTooltip(Slot, p1) ~= nil
	
	return v2 == Slot and HasActiveTooltip
end

local function report(p1)
	-- upvalues: v2 (ref), readActiveTooltip (copy), Signal (copy), v3 (ref), v4 (ref), NotificationsOrchestratorModule (copy)
	local v5 = v2
	local Slot = v2
	local SignalResult = if Slot == nil or readActiveTooltip(Slot, false) == nil then nil else Signal(false)
	
	if v5 == nil or SignalResult == nil then return end
	if p1.type == "mounted" then
		if v3 == SignalResult then return end
		v3 = SignalResult
	elseif p1.type == "viewed" then
		if v4 == SignalResult then return end
		v4 = SignalResult
	end
	NotificationsOrchestratorModule.report(v5, SignalResult, p1)
end

local Flag = false

local _ = function()
	-- upvalues: v1 (ref), GetInExperienceShopStoreModule (copy), Effect (ref), SignalsModule (copy), FFlagEnableRedeemedFreeTrialTooltipModule (copy), HasRedeemedTrialWithinWindowModule (copy), config1 (copy), FFlagEnableActiveFreeTrialTooltipModule (copy), config (copy), Flag (ref), chooseSlot (copy), v2 (ref), DelayMs (ref), DurationMs (ref), Action (ref), GamePassId (ref), firstRedeemedGamePassId (copy), Signal2 (copy), submitTooltip (copy), isTrialTooltipShowing (copy)
	local v5 = v1
	
	if v5 == nil then
		local v6 = false
		local InExperienceShopStoreModule = GetInExperienceShopStoreModule(false)
		Effect = SignalsModule.createEffect(function(p1)
			-- upvalues: InExperienceShopStoreModule (copy), FFlagEnableRedeemedFreeTrialTooltipModule (upval), HasRedeemedTrialWithinWindowModule (upval), config1 (upval), FFlagEnableActiveFreeTrialTooltipModule (upval), config (upval), Flag (upval), v6 (ref), chooseSlot (upval), v2 (upval), DelayMs (upval), DurationMs (upval), Action (upval), GamePassId (upval), firstRedeemedGamePassId (upval), Signal2 (upval), submitTooltip (upval)
			local TrialAvailabilities = InExperienceShopStoreModule.getTrialAvailabilities(p1)
			local ActiveTooltip = nil
			repeat
				if FFlagEnableRedeemedFreeTrialTooltipModule and HasRedeemedTrialWithinWindowModule(TrialAvailabilities.redeemed) then
					ActiveTooltip = config1
					break
				end
				if FFlagEnableActiveFreeTrialTooltipModule then
					local _, Value = next(TrialAvailabilities.active)
					
					if Value == true then
						ActiveTooltip = config1
						break
					end
				end
				local _, Value1 = next(TrialAvailabilities.available)
				local IsValue = Value1 == true
				ActiveTooltip = if IsValue then config else nil
			until true
			if Flag or v6 or ActiveTooltip == nil then return end
			local SlotId = chooseSlot(p1)
			
			if SlotId == nil then return end
			v6 = true
			v2 = SlotId
			DelayMs = ActiveTooltip.delayMs
			DurationMs = ActiveTooltip.durationMs
			Action = ActiveTooltip.action
			local v7 = nil
			
			if ActiveTooltip.action == "promptGamePassPurchase" then
				if FFlagEnableRedeemedFreeTrialTooltipModule and HasRedeemedTrialWithinWindowModule(TrialAvailabilities.redeemed) then
					v7 = firstRedeemedGamePassId(TrialAvailabilities)
				else
					local Key, Value2 = next(TrialAvailabilities.active)
					v7 = if Value2 == true then Key else nil
				end
			else
				v7 = nil
			end
			GamePassId = v7
			Signal2(submitTooltip(SlotId, ActiveTooltip))
		end)
		v1 = isTrialTooltipShowing
		
		return isTrialTooltipShowing
	else
		return v5
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
		-- upvalues: report (copy)
		report({ type = "activated" })
	end,
	dismiss = function(p1)
		-- upvalues: Flag (ref), report (copy)
		Flag = true
		report({
			type = "dismissed",
			reason = if p1 == nil then "activated" else p1
		})
	end,
	getActiveTooltip = function(p1)
		-- upvalues: v2 (ref), Signal (copy), readActiveTooltip (copy)
		local Slot = v2
		
		if Slot == nil then
			Signal(p1)
			
			return nil
		else
			return (readActiveTooltip(Slot, p1))
		end
	end,
	isHamburgerTooltipShowing = function(p1): boolean
		-- upvalues: readActiveTooltip (copy), v2 (ref)
		local HasEducationTooltipOnHamburger = readActiveTooltip("EducationTooltipOnHamburger", p1) ~= nil
		
		return v2 == "EducationTooltipOnHamburger" and HasEducationTooltipOnHamburger
	end,
	isShopIconTooltipShowing = function(p1): boolean
		-- upvalues: readActiveTooltip (copy), v2 (ref)
		local HasEducationTooltipOnShopIcon = readActiveTooltip("EducationTooltipOnShopIcon", p1) ~= nil
		
		return v2 == "EducationTooltipOnShopIcon" and HasEducationTooltipOnShopIcon
	end
}, {
	__call = function(_)
		-- upvalues: v1 (ref), GetInExperienceShopStoreModule (copy), Effect (ref), SignalsModule (copy), FFlagEnableRedeemedFreeTrialTooltipModule (copy), HasRedeemedTrialWithinWindowModule (copy), config1 (copy), FFlagEnableActiveFreeTrialTooltipModule (copy), config (copy), Flag (ref), chooseSlot (copy), v2 (ref), DelayMs (ref), DurationMs (ref), Action (ref), GamePassId (ref), firstRedeemedGamePassId (copy), Signal2 (copy), submitTooltip (copy), isTrialTooltipShowing (copy)
		local v5 = v1
		
		if v5 == nil then
			local v6 = false
			local InExperienceShopStoreModule = GetInExperienceShopStoreModule(false)
			Effect = SignalsModule.createEffect(function(p1)
				-- upvalues: InExperienceShopStoreModule (copy), FFlagEnableRedeemedFreeTrialTooltipModule (upval), HasRedeemedTrialWithinWindowModule (upval), config1 (upval), FFlagEnableActiveFreeTrialTooltipModule (upval), config (upval), Flag (upval), v6 (ref), chooseSlot (upval), v2 (upval), DelayMs (upval), DurationMs (upval), Action (upval), GamePassId (upval), firstRedeemedGamePassId (upval), Signal2 (upval), submitTooltip (upval)
				local TrialAvailabilities = InExperienceShopStoreModule.getTrialAvailabilities(p1)
				local ActiveTooltip = nil
				if FFlagEnableRedeemedFreeTrialTooltipModule and HasRedeemedTrialWithinWindowModule(TrialAvailabilities.redeemed) then
					ActiveTooltip = config1
				end
				if FFlagEnableActiveFreeTrialTooltipModule then
					local _, Value = next(TrialAvailabilities.active)
					
					if Value == true then
						ActiveTooltip = config1
					end
				end
				local _, Value1 = next(TrialAvailabilities.available)
				local IsValue = Value1 == true
				ActiveTooltip = if IsValue then config else nil
			end)
			v1 = isTrialTooltipShowing
			
			return isTrialTooltipShowing
		else
			return v5
		end
	end
}))