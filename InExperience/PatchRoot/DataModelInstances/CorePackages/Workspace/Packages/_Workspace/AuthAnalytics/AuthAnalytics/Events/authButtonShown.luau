local checkAndSendEventModule = require(script.Parent.Parent.Utils.checkAndSendEvent)

return function(p1, p2, p3, p4)
	-- upvalues: checkAndSendEventModule (ref)
	local t = { btn = p2 }
	
	if p3 then
		t.state = p3
	end
	if p4 then
		t.origin = p4
	end
	checkAndSendEventModule(p1, "authButtonShown", t)
end