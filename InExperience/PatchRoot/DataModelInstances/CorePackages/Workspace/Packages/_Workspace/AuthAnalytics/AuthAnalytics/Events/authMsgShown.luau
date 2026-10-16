local CheckAndSendEventModule = require(script.Parent.Parent.Utils.checkAndSendEvent)

return function(p1, State, Field, ErrorCode, AssociatedText) --[[ Line: 4 ]]
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
	if AssociatedText then
		t.associatedText = AssociatedText
	end
	CheckAndSendEventModule(p1, "authMsgShown", t)
end