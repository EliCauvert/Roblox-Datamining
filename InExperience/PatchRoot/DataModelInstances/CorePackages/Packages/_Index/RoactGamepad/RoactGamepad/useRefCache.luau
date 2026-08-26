local reactModule = require(script.Parent.Parent.React)
local createRefCacheModule = require(script.Parent.createRefCache)

return function()
	-- upvalues: reactModule (ref), createRefCacheModule (ref)
	local var1 = reactModule.useRef(nil)
	
	if var1.current == nil then
		var1.current = createRefCacheModule()
	end
	return var1.current
end