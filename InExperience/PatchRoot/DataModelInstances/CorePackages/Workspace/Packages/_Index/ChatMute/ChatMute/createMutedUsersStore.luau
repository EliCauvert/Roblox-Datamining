local createSignal = require(script:FindFirstAncestor("ChatMute").Parent.Signals).createSignal

return function()
	-- upvalues: createSignal (ref)
	local var1, var2 = createSignal({})
	local var3, var4 = createSignal({})
	local var5, var6 = createSignal({})
	
	return {
		getMutedUsernames = var1,
		getMutedDisplayNames = var3,
		getMutedUserIds = var5,
		muteGlobalUsername = function(p1)
			-- upvalues: var1 (ref), var2 (ref)
			local cloned = table.clone(var1(false))
			cloned[string.lower(p1)] = true
			var2(cloned)
		end,
		unmuteGlobalUsername = function(p1)
			-- upvalues: var1 (ref), var2 (ref)
			local cloned = table.clone(var1(false))
			cloned[string.lower(p1)] = nil
			var2(cloned)
		end,
		muteGlobalDisplayName = function(p1)
			-- upvalues: var3 (ref), var4 (ref)
			local cloned = table.clone(var3(false))
			cloned[string.lower(p1)] = true
			var4(cloned)
		end,
		unmuteGlobalDisplayName = function(p1)
			-- upvalues: var3 (ref), var4 (ref)
			local cloned = table.clone(var3(false))
			cloned[string.lower(p1)] = nil
			var4(cloned)
		end,
		isUsernameMuted = function(p1)
			-- upvalues: var1 (ref)
			return var1(false)[string.lower(p1)] == true
		end,
		isDisplayNameMuted = function(p1)
			-- upvalues: var3 (ref)
			return var3(false)[string.lower(p1)] == true
		end,
		muteGlobalUserId = function(p1)
			-- upvalues: var5 (ref), var6 (ref)
			local cloned = table.clone(var5(false))
			cloned[tostring(p1)] = true
			var6(cloned)
		end,
		unmuteGlobalUserId = function(p1)
			-- upvalues: var5 (ref), var6 (ref)
			local cloned = table.clone(var5(false))
			cloned[tostring(p1)] = nil
			var6(cloned)
		end,
		isUserIdMuted = function(p1)
			-- upvalues: var5 (ref)
			return var5(false)[tostring(p1)] == true
		end
	}
end