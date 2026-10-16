local _ = require(script.Parent.Parent.language.ast)
local Kind = require(script.Parent.Parent.language.kinds).Kind

return {
	getOperationAST = function(p1, p2) --[[ Line: 21 ]]
		-- upvalues: Kind (copy)
		local v1 = nil
		
		for _, definition in pairs(p1.definitions) do
			if definition.kind == Kind.OPERATION_DEFINITION then
				if p2 == nil then
					if v1 then
						return nil
					end
					v1 = definition
				elseif definition.name and definition.name.value == p2 then
					return definition
				end
			end
		end
		return v1
	end
}