return function(p1, p2)
	task.delay(p1, function()
		-- upvalues: p2 (ref)
		if game:IsLoaded() then
			p2()
			
			return
		end
	end)
end