local CheckAndSendEventModule = require(script.Parent.Parent.Utils.checkAndSendEvent)
local ClientErrorAdditionalArgs = game:DefineFastFlag("ClientErrorAdditionalArgs", false)

return function(p1, State, Url, Origin) --[[ Line: 5 ]]
	-- upvalues: ClientErrorAdditionalArgs (copy), CheckAndSendEventModule (copy)
	local t = {}
	
	if State then
		t.state = State
	end
	if ClientErrorAdditionalArgs and Url then
		t.url = Url
	end
	if ClientErrorAdditionalArgs and Origin then
		t.origin = Origin
	end
	CheckAndSendEventModule(p1, "authClientError", t)
end