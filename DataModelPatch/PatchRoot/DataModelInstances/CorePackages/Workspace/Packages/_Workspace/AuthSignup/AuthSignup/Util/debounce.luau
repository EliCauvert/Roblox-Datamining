return function(Callback, Delay)
	local CurrentTime = 0
	
	return function(...)
		-- upvalues: CurrentTime (ref), Delay (copy), Callback (copy)
		local list = { ... }
		local CurrentTime1 = time()
		CurrentTime = CurrentTime1
		task.delay(Delay, function()
			-- upvalues: CurrentTime (upval), CurrentTime1 (copy), Callback (upval), list (copy)
			if CurrentTime == CurrentTime1 then
				Callback(unpack(list))
			end
		end)
	end
end