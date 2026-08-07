local parent = script.Parent.Parent
local openPublishAvatarPromptModule = require(parent.Actions.OpenPublishAvatarPrompt)
local promptTypeModule = require(parent.PromptType)

return function(p0, p1) --[[ line: 12 ]]
	-- upvalues: openPublishAvatarPromptModule (ref), promptTypeModule (ref)
	return function(p2) --[[ line: 13 ]]
		-- upvalues: openPublishAvatarPromptModule (copy), promptTypeModule (copy), p0 (ref), p1 (ref)
		p2:dispatch(openPublishAvatarPromptModule(promptTypeModule.PublishAvatar, p0, p1))
	end
end