return function(p1, p2)
	task.spawn(function()
		-- upvalues: p2 (ref), p1 (ref)
		error(tostring(p1) .. "\n" .. (p2 or ""), 0)
	end)
end