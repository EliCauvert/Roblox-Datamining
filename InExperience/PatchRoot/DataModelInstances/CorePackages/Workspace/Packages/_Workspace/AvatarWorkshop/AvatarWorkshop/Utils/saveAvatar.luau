local AvatarEditorService = game:GetService("AvatarEditorService")
local _ = require(script:FindFirstAncestor("AvatarWorkshop").Stores.AvatarStateTypes)
local Frozen = table.freeze({
	BodyColors = true,
	AvatarType = true,
	Scales = true,
	Assets = true
})

return function(p1)
	-- upvalues: AvatarEditorService (copy), Frozen (copy)
	local Success, Result, Result3 = pcall(function()
		-- upvalues: AvatarEditorService (upval), p1 (copy), Frozen (upval)
		local function _()
			-- upvalues: AvatarEditorService (upval), p1 (upval), Frozen (upval)
			return AvatarEditorService:NoPromptSaveAvatar(p1.humanoidDescription, p1.rigType, Frozen, p1.gearId)
		end
		while not AvatarEditorService:NoPromptSaveAvatar(p1.humanoidDescription, p1.rigType, Frozen, p1.gearId) do
			AvatarEditorService.PromptSaveAvatarCompleted:Wait()
		end
		return AvatarEditorService.PromptSaveAvatarCompleted:Wait()
	end)
	
	if not Success then
		warn("AvatarWorkshop: couldn't save the avatar:", Result)
		
		return false, nil
	elseif Result == Enum.AvatarPromptResult.Success then
		return true, Result3
	else
		warn("AvatarWorkshop: the avatar wasn't saved:", Result)
		
		return false, Result3
	end
end