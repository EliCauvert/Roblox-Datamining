local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ConstantsModule = require(Modules.AvatarExperience.ProfilePictureEditor.Constants)
local PPEThumbnailTypeModule = require(Modules.AvatarExperience.ProfilePictureEditor.PPEThumbnailType)
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local GetAvatarEditorCategoriesModule = require(Modules.AvatarExperience.AvatarEditor.GetAvatarEditorCategories)
local AvatarExperienceAnalyticsModule = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceAnalytics)
local ReportAvatarEventCounterV1Function = AvatarExperienceAnalyticsModule.reportAvatarEventCounterV1
local Constants = AvatarExperienceAnalyticsModule.Constants

return {
	get = function(p1)
		-- upvalues: RoactAnalyticsModule (copy), ConstantsModule (copy), GetAvatarEditorCategoriesModule (copy), PPEThumbnailTypeModule (copy), ReportAvatarEventCounterV1Function (copy), Constants (copy)
		local GetResult = RoactAnalyticsModule.get(p1)
		
		return {
			profilePictureEditorButton = function()
				-- upvalues: GetResult (copy), ConstantsModule (upval)
				GetResult.EventStream:sendEventDeferred("ClickProfilePictureEditorButton", "avatarProfilePictureEditTap", {
					entry_point = "dropdown",
					feature = ConstantsModule.AnalyticsTag
				})
			end,
			profilePictureEditorOpenedFromLandingPage = function()
				-- upvalues: GetResult (copy), ConstantsModule (upval)
				GetResult.EventStream:sendEventDeferred("ProfilePictureEditorLandingPageButtonClicked", "avatarProfilePictureEditTap", {
					entry_point = "home",
					feature = ConstantsModule.AnalyticsTag
				})
			end,
			clickShopForMore = function(p2, p3)
				-- upvalues: GetAvatarEditorCategoriesModule (upval), GetResult (copy), ConstantsModule (upval)
				local AvatarEditorCategoriesModuleEntry = GetAvatarEditorCategoriesModule()[p2]
				
				if AvatarEditorCategoriesModuleEntry then
					local Subcategory = AvatarEditorCategoriesModuleEntry.Subcategories and AvatarEditorCategoriesModuleEntry.Subcategories[p3]
					GetResult.EventStream:sendEventDeferred("ProfilePictureEditorEmotesPage", "avatarProfilePictureEmoteShop", {
						feature = ConstantsModule.AnalyticsTag,
						nav = AvatarEditorCategoriesModuleEntry and AvatarEditorCategoriesModuleEntry.Name or "",
						subNav = Subcategory and Subcategory.Name or ""
					})
				end
			end,
			clickFinalSave = function(Closeup, IsDefaultPosition, EmoteAssetId)
				-- upvalues: PPEThumbnailTypeModule (upval), GetResult (copy), ConstantsModule (upval), ReportAvatarEventCounterV1Function (upval), Constants (upval)
				GetResult.EventStream:sendEventDeferred("ProfilePictureEditorFinalPage", if Closeup == PPEThumbnailTypeModule.Closeup then "clickFinalSaveCloseup" else "clickFinalSaveFullBody", {
					feature = ConstantsModule.AnalyticsTag,
					isDefaultPosition = IsDefaultPosition,
					emoteAssetId = EmoteAssetId
				})
				ReportAvatarEventCounterV1Function(Constants.AVATAR_EVENT_COUNTER_NAME.AXUpdateProfilePicture)
			end,
			clickNextFromEmotesPage = function(Asset_id)
				-- upvalues: GetResult (copy), ConstantsModule (upval)
				GetResult.EventStream:sendEventDeferred("ProfilePictureEditorEmotesPage", "avatarProfilePictureEmote", {
					feature = ConstantsModule.AnalyticsTag,
					asset_id = Asset_id
				})
			end,
			clickNextFromCameraPage = function(p2, p3)
				-- upvalues: GetResult (copy), ConstantsModule (upval)
				GetResult.EventStream:sendEventDeferred("ProfilePictureEditorCameraPage", "avatarProfilePictureCrop", {
					feature = ConstantsModule.AnalyticsTag,
					zoom = if p2 then 1 else 0,
					rotate = if p3 then 1 else 0
				})
			end,
			clickDefaultPositionsFromCameraPage = function()
				-- upvalues: GetResult (copy), ConstantsModule (upval)
				GetResult.EventStream:sendEventDeferred("ProfilePictureEditorCameraPage", "avatarProfilePictureCropDefault", { feature = ConstantsModule.AnalyticsTag })
			end
		}
	end
}