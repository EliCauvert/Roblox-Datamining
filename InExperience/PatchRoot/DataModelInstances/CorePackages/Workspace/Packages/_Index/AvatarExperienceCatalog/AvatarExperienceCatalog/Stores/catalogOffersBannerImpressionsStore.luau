local t = {}

return {
	hasSeenOfferId = function(p1)
		-- upvalues: t (write)
		return t[p1] == true
	end,
	addOfferId = function(p1)
		-- upvalues: t (write)
		t[p1] = true
	end,
	clearOfferIds = function()
		-- upvalues: t (write)
		t = {}
	end
}