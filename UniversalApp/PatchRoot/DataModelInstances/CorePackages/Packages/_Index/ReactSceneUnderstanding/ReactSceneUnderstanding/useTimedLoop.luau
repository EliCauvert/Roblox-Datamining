local useEffect = require(script:FindFirstAncestor("ReactSceneUnderstanding").Parent.React).useEffect

return function(value, p1)
	-- upvalues: useEffect (ref)
	useEffect(function()
		-- upvalues: value (ref), p1 (ref)
		local var1 = true
		task.spawn(function()
			-- upvalues: var1 (write), value (copy), p1 (copy)
			while var1 do
				task.wait(value)
				
				if not var1 then break end
				p1()
			end
		end)
		
		return function()
			-- upvalues: var1 (write)
			var1 = false
		end
	end, { value, p1 })
end