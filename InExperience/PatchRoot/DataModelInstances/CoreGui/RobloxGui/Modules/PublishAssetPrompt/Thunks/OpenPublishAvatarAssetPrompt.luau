local parent = script.Parent.Parent
local openPublishAvatarAssetPromptModule = require(parent.Actions.OpenPublishAvatarAssetPrompt)
local promptTypeModule = require(parent.PromptType)

return function(p1, p2, p3)
	-- upvalues: openPublishAvatarAssetPromptModule (ref), promptTypeModule (ref)
	return function(p4)
		-- upvalues: openPublishAvatarAssetPromptModule (copy), promptTypeModule (copy), p1 (ref), p2 (ref), p3 (ref)
		p4:dispatch(openPublishAvatarAssetPromptModule(promptTypeModule.PublishAvatarAsset, p1, p2, p3))
	end
end