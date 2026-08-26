local avatarEditorService = game:GetService("AvatarEditorService")
local parent = script:FindFirstAncestor("AvatarExperienceSave").Parent
local promiseModule = require(parent.Promise)
local _ = require(parent.LuauPolyfill)

return function(p1, p2, p3, p4)
	-- upvalues: promiseModule (ref), avatarEditorService (ref)
	return promiseModule.new(function(p5, p6)
		-- upvalues: avatarEditorService (copy), p1 (ref), p2 (ref), p3 (ref), p4 (ref)
		local var1 = avatarEditorService:NoPromptSaveAvatar(p1, p2, p3, p4)
		while not var1 do
			avatarEditorService.PromptSaveAvatarCompleted:Wait()
			var1 = avatarEditorService:NoPromptSaveAvatar(p1, p2, p3, p4)
		end
		local var2, var3 = avatarEditorService.PromptSaveAvatarCompleted:Wait()
		
		if var2 == Enum.AvatarPromptResult.Success then
			p5({
				avatarPromptResult = var2,
				humanoidDescriptionWithValidAssets = var3
			})
			
			return
		end
		p6({ avatarPromptResult = var2 })
	end)
end