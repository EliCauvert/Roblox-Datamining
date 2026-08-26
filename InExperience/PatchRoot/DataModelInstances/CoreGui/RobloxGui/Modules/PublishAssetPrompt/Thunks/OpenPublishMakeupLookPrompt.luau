local parent = script.Parent.Parent
local openPublishMakeupLookPromptModule = require(parent.Actions.OpenPublishMakeupLookPrompt)
local promptTypeModule = require(parent.PromptType)

return function(p1, p2, p3)
	-- upvalues: openPublishMakeupLookPromptModule (ref), promptTypeModule (ref)
	return function(p4)
		-- upvalues: openPublishMakeupLookPromptModule (copy), promptTypeModule (copy), p1 (ref), p2 (ref), p3 (ref)
		p4:dispatch(openPublishMakeupLookPromptModule(promptTypeModule.PublishMakeupLook, p1, p2, p3))
	end
end