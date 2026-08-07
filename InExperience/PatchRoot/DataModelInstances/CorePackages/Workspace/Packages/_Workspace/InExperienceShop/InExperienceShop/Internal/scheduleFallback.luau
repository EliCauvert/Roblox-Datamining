return function(p0, p1) --[[ line: 7 | named "scheduleFallback" ]]
	local function guardedCallback() --[[ line: 11 ]]
		-- upvalues: p1 (ref)
		if game:IsLoaded() then
			p1()
			
			return
		end
	end
	
	if game:IsLoaded() then
		task.delay(p0, guardedCallback)
		
		return
	end
	game.Loaded:Once(function() --[[ line: 26 ]]
		-- upvalues: p0 (ref), guardedCallback (ref)
		task.delay(p0, guardedCallback)
	end)
end