local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local SignalsModule = require(Parent.Signals)
local NotificationsOrchestratorModule = require(Parent.NotificationsOrchestrator)
local GetInExperienceShopStoreModule = require(InExperienceShop.Stores.getInExperienceShopStore)
local FFlagFreeTrialChipBuyAnimationModule = require(InExperienceShop.Flags.FFlagFreeTrialChipBuyAnimation)
local FFlagTrialNotificationTopBarChipOnStudioModule = require(InExperienceShop.Flags.FFlagTrialNotificationTopBarChipOnStudio)
local FIntFreeTrialUpsellTimerSecsModule = require(InExperienceShop.Flags.FIntFreeTrialUpsellTimerSecs)
local FIntFreeTrialUpsellAutoDismissAfterSecsModule = require(InExperienceShop.Flags.FIntFreeTrialUpsellAutoDismissAfterSecs)
local FreeTrialTopBarChip = NotificationsOrchestratorModule.SlotId.FreeTrialTopBarChip
local Effect = nil
local Flag = false
local v1 = nil
local v2 = nil
local Signal, Signal2 = SignalsModule.createSignal(nil)
local Active, Active2 = SignalsModule.createSignal("active")
local Signal1 = nil
local Signal2_1 = nil
local Signal3 = nil
local Signal2_2 = nil

if FFlagFreeTrialChipBuyAnimationModule then
	Signal1, Signal2_1 = SignalsModule.createSignal(false)
	Signal3, Signal2_2 = SignalsModule.createSignal(nil)
else
	Signal1 = function(_): boolean
		return false
	end
	
	Signal2_1 = function(_) end
	
	Signal3 = function(_)
		return nil
	end
	
	Signal2_2 = function(_) end
end
local DelayedThread = nil
local DelayedThread1 = nil
local Count = 0
local GamePassId = nil

local function _()
	-- upvalues: DelayedThread (ref)
	local DelayedThread1 = DelayedThread
	
	if DelayedThread1 ~= nil then
		task.cancel(DelayedThread1)
		DelayedThread = nil
	end
end

local _ = function()
	-- upvalues: DelayedThread1 (ref)
	local DelayedThread = DelayedThread1
	
	if DelayedThread ~= nil then
		task.cancel(DelayedThread)
		DelayedThread1 = nil
	end
end

local function isChipShowing(p1): boolean
	-- upvalues: Signal (copy), NotificationsOrchestratorModule (copy), FreeTrialTopBarChip (copy)
	local SignalResult = Signal(p1)
	
	if SignalResult == nil then
		return false
	else
		local v3 = NotificationsOrchestratorModule.getActiveForSlot(FreeTrialTopBarChip)(p1)
		
		return v3 ~= nil and (v3.payload.slot == "FreeTrialTopBarChip" and v3.handle == SignalResult)
	end
end

local function chipImage(p1)
	-- upvalues: Signal (copy), NotificationsOrchestratorModule (copy), FreeTrialTopBarChip (copy), FFlagFreeTrialChipBuyAnimationModule (copy), Signal1 (ref), Signal3 (ref)
	local SignalResult = Signal(p1)
	local IsHandleMatch = nil
	
	if SignalResult == nil then
		IsHandleMatch = false
	else
		local v3 = NotificationsOrchestratorModule.getActiveForSlot(FreeTrialTopBarChip)(p1)
		IsHandleMatch = v3 ~= nil and (v3.payload.slot == "FreeTrialTopBarChip" and v3.handle == SignalResult)
	end
	if IsHandleMatch then
		local v4 = NotificationsOrchestratorModule.getActiveForSlot(FreeTrialTopBarChip)(p1)
		
		return if v4 == nil or v4.payload.slot ~= "FreeTrialTopBarChip" then nil else v4.payload.image
	else
		return if FFlagFreeTrialChipBuyAnimationModule and Signal1(p1) then Signal3(p1) else nil
	end
end

local function report(p1)
	-- upvalues: Signal (copy), NotificationsOrchestratorModule (copy), FreeTrialTopBarChip (copy), v1 (ref), v2 (ref)
	local SignalResult = Signal(false)
	local IsHandleMatch = nil
	
	if SignalResult == nil then
		IsHandleMatch = false
	else
		local v3 = NotificationsOrchestratorModule.getActiveForSlot(FreeTrialTopBarChip)(false)
		IsHandleMatch = v3 ~= nil and (v3.payload.slot == "FreeTrialTopBarChip" and v3.handle == SignalResult)
	end
	if not IsHandleMatch then return end
	local SignalResult1 = Signal(false)
	
	if SignalResult1 == nil then return end
	if p1.type == "mounted" then
		if v1 == SignalResult1 then return end
		v1 = SignalResult1
	elseif p1.type == "viewed" then
		if v2 == SignalResult1 then return end
		v2 = SignalResult1
	end
	NotificationsOrchestratorModule.report(FreeTrialTopBarChip, SignalResult1, p1)
