local Parent = script.Parent.Parent
local OpenPublishAvatarPromptModule = require(Parent.Actions.OpenPublishAvatarPrompt)
local PromptTypeModule = require(Parent.PromptType)

return function(p1, p2) --[[ Line: 12 ]]
	-- upvalues: OpenPublishAvatarPromptModule (copy), PromptTypeModule (copy)
	return function(p3) --[[ Line: 13 ]]
		-- upvalues: OpenPublishAvatarPromptModule (upval), PromptTypeModule (upval), p1 (copy), p2 (copy)
		p3:dispatch(OpenPublishAvatarPromptModule(PromptTypeModule.PublishAvatar, p1, p2))
	end
end