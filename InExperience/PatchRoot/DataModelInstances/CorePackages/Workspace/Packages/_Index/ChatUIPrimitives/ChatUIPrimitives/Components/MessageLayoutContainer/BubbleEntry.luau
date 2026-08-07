local chatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local parent = chatUIPrimitives.Parent
local reactModule = require(parent.React)
local _ = require(parent.Signals)
local _ = require(chatUIPrimitives.Types)

return reactModule.memo(function(_) --[[ line: 19 | named "BubbleEntry" ]]
	return nil
end)