end

local _ = function()
	-- upvalues: FIntFreeTrialUpsellAutoDismissAfterSecsModule (copy)
	return if FIntFreeTrialUpsellAutoDismissAfterSecsModule <= 0 then nil else FIntFreeTrialUpsellAutoDismissAfterSecsModule * 1000
end

local _ = function(p1)
	-- upvalues: DelayedThread1 (ref), FIntFreeTrialUpsellAutoDismissAfterSecsModule (copy), Signal (copy), NotificationsOrchestratorModule (copy), FreeTrialTopBarChip (copy), report (copy)
	local DelayedThread = DelayedThread1
	
	if DelayedThread ~= nil then
		task.cancel(DelayedThread)
		DelayedThread1 = nil
	end
	if FIntFreeTrialUpsellAutoDismissAfterSecsModule > 0 then
		DelayedThread1 = task.delay(FIntFreeTrialUpsellAutoDismissAfterSecsModule, function()
			-- upvalues: DelayedThread1 (upval), Signal (upval), p1 (copy), NotificationsOrchestratorModule (upval), FreeTrialTopBarChip (upval), report (upval)
			DelayedThread1 = nil
			
			if Signal(false) == p1 then
				local Handle = Signal(false)
				local IsHandleMatch = nil
				
				if Handle == nil then
					IsHandleMatch = false
				else
					local v3 = NotificationsOrchestratorModule.getActiveForSlot(FreeTrialTopBarChip)(false)
					IsHandleMatch = v3 ~= nil and (v3.payload.slot == "FreeTrialTopBarChip" and v3.handle == Handle)
				end
				if IsHandleMatch then
					report({ type = "dismissed", reason = "timeout" })
				end
			end
		end)
		
		return
	end
end

local function submitNotification(p1, p2)
	-- upvalues: GetInExperienceShopStoreModule (copy), NotificationsOrchestratorModule (copy), FreeTrialTopBarChip (copy), Active2 (copy), GamePassId (ref), FIntFreeTrialUpsellAutoDismissAfterSecsModule (copy), FFlagTrialNotificationTopBarChipOnStudioModule (copy), Signal2 (copy)
	if GetInExperienceShopStoreModule(false).getNotificationFreeTrialTopBarChip(false) then
		Active2(p1)
		GamePassId = if p1 == "upsell" then p2.gamePassId else nil
		local ScaledFIntFreeTrialUpsellAutoDismissAfterSecsModule = if p1 == "upsell" then if FIntFreeTrialUpsellAutoDismissAfterSecsModule <= 0 then nil else FIntFreeTrialUpsellAutoDismissAfterSecsModule * 1000 else nil
		local SubmitResult = NotificationsOrchestratorModule.submit({
			priority = 0,
			slotId = FreeTrialTopBarChip,
			enableOnStudio = FFlagTrialNotificationTopBarChipOnStudioModule,
			lifecycleKey = if p1 == "upsell" then "free-trial-top-bar-upsell-chip" else "free-trial-top-bar-chip",
			lifecyclePolicy = {
				frequency = {},
				visibility = if ScaledFIntFreeTrialUpsellAutoDismissAfterSecsModule == nil then nil else {
					autoDismissAfterMs = ScaledFIntFreeTrialUpsellAutoDismissAfterSecsModule
				}
			},
			source = if p1 == "upsell" then "GamePassFreeTrialUpsellTopBarChip" else "GamePassFreeTrialActiveTopBarChip",
			slotDisplayPayload = {
				slot = "FreeTrialTopBarChip",
				image = if p2.image == "" then nil else p2.image
			}
		})
		Signal2(SubmitResult)
		
		return SubmitResult
	else
		NotificationsOrchestratorModule.report(FreeTrialTopBarChip, if p1 == "upsell" then "free-trial-top-bar-upsell-chip" else "free-trial-top-bar-chip", { type = "suppressed" })
		
		return nil
	end
end

