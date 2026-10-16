return function(List) --[[ Line: 4 ]]
	local self = setmetatable({}, {
		__index = function(p1, Text: string) --[[ Line: 6 ]]
			return (rawget(p1, Text:lower()))
		end,
		__newindex = function(p1, Text: string, p2) --[[ Line: 9 ]]
			rawset(p1, Text:lower(), p2)
		end
	})
	
	for i, value in pairs(List) do
		self[i] = value
	end
	return self
end