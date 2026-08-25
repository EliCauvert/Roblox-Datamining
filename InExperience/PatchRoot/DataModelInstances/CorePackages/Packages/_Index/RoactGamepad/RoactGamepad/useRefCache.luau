local reactModule = require(script.Parent.Parent.React)
local createRefCacheModule = require(script.Parent.createRefCache)

return function()
	-- upvalues: reactModule (ref), createRefCacheModule (ref)
	local var2 = reactModule.useRef(nil)
	
	if var2.current == nil then
		var2.current = createRefCacheModule()
	end
	return var2.current
end