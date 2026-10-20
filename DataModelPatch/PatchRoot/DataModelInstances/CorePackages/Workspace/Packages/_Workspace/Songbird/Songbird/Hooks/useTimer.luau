local Songbird = script:FindFirstAncestor("Songbird")
local CryoModule = require(Songbird.Parent.Cryo)
local UseEffectFunction = require(Songbird.Parent.React).useEffect

return function(Duration, Callback, p1)
	-- upvalues: UseEffectFunction (copy), CryoModule (copy)
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
	end, CryoModule.Dictionary.join({ Duration, Callback }, p1 or {}))
end