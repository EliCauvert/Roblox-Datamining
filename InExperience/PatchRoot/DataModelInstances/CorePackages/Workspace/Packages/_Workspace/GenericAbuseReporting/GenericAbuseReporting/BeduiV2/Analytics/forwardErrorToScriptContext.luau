return function(p0, p1)
	task.spawn(function()
		-- upvalues: p1 (ref), p0 (ref)
		error(tostring(p0) .. "\n" .. (p1 or ""), 0)
	end)
end