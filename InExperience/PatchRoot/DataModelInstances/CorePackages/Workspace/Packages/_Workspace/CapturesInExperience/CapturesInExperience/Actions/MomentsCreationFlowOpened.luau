local Parent = script.Parent.Parent
local _ = require(Parent.Types)

return require(Parent.Parent.Rodux).makeActionCreator(script.Name, function(Capture, SessionId) --[[ Line: 14 ]]
	return { capture = Capture, sessionId = SessionId }
end)