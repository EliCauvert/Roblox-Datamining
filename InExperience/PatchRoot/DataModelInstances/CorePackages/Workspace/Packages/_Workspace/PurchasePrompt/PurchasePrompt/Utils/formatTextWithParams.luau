return function(p1, p2)
	if p2 ~= nil then
		for i, v in pairs(p2) do
			p1 = string.gsub(p1, ("{%s}"):format(i), function()
				-- upvalues: v (ref)
				return v
			end)
		end
	end
	return p1
end