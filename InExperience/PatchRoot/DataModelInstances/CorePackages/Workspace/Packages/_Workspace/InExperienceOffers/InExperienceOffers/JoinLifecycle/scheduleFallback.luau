return function(p1, p2)
	local function guardedCallback()
		-- upvalues: p2 (ref)
		if game:IsLoaded() then
			p2()
			
			return
		end
	end
	
	if game:IsLoaded() then
		task.delay(p1, guardedCallback)
		
		return
	end
	game.Loaded:Once(function()
		-- upvalues: p1 (ref), guardedCallback (ref)
		task.delay(p1, guardedCallback)
	end)
end