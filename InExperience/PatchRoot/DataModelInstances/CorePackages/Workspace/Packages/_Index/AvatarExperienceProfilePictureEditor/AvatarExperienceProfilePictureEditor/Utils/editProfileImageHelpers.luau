local AvatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local FFlagEditProfileFramesEnabled = require(AvatarExperienceProfilePictureEditor.Parent.SharedFlags).FFlagEditProfileFramesEnabled
local ConstantsModule = require(AvatarExperienceProfilePictureEditor.Constants)
local EnumsModule = require(AvatarExperienceProfilePictureEditor.Common.Enums)

local function _(ProfileFrameNoneId)
	-- upvalues: ConstantsModule (copy)
	return if ProfileFrameNoneId == nil then nil elseif ProfileFrameNoneId == ConstantsModule.ProfileFrameNoneId then 0 else tonumber(ProfileFrameNoneId)
end

return {
	buildSavePayloadForActiveView = function(p1, p2)
		-- upvalues: ConstantsModule (copy)
		if p1 == "frames" then
			local SelectedFrameId = p2.selectedFrameId
			
			return {
				emoteAssetId = p2.savedEmoteAssetId,
				profileFrameAssetId = if SelectedFrameId == nil then nil elseif SelectedFrameId == ConstantsModule.ProfileFrameNoneId then 0 else tonumber(SelectedFrameId)
			}
		end
		if p1 == "emotes" then
			return {
				profileFrameAssetId = nil,
				emoteAssetId = p2.selectedEmoteId
			}
		end
		local config = { emoteAssetId = p2.selectedEmoteId }
		local Number = nil
		
		if p2.showFrames then
			local SelectedFrameId = p2.selectedFrameId
			Number = if SelectedFrameId == nil then nil elseif SelectedFrameId == ConstantsModule.ProfileFrameNoneId then 0 else tonumber(SelectedFrameId)
		else
			Number = nil
		end
		config.profileFrameAssetId = Number
		
		return config
	end,
	getInitialActiveView = function(FramesOnly): string
		-- upvalues: FFlagEditProfileFramesEnabled (copy), EnumsModule (copy)
		return if FFlagEditProfileFramesEnabled and FramesOnly == EnumsModule.EditProfileImageMode.FramesOnly then "frames" elseif FFlagEditProfileFramesEnabled then "combined" else "emotes"
	end,
	hasOnTitleBack = function(p1, FramesOnly): boolean
		-- upvalues: EnumsModule (copy), FFlagEditProfileFramesEnabled (copy)
		return p1 ~= "combined" and ((p1 ~= "frames" or FramesOnly ~= EnumsModule.EditProfileImageMode.FramesOnly) and (if FFlagEditProfileFramesEnabled then true else false))
	end,
	resolvePostSaveAction = function(p1): string
		return if p1.framesFeatureEnabled and p1.hasOnTitleBack then "returnToCombined" elseif p1.hasOnSaveSuccess then "exitWithSuccessCallback" else "exit"
	end,
	resolveFooterCta = function(p1): string
		return if p1.isFramesOnlyEntry or not p1.isRecommendedEmoteSelected then if p1.isEquipRestrictedFrameSelected then "subscribePlus" else "save" else "purchaseEmote"
	end
}