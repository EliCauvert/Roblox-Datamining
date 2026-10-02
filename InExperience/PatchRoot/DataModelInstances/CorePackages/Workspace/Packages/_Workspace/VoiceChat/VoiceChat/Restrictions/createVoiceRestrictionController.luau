local parent = script:FindFirstAncestor("VoiceChat").Parent
local promiseModule = require(parent.Promise)
local signalsModule = require(parent.Signals)

return function(p1)
	-- upvalues: signalsModule (ref), promiseModule (ref)
	local normal, normal_1 = signalsModule.createSignal("normal")
	local var1 = 0
	local var2 = false
	local var3 = nil
	local var4 = nil
	local var5 = false
	local var6 = nil
	
	local function _()
		-- upvalues: var6 (write)
		if var6 then
			task.cancel(var6)
			var6 = nil
		end
	end
	
	local _ = function()
		-- upvalues: var2 (write), var6 (write), var1 (write), normal_1 (ref)
		if var2 then return end
		if var6 then
			task.cancel(var6)
			var6 = nil
		end
		var1 += 1
		normal_1("hiddenUntilRejoin")
	end
	
	local function scheduleExpiry(p2)
		-- upvalues: var6 (write), var2 (write), var1 (write), normal_1 (ref)
		if var6 then
			task.cancel(var6)
			var6 = nil
		end
		local bannedUntil = p2.bannedUntil
		
		if not bannedUntil then return end
		local var7 = bannedUntil.Seconds - DateTime.now().UnixTimestamp
		
		if var7 <= 0 then
			return
		end
		var6 = task.delay(var7, function()
			-- upvalues: var6 (copy), var2 (copy), var1 (copy), normal_1 (copy)
			var6 = nil
			
			if var2 then
				return
			end
			var1 += 1
			normal_1("hiddenUntilRejoin")
		end)
	end
	
	local function updateRestrictionPresentation(p2, p3, p4)
		-- upvalues: p1 (ref), var6 (write), normal_1 (ref), scheduleExpiry (ref), var5 (write)
		local var7 = p3
		
		if not var7 or var7.banReason == nil then
			var7 = p1.getSettings()
		end
		if not p4() then return end
		if not var7 then
			p1.onError("SettingsUnavailable")
			
			return
		elseif var7.isBanned then
			normal_1("restricted")
			scheduleExpiry(var7)
			local var8 = p2 == "gameJoin" and p1.getInformedOfBan()
			
			if not p4() then return end
			if var8 == false then
				p1.showRestriction(var7, p2, p4)
				
				return
			elseif var5 then
				p1.showRestriction(var7, "mic", p4)
				
				return
			elseif var8 == nil then
				p1.onError("InformedOfBanUnavailable")
			end
			return
		elseif p2 == "mic" then
			if var6 then
				task.cancel(var6)
				var6 = nil
			end
			normal_1("hiddenUntilRejoin")
			
			return
		else
			p1.onError("PlayerModeratedBadState")
		end
	end
	
	return {
		getPresentationState = normal,
		refresh = function(p2, p3)
			-- upvalues: var2 (write), promiseModule (copy), var6 (write), var1 (write), normal_1 (ref), var3 (write), var4 (write), var5 (write), updateRestrictionPresentation (ref), p1 (ref)
			if var2 then
				return promiseModule.resolve()
			elseif p2 == "expiry" then
				if not var2 then
					if var6 then
						task.cancel(var6)
						var6 = nil
					end
					var1 += 1
					normal_1("hiddenUntilRejoin")
				end
				return promiseModule.resolve()
			elseif p2 == "mic" and var3 then
				if var4 == "gameJoin" then
					var5 = true
				end
				return var3
			elseif (p2 == "gameJoin" or p2 == "realtime") and var6 then
				task.cancel(var6)
				var6 = nil
			end
			var5 = false
			var1 += 1
			local var7 = var1
			
			local function isCurrent()
				-- upvalues: var2 (copy), var1 (copy), var7 (ref)
				return not var2 and var1 == var7
			end
			
			if p2 ~= "mic" then
				normal_1("restricted")
			end
			local var8 = promiseModule.defer(function(p4)
				-- upvalues: updateRestrictionPresentation (copy), p2 (ref), p3 (ref), isCurrent (ref)
				updateRestrictionPresentation(p2, p3, isCurrent)
				p4()
			end):catch(function()
				-- upvalues: var2 (copy), var1 (copy), var7 (ref), p1 (copy)
				if not var2 and var1 == var7 then
					p1.onError("RestrictionRequestFailed")
				end
			end)
			var3 = var8
			var4 = p2
			var8:finally(function()
				-- upvalues: var3 (copy), var8 (ref), var4 (copy), var5 (copy)
				if var3 == var8 then
					var3 = nil
					var4 = nil
					var5 = false
				end
			end)
			
			return var8
		end,
		dispose = function()
			-- upvalues: var2 (write), var1 (write), var3 (write), var4 (write), var5 (write), var6 (write), normal_1 (ref)
			var2 = true
			var1 += 1
			
			if var3 then
				var3:cancel()
				var3 = nil
				var4 = nil
				var5 = false
			end
			if var6 then
				task.cancel(var6)
				var6 = nil
			end
			normal_1("normal")
		end
	}
end