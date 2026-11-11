local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local ItemDataModule = require(Modules.AvatarExperience.Common.Selectors.ItemData)
local AvatarScreen = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local CloseAllItemDetailsModule = require(Modules.AvatarExperience.Common.Thunks.CloseAllItemDetails)

return function(p1, p2, Asset, OnOverlayClosed, OnOverlayClosedPostClose, p3)
	-- upvalues: ConstantsModule (copy), ItemDataModule (copy), AvatarScreen (copy), CloseAllItemDetailsModule (copy)
	return function(p4): boolean
		-- upvalues: ConstantsModule (upval), ItemDataModule (upval), p2 (copy), Asset (copy), p1 (copy), AvatarScreen (upval), p3 (copy), CloseAllItemDetailsModule (upval), OnOverlayClosed (copy), OnOverlayClosedPostClose (copy)
		local State = p4:getState()
		
		if State.AvatarExperience.AvatarEditor.Character.AvatarType ~= ConstantsModule.AvatarType.R6 then
			return false
		end
		local Flag = false
		local FeatureAvatarLabelPPEEmoteR15Warning: string? = nil
		local Animations = ConstantsModule.BundleTypeIdStrings.Animations
		local ItemDataModuleResult = ItemDataModule(State.AvatarExperience.Common, p2, Asset)
		local AssetType = nil
		local BundleType = nil
		
		if ItemDataModuleResult and Asset == ConstantsModule.ItemType.Bundle then
			BundleType = ItemDataModuleResult.bundleType
		elseif ItemDataModuleResult and Asset == ConstantsModule.ItemType.Asset then
			AssetType = ItemDataModuleResult.assetType
		end
		if BundleType and BundleType == Animations then
			Flag = true
			FeatureAvatarLabelPPEEmoteR15Warning = "Feature.Avatar.Message.R15AnimationsPrompt"
		elseif AssetType and AssetType == ConstantsModule.AssetTypeIdStrings.EmoteAnimation then
			Flag = true
			FeatureAvatarLabelPPEEmoteR15Warning = if p1.state.routeName == AvatarScreen.ProfilePictureEditorEmotes then "Feature.Avatar.Label.PPEEmoteR15Warning" else "Feature.Avatar.Message.R15EmotesPrompt"
		end
		if not Flag then
			return false
		end
		if p3 then
			p4:dispatch(CloseAllItemDetailsModule(p1))
		end
		p1.navigate(AvatarScreen.R15UpgradePrompt, {
			onOverlayClosed = OnOverlayClosed,
			onOverlayClosedPostClose = OnOverlayClosedPostClose,
			bodyTextKey = FeatureAvatarLabelPPEEmoteR15Warning
		})
		
		return true
	end
end