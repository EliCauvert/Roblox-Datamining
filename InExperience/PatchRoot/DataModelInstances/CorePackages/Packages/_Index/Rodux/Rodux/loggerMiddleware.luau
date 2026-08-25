local prettyPrintModule = require(script.Parent.prettyPrint)
local t = { outputFunction = print }

function t.middleware(p0, p1)
	-- upvalues: t (ref), prettyPrintModule (ref)
	return function(p2)
		-- upvalues: p0 (ref), t (copy), prettyPrintModule (copy), p1 (ref)
		local var2 = p0(p2)
		t.outputFunction(("Action dispatched: %s\nState changed to: %s"):format(prettyPrintModule(p2), prettyPrintModule(p1:getState())))
		
		return var2
	end
end

return t