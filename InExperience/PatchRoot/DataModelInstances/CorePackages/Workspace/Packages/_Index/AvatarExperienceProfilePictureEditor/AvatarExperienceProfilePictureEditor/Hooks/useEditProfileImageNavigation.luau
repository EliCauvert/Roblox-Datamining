local AvatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local Parent = AvatarExperienceProfilePictureEditor.Parent
local ReactModule = require(Parent.React)
local FFlagEditProfileFramesEnabled = require(Parent.SharedFlags).FFlagEditProfileFramesEnabled
local EnumsModule = require(AvatarExperienceProfilePictureEditor.Common.Enums)
local EditProfileImageHelpersModule = require(AvatarExperienceProfilePictureEditor.Utils.editProfileImageHelpers)

return function(p1)
	-- upvalues: ReactModule (copy), EditProfileImageHelpersModule (copy), FFlagEditProfileFramesEnabled (copy), EnumsModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState((EditProfileImageHelpersModule.getInitialActiveView(p1.mode)))
	local HasOnTitleBack = EditProfileImageHelpersModule.hasOnTitleBack(UseStateResult, p1.mode)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2("combined")
	end, {})
	
	return {
		activeView = UseStateResult,
		isFramesOnlyEntry = FFlagEditProfileFramesEnabled and (UseStateResult == "frames" and p1.mode == EnumsModule.EditProfileImageMode.FramesOnly),
		titleBackAvailable = HasOnTitleBack,
		onExpandEmotes = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2("emotes")
		end, {}),
		onExpandFrames = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2("frames")
		end, {}),
		onReturnToCombined = UseResult,
		onTitleBack = if HasOnTitleBack then UseResult else nil
	}
end