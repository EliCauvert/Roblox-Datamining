local t = {}

return {
	GameSortLoadSourceType = { API = "API", ClientFallbackCache = "ClientFallbackCache" },
	setSortLoadSource = function(Key, p1)
		-- upvalues: t (copy)
		if p1 then
			t[Key] = p1
			
			return
		else
			t[Key] = nil
		end
	end,
	getSortLoadSource = function(p1)
		-- upvalues: t (copy)
		return t[p1]
	end
}