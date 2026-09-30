local parent = script.Parent.Parent
local logging = require(parent.Parent.AppCommonLib).Logging
local checkAndSendEventModule = require(parent.Utils.checkAndSendEvent)

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: logging (ref), checkAndSendEventModule (ref)
	local t = {}
	
	if p2 then
		t.state = p2
	end
	if p3 then
		t.field = p3
	end
	if p4 then
		t.origin = p4
	end
	if p5 then
		t.associatedText = p5
	end
	if p6 ~= nil then
		if type(p6) ~= "string" then
			logging.warn("Failure logging authModalShown: Expected errorCode to be a string but got " .. type(p6))
		end
		t.errorCode = tostring(p6)
	end
	checkAndSendEventModule(p1, "authModalShown", t)
end