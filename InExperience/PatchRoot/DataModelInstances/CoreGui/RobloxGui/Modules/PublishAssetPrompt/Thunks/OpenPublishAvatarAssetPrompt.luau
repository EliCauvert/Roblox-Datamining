local Parent = script.Parent.Parent
local OpenPublishAvatarAssetPromptModule = require(Parent.Actions.OpenPublishAvatarAssetPrompt)
local PromptTypeModule = require(Parent.PromptType)

return function(p1, p2, p3)
	-- upvalues: OpenPublishAvatarAssetPromptModule (copy), PromptTypeModule (copy)
	return function(p4)
		-- upvalues: OpenPublishAvatarAssetPromptModule (upval), PromptTypeModule (upval), p1 (copy), p2 (copy), p3 (copy)
		p4:dispatch(OpenPublishAvatarAssetPromptModule(PromptTypeModule.PublishAvatarAsset, p1, p2, p3))
	end
end