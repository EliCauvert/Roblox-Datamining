local songbird = script:FindFirstAncestor("Songbird")
local cryoModule = require(songbird.Parent.Cryo)
local useEffect = require(songbird.Parent.React).useEffect

return function(value, p0, p1) --[[ line: 8 | named "useTimer" ]]
	-- upvalues: useEffect (ref), cryoModule (ref)
	useEffect(function() --[[ line: 9 ]]
		-- upvalues: value (ref), p0 (ref)
		local var2 = true
		task.spawn(function() --[[ line: 12 ]]
			-- upvalues: var2 (write), value (copy), p0 (copy)
			while var2 do
				task.wait(value)
				
				if not var2 then break end
				p0()
			end
		end)
		
		return function() --[[ line: 24 ]]
			-- upvalues: var2 (write)
			var2 = false
		end
	end, cryoModule.Dictionary.join({ value, p0 }, p1 or {}))
end