return function(Delay, Callback)
	local function guardedCallback()
		-- upvalues: Callback (copy)
		if game:IsLoaded() then
			Callback()
			
			return
		end
	end
	
	if game:IsLoaded() then
		task.delay(Delay, guardedCallback)
		
		return
	else
		game.Loaded:Once(function()
			-- upvalues: Delay (copy), guardedCallback (copy)
			task.delay(Delay, guardedCallback)
		end)
	end
end