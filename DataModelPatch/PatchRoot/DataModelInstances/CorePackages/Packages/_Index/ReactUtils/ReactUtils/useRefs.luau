local ReactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)

return function(Current: number, Current1)
	-- upvalues: ReactModule (copy)
	local UseRefResult = ReactModule.useRef({})
	local UseRefResult1 = ReactModule.useRef(Current)
	
	if #UseRefResult.current < Current then
		for _ = 1, Current - #UseRefResult.current do
			local Ref = ReactModule.createRef()
			Ref.current = Current1
			table.insert(UseRefResult.current, Ref)
		end
	elseif Current < UseRefResult1.current then
		for i = Current + 1, UseRefResult1.current do
			UseRefResult.current[i].current = Current1
		end
	end
	UseRefResult1.current = Current
	
	return (ReactModule.useMemo(function()
		-- upvalues: UseRefResult (copy), Current (copy)
		return table.move(UseRefResult.current, 1, Current, 1, {})
	end, { Current }))
end