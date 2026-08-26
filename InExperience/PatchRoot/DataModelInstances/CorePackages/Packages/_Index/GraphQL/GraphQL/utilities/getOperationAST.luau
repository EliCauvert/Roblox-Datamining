local _ = require(script.Parent.Parent.language.ast)
local kind = require(script.Parent.Parent.language.kinds).Kind

return {
	getOperationAST = function(p1, p2)
		-- upvalues: kind (ref)
		local var1 = nil
		
		for i, v in pairs(p1.definitions) do
			if v.kind == kind.OPERATION_DEFINITION then
				if p2 == nil then
					if not var1 then
						var1 = v
						continue
					end
					return nil
				elseif v.name and v.name.value == p2 then
					return v
				end
			end
		end
		return var1
	end
}