local ReactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)

return function(p1) --[[ Line: 9 | Named "useTypedQueryBinding" ]]
	-- upvalues: ReactModule (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(p1 or "")
	local UseRefResult = ReactModule.useRef({})
	ReactModule.useEffect(function() --[[ Line: 13 ]]
		-- upvalues: p1 (copy), UseRefResult (copy), UseBindingResult (copy), UseBindingResult2 (copy)
		local P0 = p1 or ""
		local Current = UseRefResult.current
		local FoundIndex: number? = table.find(Current, P0)
		
		if FoundIndex == nil then
			table.clear(Current)
			
			if UseBindingResult:getValue() ~= P0 then
				UseBindingResult2(P0)
			end
			return
		else
			for _ = 1, FoundIndex do
				table.remove(Current, 1)
			end
		end
	end, { p1 })
	
	return UseBindingResult, (ReactModule.useCallback(function(p2) --[[ Line: 29 ]]
		-- upvalues: UseRefResult (copy), UseBindingResult2 (copy)
		table.insert(UseRefResult.current, p2)
		UseBindingResult2(p2)
	end, { UseBindingResult2 }))
end