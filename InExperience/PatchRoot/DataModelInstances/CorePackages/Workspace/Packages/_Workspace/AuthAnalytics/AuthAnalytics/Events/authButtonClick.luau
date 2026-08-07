local checkAndSendEventModule = require(script.Parent.Parent.Utils.checkAndSendEvent)

return function(p0, p1, p2, p3, p4, p5, p6) --[[ line: 4 ]]
	-- upvalues: checkAndSendEventModule (ref)
	local t = {}
	
	if p1 then
		t.btn = p1
	end
	if p2 then
		t.state = p2
	end
	if p3 then
		t.url = p3
	end
	if p4 ~= nil then
		t.is_alt_attempt = p4
	end
	if p5 then
		t.origin = p5
	end
	if p6 then
		t.ctype = p6
	end
	checkAndSendEventModule(p0, "authButtonClick", t)
end