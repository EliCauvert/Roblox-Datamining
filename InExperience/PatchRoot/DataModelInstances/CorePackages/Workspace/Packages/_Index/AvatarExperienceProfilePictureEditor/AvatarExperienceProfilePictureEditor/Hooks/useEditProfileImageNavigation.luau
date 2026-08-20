local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local parent = avatarExperienceProfilePictureEditor.Parent
local reactModule = require(parent.React)
local fFlagEditProfileFramesEnabled = require(parent.SharedFlags).FFlagEditProfileFramesEnabled
local enumsModule = require(avatarExperienceProfilePictureEditor.Common.Enums)
local editProfileImageHelpersModule = require(avatarExperienceProfilePictureEditor.Utils.editProfileImageHelpers)

return function(p0) --[[ line: 27 | named "useEditProfileImageNavigation" ]]
	-- upvalues: reactModule (ref), editProfileImageHelpersModule (ref), fFlagEditProfileFramesEnabled (ref), enumsModule (ref)
	local var4, var5 = reactModule.useState(editProfileImageHelpersModule.getInitialActiveView(p0.mode))
	local var6 = editProfileImageHelpersModule.hasOnTitleBack(var4, p0.mode)
	local var7 = reactModule.useCallback(function() --[[ line: 41 ]]
		-- upvalues: var5 (ref)
		var5("combined")
	end, {})
	
	return {
		activeView = var4,
		isFramesOnlyEntry = fFlagEditProfileFramesEnabled and (var4 == "frames" and p0.mode == enumsModule.EditProfileImageMode.FramesOnly),
		titleBackAvailable = var6,
		onExpandEmotes = reactModule.useCallback(function() --[[ line: 35 ]]
			-- upvalues: var5 (ref)
			var5("emotes")
		end, {}),
		onExpandFrames = reactModule.useCallback(function() --[[ line: 38 ]]
			-- upvalues: var5 (ref)
			var5("frames")
		end, {}),
		onReturnToCombined = var7,
		onTitleBack = if var6 then var7 else nil
	}
end