local _ = function(p1)
	-- upvalues: submitNotification (copy), DelayedThread1 (ref), FIntFreeTrialUpsellAutoDismissAfterSecsModule (copy), Signal (copy), NotificationsOrchestratorModule (copy), FreeTrialTopBarChip (copy), report (copy)
	local Upsell = submitNotification("upsell", p1)
	
	if Upsell ~= nil then
		local DelayedThread = DelayedThread1
		
		if DelayedThread ~= nil then
			task.cancel(DelayedThread)
			DelayedThread1 = nil
		end
		if FIntFreeTrialUpsellAutoDismissAfterSecsModule <= 0 then return end
		DelayedThread1 = task.delay(FIntFreeTrialUpsellAutoDismissAfterSecsModule, function()
			-- upvalues: DelayedThread1 (upval), Signal (upval), Upsell (copy), NotificationsOrchestratorModule (upval), FreeTrialTopBarChip (upval), report (upval)
			DelayedThread1 = nil
			
			if Signal(false) == Upsell then
				local Handle = Signal(false)
				local IsHandleMatch = nil
				
				if Handle == nil then
					IsHandleMatch = false
				else
					local v3 = NotificationsOrchestratorModule.getActiveForSlot(FreeTrialTopBarChip)(false)
					IsHandleMatch = v3 ~= nil and (v3.payload.slot == "FreeTrialTopBarChip" and v3.handle == Handle)
				end
				if IsHandleMatch then
					report({ type = "dismissed", reason = "timeout" })
				end
			end
		end)
	end
end

