local CheckAndSendEventModule = require(script.Parent.Parent.Utils.checkAndSendEvent)

return function(p1, Field, State, Origin, p2, AssociatedText)
	-- upvalues: CheckAndSendEventModule (copy)
	local t = {}
	
	if Field then
		t.field = Field
	end
	if State then
		t.state = State
	end
	if Origin then
		t.origin = Origin
	end
	if p2 ~= nil then
		t.entered = tostring(p2)
	end
	if AssociatedText then
		t.associatedText = AssociatedText
	end
	CheckAndSendEventModule(p1, "authFormInteraction", t)
end