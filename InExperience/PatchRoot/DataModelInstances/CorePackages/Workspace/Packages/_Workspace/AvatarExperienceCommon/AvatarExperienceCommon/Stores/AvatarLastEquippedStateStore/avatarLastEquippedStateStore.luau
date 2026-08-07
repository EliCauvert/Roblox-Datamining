local var0 = nil
local var1 = false
local var2 = true

return {
	getAvatarLastEquippedState = function() --[[ line: 25 ]]
		-- upvalues: var0 (write)
		return var0
	end,
	setAvatarLastEquippedState = function(p0) --[[ line: 29 ]]
		-- upvalues: var0 (write)
		var0 = p0
	end,
	getChangedLayeredMakeupSorting = function() --[[ line: 33 ]]
		-- upvalues: var1 (write)
		return var1
	end,
	setChangedLayeredMakeupSorting = function(p1) --[[ line: 37 ]]
		-- upvalues: var1 (write)
		var1 = p1
	end,
	getShouldRevertLastEquippedState = function() --[[ line: 41 ]]
		-- upvalues: var2 (write)
		return var2
	end,
	setShouldRevertLastEquippedState = function(p2) --[[ line: 45 ]]
		-- upvalues: var2 (write)
		var2 = p2
	end
}