local _ = function(p1, p2)
	-- upvalues: DelayedThread (ref), Count (ref), FIntFreeTrialUpsellTimerSecsModule (copy), Signal (copy), NotificationsOrchestratorModule (copy), FreeTrialTopBarChip (copy), FFlagFreeTrialChipBuyAnimationModule (copy), Signal2_2 (ref), chipImage (copy), Signal2_1 (ref), report (copy), GetInExperienceShopStoreModule (copy), submitNotification (copy), DelayedThread1 (ref), FIntFreeTrialUpsellAutoDismissAfterSecsModule (copy)
	local DelayedThread2 = DelayedThread
	
	if DelayedThread2 ~= nil then
		task.cancel(DelayedThread2)
		DelayedThread = nil
	end
	Count += 1
	local Count1: number = Count
	DelayedThread = task.delay(FIntFreeTrialUpsellTimerSecsModule, function()
		-- upvalues: DelayedThread (upval), Count1 (copy), Count (upval), Signal (upval), p1 (copy), NotificationsOrchestratorModule (upval), FreeTrialTopBarChip (upval), FFlagFreeTrialChipBuyAnimationModule (upval), Signal2_2 (upval), chipImage (upval), Signal2_1 (upval), report (upval), GetInExperienceShopStoreModule (upval), p2 (copy), submitNotification (upval), DelayedThread1 (upval), FIntFreeTrialUpsellAutoDismissAfterSecsModule (upval)
		DelayedThread = nil
		
		if Count1 ~= Count then return end
		if Signal(false) ~= p1 then
			local Handle = Signal(false)
			local IsHandleMatch = nil
			
			if Handle == nil then
				IsHandleMatch = false
			else
				local v3 = NotificationsOrchestratorModule.getActiveForSlot(FreeTrialTopBarChip)(false)
				IsHandleMatch = v3 ~= nil and (v3.payload.slot == "FreeTrialTopBarChip" and v3.handle == Handle)
			end
			if IsHandleMatch then return end
		end
		if Signal(false) == p1 then
			local Handle = Signal(false)
			local IsHandleMatch = nil
			
			if Handle == nil then
				IsHandleMatch = false
			else
				local v4 = NotificationsOrchestratorModule.getActiveForSlot(FreeTrialTopBarChip)(false)
				IsHandleMatch = v4 ~= nil and (v4.payload.slot == "FreeTrialTopBarChip" and v4.handle == Handle)
			end
			if IsHandleMatch then
				if FFlagFreeTrialChipBuyAnimationModule then
					Signal2_2(chipImage(false))
					Signal2_1(true)
				end
				report({ type = "dismissed", reason = "timeout" })
			end
		end
		GetInExperienceShopStoreModule(false).currentlyOwnsGamePass(p2.gamePassId):andThen(function(Result)
			-- upvalues: Count1 (upval), Count (upval), FFlagFreeTrialChipBuyAnimationModule (upval), Signal2_1 (upval), p2 (upval), submitNotification (upval), DelayedThread1 (upval), FIntFreeTrialUpsellAutoDismissAfterSecsModule (upval), Signal (upval), NotificationsOrchestratorModule (upval), FreeTrialTopBarChip (upval), report (upval)
			if Count1 ~= Count then return end
			if not Result then
				local Upsell = submitNotification("upsell", p2)
				
				if Upsell ~= nil then
					local DelayedThread = DelayedThread1
					
					if DelayedThread ~= nil then
						task.cancel(DelayedThread)
						DelayedThread1 = nil
					end
					if FIntFreeTrialUpsellAutoDismissAfterSecsModule > 0 then
						DelayedThread1 = task.delay(FIntFreeTrialUpsellAutoDismissAfterSecsModule, function()
							-- upvalues: DelayedThread1 (upval), Signal (upval), Upsell (copy), NotificationsOrchestratorModule (upval), FreeTrialTopBarChip (upval), report (upval)
							DelayedThread1 = nil
							
							if Signal(false) == Upsell then
								local Handle = Signal(false)
								local IsHandleMatch = nil
								
								if Handle == nil then
									IsHandleMatch = false
								else
									local v5 = NotificationsOrchestratorModule.getActiveForSlot(FreeTrialTopBarChip)(false)
									IsHandleMatch = v5 ~= nil and (v5.payload.slot == "FreeTrialTopBarChip" and v5.handle == Handle)
								end
								if IsHandleMatch then
									report({ type = "dismissed", reason = "timeout" })
								end
							end
						end)
					end
				end
				if FFlagFreeTrialChipBuyAnimationModule then
					Signal2_1(false)
				end
				return
			elseif FFlagFreeTrialChipBuyAnimationModule then
				Signal2_1(false)
			end
		end):catch(function()
			-- upvalues: Count1 (upval), Count (upval), p2 (upval), submitNotification (upval), DelayedThread1 (upval), FIntFreeTrialUpsellAutoDismissAfterSecsModule (upval), Signal (upval), NotificationsOrchestratorModule (upval), FreeTrialTopBarChip (upval), report (upval), FFlagFreeTrialChipBuyAnimationModule (upval), Signal2_1 (upval)
			if Count1 ~= Count then return end
			local Upsell = submitNotification("upsell", p2)
			
			if Upsell ~= nil then
				local DelayedThread = DelayedThread1
				
				if DelayedThread ~= nil then
					task.cancel(DelayedThread)
					DelayedThread1 = nil
				end
				if FIntFreeTrialUpsellAutoDismissAfterSecsModule > 0 then
					DelayedThread1 = task.delay(FIntFreeTrialUpsellAutoDismissAfterSecsModule, function()
						-- upvalues: DelayedThread1 (upval), Signal (upval), Upsell (copy), NotificationsOrchestratorModule (upval), FreeTrialTopBarChip (upval), report (upval)
						DelayedThread1 = nil
						
						if Signal(false) == Upsell then
							local Handle = Signal(false)
							local IsHandleMatch = nil
							
							if Handle == nil then
								IsHandleMatch = false
							else
								local v5 = NotificationsOrchestratorModule.getActiveForSlot(FreeTrialTopBarChip)(false)
								IsHandleMatch = v5 ~= nil and (v5.payload.slot == "FreeTrialTopBarChip" and v5.handle == Handle)
							end
							if IsHandleMatch then
								report({ type = "dismissed", reason = "timeout" })
							end
						end
					end)
				end
			end
			if FFlagFreeTrialChipBuyAnimationModule then
				Signal2_1(false)
			end
		end)
	end)
end

