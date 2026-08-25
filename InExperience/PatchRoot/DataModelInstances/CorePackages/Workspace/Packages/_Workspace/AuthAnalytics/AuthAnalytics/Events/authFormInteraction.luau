local checkAndSendEventModule = require(script.Parent.Parent.Utils.checkAndSendEvent)

return function(p0, p1, p2, p3, p4)
	-- upvalues: checkAndSendEventModule (ref)
	local t = {}
	
	if p1 then
		t.field = p1
	end
	if p2 then
		t.state = p2
	end
	if p3 then
		t.origin = p3
	end
	if p4 ~= nil then
		t.entered = tostring(p4)
	end
	checkAndSendEventModule(p0, "authFormInteraction", t)
end