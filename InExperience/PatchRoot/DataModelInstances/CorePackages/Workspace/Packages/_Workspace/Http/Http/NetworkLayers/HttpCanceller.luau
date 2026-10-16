local Count = 0

return {
	currentSession = function() --[[ Line: 5 ]]
		-- upvalues: Count (ref)
		return Count
	end,
	cancel = function() --[[ Line: 9 ]]
		-- upvalues: Count (ref)
		Count += 1
	end
}