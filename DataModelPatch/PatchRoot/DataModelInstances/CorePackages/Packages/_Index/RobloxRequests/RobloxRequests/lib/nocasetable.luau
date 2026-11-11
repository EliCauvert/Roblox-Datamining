return function(List)
	local self = setmetatable({}, {
		__index = function(p1, Text: string)
			return (rawget(p1, Text:lower()))
		end,
		__newindex = function(p1, Text: string, p2)
			rawset(p1, Text:lower(), p2)
		end
	})
	
	for i, value in pairs(List) do
		self[i] = value
	end
	return self
end