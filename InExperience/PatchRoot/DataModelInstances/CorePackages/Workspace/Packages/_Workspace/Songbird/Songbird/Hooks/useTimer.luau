local Songbird = script:FindFirstAncestor("Songbird")
local CryoModule = require(Songbird.Parent.Cryo)
local UseEffectFunction = require(Songbird.Parent.React).useEffect

return function(Duration, Callback, p1) --[[ Line: 8 | Named "useTimer" ]]
	-- upvalues: UseEffectFunction (copy), CryoModule (copy)
	UseEffectFunction(function() --[[ Line: 9 ]]
		-- upvalues: Duration (copy), Callback (copy)
		local Flag = true
		task.spawn(function() --[[ Line: 12 ]]
			-- upvalues: Flag (ref), Duration (upval), Callback (upval)
			while Flag do
				task.wait(Duration)
				
				if not Flag then break end
				Callback()
			end
		end)
		
		return function() --[[ Line: 24 ]]
			-- upvalues: Flag (ref)
			Flag = false
		end
	end, CryoModule.Dictionary.join({ Duration, Callback }, p1 or {}))
end