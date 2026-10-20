local CheckAndSendEventModule = require(script.Parent.Parent.Utils.checkAndSendEvent)

return function(p1, Btn, State, Url, Is_alt_attempt, Origin, Ctype, AssociatedText)
	-- upvalues: CheckAndSendEventModule (copy)
	local t = {}
	
	if Btn then
		t.btn = Btn
	end
	if State then
		t.state = State
	end
	if Url then
		t.url = Url
	end
	if Is_alt_attempt ~= nil then
		t.is_alt_attempt = Is_alt_attempt
	end
	if Origin then
		t.origin = Origin
	end
	if Ctype then
		t.ctype = Ctype
	end
	if AssociatedText then
		t.associatedText = AssociatedText
	end
	CheckAndSendEventModule(p1, "authButtonClick", t)
end