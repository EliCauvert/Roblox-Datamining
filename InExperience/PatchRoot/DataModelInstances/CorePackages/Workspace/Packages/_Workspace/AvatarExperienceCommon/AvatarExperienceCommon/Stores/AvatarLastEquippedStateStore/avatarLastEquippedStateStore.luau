local var1 = nil
local var2 = false
local var3 = true

return {
	getAvatarLastEquippedState = function()
		-- upvalues: var1 (write)
		return var1
	end,
	setAvatarLastEquippedState = function(p1)
		-- upvalues: var1 (write)
		var1 = p1
	end,
	getChangedLayeredMakeupSorting = function()
		-- upvalues: var2 (write)
		return var2
	end,
	setChangedLayeredMakeupSorting = function(p1)
		-- upvalues: var2 (write)
		var2 = p1
	end,
	getShouldRevertLastEquippedState = function()
		-- upvalues: var3 (write)
		return var3
	end,
	setShouldRevertLastEquippedState = function(p1)
		-- upvalues: var3 (write)
		var3 = p1
	end
}