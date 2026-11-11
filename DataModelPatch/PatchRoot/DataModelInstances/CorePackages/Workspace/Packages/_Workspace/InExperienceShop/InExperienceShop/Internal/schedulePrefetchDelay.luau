return function(Delay, Callback)
	task.delay(Delay, function()
		-- upvalues: Callback (copy)
		if game:IsLoaded() then
			Callback()
			
			return
		end
	end)
end