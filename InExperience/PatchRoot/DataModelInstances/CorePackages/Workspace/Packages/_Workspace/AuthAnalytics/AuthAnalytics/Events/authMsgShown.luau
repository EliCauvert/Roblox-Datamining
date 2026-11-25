local Parent = script.Parent.Parent
local CheckAndSendEventModule = require(Parent.Utils.checkAndSendEvent)
local FFlagLuaAppSsoLinkCandidateModule = require(Parent.Flags.FFlagLuaAppSsoLinkCandidate)

return function(p1, State, Field, ErrorCode, AssociatedText, Origin)
	-- upvalues: FFlagLuaAppSsoLinkCandidateModule (copy), CheckAndSendEventModule (copy)
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
	if FFlagLuaAppSsoLinkCandidateModule and Origin then
		t.origin = Origin
	end
	CheckAndSendEventModule(p1, "authMsgShown", t)
end