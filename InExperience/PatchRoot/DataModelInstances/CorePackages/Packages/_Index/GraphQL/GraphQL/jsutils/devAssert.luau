return {
	devAssert = function(p1, p2)
		if not p1 then
			error(p2, 2)
		end
	end
}