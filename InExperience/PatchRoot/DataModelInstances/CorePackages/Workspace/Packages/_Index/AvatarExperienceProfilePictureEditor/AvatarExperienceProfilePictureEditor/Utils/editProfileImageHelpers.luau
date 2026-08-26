local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local fFlagEditProfileFramesEnabled = require(avatarExperienceProfilePictureEditor.Parent.SharedFlags).FFlagEditProfileFramesEnabled
local constantsModule = require(avatarExperienceProfilePictureEditor.Constants)
local enumsModule = require(avatarExperienceProfilePictureEditor.Common.Enums)

local function _(value)
	-- upvalues: constantsModule (ref)
	return if value == nil then nil elseif value == constantsModule.ProfileFrameNoneId then 0 else tonumber(value)
end

return {
	buildSavePayloadForActiveView = function(p1, p2)
		-- upvalues: constantsModule (ref)
		if p1 == "frames" then
			local t = { emoteAssetId = p2.savedEmoteAssetId }
			local selectedFrameId = p2.selectedFrameId
			t.profileFrameAssetId = if selectedFrameId == nil then nil elseif selectedFrameId == constantsModule.ProfileFrameNoneId then 0 else tonumber(selectedFrameId)
			
			return t
		elseif p1 == "emotes" then
			return {
				profileFrameAssetId = nil,
				emoteAssetId = p2.selectedEmoteId
			}
		end
		local var1
		local t = { emoteAssetId = p2.selectedEmoteId }
		
		if p2.showFrames then
			local selectedFrameId = p2.selectedFrameId
			var1 = if selectedFrameId == nil then nil elseif selectedFrameId == constantsModule.ProfileFrameNoneId then 0 else tonumber(selectedFrameId)
		else
			var1 = nil
		end
		t.profileFrameAssetId = var1
		
		return t
	end,
	getInitialActiveView = function(p1)
		-- upvalues: fFlagEditProfileFramesEnabled (ref), enumsModule (ref)
		return if fFlagEditProfileFramesEnabled and p1 == enumsModule.EditProfileImageMode.FramesOnly then "frames" elseif fFlagEditProfileFramesEnabled then "combined" else "emotes"
	end,
	hasOnTitleBack = function(p1, p2)
		-- upvalues: enumsModule (ref), fFlagEditProfileFramesEnabled (ref)
		return if p1 == "combined" then false elseif p1 == "frames" and p2 == enumsModule.EditProfileImageMode.FramesOnly then false else fFlagEditProfileFramesEnabled
	end,
	resolvePostSaveAction = function(p1)
		return if p1.framesFeatureEnabled and p1.hasOnTitleBack then "returnToCombined" elseif p1.hasOnSaveSuccess then "exitWithSuccessCallback" else "exit"
	end,
	resolveFooterCta = function(p1)
		return if not (not p1.isFramesOnlyEntry and p1.isRecommendedEmoteSelected) then if p1.isEquipRestrictedFrameSelected then "subscribePlus" else "save" else "purchaseEmote"
	end
}