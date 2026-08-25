local reactModule = require(script:FindFirstAncestor("SduiCoreSystem").Parent.React)
local var1 = 0

local function _()
	-- upvalues: var1 (write)
	var1 += 1
	
	return tostring(var1)
end

return function()
	-- upvalues: reactModule (ref), var1 (write)
	local var2 = reactModule.useRef(nil)
	
	if var2.current == nil then
		var1 += 1
		var2.current = tostring(var1)
	end
	return var2
end