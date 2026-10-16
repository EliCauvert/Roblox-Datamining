local t = {}

return function(Key, Callback: () -> ()) --[[ Line: 3 ]]
	-- upvalues: t (copy)
	if not t[Key] then
		t[Key] = true
		Callback()
		
		return
	end
end