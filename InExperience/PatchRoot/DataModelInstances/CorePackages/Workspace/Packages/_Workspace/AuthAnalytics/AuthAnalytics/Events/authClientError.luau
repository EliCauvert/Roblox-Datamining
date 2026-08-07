local checkAndSendEventModule = require(script.Parent.Parent.Utils.checkAndSendEvent)
local clientErrorAdditionalArgs = game:DefineFastFlag("ClientErrorAdditionalArgs", false)

return function(p0, p1, p2, p3) --[[ line: 5 ]]
	-- upvalues: clientErrorAdditionalArgs (ref), checkAndSendEventModule (ref)
	local t = {}
	
	if p1 then
		t.state = p1
	end
	if clientErrorAdditionalArgs and p2 then
		t.url = p2
	end
	if clientErrorAdditionalArgs and p3 then
		t.origin = p3
	end
	checkAndSendEventModule(p0, "authClientError", t)
end