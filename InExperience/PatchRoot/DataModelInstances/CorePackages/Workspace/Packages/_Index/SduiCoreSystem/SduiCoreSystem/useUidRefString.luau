local reactModule = require(script:FindFirstAncestor("SduiCoreSystem").Parent.React)
local var1 = 0

local function _() --[[ line: 8 | named "getNextUidKey" ]]
	-- upvalues: var1 (write)
	var1 += 1
	
	return tostring(var1)
end

return function() --[[ line: 13 | named "useUidRefString" ]]
	-- upvalues: reactModule (ref), var1 (write)
	local var2 = reactModule.useRef(nil)
	
	if var2.current == nil then
		var1 += 1
		var2.current = tostring(var1)
	end
	return var2
end