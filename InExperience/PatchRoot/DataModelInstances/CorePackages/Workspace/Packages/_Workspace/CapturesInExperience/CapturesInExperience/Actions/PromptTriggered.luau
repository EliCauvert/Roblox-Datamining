local parent = script.Parent.Parent
local roduxModule = require(parent.Parent.Rodux)
local _ = require(parent.Enums.PromptType)
local _ = require(parent.Types)

return roduxModule.makeActionCreator(script.Name, function(p0, p1, p2)
	return { promptData = p2, promptId = p0, promptType = p1 }
end)