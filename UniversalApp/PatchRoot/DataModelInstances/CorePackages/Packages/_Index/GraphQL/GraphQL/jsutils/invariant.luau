return {
	invariant = function(p1, p2)
		if not p1 then
			error(p2 or "Unexpected invariant triggered.")
		end
	end
}