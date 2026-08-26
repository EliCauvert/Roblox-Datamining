local reactGlobalsModule = require(script.Parent.Parent.ReactGlobals)
local describeError = require(script.Parent["ErrorHandling.roblox"]).describeError

return function(p1, _, p2, p3, ...)
	-- upvalues: reactGlobalsModule (ref), describeError (ref)
	local var1
	local _ = nil
	local var2 = nil
	
	if reactGlobalsModule.__YOLO__ then
		var1 = true
		
		if p3 == nil then
			p2(...)
		else
			p2(p3, ...)
		end
	elseif p3 == nil then
		local ok, status = xpcall(p2, describeError, ...)
		var1 = ok
		var2 = status
	else
		local ok, status = xpcall(p2, describeError, p3, ...)
		var1 = ok
		var2 = status
	end
	if not var1 then
		p1.onError(var2)
	end
end