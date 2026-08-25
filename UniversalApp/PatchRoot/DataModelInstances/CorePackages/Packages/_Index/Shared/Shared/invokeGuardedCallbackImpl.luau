local reactGlobalsModule = require(script.Parent.Parent.ReactGlobals)
local describeError = require(script.Parent["ErrorHandling.roblox"]).describeError

return function(p0, _, p1, p2, ...)
	-- upvalues: reactGlobalsModule (ref), describeError (ref)
	local var2
	local _ = nil
	local var1 = nil
	
	if reactGlobalsModule.__YOLO__ then
		var2 = true
		
		if p2 == nil then
			p1(...)
		else
			p1(p2, ...)
		end
	elseif p2 == nil then
		local ok, status = xpcall(p1, describeError, ...)
		var2 = ok
		var1 = status
	else
		local ok, status = xpcall(p1, describeError, p2, ...)
		var2 = ok
		var1 = status
	end
	if not var2 then
		p0.onError(var1)
	end
end