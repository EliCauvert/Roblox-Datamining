local checkAndSendEventModule = require(script.Parent.Parent.Utils.checkAndSendEvent)

return function(p1, p2, p3, p4)
	-- upvalues: checkAndSendEventModule (ref)
	local t = {}
	
	if p2 then
		t.state = p2
	end
	if p3 then
		t.field = p3
	end
	if p4 then
		t.errorCode = p4
	end
	checkAndSendEventModule(p1, "authMsgShown", t)
end