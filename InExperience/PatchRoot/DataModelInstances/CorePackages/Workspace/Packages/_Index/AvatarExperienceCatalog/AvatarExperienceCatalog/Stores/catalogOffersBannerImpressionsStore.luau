local t = {}

return {
	hasSeenOfferId = function(p1): boolean --[[ Line: 3 ]]
		-- upvalues: t (ref)
		return t[p1] == true
	end,
	addOfferId = function(Key) --[[ Line: 7 ]]
		-- upvalues: t (ref)
		t[Key] = true
	end,
	clearOfferIds = function() --[[ Line: 11 ]]
		-- upvalues: t (ref)
		t = {}
	end
}