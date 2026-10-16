return function(p1, p2) --[[ Line: 3 | Named "devAssert" ]]
	if _G.__DEV__ == true then
		assert(p1, p2)
	end
end