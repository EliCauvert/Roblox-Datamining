local Count = 0

return {
	currentSession = function() --[[ Line: 5 ]]
		-- upvalues: Count (ref)
		return Count
	end,
	startNewSession = function() --[[ Line: 9 ]]
		-- upvalues: Count (ref)
		Count += 1
	end
}