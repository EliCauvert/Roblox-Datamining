local parent = script.Parent.Parent
local openPublishAvatarPromptModule = require(parent.Actions.OpenPublishAvatarPrompt)
local promptTypeModule = require(parent.PromptType)

return function(p1, p2)
	-- upvalues: openPublishAvatarPromptModule (ref), promptTypeModule (ref)
	return function(p3)
		-- upvalues: openPublishAvatarPromptModule (copy), promptTypeModule (copy), p1 (ref), p2 (ref)
		p3:dispatch(openPublishAvatarPromptModule(promptTypeModule.PublishAvatar, p1, p2))
	end
end