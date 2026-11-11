local IsBadgeDetailsSheetOpen = false

return {
	getIsBadgeDetailsSheetOpen = function()
		-- upvalues: IsBadgeDetailsSheetOpen (ref)
		return IsBadgeDetailsSheetOpen
	end,
	setIsBadgeDetailsSheetOpen = function(Value)
		-- upvalues: IsBadgeDetailsSheetOpen (ref)
		IsBadgeDetailsSheetOpen = Value
	end
}