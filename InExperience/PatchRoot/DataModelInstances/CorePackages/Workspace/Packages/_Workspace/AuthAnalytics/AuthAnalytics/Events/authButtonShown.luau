local CheckAndSendEventModule = require(script.Parent.Parent.Utils.checkAndSendEvent)

return function(p1, Btn, State, Origin)
	-- upvalues: CheckAndSendEventModule (copy)
	local config = { btn = Btn }
	
	if State then
		config.state = State
	end
	if Origin then
		config.origin = Origin
	end
	CheckAndSendEventModule(p1, "authButtonShown", config)
end