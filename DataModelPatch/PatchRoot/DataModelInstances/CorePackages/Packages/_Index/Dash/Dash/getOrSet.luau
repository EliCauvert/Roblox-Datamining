return function(p1, Key, Callback)
	if p1[Key] == nil then
		p1[Key] = Callback(p1, Key)
	end
	return p1[Key]
end