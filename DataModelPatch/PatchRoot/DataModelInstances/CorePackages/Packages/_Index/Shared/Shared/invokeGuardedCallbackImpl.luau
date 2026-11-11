local ReactGlobalsModule = require(script.Parent.Parent.ReactGlobals)
local DescribeError = require(script.Parent["ErrorHandling.roblox"]).describeError
local _ = ReactGlobalsModule.__DEV__

return function(p1, _, Callback: (any, any) -> (), p2, ...)
	-- upvalues: ReactGlobalsModule (copy), DescribeError (copy)
	local v1 = nil
	local v2 = nil
	
	if ReactGlobalsModule.__YOLO__ then
		v2 = true
		
		if p2 == nil then
			Callback(...)
		else
			Callback(p2, ...)
		end
	elseif p2 == nil then
		v2, v3 = xpcall(Callback, DescribeError, ...)
	else
		v2, v3 = xpcall(Callback, DescribeError, p2, ...)
	end
	if not v2 then
		p1.onError(v1)
	end
end