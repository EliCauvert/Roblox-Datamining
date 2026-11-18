local t = {}

return function(Key)
	-- upvalues: t (copy)
	if not t[Key] then
		t[Key] = true
		warn(Key)
	end
end