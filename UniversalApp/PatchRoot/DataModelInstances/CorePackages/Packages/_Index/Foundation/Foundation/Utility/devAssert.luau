return function(p1, p2)
	if _G.__DEV__ == true then
		assert(p1, p2)
	end
end