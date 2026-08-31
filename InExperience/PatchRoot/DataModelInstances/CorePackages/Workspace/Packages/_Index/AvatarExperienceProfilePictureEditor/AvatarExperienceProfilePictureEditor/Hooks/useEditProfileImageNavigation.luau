local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local parent = avatarExperienceProfilePictureEditor.Parent
local reactModule = require(parent.React)
local fFlagEditProfileFramesEnabled = require(parent.SharedFlags).FFlagEditProfileFramesEnabled
local enumsModule = require(avatarExperienceProfilePictureEditor.Common.Enums)
local editProfileImageHelpersModule = require(avatarExperienceProfilePictureEditor.Utils.editProfileImageHelpers)

return function(p1)
	-- upvalues: reactModule (ref), editProfileImageHelpersModule (ref), fFlagEditProfileFramesEnabled (ref), enumsModule (ref)
	local var1, var2 = reactModule.useState(editProfileImageHelpersModule.getInitialActiveView(p1.mode))
	local var3 = editProfileImageHelpersModule.hasOnTitleBack(var1, p1.mode)
	local var4 = reactModule.useCallback(function()
		-- upvalues: var2 (ref)
		var2("combined")
	end, {})
	
	return {
		activeView = var1,
		isFramesOnlyEntry = fFlagEditProfileFramesEnabled and (var1 == "frames" and p1.mode == enumsModule.EditProfileImageMode.FramesOnly),
		titleBackAvailable = var3,
		onExpandEmotes = reactModule.useCallback(function()
			-- upvalues: var2 (ref)
			var2("emotes")
		end, {}),
		onExpandFrames = reactModule.useCallback(function()
			-- upvalues: var2 (ref)
			var2("frames")
		end, {}),
		onReturnToCombined = var4,
		onTitleBack = if var3 then var4 else nil
	}
end