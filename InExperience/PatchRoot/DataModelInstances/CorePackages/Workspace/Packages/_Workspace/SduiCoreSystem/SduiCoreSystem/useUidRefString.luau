local ReactModule = require(script:FindFirstAncestor("SduiCoreSystem").Parent.React)
local Count = 0

local function _(): string
	-- upvalues: Count (ref)
	Count += 1
	
	return (tostring(Count))
end

return function()
	-- upvalues: ReactModule (copy), Count (ref)
	local UseRefResult = ReactModule.useRef(nil)
	
	if UseRefResult.current == nil then
		Count += 1
		UseRefResult.current = tostring(Count)
	end
	return UseRefResult
end