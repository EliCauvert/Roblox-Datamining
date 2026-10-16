return function(p1, Key, Callback) --[[ Line: 13 | Named "getOrSet" ]]
	if p1[Key] == nil then
		p1[Key] = Callback(p1, Key)
	end
	return p1[Key]
end