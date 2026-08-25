local chatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local parent = chatUIPrimitives.Parent
local reactModule = require(parent.React)
local _ = require(parent.Signals)
local _ = require(chatUIPrimitives.Types)

return reactModule.memo(function(_)
	return nil
end)