local Parent = script.Parent.Parent
local Logging = require(Parent.Parent.AppCommonLib).Logging
local CheckAndSendEventModule = require(Parent.Utils.checkAndSendEvent)

return function(p1, State, Is_alt_attempt, Origin, p2, p3)
	-- upvalues: Logging (copy), CheckAndSendEventModule (copy)
	local t = {}
	
	if State then
		if type(State) ~= "string" then
			Logging.warn("Failure logging authPageLoad: Expected state to be a string but got " .. type(State))
			
			return
		end
		t.state = State
	end
	if Is_alt_attempt ~= nil then
		if type(Is_alt_attempt) ~= "boolean" then
			Logging.warn("Failure logging authPageLoad: Expected isAltAttempt to be a boolean but got " .. type(Is_alt_attempt))
			
			return
		end
		t.is_alt_attempt = Is_alt_attempt
	end
	if Origin then
		if type(Origin) ~= "string" then
			Logging.warn("Failure logging authPageLoad: Expected origin to be a string but got " .. type(Origin))
			
			return
		end
		t.origin = Origin
	end
	if p2 ~= nil then
		if type(p2) ~= "string" then
			Logging.warn("Failure logging authPageLoad: Expected field to be a string but got " .. type(p2))
		end
		t.field = tostring(p2)
	end
	if p3 ~= nil then
		if type(p3) ~= "string" then
			Logging.warn("Failure logging authPageLoad: Expected associatedText to be a string but got " .. type(p3))
		end
		t.associatedText = tostring(p3)
	end
	CheckAndSendEventModule(p1, "authPageload", t)
end