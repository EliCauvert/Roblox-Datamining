local Count = 0

return {
	currentSession = function()
		-- upvalues: Count (ref)
		return Count
	end,
	cancelAll = function()
		-- upvalues: Count (ref)
		Count += 1
	end
}