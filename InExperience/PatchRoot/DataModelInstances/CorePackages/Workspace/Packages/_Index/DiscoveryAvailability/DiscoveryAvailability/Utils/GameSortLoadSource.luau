local t = {}

return {
	GameSortLoadSourceType = { API = "API", ClientFallbackCache = "ClientFallbackCache" },
	setSortLoadSource = function(value, p0)
		-- upvalues: t (ref)
		if p0 then
			t[value] = p0
			
			return
		end
		t[value] = nil
	end,
	getSortLoadSource = function(p1)
		-- upvalues: t (ref)
		return t[p1]
	end
}