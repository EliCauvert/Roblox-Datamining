local UseEffectFunction = require(script:FindFirstAncestor("ReactSceneUnderstanding").Parent.React).useEffect

return function(Duration, Callback) --[[ Line: 7 | Named "useTimedLoop" ]]
	-- upvalues: UseEffectFunction (copy)
	UseEffectFunction(function() --[[ Line: 8 ]]
		-- upvalues: Duration (copy), Callback (copy)
		local Flag = true
		task.spawn(function() --[[ Line: 11 ]]
			-- upvalues: Flag (ref), Duration (upval), Callback (upval)
			while Flag do
				task.wait(Duration)
				
				if not Flag then break end
				Callback()
			end
		end)
		
		return function() --[[ Line: 23 ]]
			-- upvalues: Flag (ref)
			Flag = false
		end
	end, { Duration, Callback })
end