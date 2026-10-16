local Parent = script.Parent.Parent
local Logging = require(Parent.Parent.AppCommonLib).Logging
local CheckAndSendEventModule = require(Parent.Utils.checkAndSendEvent)

return function(p1, State, Field, Origin, AssociatedText, p2) --[[ Line: 6 ]]
	-- upvalues: Logging (copy), CheckAndSendEventModule (copy)
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
	if AssociatedText then
		t.associatedText = AssociatedText
	end
	if p2 ~= nil then
		if type(p2) ~= "string" then
			Logging.warn("Failure logging authModalShown: Expected errorCode to be a string but got " .. type(p2))
		end
		t.errorCode = tostring(p2)
	end
	CheckAndSendEventModule(p1, "authModalShown", t)
end