return function(p0, p1)
	task.delay(p0, function()
		-- upvalues: p1 (ref)
		if game:IsLoaded() then
			p1()
			
			return
		end
	end)
end