local _ = function()
	-- upvalues: Flag (ref), GetInExperienceShopStoreModule (copy), Effect (ref), SignalsModule (copy), Signal (copy), NotificationsOrchestratorModule (copy), FreeTrialTopBarChip (copy), submitNotification (copy), FIntFreeTrialUpsellTimerSecsModule (copy), DelayedThread (ref), Count (ref), FFlagFreeTrialChipBuyAnimationModule (copy), Signal2_2 (ref), chipImage (copy), Signal2_1 (ref), report (copy), DelayedThread1 (ref), FIntFreeTrialUpsellAutoDismissAfterSecsModule (copy)
	if not Flag then
		Flag = true
		local v3 = nil
		local InExperienceShopStoreModule = GetInExperienceShopStoreModule(false)
		Effect = SignalsModule.createEffect(function(p1)
			-- upvalues: InExperienceShopStoreModule (copy), v3 (ref), Signal (upval), NotificationsOrchestratorModule (upval), FreeTrialTopBarChip (upval), submitNotification (upval), FIntFreeTrialUpsellTimerSecsModule (upval), DelayedThread (upval), Count (upval), FFlagFreeTrialChipBuyAnimationModule (upval), Signal2_2 (upval), chipImage (upval), Signal2_1 (upval), report (upval), GetInExperienceShopStoreModule (upval), DelayedThread1 (upval), FIntFreeTrialUpsellAutoDismissAfterSecsModule (upval)
			local TrialRedeemThumbnail = InExperienceShopStoreModule.getTrialRedeemThumbnail(p1)
			
			if TrialRedeemThumbnail == nil or TrialRedeemThumbnail == v3 then return end
			v3 = TrialRedeemThumbnail
			local Handle = Signal(false)
			local IsHandleMatch = nil
			
			if Handle == nil then
				IsHandleMatch = false
			else
				local v4 = NotificationsOrchestratorModule.getActiveForSlot(FreeTrialTopBarChip)(false)
				IsHandleMatch = v4 ~= nil and (v4.payload.slot == "FreeTrialTopBarChip" and v4.handle == Handle)
			end
			if IsHandleMatch then return end
			local config = {
				image = TrialRedeemThumbnail.image,
				gamePassId = TrialRedeemThumbnail.gamePassId
			}
			local Active = submitNotification("active", config)
			
			if Active ~= nil and FIntFreeTrialUpsellTimerSecsModule > 0 then
				local DelayedThread = DelayedThread
				
				if DelayedThread ~= nil then
					task.cancel(DelayedThread)
					DelayedThread = nil
				end
				Count += 1
				local Count: number = Count
				DelayedThread = task.delay(FIntFreeTrialUpsellTimerSecsModule, function()
					-- upvalues: DelayedThread (upval), Count (copy), Count (upval), Signal (upval), Active (copy), NotificationsOrchestratorModule (upval), FreeTrialTopBarChip (upval), FFlagFreeTrialChipBuyAnimationModule (upval), Signal2_2 (upval), chipImage (upval), Signal2_1 (upval), report (upval), GetInExperienceShopStoreModule (upval), config (copy), submitNotification (upval), DelayedThread1 (upval), FIntFreeTrialUpsellAutoDismissAfterSecsModule (upval)
					DelayedThread = nil
					
					if Count ~= Count then return end
					if Signal(false) ~= Active then
						local Handle = Signal(false)
						local IsHandleMatch = nil
						
						if Handle == nil then
							IsHandleMatch = false
						else
							local v5 = NotificationsOrchestratorModule.getActiveForSlot(FreeTrialTopBarChip)(false)
							IsHandleMatch = v5 ~= nil and (v5.payload.slot == "FreeTrialTopBarChip" and v5.handle == Handle)
						end
						if IsHandleMatch then return end
					end
					if Signal(false) == Active then
						local Handle = Signal(false)
						local IsHandleMatch = nil
						
						if Handle == nil then
							IsHandleMatch = false
						else
							local v6 = NotificationsOrchestratorModule.getActiveForSlot(FreeTrialTopBarChip)(false)
							IsHandleMatch = v6 ~= nil and (v6.payload.slot == "FreeTrialTopBarChip" and v6.handle == Handle)
						end
						if IsHandleMatch then
							if FFlagFreeTrialChipBuyAnimationModule then
								Signal2_2(chipImage(false))
								Signal2_1(true)
							end
							report({ type = "dismissed", reason = "timeout" })
						end
					end
					GetInExperienceShopStoreModule(false).currentlyOwnsGamePass(config.gamePassId):andThen(function(Result)
						-- upvalues: Count (upval), Count (upval), FFlagFreeTrialChipBuyAnimationModule (upval), Signal2_1 (upval), config (upval), submitNotification (upval), DelayedThread1 (upval), FIntFreeTrialUpsellAutoDismissAfterSecsModule (upval), Signal (upval), NotificationsOrchestratorModule (upval), FreeTrialTopBarChip (upval), report (upval)
						if Count ~= Count then return end
						if not Result then
							local Upsell = submitNotification("upsell", config)
							
							if Upsell ~= nil then
								local DelayedThread = DelayedThread1
								
								if DelayedThread ~= nil then
									task.cancel(DelayedThread)
									DelayedThread1 = nil
								end
								if FIntFreeTrialUpsellAutoDismissAfterSecsModule > 0 then
									DelayedThread1 = task.delay(FIntFreeTrialUpsellAutoDismissAfterSecsModule, function()
										-- upvalues: DelayedThread1 (upval), Signal (upval), Upsell (copy), NotificationsOrchestratorModule (upval), FreeTrialTopBarChip (upval), report (upval)
										DelayedThread1 = nil
										
										if Signal(false) == Upsell then
											local Handle = Signal(false)
											local IsHandleMatch = nil
											
											if Handle == nil then
												IsHandleMatch = false
											else
												local v7 = NotificationsOrchestratorModule.getActiveForSlot(FreeTrialTopBarChip)(false)
												IsHandleMatch = v7 ~= nil and (v7.payload.slot == "FreeTrialTopBarChip" and v7.handle == Handle)
											end
											if IsHandleMatch then
												report({ type = "dismissed", reason = "timeout" })
											end
										end
									end)
								end
							end
							if FFlagFreeTrialChipBuyAnimationModule then
								Signal2_1(false)
							end
							return
						elseif FFlagFreeTrialChipBuyAnimationModule then
							Signal2_1(false)
						end
					end):catch(function()
						-- upvalues: Count (upval), Count (upval), config (upval), submitNotification (upval), DelayedThread1 (upval), FIntFreeTrialUpsellAutoDismissAfterSecsModule (upval), Signal (upval), NotificationsOrchestratorModule (upval), FreeTrialTopBarChip (upval), report (upval), FFlagFreeTrialChipBuyAnimationModule (upval), Signal2_1 (upval)
						if Count ~= Count then return end
						local Upsell = submitNotification("upsell", config)
						
						if Upsell ~= nil then
							local DelayedThread = DelayedThread1
							
							if DelayedThread ~= nil then
								task.cancel(DelayedThread)
								DelayedThread1 = nil
							end
							if FIntFreeTrialUpsellAutoDismissAfterSecsModule > 0 then
								DelayedThread1 = task.delay(FIntFreeTrialUpsellAutoDismissAfterSecsModule, function()
									-- upvalues: DelayedThread1 (upval), Signal (upval), Upsell (copy), NotificationsOrchestratorModule (upval), FreeTrialTopBarChip (upval), report (upval)
									DelayedThread1 = nil
									
									if Signal(false) == Upsell then
										local Handle = Signal(false)
										local IsHandleMatch = nil
										
										if Handle == nil then
											IsHandleMatch = false
										else
											local v7 = NotificationsOrchestratorModule.getActiveForSlot(FreeTrialTopBarChip)(false)
											IsHandleMatch = v7 ~= nil and (v7.payload.slot == "FreeTrialTopBarChip" and v7.handle == Handle)
										end
										if IsHandleMatch then
											report({ type = "dismissed", reason = "timeout" })
										end
									end
								end)
							end
						end
						if FFlagFreeTrialChipBuyAnimationModule then
							Signal2_1(false)
						end
					end)
				end)
			end
		end)
		
		return
	end
