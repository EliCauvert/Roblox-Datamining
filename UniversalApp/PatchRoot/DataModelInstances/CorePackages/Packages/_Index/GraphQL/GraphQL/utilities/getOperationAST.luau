local _ = require(script.Parent.Parent.language.ast)
local kind = require(script.Parent.Parent.language.kinds).Kind

return {
	getOperationAST = function(p0, p1)
		-- upvalues: kind (ref)
		local var0 = nil
		
		for i, v in pairs(p0.definitions) do
			if v.kind == kind.OPERATION_DEFINITION then
				if p1 == nil then
					if not var0 then
						var0 = v
						continue
					end
					return nil
				elseif v.name and v.name.value == p1 then
					return v
				end
			end
		end
		return var0
	end
}