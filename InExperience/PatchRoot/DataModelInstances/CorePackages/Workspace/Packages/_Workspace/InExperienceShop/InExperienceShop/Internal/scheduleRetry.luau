return function(p0, p1) --[[ line: 4 | named "scheduleRetry" ]]
	task.delay(p0, function() --[[ line: 5 | named "guardedCallback" ]]
		-- upvalues: p1 (ref)
		if game:IsLoaded() then
			p1()
			
			return
		end
	end)
end