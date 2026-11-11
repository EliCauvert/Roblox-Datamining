local CheckAndSendEventModule = require(script.Parent.Parent.Utils.checkAndSendEvent)

return function(p1, State, Field, ErrorCode)
	-- upvalues: CheckAndSendEventModule (copy)
	local t = {}
	
	if State then
		t.state = State
	end
	if Field then
		t.field = Field
	end
	if ErrorCode then
		t.errorCode = ErrorCode
	end
	CheckAndSendEventModule(p1, "authMsgShown", t)
end