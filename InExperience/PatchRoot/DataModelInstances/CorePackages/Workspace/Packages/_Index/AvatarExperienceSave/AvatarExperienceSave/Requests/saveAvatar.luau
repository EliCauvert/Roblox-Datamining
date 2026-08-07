local avatarEditorService = game:GetService("AvatarEditorService")
local parent = script:FindFirstAncestor("AvatarExperienceSave").Parent
local promiseModule = require(parent.Promise)
local _ = require(parent.LuauPolyfill)

return function(p0, p1, p2, p3) --[[ line: 28 | named "saveAvatar" ]]
	-- upvalues: promiseModule (ref), avatarEditorService (ref)
	return promiseModule.new(function(p4, p5) --[[ line: 34 ]]
		-- upvalues: avatarEditorService (copy), p0 (ref), p1 (ref), p2 (ref), p3 (ref)
		local var2 = avatarEditorService:NoPromptSaveAvatar(p0, p1, p2, p3)
		while not var2 do
			avatarEditorService.PromptSaveAvatarCompleted:Wait()
			var2 = avatarEditorService:NoPromptSaveAvatar(p0, p1, p2, p3)
		end
		local var3, var4 = avatarEditorService.PromptSaveAvatarCompleted:Wait()
		
		if var3 == Enum.AvatarPromptResult.Success then
			p4({
				avatarPromptResult = var3,
				humanoidDescriptionWithValidAssets = var4
			})
			
			return
		end
		p5({ avatarPromptResult = var3 })
	end)
end