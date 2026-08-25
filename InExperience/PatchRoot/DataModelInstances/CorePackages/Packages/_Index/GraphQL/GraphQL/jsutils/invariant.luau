return {
	invariant = function(p0, p1)
		if not p0 then
			error(p1 or "Unexpected invariant triggered.")
		end
	end
}