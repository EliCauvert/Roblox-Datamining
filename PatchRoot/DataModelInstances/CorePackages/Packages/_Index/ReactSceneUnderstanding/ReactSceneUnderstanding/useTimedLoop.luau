-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:30:38 2026 Pacific Standard Time.

local useEffect = require(script:FindFirstAncestor("ReactSceneUnderstanding").Parent.React).useEffect

return function(value, p0) --[[ line: 7 | named "useTimedLoop" ]]
	-- upvalues: useEffect (ref)
	useEffect(function() --[[ line: 8 ]]
		-- upvalues: value (ref), p0 (ref)
		local var0 = true
		task.spawn(function() --[[ line: 11 ]]
			-- upvalues: var0 (write), value (copy), p0 (copy)
			while var0 do
				task.wait(value)
				
				if not var0 then break end
				p0()
			end
		end)
		
		return function() --[[ line: 23 ]]
			-- upvalues: var0 (write)
			var0 = false
		end
	end, { value, p0 })
end