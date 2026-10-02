return function(p1)
	task.spawn(function()
		-- upvalues: p1 (ref)
		error(p1, 0)
	end)
end