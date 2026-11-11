local Parent = script.Parent.Parent
local _ = require(Parent.Enums.PromptType)
local _ = require(Parent.Types)

return require(Parent.Parent.Rodux).makeActionCreator(script.Name, function(PromptId, PromptType, PromptData)
	return {
		promptData = PromptData,
		promptId = PromptId,
		promptType = PromptType
	}
end)