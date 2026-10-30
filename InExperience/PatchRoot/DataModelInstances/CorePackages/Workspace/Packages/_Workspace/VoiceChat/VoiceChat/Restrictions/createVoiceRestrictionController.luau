local Parent = script:FindFirstAncestor("VoiceChat").Parent
local PromiseModule = require(Parent.Promise)
local SignalsModule = require(Parent.Signals)
local config = { UNACKNOWLEDGED = 8, ACKNOWLEDGED = 9 }

local function _(p1): boolean
	return p1 == 8 or p1 == 9
end

local _ = function(p1): boolean
	return p1 == "gameJoin" or (p1 == "expiry" or p1 == "acknowledgement")
end

return function(p1)
	-- upvalues: SignalsModule (copy), config (copy), PromiseModule (copy)
	local Normal, Normal2 = SignalsModule.createSignal("normal")
	local Flag = false
	local v1 = nil
	local DelayedThread = nil
	local Flag1 = false
	local Callback = nil
	
	local function _()
		-- upvalues: DelayedThread (ref)
		if DelayedThread then
			task.cancel(DelayedThread)
			DelayedThread = nil
		end
	end
	
	local _ = function()
		-- upvalues: DelayedThread (ref), Flag1 (ref), Normal2 (copy)
		if DelayedThread then
			task.cancel(DelayedThread)
			DelayedThread = nil
		end
		Flag1 = false
		Normal2("hiddenUntilRejoin")
	end
	
	local function scheduleExpiry(Seconds)
		-- upvalues: DelayedThread (ref), Callback (ref)
		if DelayedThread then
			task.cancel(DelayedThread)
			DelayedThread = nil
		end
		local Delay = if Seconds then Seconds - DateTime.now().UnixTimestamp else 0
		
		if Delay > 0 then
			DelayedThread = task.delay(Delay, function()
				-- upvalues: DelayedThread (upval), Callback (upval)
				DelayedThread = nil
				Callback("expiry")
			end)
		end
	end
	
	local _ = function(p2)
		-- upvalues: Callback (ref)
		return function()
			-- upvalues: p2 (copy), Callback (upval)
			local BannedUntil = p2.bannedUntil
			
			if not BannedUntil or BannedUntil.Seconds <= DateTime.now().UnixTimestamp then
				Callback("acknowledgement")
			end
		end
	end
	
	local _ = function(p2, p3)
		-- upvalues: DelayedThread (ref), Flag1 (ref), Normal2 (copy), p1 (copy)
		if p2 ~= "expiry" and p2 ~= "acknowledgement" then
			p1.onError(p3)
			
			return
		end
		if DelayedThread then
			task.cancel(DelayedThread)
			DelayedThread = nil
		end
		Flag1 = false
		Normal2("hiddenUntilRejoin")
	end
	
	local function showDialogIfUnseen(p2, Settings, Callback1)
		-- upvalues: config (upval), p1 (copy), Callback (ref)
		local Trigger = p2.trigger
		local BanReason = Settings.banReason
		local IsBanReasonMatch: boolean = BanReason == config.UNACKNOWLEDGED or BanReason == config.ACKNOWLEDGED
		local Enabled = nil
		
		if IsBanReasonMatch and Trigger == "removedFromVoice" then
			Enabled = true
		elseif Trigger == "gameJoin" or (Trigger == "expiry" or Trigger == "acknowledgement") then
			if IsBanReasonMatch then
				Enabled = Settings.banReason == 9
			else
				Enabled = p1.getInformedOfBan()
				
				if not Callback1() then return end
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
			p1.showUFRRestriction(Settings, v2, if v2 == "gameJoin" then function()
				-- upvalues: Settings (copy), Callback (upval)
				local BannedUntil = Settings.bannedUntil
				
				if not BannedUntil or BannedUntil.Seconds <= DateTime.now().UnixTimestamp then
					Callback("acknowledgement")
				end
			end else nil)
			
			return
		else
			p1.showLegacyRestriction(Settings, v2, Callback1)
		end
	end
	
	local function runCheck(p2, p3)
		-- upvalues: v1 (ref), p1 (copy), DelayedThread (ref), Flag1 (ref), Normal2 (copy), scheduleExpiry (copy), showDialogIfUnseen (copy)
		local function isCurrent(): boolean
			-- upvalues: v1 (upval), p2 (copy)
			return v1 == p2
		end
		
		local Trigger = p2.trigger
		local Settings = if p3 and p3.banReason ~= nil then p3 else p1.getSettings()
		
		if v1 ~= p2 then return end
		if Settings then
			if Settings.isBanned then
				Normal2("restricted")
				scheduleExpiry(if Settings.bannedUntil then Settings.bannedUntil.Seconds else nil)
				showDialogIfUnseen(p2, Settings, isCurrent)
				
				return
			end
			if not Flag1 then
				if Trigger == "gameJoin" or Trigger == "removedFromVoice" then
					p1.onError("PlayerModeratedBadState")
					
					return
				end
				if DelayedThread then
					task.cancel(DelayedThread)
					DelayedThread = nil
				end
				Flag1 = false
				Normal2("hiddenUntilRejoin")
				
				return
			elseif Trigger == "micTap" or p2.micTapped then
				p1.showUFRRestriction(Settings, "micTap", nil)
			end
			return
		else
			if Trigger ~= "expiry" and Trigger ~= "acknowledgement" then
				p1.onError("SettingsUnavailable")
				
				return
			end
			if DelayedThread then
				task.cancel(DelayedThread)
				DelayedThread = nil
			end
			Flag1 = false
			Normal2("hiddenUntilRejoin")
		end
	end
	
	Callback = function(Trigger, p2)
		-- upvalues: Flag (ref), PromiseModule (upval), v1 (ref), Flag1 (ref), DelayedThread (ref), Normal2 (copy), runCheck (copy), p1 (copy)
		if Flag then
			return PromiseModule.resolve()
		end
		local v2 = v1
		
		if Trigger == "micTap" and v2 and v2.promise then
			v2.micTapped = true
			
			return v2.promise
		end
		if (Trigger == "gameJoin" or Trigger == "removedFromVoice" and not Flag1) and DelayedThread then
			task.cancel(DelayedThread)
			DelayedThread = nil
		end
		if Trigger == "gameJoin" or Trigger == "expiry" then
			Flag1 = false
		end
		local config = { micTapped = false, trigger = Trigger }
		v1 = config
		
		if Trigger ~= "micTap" then
			Normal2("restricted")
		end
		local Promise = PromiseModule.defer(function(Callback: () -> ())
			-- upvalues: runCheck (upval), config (copy), p2 (copy)
			runCheck(config, p2)
			Callback()
		end):catch(function()
			-- upvalues: v1 (upval), config (copy), Trigger (copy), DelayedThread (upval), Flag1 (upval), Normal2 (upval), p1 (upval)
			if v1 == config then
				if Trigger == "expiry" or Trigger == "acknowledgement" then
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
		check = Callback,
		applyUFRTimeout = function(p2)
			-- upvalues: Flag (ref), v1 (ref), Flag1 (ref), Normal2 (copy), scheduleExpiry (copy)
			if not Flag then
				v1 = nil
				Flag1 = true
				Normal2("restricted")
				scheduleExpiry(p2)
				
				return
			end
		end,
		dispose = function()
			-- upvalues: Flag (ref), v1 (ref), DelayedThread (ref), Normal2 (copy)
			Flag = true
			
			if v1 and v1.promise then
				v1.promise:cancel()
			end
			v1 = nil
			
			if DelayedThread then
				task.cancel(DelayedThread)
				DelayedThread = nil
			end
			Normal2("normal")
		end
	}
end