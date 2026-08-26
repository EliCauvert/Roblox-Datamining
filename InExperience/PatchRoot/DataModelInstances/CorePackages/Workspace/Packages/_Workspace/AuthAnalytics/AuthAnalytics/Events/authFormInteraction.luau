local checkAndSendEventModule = require(script.Parent.Parent.Utils.checkAndSendEvent)

return function(p1, p2, p3, p4, p5)
	-- upvalues: checkAndSendEventModule (ref)
	local t = {}
	
	if p2 then
		t.field = p2
	end
	if p3 then
		t.state = p3
	end
	if p4 then
		t.origin = p4
	end
	if p5 ~= nil then
		t.entered = tostring(p5)
	end
	checkAndSendEventModule(p1, "authFormInteraction", t)
end