end

return (setmetatable({
	isShowing = isChipShowing,
	isPresented = function(p1)
		-- upvalues: Signal (copy), NotificationsOrchestratorModule (copy), FreeTrialTopBarChip (copy), Signal1 (ref)
		local SignalResult = Signal(p1)
		local IsHandleMatch = nil
		
		if SignalResult == nil then
			IsHandleMatch = false
		else
			local v3 = NotificationsOrchestratorModule.getActiveForSlot(FreeTrialTopBarChip)(p1)
			IsHandleMatch = v3 ~= nil and (v3.payload.slot == "FreeTrialTopBarChip" and v3.handle == SignalResult)
		end
		return if IsHandleMatch then true else Signal1(p1 or false)
	end,
	handle = Signal,
	image = chipImage,
	textKey = function(p1): string
		-- upvalues: Active (copy)
		return if Active(p1) == "upsell" then "Feature.Catalog.Action.Buy" else "Feature.InExperienceShop.Label.Active"
	end,
	isEmphasis = function(p1): boolean
		-- upvalues: Active (copy)
		return Active(p1) == "upsell"
	end,
	promptsPurchase = function(p1): boolean
		-- upvalues: Active (copy)
		return Active(p1) == "upsell"
	end,
	promptPurchase = function()
		-- upvalues: report (copy), GamePassId (ref), InExperienceShop (copy)
		report({ type = "activated" })
		local GamePassId1 = GamePassId
		report({ type = "dismissed", reason = "activated" })
		
		if GamePassId1 ~= nil and GamePassId1 ~= "" then
			require(InExperienceShop.initiateShopItemPurchase)(GamePassId1, "GamePass")
			
			return
		end
	end,
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
	dismiss = function()
		-- upvalues: FFlagFreeTrialChipBuyAnimationModule (copy), Signal2_1 (ref), report (copy)
		if FFlagFreeTrialChipBuyAnimationModule then
			Signal2_1(false)
		end
		report({ type = "dismissed", reason = "user" })
	end
}, {
	__call = function(_)
		-- upvalues: Flag (ref), GetInExperienceShopStoreModule (copy), Effect (ref), SignalsModule (copy), Signal (copy), NotificationsOrchestratorModule (copy), FreeTrialTopBarChip (copy), submitNotification (copy), FIntFreeTrialUpsellTimerSecsModule (copy), DelayedThread (ref), Count (ref), FFlagFreeTrialChipBuyAnimationModule (copy), Signal2_2 (ref), chipImage (copy), Signal2_1 (ref), report (copy), DelayedThread1 (ref), FIntFreeTrialUpsellAutoDismissAfterSecsModule (copy), isChipShowing (copy)
		if not Flag then
			Flag = true
			local TrialRedeemThumbnail = nil
			local InExperienceShopStoreModule = GetInExperienceShopStoreModule(false)
			Effect = SignalsModule.createEffect(function(p1)
				-- upvalues: InExperienceShopStoreModule (copy), TrialRedeemThumbnail (ref), Signal (upval), NotificationsOrchestratorModule (upval), FreeTrialTopBarChip (upval), submitNotification (upval), FIntFreeTrialUpsellTimerSecsModule (upval), DelayedThread (upval), Count (upval), FFlagFreeTrialChipBuyAnimationModule (upval), Signal2_2 (upval), chipImage (upval), Signal2_1 (upval), report (upval), GetInExperienceShopStoreModule (upval), DelayedThread1 (upval), FIntFreeTrialUpsellAutoDismissAfterSecsModule (upval)
				local TrialRedeemThumbnail = InExperienceShopStoreModule.getTrialRedeemThumbnail(p1)
				
				if TrialRedeemThumbnail == nil or TrialRedeemThumbnail == TrialRedeemThumbnail then return end
				TrialRedeemThumbnail = TrialRedeemThumbnail
				local Handle = Signal(false)
				local IsHandleMatch = nil
				
				if Handle == nil then
					IsHandleMatch = false
				else
					local v3 = NotificationsOrchestratorModule.getActiveForSlot(FreeTrialTopBarChip)(false)
					IsHandleMatch = v3 ~= nil and (v3.payload.slot == "FreeTrialTopBarChip" and v3.handle == Handle)
				end
				if IsHandleMatch then return end
				local config = {
					image = TrialRedeemThumbnail.image,
					gamePassId = TrialRedeemThumbnail.gamePassId
				}
				local Active = submitNotification("active", config)
				
				if Active ~= nil and FIntFreeTrialUpsellTimerSecsModule > 0 then
					local DelayedThread = DelayedThread
					
					if DelayedThread ~= nil then
						task.cancel(DelayedThread)
						DelayedThread = nil
					end
					Count += 1
					local Count: number = Count
					DelayedThread = task.delay(FIntFreeTrialUpsellTimerSecsModule, function()
						-- upvalues: DelayedThread (upval), Count (copy), Count (upval), Signal (upval), Active (copy), NotificationsOrchestratorModule (upval), FreeTrialTopBarChip (upval), FFlagFreeTrialChipBuyAnimationModule (upval), Signal2_2 (upval), chipImage (upval), Signal2_1 (upval), report (upval), GetInExperienceShopStoreModule (upval), config (copy), submitNotification (upval), DelayedThread1 (upval), FIntFreeTrialUpsellAutoDismissAfterSecsModule (upval)
						DelayedThread = nil
						
						if Count ~= Count then return end
						if Signal(false) ~= Active then
							local Handle = Signal(false)
							local IsHandleMatch = nil
							
							if Handle == nil then
								IsHandleMatch = false
							else
								local v4 = NotificationsOrchestratorModule.getActiveForSlot(FreeTrialTopBarChip)(false)
								IsHandleMatch = v4 ~= nil and (v4.payload.slot == "FreeTrialTopBarChip" and v4.handle == Handle)
							end
							if IsHandleMatch then return end
						end
						if Signal(false) == Active then
							local Handle = Signal(false)
							local IsHandleMatch = nil
							
							if Handle == nil then
								IsHandleMatch = false
							else
								local v5 = NotificationsOrchestratorModule.getActiveForSlot(FreeTrialTopBarChip)(false)
								IsHandleMatch = v5 ~= nil and (v5.payload.slot == "FreeTrialTopBarChip" and v5.handle == Handle)
							end
							if IsHandleMatch then
								if FFlagFreeTrialChipBuyAnimationModule then
									Signal2_2(chipImage(false))
									Signal2_1(true)
								end
								report({ type = "dismissed", reason = "timeout" })
							end
						end
						GetInExperienceShopStoreModule(false).currentlyOwnsGamePass(config.gamePassId):andThen(function(Result)
							-- upvalues: Count (upval), Count (upval), FFlagFreeTrialChipBuyAnimationModule (upval), Signal2_1 (upval), config (upval), submitNotification (upval), DelayedThread1 (upval), FIntFreeTrialUpsellAutoDismissAfterSecsModule (upval), Signal (upval), NotificationsOrchestratorModule (upval), FreeTrialTopBarChip (upval), report (upval)
							if Count ~= Count then return end
							if not Result then
								local Upsell = submitNotification("upsell", config)
								
								if Upsell ~= nil then
									local DelayedThread = DelayedThread1
									
									if DelayedThread ~= nil then
										task.cancel(DelayedThread)
										DelayedThread1 = nil
									end
									if FIntFreeTrialUpsellAutoDismissAfterSecsModule > 0 then
										DelayedThread1 = task.delay(FIntFreeTrialUpsellAutoDismissAfterSecsModule, function()
											-- upvalues: DelayedThread1 (upval), Signal (upval), Upsell (copy), NotificationsOrchestratorModule (upval), FreeTrialTopBarChip (upval), report (upval)
											DelayedThread1 = nil
											
											if Signal(false) == Upsell then
												local Handle = Signal(false)
												local IsHandleMatch = nil
												
												if Handle == nil then
													IsHandleMatch = false
												else
													local v6 = NotificationsOrchestratorModule.getActiveForSlot(FreeTrialTopBarChip)(false)
													IsHandleMatch = v6 ~= nil and (v6.payload.slot == "FreeTrialTopBarChip" and v6.handle == Handle)
												end
												if IsHandleMatch then
													report({ type = "dismissed", reason = "timeout" })
												end
											end
										end)
									end
								end
								if FFlagFreeTrialChipBuyAnimationModule then
									Signal2_1(false)
								end
								return
							elseif FFlagFreeTrialChipBuyAnimationModule then
								Signal2_1(false)
							end
						end):catch(function()
							-- upvalues: Count (upval), Count (upval), config (upval), submitNotification (upval), DelayedThread1 (upval), FIntFreeTrialUpsellAutoDismissAfterSecsModule (upval), Signal (upval), NotificationsOrchestratorModule (upval), FreeTrialTopBarChip (upval), report (upval), FFlagFreeTrialChipBuyAnimationModule (upval), Signal2_1 (upval)
							if Count ~= Count then return end
							local Upsell = submitNotification("upsell", config)
							
							if Upsell ~= nil then
								local DelayedThread = DelayedThread1
								
								if DelayedThread ~= nil then
									task.cancel(DelayedThread)
									DelayedThread1 = nil
								end
								if FIntFreeTrialUpsellAutoDismissAfterSecsModule > 0 then
									DelayedThread1 = task.delay(FIntFreeTrialUpsellAutoDismissAfterSecsModule, function()
										-- upvalues: DelayedThread1 (upval), Signal (upval), Upsell (copy), NotificationsOrchestratorModule (upval), FreeTrialTopBarChip (upval), report (upval)
										DelayedThread1 = nil
										
										if Signal(false) == Upsell then
											local Handle = Signal(false)
											local IsHandleMatch = nil
											
											if Handle == nil then
												IsHandleMatch = false
											else
												local v6 = NotificationsOrchestratorModule.getActiveForSlot(FreeTrialTopBarChip)(false)
												IsHandleMatch = v6 ~= nil and (v6.payload.slot == "FreeTrialTopBarChip" and v6.handle == Handle)
											end
											if IsHandleMatch then
												report({ type = "dismissed", reason = "timeout" })
											end
										end
									end)
								end
							end
							if FFlagFreeTrialChipBuyAnimationModule then
								Signal2_1(false)
							end
						end)
					end)
				end
			end)
		end
		return isChipShowing
	end
}))