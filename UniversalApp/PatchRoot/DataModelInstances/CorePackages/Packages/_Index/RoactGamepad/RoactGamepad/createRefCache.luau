local RoactModule = require(script.Parent.Parent.Roact)

return function() --[[ Line: 10 | Named "createRefCache" ]]
	-- upvalues: RoactModule (copy)
	local Refs = {}
	setmetatable(Refs, {
		__index = function(_, Key) --[[ Line: 14 ]]
			-- upvalues: RoactModule (upval), Refs (copy)
			local Ref = RoactModule.createRef()
			Refs[Key] = Ref
			
			return Ref
		end,
		__tostring = function(List): string --[[ Line: 20 ]]
			local Message = "{"
			
			for i, value in pairs(List) do
				Message = ("%s\n\t%s -> %s"):format(Message, tostring(i), (tostring(value)))
			end
			return Message .. "\n}"
		end
	})
	
	return Refs
end