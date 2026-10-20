local Parent = script:FindFirstAncestor("VoiceChat").Parent
local PromiseModule = require(Parent.Promise)
local SignalsModule = require(Parent.Signals)

return function(p1)
	-- upvalues: SignalsModule (copy), PromiseModule (copy)
	local Normal, Normal2 = SignalsModule.createSignal("normal")
	local Count = 0
	local Flag = false
	local Promise = nil
	local v1 = nil
	local Flag1 = false
	local DelayedThread = nil
	
	local function _()
		-- upvalues: DelayedThread (ref)
		if DelayedThread then
			task.cancel(DelayedThread)
			DelayedThread = nil
		end
	end
	
	local _ = function()
		-- upvalues: Flag (ref), DelayedThread (ref), Count (ref), Normal2 (copy)
		if Flag then return end
		if DelayedThread then
			task.cancel(DelayedThread)
			DelayedThread = nil
		end
		Count += 1
		Normal2("hiddenUntilRejoin")
	end
	
	local function scheduleExpiry(Settings)
		-- upvalues: DelayedThread (ref), Flag (ref), Count (ref), Normal2 (copy)
		if DelayedThread then
			task.cancel(DelayedThread)
			DelayedThread = nil
		end
		local BannedUntil = Settings.bannedUntil
		
		if not BannedUntil then return end
		local SecondsDelta = BannedUntil.Seconds - DateTime.now().UnixTimestamp
		
		if SecondsDelta > 0 then
			DelayedThread = task.delay(SecondsDelta, function()
				-- upvalues: DelayedThread (upval), Flag (upval), Count (upval), Normal2 (upval)
				DelayedThread = nil
				
				if Flag then return end
				if DelayedThread then
					task.cancel(DelayedThread)
					DelayedThread = nil
				end
				Count += 1
				Normal2("hiddenUntilRejoin")
			end)
			
			return
		end
	end
	
	local function updateRestrictionPresentation(p2, Settings, Callback)
		-- upvalues: p1 (copy), DelayedThread (ref), Normal2 (copy), scheduleExpiry (copy), Flag1 (ref)
		local Settings1 = Settings
		
		if not Settings1 or Settings1.banReason == nil then
			Settings1 = p1.getSettings()
		end
		if not Callback() then return end
		if not Settings1 then
			p1.onError("SettingsUnavailable")
			
			return
		end
		if Settings1.isBanned then
			Normal2("restricted")
			scheduleExpiry(Settings1)
			local InformedOfBan = p2 == "gameJoin" and p1.getInformedOfBan()
			
			if not Callback() then return end
			if InformedOfBan == false then
				p1.showRestriction(Settings1, p2, Callback)
				
				return
			end
			if Flag1 then
				p1.showRestriction(Settings1, "mic", Callback)
				
				return
			end
			if InformedOfBan == nil then
				p1.onError("InformedOfBanUnavailable")
			end
			return
		else
			if p2 ~= "mic" then
				p1.onError("PlayerModeratedBadState")
				
				return
			end
			if DelayedThread then
				task.cancel(DelayedThread)
				DelayedThread = nil
			end
			Normal2("hiddenUntilRejoin")
		end
	end
	
	return {
		getPresentationState = Normal,
		refresh = function(p2, p3)
			-- upvalues: Flag (ref), PromiseModule (upval), DelayedThread (ref), Count (ref), Normal2 (copy), Promise (ref), v1 (ref), Flag1 (ref), updateRestrictionPresentation (copy), p1 (copy)
			if Flag then
				return PromiseModule.resolve()
			end
			if p2 == "expiry" then
				if not Flag then
					if DelayedThread then
						task.cancel(DelayedThread)
						DelayedThread = nil
					end
					Count += 1
					Normal2("hiddenUntilRejoin")
				end
				return PromiseModule.resolve()
			elseif p2 == "mic" and Promise then
				if v1 == "gameJoin" then
					Flag1 = true
				end
				return Promise
			else
				if (p2 == "gameJoin" or p2 == "realtime") and DelayedThread then
					task.cancel(DelayedThread)
					DelayedThread = nil
				end
				Flag1 = false
				Count += 1
				local Count1: number = Count
				
				local function isCurrent(): boolean
					-- upvalues: Flag (upval), Count (upval), Count1 (copy)
					return not Flag and Count == Count1
				end
				
				if p2 ~= "mic" then
					Normal2("restricted")
				end
				local Promise1 = PromiseModule.defer(function(Callback: () -> ())
					-- upvalues: updateRestrictionPresentation (upval), p2 (copy), p3 (copy), isCurrent (copy)
					updateRestrictionPresentation(p2, p3, isCurrent)
					Callback()
				end):catch(function()
					-- upvalues: Flag (upval), Count (upval), Count1 (copy), p1 (upval)
					if not Flag and Count == Count1 then
						p1.onError("RestrictionRequestFailed")
					end
				end)
				Promise = Promise1
				v1 = p2
				Promise1:finally(function()
					-- upvalues: Promise (upval), Promise1 (copy), v1 (upval), Flag1 (upval)
					if Promise == Promise1 then
						Promise = nil
						v1 = nil
						Flag1 = false
					end
				end)
				
				return Promise1
			end
		end,
		dispose = function()
			-- upvalues: Flag (ref), Count (ref), Promise (ref), v1 (ref), Flag1 (ref), DelayedThread (ref), Normal2 (copy)
			Flag = true
			Count += 1
			
			if Promise then
				Promise:cancel()
				Promise = nil
				v1 = nil
				Flag1 = false
			end
			if DelayedThread then
				task.cancel(DelayedThread)
				DelayedThread = nil
			end
			Normal2("normal")
		end
	}
end