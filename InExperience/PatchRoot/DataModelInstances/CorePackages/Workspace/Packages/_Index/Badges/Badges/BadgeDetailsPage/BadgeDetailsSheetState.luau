local IsBadgeDetailsSheetOpen = false

return {
	getIsBadgeDetailsSheetOpen = function() --[[ Line: 3 ]]
		-- upvalues: IsBadgeDetailsSheetOpen (ref)
		return IsBadgeDetailsSheetOpen
	end,
	setIsBadgeDetailsSheetOpen = function(Value) --[[ Line: 7 ]]
		-- upvalues: IsBadgeDetailsSheetOpen (ref)
		IsBadgeDetailsSheetOpen = Value
	end
}