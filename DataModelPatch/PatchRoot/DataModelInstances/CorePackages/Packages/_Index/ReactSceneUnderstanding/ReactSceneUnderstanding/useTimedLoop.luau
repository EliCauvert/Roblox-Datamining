local UseEffectFunction = require(script:FindFirstAncestor("ReactSceneUnderstanding").Parent.React).useEffect

return function(Duration, Callback)
	-- upvalues: UseEffectFunction (copy)
	UseEffectFunction(function()
		-- upvalues: Duration (copy), Callback (copy)
		local Flag = true
		task.spawn(function()
			-- upvalues: Flag (ref), Duration (upval), Callback (upval)
			while Flag do
				task.wait(Duration)
				
				if not Flag then break end
				Callback()
			end
		end)
		
		return function()
			-- upvalues: Flag (ref)
			Flag = false
		end
	end, { Duration, Callback })
end