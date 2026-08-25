local checkAndSendEventModule = require(script.Parent.Parent.Utils.checkAndSendEvent)

return function(p0, p1, p2, p3)
	-- upvalues: checkAndSendEventModule (ref)
	local t = {}
	
	if p1 then
		t.state = p1
	end
	if p2 then
		t.field = p2
	end
	if p3 then
		t.errorCode = p3
	end
	checkAndSendEventModule(p0, "authMsgShown", t)
end