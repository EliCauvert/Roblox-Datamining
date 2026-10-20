local t = {}

return {
	hasSeenOfferId = function(p1): boolean
		-- upvalues: t (ref)
		return t[p1] == true
	end,
	addOfferId = function(Key)
		-- upvalues: t (ref)
		t[Key] = true
	end,
	clearOfferIds = function()
		-- upvalues: t (ref)
		t = {}
	end
}