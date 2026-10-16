return function(Delay, Callback) --[[ Line: 7 | Named "scheduleFallback" ]]
	local function guardedCallback() --[[ Line: 11 ]]
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
		game.Loaded:Once(function() --[[ Line: 26 ]]
			-- upvalues: Delay (copy), guardedCallback (copy)
			task.delay(Delay, guardedCallback)
		end)
	end
end