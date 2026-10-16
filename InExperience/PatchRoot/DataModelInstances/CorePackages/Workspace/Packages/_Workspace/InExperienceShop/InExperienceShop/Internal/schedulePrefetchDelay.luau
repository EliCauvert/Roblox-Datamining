return function(Delay, Callback) --[[ Line: 4 | Named "schedulePrefetchDelay" ]]
	task.delay(Delay, function() --[[ Line: 5 | Named "guardedCallback" ]]
		-- upvalues: Callback (copy)
		if game:IsLoaded() then
			Callback()
			
			return
		end
	end)
end