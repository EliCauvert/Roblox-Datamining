local t = {}
t.__index = t

function t:__tostring()
	local t = {}
	
	for i, v in pairs(self) do
		table.insert(t, string.format("%s = %s", tostring(i), tostring(v)))
	end
	table.sort(t)
	
	return "<HttpResponse: " .. table.concat(t, ", ") .. ">"
end

function t.success(p1, p2)
	-- upvalues: t (ref)
	return setmetatable({ responseCode = p1, responseBody = p2 }, t)
end

function t.error(p1)
	-- upvalues: t (ref)
	return setmetatable({ HttpError = p1 }, t)
end

return t