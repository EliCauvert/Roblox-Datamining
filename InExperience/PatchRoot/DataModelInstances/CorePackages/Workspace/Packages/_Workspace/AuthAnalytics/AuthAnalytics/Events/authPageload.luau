local parent = script.Parent.Parent
local logging = require(parent.Parent.AppCommonLib).Logging
local checkAndSendEventModule = require(parent.Utils.checkAndSendEvent)

return function(p0, p1, p2, p3)
	-- upvalues: logging (ref), checkAndSendEventModule (ref)
	local t = {}
	
	if p1 then
		if type(p1) ~= "string" then
			logging.warn("Failure logging authPageLoad: Expected state to be a string but got " .. type(p1))
			
			return
		end
		t.state = p1
	end
	if p2 ~= nil then
		if type(p2) ~= "boolean" then
			logging.warn("Failure logging authPageLoad: Expected isAltAttempt to be a boolean but got " .. type(p2))
			
			return
		end
		t.is_alt_attempt = p2
	end
	if p3 then
		if type(p3) ~= "string" then
			logging.warn("Failure logging authPageLoad: Expected origin to be a string but got " .. type(p3))
			
			return
		end
		t.origin = p3
	end
	checkAndSendEventModule(p0, "authPageload", t)
end