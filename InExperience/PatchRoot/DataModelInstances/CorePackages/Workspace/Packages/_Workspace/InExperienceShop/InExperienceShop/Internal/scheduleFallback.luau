return function(p0, p1)
	local function guardedCallback()
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
	game.Loaded:Once(function()
		-- upvalues: p0 (ref), guardedCallback (ref)
		task.delay(p0, guardedCallback)
	end)
end