local t = {}

return function(Key, Callback: () -> ())
	-- upvalues: t (copy)
	if not t[Key] then
		t[Key] = true
		Callback()
		
		return
	end
end