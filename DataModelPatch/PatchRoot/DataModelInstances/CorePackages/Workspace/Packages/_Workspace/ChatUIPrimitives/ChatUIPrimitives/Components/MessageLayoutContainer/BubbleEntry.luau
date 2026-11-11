local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local Parent = ChatUIPrimitives.Parent
local _ = require(Parent.Signals)
local _ = require(ChatUIPrimitives.Types)

return require(Parent.React).memo(function(_)
	return nil
end)