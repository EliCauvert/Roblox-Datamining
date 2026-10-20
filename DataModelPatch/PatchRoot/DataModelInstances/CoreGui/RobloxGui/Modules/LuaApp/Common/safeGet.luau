local function safeGet(p1, p2, ...)
	-- upvalues: safeGet (copy)
	return if p2 then if type(p1) == "table" then safeGet(p1[p2], ...) else nil else p1
end

return safeGet