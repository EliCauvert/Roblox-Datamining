local useEffect = require(script:FindFirstAncestor("ReactSceneUnderstanding").Parent.React).useEffect

return function(value, p0)
	-- upvalues: useEffect (ref)
	useEffect(function()
		-- upvalues: value (ref), p0 (ref)
		local var0 = true
		task.spawn(function()
			-- upvalues: var0 (write), value (copy), p0 (copy)
			while var0 do
				task.wait(value)
				
				if not var0 then break end
				p0()
			end
		end)
		
		return function()
			-- upvalues: var0 (write)
			var0 = false
		end
	end, { value, p0 })
end