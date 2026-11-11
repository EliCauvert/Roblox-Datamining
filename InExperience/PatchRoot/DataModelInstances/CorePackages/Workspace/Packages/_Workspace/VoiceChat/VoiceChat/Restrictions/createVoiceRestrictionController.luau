local VoiceChat = script:FindFirstAncestor("VoiceChat")
local Parent = VoiceChat.Parent
local PromiseModule = require(Parent.Promise)
local SignalsModule = require(Parent.Signals)
local FIntVoiceRestrictionExpiryGraceSecondsModule = require(VoiceChat.Flags.FIntVoiceRestrictionExpiryGraceSeconds)
local config = {
	UNACKNOWLEDGED_UNEXPIRED = 8,
	ACKNOWLEDGED_UNEXPIRED = 9,
	UNACKNOWLEDGED_EXPIRED = 10
}

local function _(p1): boolean
	return p1 == 8 or (p1 == 9 or p1 == 10)
end

local _ = function(p1): boolean
	return p1 == 8 or p1 == 10
end

local _ = function(p1): boolean
	return p1 == "gameJoin" or (p1 == "expiry" or p1 == "acknowledgement")
end

return function(p1)
	-- upvalues: SignalsModule (copy), FIntVoiceRestrictionExpiryGraceSecondsModule (copy), config (copy), PromiseModule (copy)
	local Normal, Normal2 = SignalsModule.createSignal("normal")
	local GetNowFunction = p1.getNow
	local Flag = false
	local v1 = nil
	local DelayedThread = nil
	local Flag1 = false
	local Flag2 = false
	local Check = nil
	
	local function _(p2): boolean
		-- upvalues: GetNowFunction (copy)
		local BannedUntil = p2.bannedUntil
		
		return BannedUntil ~= nil and BannedUntil.Seconds <= GetNowFunction()
	end
	
	local _ = function()
		-- upvalues: Flag2 (ref), DelayedThread (ref)
		Flag2 = false
		
		if DelayedThread then
			task.cancel(DelayedThread)
			DelayedThread = nil
		end
	end
	
	local _ = function()
		-- upvalues: Flag2 (ref), DelayedThread (ref), Flag1 (ref), Normal2 (copy)
		Flag2 = false
		
		if DelayedThread then
			task.cancel(DelayedThread)
			DelayedThread = nil
		end
		Flag1 = false
		Normal2("hiddenUntilRejoin")
	end
	
	local _ = function(p2)
		-- upvalues: Flag2 (ref), DelayedThread (ref), GetNowFunction (copy), Check (ref)
		Flag2 = false
		
		if DelayedThread then
			task.cancel(DelayedThread)
			DelayedThread = nil
		end
		DelayedThread = task.delay(math.max(p2 - GetNowFunction(), 0), function()
			-- upvalues: DelayedThread (upval), Flag2 (upval), Check (upval)
			DelayedThread = nil
			Flag2 = false
			Check("expiry")
		end)
	end
	
	local _ = function(p2)
		-- upvalues: FIntVoiceRestrictionExpiryGraceSecondsModule (upval), Flag2 (ref), DelayedThread (ref), GetNowFunction (copy), Check (ref)
		if p2 then
			local NewFIntVoiceRestrictionExpiryGraceSecondsModule = p2 + FIntVoiceRestrictionExpiryGraceSecondsModule
			Flag2 = false
			
			if DelayedThread then
				task.cancel(DelayedThread)
				DelayedThread = nil
			end
			DelayedThread = task.delay(math.max(NewFIntVoiceRestrictionExpiryGraceSecondsModule - GetNowFunction(), 0), function()
				-- upvalues: DelayedThread (upval), Flag2 (upval), Check (upval)
				DelayedThread = nil
				Flag2 = false
				Check("expiry")
			end)
			
			return
		else
			Flag2 = false
			
			if DelayedThread then
				task.cancel(DelayedThread)
				DelayedThread = nil
			end
		end
	end
	
	local _ = function(p2)
		-- upvalues: Normal (copy), Flag1 (ref), GetNowFunction (copy), Check (ref)
		return function()
			-- upvalues: Normal (upval), Flag1 (upval), p2 (copy), GetNowFunction (upval), Check (upval)
			if Normal(false) ~= "restricted" or Flag1 then return end
			local BannedUntil = p2.bannedUntil
			
			if not BannedUntil or BannedUntil.Seconds <= GetNowFunction() then
				Check("acknowledgement")
			end
		end
	end
	
	local _ = function(p2, p3)
		-- upvalues: p1 (copy), Normal (copy), Flag1 (ref), GetNowFunction (copy), Check (ref)
		p1.showUFRRestriction(p2, p3, function()
			-- upvalues: Normal (upval), Flag1 (upval), p2 (copy), GetNowFunction (upval), Check (upval)
			if Normal(false) ~= "restricted" or Flag1 then return end
			local BannedUntil = p2.bannedUntil
			
			if not BannedUntil or BannedUntil.Seconds <= GetNowFunction() then
				Check("acknowledgement")
			end
		end)
	end
	
	local _ = function(p2, p3)
		-- upvalues: Flag2 (ref), DelayedThread (ref), Flag1 (ref), Normal2 (copy), p1 (copy)
		if p2 ~= "expiry" and p2 ~= "acknowledgement" then
			p1.onError(p3)
			
			return
		end
		Flag2 = false
		
		if DelayedThread then
			task.cancel(DelayedThread)
			DelayedThread = nil
		end
		Flag1 = false
		Normal2("hiddenUntilRejoin")
	end
	
	local function showDialogIfUnseen(p2, p3, Callback)
		-- upvalues: config (upval), p1 (copy), Normal (copy), Flag1 (ref), GetNowFunction (copy), Check (ref)
		local Trigger = p2.trigger
		local BanReason = p3.banReason
		local IsBanReasonMatch: boolean = BanReason == config.UNACKNOWLEDGED_UNEXPIRED or (BanReason == config.ACKNOWLEDGED_UNEXPIRED or BanReason == config.UNACKNOWLEDGED_EXPIRED)
		local Enabled = nil
		
		if IsBanReasonMatch and Trigger == "removedFromVoice" then
			Enabled = true
		elseif Trigger == "gameJoin" or (Trigger == "expiry" or Trigger == "acknowledgement") then
			if IsBanReasonMatch then
				Enabled = p3.banReason == 9
			else
				Enabled = p1.getInformedOfBan()
				
				if not Callback() then return end
			end
		else
			Enabled = false
		end
		local v2: string? = nil
		
		if Enabled == false then
			v2 = Trigger
		elseif p2.micTapped then
			v2 = "micTap"
		else
			if Enabled == nil then
				p1.onError("InformedOfBanUnavailable")
				
				return
			end
			return
		end
		if IsBanReasonMatch then
			p1.showUFRRestriction(p3, v2, function()
				-- upvalues: Normal (upval), Flag1 (upval), p3 (copy), GetNowFunction (upval), Check (upval)
				if Normal(false) ~= "restricted" or Flag1 then return end
				local BannedUntil = p3.bannedUntil
				
				if not BannedUntil or BannedUntil.Seconds <= GetNowFunction() then
					Check("acknowledgement")
				end
			end)
			
			return
		else
			p1.showLegacyRestriction(p3, v2, Callback)
		end
	end
	
	local function handleEndedRestriction(p2, p3)
		-- upvalues: config (upval), GetNowFunction (copy), FIntVoiceRestrictionExpiryGraceSecondsModule (upval), Flag2 (ref), DelayedThread (ref), Check (ref), p1 (copy), Normal (copy), Flag1 (ref), Normal2 (copy)
		local Trigger = p2.trigger
		local BanReason = p3.banReason
		local IsBanReasonMatch: boolean = BanReason == config.UNACKNOWLEDGED_UNEXPIRED or (BanReason == config.ACKNOWLEDGED_UNEXPIRED or BanReason == config.UNACKNOWLEDGED_EXPIRED)
		
		if Trigger == "removedFromVoice" then
			local NewNow = GetNowFunction() + FIntVoiceRestrictionExpiryGraceSecondsModule
			Flag2 = false
			
			if DelayedThread then
				task.cancel(DelayedThread)
				DelayedThread = nil
			end
			DelayedThread = task.delay(math.max(NewNow - GetNowFunction(), 0), function()
				-- upvalues: DelayedThread (upval), Flag2 (upval), Check (upval)
				DelayedThread = nil
				Flag2 = false
				Check("expiry")
			end)
			Flag2 = true
		end
		if not Flag2 then
			Flag2 = false
			
			if DelayedThread then
				task.cancel(DelayedThread)
				DelayedThread = nil
			end
			Flag1 = false
			Normal2("hiddenUntilRejoin")
			local BanReason1 = p3.banReason
			
			if (BanReason1 == config.UNACKNOWLEDGED_UNEXPIRED or BanReason1 == config.UNACKNOWLEDGED_EXPIRED) and Trigger ~= "acknowledgement" then
				p1.showUFRRestriction(p3, Trigger, function()
					-- upvalues: Normal (upval), Flag1 (upval), p3 (copy), GetNowFunction (upval), Check (upval)
					if Normal(false) ~= "restricted" or Flag1 then return end
					local BannedUntil = p3.bannedUntil
					
					if not BannedUntil or BannedUntil.Seconds <= GetNowFunction() then
						Check("acknowledgement")
					end
				end)
			end
			return
		elseif IsBanReasonMatch and (Trigger == "micTap" or p2.micTapped) then
			p1.showUFRRestriction(p3, "micTap", function()
				-- upvalues: Normal (upval), Flag1 (upval), p3 (copy), GetNowFunction (upval), Check (upval)
				if Normal(false) ~= "restricted" or Flag1 then return end
				local BannedUntil = p3.bannedUntil
				
				if not BannedUntil or BannedUntil.Seconds <= GetNowFunction() then
					Check("acknowledgement")
				end
			end)
		end
	end
	
	local function runCheck(p2, p3)
		-- upvalues: v1 (ref), p1 (copy), Flag2 (ref), DelayedThread (ref), Flag1 (ref), Normal2 (copy), GetNowFunction (copy), FIntVoiceRestrictionExpiryGraceSecondsModule (upval), Check (ref), showDialogIfUnseen (copy), Normal (copy), handleEndedRestriction (copy)
		local function isCurrent(): boolean
			-- upvalues: v1 (upval), p2 (copy)
			return v1 == p2
		end
		
		local Trigger = p2.trigger
		local P17 = p3 or p1.getSettings()
		
		if v1 ~= p2 then return end
		if P17 then
			if P17.isBanned then
				local BannedUntil = P17.bannedUntil
				
				if BannedUntil == nil or BannedUntil.Seconds > GetNowFunction() then
					Flag1 = false
					Normal2("restricted")
					local Seconds = if P17.bannedUntil then P17.bannedUntil.Seconds else nil
					
					if Seconds then
						local NewSeconds = Seconds + FIntVoiceRestrictionExpiryGraceSecondsModule
						Flag2 = false
						
						if DelayedThread then
							task.cancel(DelayedThread)
							DelayedThread = nil
						end
						DelayedThread = task.delay(math.max(NewSeconds - GetNowFunction(), 0), function()
							-- upvalues: DelayedThread (upval), Flag2 (upval), Check (upval)
							DelayedThread = nil
							Flag2 = false
							Check("expiry")
						end)
					else
						Flag2 = false
						
						if DelayedThread then
							task.cancel(DelayedThread)
							DelayedThread = nil
						end
					end
					showDialogIfUnseen(p2, P17, isCurrent)
					
					return
				end
			end
			if not Flag1 then
				if P17.isBanned or P17.banReason == 10 then
					handleEndedRestriction(p2, P17)
					
					return
				end
				if Trigger == "gameJoin" or Trigger == "removedFromVoice" then
					p1.onError("PlayerModeratedBadState")
					
					return
				end
				Flag2 = false
				
				if DelayedThread then
					task.cancel(DelayedThread)
					DelayedThread = nil
				end
				Flag1 = false
				Normal2("hiddenUntilRejoin")
				
				return
			elseif Trigger == "micTap" or p2.micTapped then
				p1.showUFRRestriction(P17, "micTap", function()
					-- upvalues: Normal (upval), Flag1 (upval), P17 (copy), GetNowFunction (upval), Check (upval)
					if Normal(false) ~= "restricted" or Flag1 then return end
					local BannedUntil = P17.bannedUntil
					
					if not BannedUntil or BannedUntil.Seconds <= GetNowFunction() then
						Check("acknowledgement")
					end
				end)
			end
			return
		else
			if Trigger ~= "expiry" and Trigger ~= "acknowledgement" then
				p1.onError("SettingsUnavailable")
				
				return
			end
			Flag2 = false
			
			if DelayedThread then
				task.cancel(DelayedThread)
				DelayedThread = nil
			end
			Flag1 = false
			Normal2("hiddenUntilRejoin")
		end
	end
	
	Check = function(Trigger, p2)
		-- upvalues: Flag (ref), PromiseModule (upval), v1 (ref), Flag1 (ref), Flag2 (ref), DelayedThread (ref), GetNowFunction (copy), Normal2 (copy), runCheck (copy), p1 (copy)
		if Flag then
			return PromiseModule.resolve()
		end
		local v2 = v1
		
		if Trigger == "micTap" and v2 and v2.promise then
			v2.micTapped = true
			
			return v2.promise
		end
		if Trigger == "gameJoin" or Trigger == "removedFromVoice" and not Flag1 then
			Flag2 = false
			
			if DelayedThread then
				task.cancel(DelayedThread)
				DelayedThread = nil
			end
		end
		if Trigger == "gameJoin" or Trigger == "expiry" then
			Flag1 = false
		end
		local config = { micTapped = false, trigger = Trigger }
		v1 = config
		local v3 = if p2 and p2.banReason ~= nil then p2 else nil
		local IsBanned = false
		
		if Trigger == "gameJoin" then
			IsBanned = false
			
			if v3 ~= nil then
				IsBanned = v3.isBanned
				
				if IsBanned then
					local BannedUntil = v3.bannedUntil
					IsBanned = BannedUntil ~= nil and BannedUntil.Seconds <= GetNowFunction()
				end
			end
		end
		if Trigger ~= "micTap" and not IsBanned then
			Normal2("restricted")
		end
		local Promise = PromiseModule.defer(function(Callback: () -> ())
			-- upvalues: runCheck (upval), config (copy), v3 (copy)
			runCheck(config, v3)
			Callback()
		end):catch(function()
			-- upvalues: v1 (upval), config (copy), Trigger (copy), Flag2 (upval), DelayedThread (upval), Flag1 (upval), Normal2 (upval), p1 (upval)
			if v1 == config then
				if Trigger == "expiry" or Trigger == "acknowledgement" then
					Flag2 = false
					
					if DelayedThread then
						task.cancel(DelayedThread)
						DelayedThread = nil
					end
					Flag1 = false
					Normal2("hiddenUntilRejoin")
					
					return
				else
					p1.onError("RestrictionRequestFailed")
				end
			end
		end)
		config.promise = Promise
		Promise:finally(function()
			-- upvalues: config (copy)
			config.promise = nil
		end)
		
		return Promise
	end
	
	return {
		getPresentationState = Normal,
		check = Check,
		applyUFRTimeout = function(p2)
			-- upvalues: Flag (ref), v1 (ref), Flag1 (ref), Normal2 (copy), FIntVoiceRestrictionExpiryGraceSecondsModule (upval), Flag2 (ref), DelayedThread (ref), GetNowFunction (copy), Check (ref)
			if Flag then return end
			v1 = nil
			Flag1 = true
			Normal2("restricted")
			
			if p2 then
				local NewFIntVoiceRestrictionExpiryGraceSecondsModule = p2 + FIntVoiceRestrictionExpiryGraceSecondsModule
				Flag2 = false
				
				if DelayedThread then
					task.cancel(DelayedThread)
					DelayedThread = nil
				end
				DelayedThread = task.delay(math.max(NewFIntVoiceRestrictionExpiryGraceSecondsModule - GetNowFunction(), 0), function()
					-- upvalues: DelayedThread (upval), Flag2 (upval), Check (upval)
					DelayedThread = nil
					Flag2 = false
					Check("expiry")
				end)
				
				return
			else
				Flag2 = false
				
				if DelayedThread then
					task.cancel(DelayedThread)
					DelayedThread = nil
				end
			end
		end,
		showPendingAcknowledgement = function(p2)
			-- upvalues: Flag (ref), Normal (copy), v1 (ref), Flag1 (ref), p1 (copy), GetNowFunction (copy), Check (ref)
			if Flag or p2.isBanned or p2.banReason ~= 10 then return end
			if Normal(false) == "normal" and not v1 and not Flag1 then
				p1.showUFRRestriction(p2, "gameJoin", function()
					-- upvalues: Normal (upval), Flag1 (upval), p2 (copy), GetNowFunction (upval), Check (upval)
					if Normal(false) ~= "restricted" or Flag1 then return end
					local BannedUntil = p2.bannedUntil
					
					if not BannedUntil or BannedUntil.Seconds <= GetNowFunction() then
						Check("acknowledgement")
					end
				end)
				
				return
			end
		end,
		dispose = function()
			-- upvalues: Flag (ref), v1 (ref), Flag2 (ref), DelayedThread (ref), Normal2 (copy)
			Flag = true
			
			if v1 and v1.promise then
				v1.promise:cancel()
			end
			v1 = nil
			Flag2 = false
			
			if DelayedThread then
				task.cancel(DelayedThread)
				DelayedThread = nil
			end
			Normal2("normal")
		end
	}
end