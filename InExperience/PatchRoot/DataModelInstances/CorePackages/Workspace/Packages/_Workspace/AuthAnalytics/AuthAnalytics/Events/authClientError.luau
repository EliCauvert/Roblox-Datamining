local checkAndSendEventModule = require(script.Parent.Parent.Utils.checkAndSendEvent)
local clientErrorAdditionalArgs = game:DefineFastFlag("ClientErrorAdditionalArgs", false)

return function(p1, p2, p3, p4)
	-- upvalues: clientErrorAdditionalArgs (ref), checkAndSendEventModule (ref)
	local t = {}
	
	if p2 then
		t.state = p2
	end
	if clientErrorAdditionalArgs and p3 then
		t.url = p3
	end
	if clientErrorAdditionalArgs and p4 then
		t.origin = p4
	end
	checkAndSendEventModule(p1, "authClientError", t)
end