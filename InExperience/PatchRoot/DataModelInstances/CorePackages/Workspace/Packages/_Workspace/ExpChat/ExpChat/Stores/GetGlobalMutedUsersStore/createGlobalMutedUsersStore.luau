local createSignal = require(script:FindFirstAncestor("ExpChat").Parent.Signals).createSignal

return function() --[[ line: 29 ]]
	-- upvalues: createSignal (ref)
	local var0, var1 = createSignal({})
	local var2, var3 = createSignal({})
	local var4, var5 = createSignal({})
	
	return {
		getMutedGlobalUsernames = var0,
		getMutedGlobalDisplayNames = var2,
		getMutedGlobalUserIds = var4,
		muteGlobalUsername = function(p0) --[[ line: 34 ]]
			-- upvalues: var0 (ref), var1 (ref)
			local cloned = table.clone(var0(false))
			cloned[string.lower(p0)] = true
			var1(cloned)
		end,
		unmuteGlobalUsername = function(p1) --[[ line: 41 ]]
			-- upvalues: var0 (ref), var1 (ref)
			local cloned = table.clone(var0(false))
			cloned[string.lower(p1)] = nil
			var1(cloned)
		end,
		muteGlobalDisplayName = function(p2) --[[ line: 48 ]]
			-- upvalues: var2 (ref), var3 (ref)
			local cloned = table.clone(var2(false))
			cloned[string.lower(p2)] = true
			var3(cloned)
		end,
		unmuteGlobalDisplayName = function(p3) --[[ line: 55 ]]
			-- upvalues: var2 (ref), var3 (ref)
			local cloned = table.clone(var2(false))
			cloned[string.lower(p3)] = nil
			var3(cloned)
		end,
		isUsernameMuted = function(p4) --[[ line: 62 ]]
			-- upvalues: var0 (ref)
			return var0(false)[string.lower(p4)] == true
		end,
		isDisplayNameMuted = function(p5) --[[ line: 66 ]]
			-- upvalues: var2 (ref)
			return var2(false)[string.lower(p5)] == true
		end,
		muteGlobalUserId = function(p6) --[[ line: 70 ]]
			-- upvalues: var4 (ref), var5 (ref)
			local cloned = table.clone(var4(false))
			cloned[tostring(p6)] = true
			var5(cloned)
		end,
		unmuteGlobalUserId = function(p7) --[[ line: 77 ]]
			-- upvalues: var4 (ref), var5 (ref)
			local cloned = table.clone(var4(false))
			cloned[tostring(p7)] = nil
			var5(cloned)
		end,
		isUserIdMuted = function(p8) --[[ line: 84 ]]
			-- upvalues: var4 (ref)
			return var4(false)[tostring(p8)] == true
		end
	}
end