local prettyPrintModule = require(script.Parent.prettyPrint)
local t = { outputFunction = print }

function t.middleware(p1, p2)
	-- upvalues: t (ref), prettyPrintModule (ref)
	return function(p3)
		-- upvalues: p1 (ref), t (copy), prettyPrintModule (copy), p2 (ref)
		local var1 = p1(p3)
		t.outputFunction(("Action dispatched: %s\nState changed to: %s"):format(prettyPrintModule(p3), prettyPrintModule(p2:getState())))
		
		return var1
	end
end

return t