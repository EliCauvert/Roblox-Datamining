local CheckAndSendEventModule = require(script.Parent.Parent.Utils.checkAndSendEvent)

return function(p1, State, Field, Origin)
	-- upvalues: CheckAndSendEventModule (copy)
	local t = {}
	
	if State then
		t.state = State
	end
	if Field then
		t.field = Field
	end
	if Origin then
		t.origin = Origin
	end
	CheckAndSendEventModule(p1, "authModalShown", t)
end