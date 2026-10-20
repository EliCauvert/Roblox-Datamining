return function(Callback, p1)
	local CurrentTime = 0
	
	return function(...)
		-- upvalues: CurrentTime (ref), p1 (copy), Callback (copy)
		local list = { ... }
		local CurrentTime1 = time()
		CurrentTime = CurrentTime1
		delay(p1, function()
			-- upvalues: CurrentTime (upval), CurrentTime1 (copy), Callback (upval), list (copy)
			if CurrentTime == CurrentTime1 then
				Callback(unpack(list))
			end
		end)
	end
end