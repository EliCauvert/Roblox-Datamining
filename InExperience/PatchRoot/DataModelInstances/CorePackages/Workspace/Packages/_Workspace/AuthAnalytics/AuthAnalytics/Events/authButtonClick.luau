local checkAndSendEventModule = require(script.Parent.Parent.Utils.checkAndSendEvent)

return function(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: checkAndSendEventModule (ref)
	local t = {}
	
	if p2 then
		t.btn = p2
	end
	if p3 then
		t.state = p3
	end
	if p4 then
		t.url = p4
	end
	if p5 ~= nil then
		t.is_alt_attempt = p5
	end
	if p6 then
		t.origin = p6
	end
	if p7 then
		t.ctype = p7
	end
	checkAndSendEventModule(p1, "authButtonClick", t)
end