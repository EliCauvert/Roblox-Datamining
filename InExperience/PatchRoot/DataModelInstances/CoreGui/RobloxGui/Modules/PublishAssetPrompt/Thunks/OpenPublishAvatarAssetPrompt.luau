local parent = script.Parent.Parent
local openPublishAvatarAssetPromptModule = require(parent.Actions.OpenPublishAvatarAssetPrompt)
local promptTypeModule = require(parent.PromptType)

return function(p0, p1, p2)
	-- upvalues: openPublishAvatarAssetPromptModule (ref), promptTypeModule (ref)
	return function(p3)
		-- upvalues: openPublishAvatarAssetPromptModule (copy), promptTypeModule (copy), p0 (ref), p1 (ref), p2 (ref)
		p3:dispatch(openPublishAvatarAssetPromptModule(promptTypeModule.PublishAvatarAsset, p0, p1, p2))
	end
end