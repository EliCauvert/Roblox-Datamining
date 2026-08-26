local parent = script.Parent.Parent
local roduxModule = require(parent.Parent.Rodux)
local _ = require(parent.Enums.PromptType)
local _ = require(parent.Types)

return roduxModule.makeActionCreator(script.Name, function(p1, p2, p3)
	return { promptData = p3, promptId = p1, promptType = p2 }
end)