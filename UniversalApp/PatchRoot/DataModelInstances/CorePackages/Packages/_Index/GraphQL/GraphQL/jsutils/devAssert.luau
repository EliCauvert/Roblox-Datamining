return {
	devAssert = function(p0, p1) --[[ line: 9 ]]
		if not p0 then
			error(p1, 2)
		end
	end
}