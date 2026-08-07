return function(p0, p1) --[[ line: 1 | named "formatTextWithParams" ]]
	if p1 ~= nil then
		for i, v in pairs(p1) do
			p0 = string.gsub(p0, ("{%s}"):format(i), function() --[[ line: 5 ]]
				-- upvalues: v (ref)
				return v
			end)
		end
	end
	return p0
end