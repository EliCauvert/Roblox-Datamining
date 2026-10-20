local ReactModule = require(script.Parent.Parent.React)
local CreateRefCacheModule = require(script.Parent.createRefCache)

return function()
	-- upvalues: ReactModule (copy), CreateRefCacheModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	
	if UseRefResult.current == nil then
		UseRefResult.current = CreateRefCacheModule()
	end
	return UseRefResult.current
end