local Parent = script.Parent.Parent
local OpenPublishMakeupLookPromptModule = require(Parent.Actions.OpenPublishMakeupLookPrompt)
local PromptTypeModule = require(Parent.PromptType)

return function(p1, p2, p3)
	-- upvalues: OpenPublishMakeupLookPromptModule (copy), PromptTypeModule (copy)
	return function(p4)
		-- upvalues: OpenPublishMakeupLookPromptModule (upval), PromptTypeModule (upval), p1 (copy), p2 (copy), p3 (copy)
		p4:dispatch(OpenPublishMakeupLookPromptModule(PromptTypeModule.PublishMakeupLook, p1, p2, p3))
	end
end