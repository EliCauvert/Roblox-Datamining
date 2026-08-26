local parent = script.Parent.Parent
local logging = require(parent.Parent.AppCommonLib).Logging
local checkAndSendEventModule = require(parent.Utils.checkAndSendEvent)

return function(p1, p2, p3, p4)
	-- upvalues: logging (ref), checkAndSendEventModule (ref)
	local t = {}
	
	if p2 then
		if type(p2) ~= "string" then
			logging.warn("Failure logging authPageLoad: Expected state to be a string but got " .. type(p2))
			
			return
		end
		t.state = p2
	end
	if p3 ~= nil then
		if type(p3) ~= "boolean" then
			logging.warn("Failure logging authPageLoad: Expected isAltAttempt to be a boolean but got " .. type(p3))
			
			return
		end
		t.is_alt_attempt = p3
	end
	if p4 then
		if type(p4) ~= "string" then
			logging.warn("Failure logging authPageLoad: Expected origin to be a string but got " .. type(p4))
			
			return
		end
		t.origin = p4
	end
	checkAndSendEventModule(p1, "authPageload", t)
end