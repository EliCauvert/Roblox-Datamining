local parent = script.Parent.Parent
local openPublishMakeupLookPromptModule = require(parent.Actions.OpenPublishMakeupLookPrompt)
local promptTypeModule = require(parent.PromptType)

return function(p0, p1, p2)
	-- upvalues: openPublishMakeupLookPromptModule (ref), promptTypeModule (ref)
	return function(p3)
		-- upvalues: openPublishMakeupLookPromptModule (copy), promptTypeModule (copy), p0 (ref), p1 (ref), p2 (ref)
		p3:dispatch(openPublishMakeupLookPromptModule(promptTypeModule.PublishMakeupLook, p0, p1, p2))
	end
end