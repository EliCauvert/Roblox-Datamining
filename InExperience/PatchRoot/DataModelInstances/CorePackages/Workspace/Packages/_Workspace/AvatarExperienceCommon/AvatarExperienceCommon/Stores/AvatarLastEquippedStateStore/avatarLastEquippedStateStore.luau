local var0 = nil
local var1 = false
local var2 = true

return {
	getAvatarLastEquippedState = function()
		-- upvalues: var0 (write)
		return var0
	end,
	setAvatarLastEquippedState = function(p0)
		-- upvalues: var0 (write)
		var0 = p0
	end,
	getChangedLayeredMakeupSorting = function()
		-- upvalues: var1 (write)
		return var1
	end,
	setChangedLayeredMakeupSorting = function(p1)
		-- upvalues: var1 (write)
		var1 = p1
	end,
	getShouldRevertLastEquippedState = function()
		-- upvalues: var2 (write)
		return var2
	end,
	setShouldRevertLastEquippedState = function(p2)
		-- upvalues: var2 (write)
		var2 = p2
	end
}