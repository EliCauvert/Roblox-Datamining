return function(p0, p1)
	if p1 ~= nil then
		for i, v in pairs(p1) do
			p0 = string.gsub(p0, ("{%s}"):format(i), function()
				-- upvalues: v (ref)
				return v
			end)
		end
	end
	return p0
end