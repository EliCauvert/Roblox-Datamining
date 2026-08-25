return function(p0, p1)
	if _G.__DEV__ == true then
		assert(p0, p1)
	end
end