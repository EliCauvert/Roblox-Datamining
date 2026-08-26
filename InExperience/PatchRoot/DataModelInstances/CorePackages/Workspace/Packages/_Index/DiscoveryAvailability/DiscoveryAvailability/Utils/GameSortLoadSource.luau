local t = {}

return {
	GameSortLoadSourceType = { API = "API", ClientFallbackCache = "ClientFallbackCache" },
	setSortLoadSource = function(value, p1)
		-- upvalues: t (ref)
		if p1 then
			t[value] = p1
			
			return
		end
		t[value] = nil
	end,
	getSortLoadSource = function(p1)
		-- upvalues: t (ref)
		return t[p1]
	end
}