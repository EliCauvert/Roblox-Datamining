local AvatarEditorService = game:GetService("AvatarEditorService")
local Players = game:GetService("Players")

return {
	applyDefaultClothing = function(HumanoidDescription)
		-- upvalues: AvatarEditorService (copy)
		local Success, Result = pcall(function()
			-- upvalues: AvatarEditorService (upval), HumanoidDescription (copy)
			return AvatarEditorService:CheckApplyDefaultClothingAsync(HumanoidDescription)
		end)
		
		if Success then
			return Result or HumanoidDescription
		else
			warn("AvatarPreview could not check for default clothing:", Result)
			
			return HumanoidDescription
		end
	end,
	createModel = function(Description, RigType)
		-- upvalues: Players (copy)
		return Players:CreateHumanoidModelFromDescriptionAsync(Description, RigType)
	end,
	applyDescription = function(Humanoid, HumanoidDescription)
		Humanoid:ApplyDescriptionAsync(HumanoidDescription)
	end
}