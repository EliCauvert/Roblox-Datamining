local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local fFlagEditProfileFramesEnabled2 = require(avatarExperienceProfilePictureEditor.Parent.SharedFlags).FFlagEditProfileFramesEnabled2
local constantsModule = require(avatarExperienceProfilePictureEditor.Constants)
local enumsModule = require(avatarExperienceProfilePictureEditor.Common.Enums)

local function _(value) --[[ line: 27 | named "toProfileFrameAssetId" ]]
	-- upvalues: constantsModule (ref)
	return if value == nil then nil elseif value == constantsModule.ProfileFrameNoneId then 0 else tonumber(value)
end

return {
	buildSavePayloadForActiveView = function(p0, p1) --[[ line: 37 ]]
		-- upvalues: constantsModule (ref)
		if p0 == "frames" then
			local t = { emoteAssetId = p1.savedEmoteAssetId }
			local selectedFrameId = p1.selectedFrameId
			t.profileFrameAssetId = if selectedFrameId == nil then nil elseif selectedFrameId == constantsModule.ProfileFrameNoneId then 0 else tonumber(selectedFrameId)
			
			return t
		elseif p0 == "emotes" then
			return {
				profileFrameAssetId = nil,
				emoteAssetId = p1.selectedEmoteId
			}
		end
		local var5
		local t = { emoteAssetId = p1.selectedEmoteId }
		
		if p1.showFrames then
			local selectedFrameId = p1.selectedFrameId
			var5 = if selectedFrameId == nil then nil elseif selectedFrameId == constantsModule.ProfileFrameNoneId then 0 else tonumber(selectedFrameId)
		else
			var5 = nil
		end
		t.profileFrameAssetId = var5
		
		return t
	end,
	getInitialActiveView = function(p2) --[[ line: 56 ]]
		-- upvalues: fFlagEditProfileFramesEnabled2 (ref), enumsModule (ref)
		return if fFlagEditProfileFramesEnabled2 and p2 == enumsModule.EditProfileImageMode.FramesOnly then "frames" elseif fFlagEditProfileFramesEnabled2 then "combined" else "emotes"
	end,
	hasOnTitleBack = function(p3, p4) --[[ line: 66 ]]
		-- upvalues: enumsModule (ref), fFlagEditProfileFramesEnabled2 (ref)
		return if p3 == "combined" then false elseif p3 == "frames" and p4 == enumsModule.EditProfileImageMode.FramesOnly then false else fFlagEditProfileFramesEnabled2
	end,
	resolvePostSaveAction = function(p5) --[[ line: 79 ]]
		return if p5.framesFeatureEnabled and p5.hasOnTitleBack then "returnToCombined" elseif p5.hasOnSaveSuccess then "exitWithSuccessCallback" else "exit"
	end,
	resolveFooterCta = function(p6) --[[ line: 93 ]]
		return if not (not p6.isFramesOnlyEntry and p6.isRecommendedEmoteSelected) then if p6.isEquipRestrictedFrameSelected then "subscribePlus" else "save" else "purchaseEmote"
	end
}