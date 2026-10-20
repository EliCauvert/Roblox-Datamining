local ReactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)

return function()
	-- upvalues: ReactModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	
	if UseRefResult.current == nil then
		local Current = {}
		setmetatable(Current, {
			__index = function(_, Key)
				-- upvalues: ReactModule (upval), Current (copy)
				local Ref = ReactModule.createRef()
				Current[Key] = Ref
				
				return Ref
			end,
			__tostring = function(List): string
				local Message = "{"
				
				for i, value in pairs(List) do
					Message = ("%s\n\t%s -> %s"):format(Message, tostring(i), (tostring(value)))
				end
				return Message .. "\n}"
			end
		})
		UseRefResult.current = Current
	end
	return UseRefResult.current
end