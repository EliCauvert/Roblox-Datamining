local var1 = false

return {
	getIsBadgeDetailsSheetOpen = function()
		-- upvalues: var1 (write)
		return var1
	end,
	setIsBadgeDetailsSheetOpen = function(value)
		-- upvalues: var1 (write)
		var1 = value
	end
}